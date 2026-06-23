<?php

$path = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
$file = __DIR__ . urldecode($path);

if ($path !== '/' && is_file($file)) {
    return false;
}

$query = $_SERVER['QUERY_STRING'] ?? '';
$route = ltrim($path, '/');
$_GET['s'] = $route;
$_REQUEST['s'] = $route;
$_SERVER['SCRIPT_NAME'] = '/index.php';
$_SERVER['PHP_SELF'] = '/index.php';
$_SERVER['SCRIPT_FILENAME'] = __DIR__ . '/index.php';
$_SERVER['REQUEST_URI'] = '/index.php?s=' . rawurlencode($route) . ($query === '' ? '' : '&' . $query);
$_SERVER['QUERY_STRING'] = 's=' . rawurlencode($route) . ($query === '' ? '' : '&' . $query);

require __DIR__ . '/index.php';
