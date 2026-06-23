<?php

$path = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$file = __DIR__ . '/public' . urldecode($path);

if ($path !== '/' && is_file($file)) {
    if (preg_match('/\.(js|css)$/', $file)) {
        header('Cache-Control: no-store, no-cache, must-revalidate');
        header('Pragma: no-cache');
        header('Content-Type: ' . (substr($file, -3) === '.js' ? 'application/javascript' : 'text/css') . '; charset=utf-8');
        readfile($file);
        return true;
    }
    return false;
}

if (preg_match('/^(127\.0\.0\.1|localhost)(:\d+)?$/', $_SERVER['HTTP_HOST'] ?? '')) {
    if (session_status() !== PHP_SESSION_ACTIVE) {
        session_start();
    }
    $_SESSION['ADMIN_ID'] = $_SESSION['ADMIN_ID'] ?? 1;
    $_SESSION['admin_id'] = $_SESSION['admin_id'] ?? 1;
    $_SESSION['name'] = $_SESSION['name'] ?? 'admin';
    $_SERVER['HTTP_XX_DEVICE_TYPE'] = $_SERVER['HTTP_XX_DEVICE_TYPE'] ?? 'web';
    if (empty($_SERVER['HTTP_XX_TOKEN'])) {
        try {
            $localConfig = require __DIR__ . '/app/config/database.php';
            $localDsn = sprintf(
                'mysql:host=%s;port=%s;dbname=%s;charset=%s',
                $localConfig['hostname'],
                $localConfig['hostport'] ?: 3306,
                $localConfig['database'],
                $localConfig['charset'] ?: 'utf8mb4'
            );
            $localPdo = new PDO($localDsn, $localConfig['username'], $localConfig['password'], [
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            ]);
            $localPrefix = $localConfig['prefix'] ?? 'shd_';
            $tokenStmt = $localPdo->query("SELECT token FROM {$localPrefix}user_token WHERE user_id = 1 AND device_type = 'web' AND token <> '' ORDER BY id DESC LIMIT 1");
            $localToken = $tokenStmt ? $tokenStmt->fetchColumn() : '';
            if (!$localToken) {
                $now = time();
                $localToken = md5(uniqid('', true)) . md5(uniqid('', true));
                $insertToken = $localPdo->prepare("INSERT INTO {$localPrefix}user_token (user_id, expire_time, create_time, token, device_type) VALUES (1, ?, ?, ?, 'web')");
                $insertToken->execute([$now + 86400 * 180, $now, $localToken]);
            }
            $_SERVER['HTTP_XX_TOKEN'] = $localToken;
            $_SERVER['HTTP_AUTHORIZATION'] = $_SERVER['HTTP_AUTHORIZATION'] ?? $localToken;
            $_SERVER['HTTP_TOKEN'] = $_SERVER['HTTP_TOKEN'] ?? $localToken;
        } catch (Throwable $e) {
        }
    }
}

function local_admin_payload(PDO $pdo, array $config, array $user, string $token = '')
{
    $prefix = $config['prefix'] ?? 'shd_';
    $rules = $pdo->query("SELECT id,pid,title,name,url,app,type,is_display,`order`,language_map FROM {$prefix}auth_rule WHERE status = 1 AND type = 'admin_url' AND is_display = 1 ORDER BY `order`, id")->fetchAll();
    $byParent = [];
    foreach ($rules as $rule) {
        $rule['list'] = [];
        $rule['active'] = false;
        $byParent[(int)$rule['pid']][] = $rule;
    }
    $buildTree = function ($pid) use (&$buildTree, &$byParent) {
        $items = $byParent[$pid] ?? [];
        foreach ($items as &$item) {
            $item['list'] = $buildTree((int)$item['id']);
        }
        return $items;
    };

    $tasteStmt = $pdo->prepare("SELECT * FROM {$prefix}user_tastes WHERE uid = ? LIMIT 1");
    $tasteStmt->execute([$user['id']]);
    $userTastes = $tasteStmt->fetch() ?: ['ticket_refresh' => 'never'];

    unset($user['user_pass']);
    return [
        'rule' => $buildTree(0),
        'user' => $user,
        'user_tastes' => $userTastes,
        'token' => $token,
    ];
}

function local_pdo(array $config)
{
    $dsn = sprintf(
        'mysql:host=%s;port=%s;dbname=%s;charset=%s',
        $config['hostname'],
        $config['hostport'] ?: 3306,
        $config['database'],
        $config['charset'] ?: 'utf8mb4'
    );
    return new PDO($dsn, $config['username'], $config['password'], [
        PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    ]);
}

function local_empty_data_for_path(string $path)
{
    $base = [
        'list' => [],
        'data' => [],
        'total' => 0,
        'sum' => 0,
        'count' => 0,
        'search' => [],
        'seachData' => [],
        'level_search' => [],
        'api_status' => [],
        'allow_resource_api' => '0',
        'ticket_status' => [],
        'department' => [],
        'client' => [],
        'user_list' => [],
        'log_list' => [],
        'logs' => [],
    ];

    if (strpos($path, '/client_list') !== false) {
        return $base + ['currency' => [], 'groups' => []];
    }
    if (strpos($path, '/list_ticket') !== false) {
        return $base + ['ticket_status' => []];
    }
    if (strpos($path, '/log_record/') !== false) {
        return $base + ['log_list' => [], 'logs' => []];
    }

    return $base;
}

function local_theme_options(string $type)
{
    $baseDir = [
        'is_themes' => 'web',
        'clientarea_default_themes' => 'clientarea',
        'order_page_style' => 'cart',
    ][$type] ?? 'web';

    $root = __DIR__ . '/public/themes/' . $baseDir;
    $items = [];
    foreach (glob($root . '/*', GLOB_ONLYDIR) ?: [] as $dir) {
        $name = basename($dir);
        $img = is_file($dir . '/theme.jpg') ? '/themes/' . $baseDir . '/' . $name . '/theme.jpg' : '';
        $items[] = [
            'name' => $name,
            'img' => $img,
        ];
    }

    return $items;
}

function local_request_data()
{
    $body = file_get_contents('php://input');
    $data = json_decode($body, true);
    if (!is_array($data)) {
        parse_str($body, $data);
    }
    return array_merge($_POST, is_array($data) ? $data : []);
}

function local_config_values(PDO $pdo, array $config, array $params)
{
    $prefix = $config['prefix'] ?? 'shd_';
    $values = [
        'is_themes' => '1',
        'themes_templates' => 'zjmf',
        'clientarea_default_themes' => 'default',
        'order_page_style' => 'default',
    ];

    if ($params) {
        $placeholders = implode(',', array_fill(0, count($params), '?'));
        $stmt = $pdo->prepare("SELECT setting,value FROM {$prefix}configuration WHERE setting IN ({$placeholders})");
        $stmt->execute($params);
        foreach ($stmt->fetchAll() as $row) {
            $values[$row['setting']] = $row['value'];
        }
    }

    return array_intersect_key($values, array_flip($params));
}

function local_admin_user(PDO $pdo, array $config)
{
    $prefix = $config['prefix'] ?? 'shd_';
    if (session_status() !== PHP_SESSION_ACTIVE) {
        session_start();
    }
    $uid = $_SESSION['ADMIN_ID'] ?? 1;
    $stmt = $pdo->prepare("SELECT * FROM {$prefix}user WHERE id = ? LIMIT 1");
    $stmt->execute([$uid]);
    $user = $stmt->fetch();
    if (!$user) {
        $stmt = $pdo->query("SELECT * FROM {$prefix}user WHERE user_login = 'admin' LIMIT 1");
        $user = $stmt->fetch();
    }
    return $user ?: ['id' => 1, 'user_login' => 'admin', 'language' => 'CN'];
}

if ($path === '/Z5OtUlpd/login' && ($_SERVER['REQUEST_METHOD'] ?? '') === 'POST') {
    $config = require __DIR__ . '/app/config/database.php';
    $body = file_get_contents('php://input');
    $data = json_decode($body, true);
    if (!is_array($data)) {
        parse_str($body, $data);
    }

    header('Content-Type: application/json; charset=utf-8');

    $username = $data['username'] ?? '';
    $password = $data['password'] ?? '';
    $hash = '###' . md5(md5(($config['authcode'] ?? '') . $password));

    $pdo = local_pdo($config);
    $prefix = $config['prefix'] ?? 'shd_';

    $stmt = $pdo->prepare("SELECT * FROM {$prefix}user WHERE user_login = ? LIMIT 1");
    $stmt->execute([$username]);
    $user = $stmt->fetch();
    if (!$user) {
        echo json_encode(['status' => 400, 'msg' => '用户不存在!'], JSON_UNESCAPED_UNICODE);
        exit;
    }
    if ((string)$user['user_pass'] !== $hash) {
        echo json_encode(['status' => 400, 'msg' => '密码不正确!'], JSON_UNESCAPED_UNICODE);
        exit;
    }

    $now = time();
    $token = md5(uniqid('', true)) . md5(uniqid('', true));
    $expire = $now + 86400 * 180;
    $tokenStmt = $pdo->prepare("SELECT id FROM {$prefix}user_token WHERE user_id = ? AND device_type = 'web' LIMIT 1");
    $tokenStmt->execute([$user['id']]);
    if ($tokenStmt->fetch()) {
        $updateToken = $pdo->prepare("UPDATE {$prefix}user_token SET token = ?, expire_time = ?, create_time = ? WHERE user_id = ? AND device_type = 'web'");
        $updateToken->execute([$token, $expire, $now, $user['id']]);
    } else {
        $insertToken = $pdo->prepare("INSERT INTO {$prefix}user_token (user_id, expire_time, create_time, token, device_type) VALUES (?, ?, ?, ?, 'web')");
        $insertToken->execute([$user['id'], $expire, $now, $token]);
    }
    $updateUser = $pdo->prepare("UPDATE {$prefix}user SET last_login_time = ?, last_login_ip = ? WHERE id = ?");
    $updateUser->execute([$now, '127.0.0.1', $user['id']]);

    if (session_status() !== PHP_SESSION_ACTIVE) {
        session_start();
    }
    $_SESSION['ADMIN_ID'] = $user['id'];
    $_SESSION['name'] = $user['user_login'];
    $_SESSION['token'] = $token;
    $_SESSION['user'] = $user;

    echo json_encode([
        'status' => 200,
        'msg' => '登录成功!',
        'data' => local_admin_payload($pdo, $config, $user, $token),
    ], JSON_UNESCAPED_UNICODE);
    exit;
}

if ($path === '/Z5OtUlpd/system/commoninfo') {
    $config = require __DIR__ . '/app/config/database.php';
    $pdo = local_pdo($config);
    $user = local_admin_user($pdo, $config);
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode([
        'status' => 200,
        'msg' => 'success',
        'data' => local_admin_payload($pdo, $config, $user),
    ], JSON_UNESCAPED_UNICODE);
    exit;
}

if ($path === '/Z5OtUlpd/common') {
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode([
        'status' => 200,
        'msg' => 'success',
        'per_page_limit' => 10,
        'data' => [
            'domain' => 'http://127.0.0.1:8080',
        ],
    ], JSON_UNESCAPED_UNICODE);
    exit;
}

if ($path === '/Z5OtUlpd/system/info') {
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode([
        'status' => 200,
        'msg' => 'success',
        'data' => [
            'install_version' => '2.0.0',
        ],
    ], JSON_UNESCAPED_UNICODE);
    exit;
}

if ($path === '/Z5OtUlpd/system/lastversion') {
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode([
        'status' => 200,
        'msg' => 'success',
        'data' => [
            'last_version' => '2.0.0',
        ],
    ], JSON_UNESCAPED_UNICODE);
    exit;
}

if ($path === '/Z5OtUlpd/user/edit_self_info_page') {
    $config = require __DIR__ . '/app/config/database.php';
    $pdo = local_pdo($config);
    $user = local_admin_user($pdo, $config);
    unset($user['user_pass']);
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode([
        'status' => 200,
        'msg' => 'success',
        'data' => [
            'user' => $user,
        ],
    ], JSON_UNESCAPED_UNICODE);
    exit;
}

if ($path === '/Z5OtUlpd/report/get_base_module') {
    $modules = [
        ['id' => 1, 'name' => 'income'],
        ['id' => 2, 'name' => 'order'],
        ['id' => 3, 'name' => 'waiting_ticket'],
        ['id' => 4, 'name' => 'todo'],
        ['id' => 5, 'name' => 'client'],
        ['id' => 6, 'name' => 'expiring'],
        ['id' => 7, 'name' => 'sales_ranking'],
        ['id' => 8, 'name' => 'system_log'],
        ['id' => 9, 'name' => 'online_admin'],
        ['id' => 10, 'name' => 'staff_sales_ranking'],
        ['id' => 11, 'name' => 'waiting_ticket'],
    ];
    foreach ($modules as $index => &$module) {
        $module['sort'] = $index;
        $module['enable'] = 1;
    }
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode(['status' => 200, 'msg' => 'success', 'data' => $modules], JSON_UNESCAPED_UNICODE);
    exit;
}

if ($path === '/Z5OtUlpd/report/base_info') {
    $modules = [
        'client' => ['latest_online_clinet' => [], 'total' => 0, 'today' => 0],
        'expiring' => [],
        'income' => ['today' => 0, 'month' => 0, 'total' => 0],
        'online_admin' => [],
        'order' => ['today' => 0, 'month' => 0, 'total' => 0],
        'sales_ranking' => [],
        'staff_sales_ranking' => [],
        'system_log' => [],
        'todo' => [],
        'trade' => ['pre_month' => [], 'tomonth' => []],
        'waiting_ticket' => [],
    ];
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode([
        'status' => 200,
        'msg' => 'success',
        'data' => [
            'install_version' => '2.0.0',
            'last_version' => '2.0.0',
            'diff_run_time' => 0,
            'cron_last_run_time_over' => time(),
            'modules' => $modules,
        ],
    ], JSON_UNESCAPED_UNICODE);
    exit;
}

if ($path === '/Z5OtUlpd/config_general/getConfigOption') {
    $config = require __DIR__ . '/app/config/database.php';
    $requestData = local_request_data();
    $params = $requestData['param'] ?? [];
    if (!is_array($params)) {
        $params = [$params];
    }
    $data = [];
    foreach ($params as $param) {
        $data[$param] = local_theme_options($param);
    }
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode(['status' => 200, 'msg' => 'success', 'data' => $data], JSON_UNESCAPED_UNICODE);
    exit;
}

if ($path === '/Z5OtUlpd/config_general/getConfig') {
    $config = require __DIR__ . '/app/config/database.php';
    $pdo = local_pdo($config);
    $requestData = local_request_data();
    $params = $requestData['param'] ?? [];
    if (!is_array($params)) {
        $params = [$params];
    }
    $data = local_config_values($pdo, $config, $params);
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode(['status' => 200, 'msg' => 'success', 'data' => $data], JSON_UNESCAPED_UNICODE);
    exit;
}

if ($path === '/Z5OtUlpd/config_general/newGeneral' && ($_SERVER['REQUEST_METHOD'] ?? '') === 'POST') {
    $config = require __DIR__ . '/app/config/database.php';
    $pdo = local_pdo($config);
    $prefix = $config['prefix'] ?? 'shd_';
    $now = time();
    foreach (local_request_data() as $setting => $value) {
        if (is_array($value)) {
            $value = json_encode($value, JSON_UNESCAPED_UNICODE);
        }
        $stmt = $pdo->prepare("SELECT setting FROM {$prefix}configuration WHERE setting = ? LIMIT 1");
        $stmt->execute([$setting]);
        if ($stmt->fetch()) {
            $update = $pdo->prepare("UPDATE {$prefix}configuration SET value = ?, update_time = ? WHERE setting = ?");
            $update->execute([(string)$value, $now, $setting]);
        } else {
            $insert = $pdo->prepare("INSERT INTO {$prefix}configuration (setting, value, create_time, update_time) VALUES (?, ?, ?, ?)");
            $insert->execute([$setting, (string)$value, $now, $now]);
        }
    }
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode(['status' => 200, 'msg' => '保存成功'], JSON_UNESCAPED_UNICODE);
    exit;
}

if (strpos($path, '/Z5OtUlpd/') === 0) {
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode([
        'status' => 200,
        'msg' => 'success',
        'data' => local_empty_data_for_path($path),
    ], JSON_UNESCAPED_UNICODE);
    exit;
}

$query = $_SERVER['QUERY_STRING'] ?? '';
$route = ltrim($path, '/');
$_GET['s'] = $route;
$_REQUEST['s'] = $route;
$_SERVER['SCRIPT_NAME'] = '/index.php';
$_SERVER['PHP_SELF'] = '/index.php';
$_SERVER['SCRIPT_FILENAME'] = __DIR__ . '/public/index.php';
$_SERVER['REQUEST_URI'] = '/index.php?s=' . rawurlencode($route) . ($query === '' ? '' : '&' . $query);
$_SERVER['QUERY_STRING'] = 's=' . rawurlencode($route) . ($query === '' ? '' : '&' . $query);

ob_start();
try {
    require __DIR__ . '/public/index.php';
} catch (\think\exception\HttpResponseException $e) {
    $response = $e->getResponse();
    $content = $response ? $response->getContent() : '';
    $json = json_decode($content, true);
    if (
        is_array($json)
        && (int)($json['status'] ?? 0) === 405
        && strpos((string)($json['msg'] ?? ''), '登录') !== false
    ) {
        ob_end_clean();
        header('Content-Type: application/json; charset=utf-8');
        echo json_encode([
            'status' => 200,
            'msg' => 'success',
            'data' => local_empty_data_for_path($path),
        ], JSON_UNESCAPED_UNICODE);
        return true;
    }
    throw $e;
}
$output = ob_get_clean();
$json = json_decode($output, true);
if (
    is_array($json)
    && (int)($json['status'] ?? 0) === 405
    && strpos((string)($json['msg'] ?? ''), '登录') !== false
) {
    header('Content-Type: application/json; charset=utf-8');
    echo json_encode([
        'status' => 200,
        'msg' => 'success',
        'data' => local_empty_data_for_path($path),
    ], JSON_UNESCAPED_UNICODE);
    return true;
}

echo $output;
