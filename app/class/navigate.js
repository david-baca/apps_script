import { PROYECT_NAME } from "../env.js";

export class Navigate {

    static NAME_APP = "/"+PROYECT_NAME+"/app";

    static PATHS = {
        LOGIN: "/login.html",
        HOME: "/index.html",
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
        const finalURL = base + clean;
        window.location.href = finalURL;
    }

    static here_is(route){ return this.getCurrentRoute() === route; }
    static here_not_is(route){ return this.getCurrentRoute() !== route; }
}
