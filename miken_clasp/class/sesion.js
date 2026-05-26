import { KEY_CACHE_EMAIL, KEY_CACHE_TOKEN } from "../env.js";
import { Navigate } from "./navigate.js";
import { loginAutenticacion } from "../utils/autenticacion.js";

export class Sesion {
    static token = null;
    static email = null;

    constructor() { this.checkSession(); this.init_listen_action_logout(); }

    checkSession() {
        const token = localStorage.getItem(KEY_CACHE_TOKEN);
        const email = localStorage.getItem(KEY_CACHE_EMAIL);
        if (!token || !email) {
            if (Navigate.here_not_is(Navigate.PATHS.LOGIN)) Navigate.to(Navigate.PATHS.LOGIN);
            return false;
        }
        Sesion.token = token;
        Sesion.email = email;
        if (Navigate.here_is(Navigate.PATHS.LOGIN)) Navigate.to(Navigate.PATHS.HOME);
        return true;
    }

    static init_listen_action_login() {
        const btn = document.getElementById("btnEnviar");
        if (btn) {
            btn.addEventListener("click", async () => {
                const email = document.getElementById("email").value;
                const password = document.getElementById("password").value;
                const result = await loginAutenticacion(email, password);
                if (result.success) {
                    globalThis.Report.addSuccess("Sesión iniciada");
                    window.location.reload();
                } else {
                    globalThis.Report.addError(result.error || "Error en login");
                }
            });
        }
    }

    init_listen_action_logout() {
        const btn = document.getElementById("destroy_sesion");
        if (btn) {
            btn.addEventListener("click", () => {
                localStorage.removeItem(KEY_CACHE_EMAIL);
                localStorage.removeItem(KEY_CACHE_TOKEN);
                Sesion.token = null;
                Sesion.email = null;
                Navigate.to(Navigate.PATHS.LOGIN);
            });
        }
    }
}
