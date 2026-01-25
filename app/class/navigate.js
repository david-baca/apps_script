import { PROYECT_NAME } from "../env.js";

export class Navigate {

    static NAME_APP = "/"+PROYECT_NAME+"/views";

    static PATHS = {
        LOGIN: "/login.html",
        HOME: "/index.html",
        PRODUCTOS: "/views/products/list.html",
        PRODUCTO_NUEVO: "/views/products/create.html",
        PRODUCTO_EDITAR: "/views/products/edit.html",
        PERFIL: "/views/perfil/index.html",
        CONFIGURACION: "/views/configuracion/index.html"
    };

    static isGithubPages() {
        return window.location.hostname.includes("github.io");
    }

    static getBaseRepo() {
        if (!this.isGithubPages()) return ""; // LOCAL => sin repo
        const parts = window.location.pathname.split("/");
        const repo = parts[1] || "";
        return repo ? "/" + repo : "";
    }

    static getFullBase() {
        return this.getBaseRepo() + this.NAME_APP;
    }

    static getCurrentRoute() {
        const base = this.getFullBase();
        return window.location.pathname.replace(base, "") || "/";
    }

    static to(route) {
        const base = this.getFullBase();
        const clean = route.startsWith("/") ? route : "/" + route;
        
        // Si es una ruta interna con hash (#)
        if (clean.startsWith("#")) {
            window.location.hash = clean;
            return;
        }
        
        const finalURL = base + clean;
        window.location.href = finalURL;
    }

    static here_is(route){ 
        const current = this.getCurrentRoute();
        return current === route || current === route + ".html"; 
    }
    
    static here_not_is(route){ 
        return !this.here_is(route); 
    }
    
    // Navegación con parámetros
    static toWithParams(baseRoute, params = {}) {
        const queryString = new URLSearchParams(params).toString();
        const route = `${baseRoute}${queryString ? '?' + queryString : ''}`;
        this.to(route);
    }
    
    // Obtener parámetros de la URL actual
    static getUrlParams() {
        const queryString = window.location.search;
        return new URLSearchParams(queryString);
    }
}