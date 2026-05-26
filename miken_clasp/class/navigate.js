import { PROYECT_NAME } from "../env.js";

export class Navigate {
    static NAME_APP = PROYECT_NAME ? "/"+PROYECT_NAME+"/views" : "";

    static PATHS = {
        LOGIN: "/login.html",
        HOME: "/index.html",
        PRODUCTOS: "/products/list.html",
        PRODUCTO_NUEVO: "/products/create.html",
        PRODUCTO_EDITAR: "/products/edit.html",
        PERFIL: "/perfil/index.html",
        CONFIGURACION: "/configuracion/index.html"
    };

    static isGithubPages() { return window.location.hostname.includes("github.io"); }
    static getBaseRepo() {
        if (!this.isGithubPages()) return "";
        const parts = window.location.pathname.split("/");
        const repo = parts[1] || "";
        return repo ? "/" + repo : "";
    }
    static getFullBase() { return this.getBaseRepo() + this.NAME_APP; }
    static getFullPaths() {
        const base = this.getFullBase();
        const fullPaths = {};
        for (const [key, path] of Object.entries(this.PATHS))
            fullPaths[key] = base + (path.startsWith("/") ? path : "/" + path);
        return fullPaths;
    }
    static getCurrentRoute() { return window.location.pathname.replace(this.getFullBase(), "") || "/"; }
    static to(route) {
        const base = this.getFullBase();
        const clean = route.startsWith("/") ? route : "/" + route;
        if (clean.startsWith("#")) { window.location.hash = clean; return; }
        window.location.href = base + clean;
    }
    static here_is(route) { return this.getCurrentRoute() === route || this.getCurrentRoute() === route + ".html"; }
    static here_not_is(route) { return !this.here_is(route); }
    static toWithParams(baseRoute, params = {}) {
        const qs = new URLSearchParams(params).toString();
        this.to(`${baseRoute}${qs ? '?'+qs : ''}`);
    }
    static getUrlParams() { return new URLSearchParams(window.location.search); }
}
