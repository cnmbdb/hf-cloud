import { createServer } from "node:http";
import { extname, join, normalize } from "node:path";
import { readFile } from "node:fs/promises";

const root = process.cwd();
const webRoot = join(root, "themes", "web", "ogmiao");
const port = Number(process.env.PORT || 8090);

const mime = {
  ".html": "text/html; charset=utf-8",
  ".css": "text/css; charset=utf-8",
  ".js": "text/javascript; charset=utf-8",
  ".json": "application/json; charset=utf-8",
  ".png": "image/png",
  ".jpg": "image/jpeg",
  ".jpeg": "image/jpeg",
  ".webp": "image/webp",
  ".svg": "image/svg+xml; charset=utf-8",
  ".ico": "image/x-icon",
  ".txt": "text/plain; charset=utf-8",
  ".woff": "font/woff",
  ".woff2": "font/woff2",
};

const setting = {
  web_view: "/themes/web/ogmiao",
  web_url: "",
  company_name: "HFCloud",
  company_profile: "HFCloud 提供云服务器、全球节点、高防网络与企业级运维支持。",
  company_phone: "暂无电话",
  company_email: "ogmiao@outlook.com",
  company_address: "上海市浦东新区",
  company_record: "",
  logo_url_home: "/themes/web/ogmiao/%E6%9C%AA%E5%91%BD%E5%90%8D%20%E4%BB%BD%20%E4%BB%BD%20%E4%BB%BD%20%E4%BB%BD%20%E4%BB%BD%20%E4%BB%BD%20%E4%BB%BD%20%E4%BB%BD%203.png",
};

function safePath(base, urlPath) {
  const clean = normalize(decodeURIComponent(urlPath)).replace(/^(\.\.[/\\])+/, "");
  return join(base, clean);
}

async function readText(path) {
  return await readFile(path, "utf8");
}

function replaceVars(html) {
  return html
    .replace(/\{include\s+file="common\/header"\s*\/\}/g, headerCache)
    .replace(/\{include\s+file="common\/footer"\s*\/\}/g, footerCache)
    .replace(/\{\$setting\.([a-zA-Z0-9_]+)(?:\|default='([^']*)')?\}/g, (_, key, fallback) => {
      return setting[key] ?? fallback ?? "";
    })
    .replace(/\{\$canonical\|default='([^']*)'\}/g, "$1")
    .replace(/\{\$head\|raw\|default=''\}/g, "")
    .replace(/\{\$nav_links\|raw\|default=''\}/g, "");
}

let headerCache = "";
let footerCache = "";

async function renderPage(urlPath) {
  let page = urlPath === "/" ? "index.html" : urlPath.replace(/^\//, "");
  if (!page.endsWith(".html")) page += ".html";
  const html = await readText(safePath(webRoot, page));
  return replaceVars(html);
}

async function refreshIncludes() {
  headerCache = await readText(join(webRoot, "common", "header.html"));
  footerCache = await readText(join(webRoot, "common", "footer.html"));
}

await refreshIncludes();

createServer(async (req, res) => {
  try {
    const url = new URL(req.url || "/", `http://127.0.0.1:${port}`);
    await refreshIncludes();

    if (url.pathname.startsWith("/themes/")) {
      const filePath = safePath(root, url.pathname);
      const data = await readFile(filePath);
      res.writeHead(200, { "Content-Type": mime[extname(filePath)] || "application/octet-stream" });
      res.end(data);
      return;
    }

    const html = await renderPage(url.pathname);
    res.writeHead(200, { "Content-Type": "text/html; charset=utf-8" });
    res.end(html);
  } catch (error) {
    res.writeHead(404, { "Content-Type": "text/plain; charset=utf-8" });
    res.end(`Preview not found: ${req.url}\n${error.message}`);
  }
}).listen(port, "127.0.0.1", () => {
  console.log(`ogmiao preview: http://127.0.0.1:${port}/`);
});
