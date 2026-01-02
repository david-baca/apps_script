import {
    KEY_CACHE_EMAIL,
    KEY_CACHE_PASS,
    KEY_CACHE_TEMP
} from "../env.js";
import { Navigate } from "./navigate.js";
import { loginAutenticacion } from "../utils/autenticacion.js";

export class Sesion {
    // Propiedades estáticas compartidas por TODAS las instancias
    static email = false;
    static hash = false;
    static fecha = false;

    constructor() {
        const { status, email, hash, hoy } = this.is_ready_login();
        this.email = email;
        this.hash = hash
        this.fecha = hoy;
        this.init_listen_action_logout()
    }
    
    init_listen_action_logout(){
        const destroy_sesion = document.getElementById("destroy_sesion");
        if (destroy_sesion) {
            destroy_sesion.addEventListener("click", () => {
                localStorage.removeItem(KEY_CACHE_EMAIL);
                localStorage.removeItem(KEY_CACHE_PASS);
                localStorage.removeItem(KEY_CACHE_TEMP);
                Navigate.to(Navigate.PATHS.LOGIN)
            });
        }
    }

    static init_listen_action_login(){
        const btn_init_loguin = document.getElementById("btnEnviar");
        if (btn_init_loguin) {
            btn_init_loguin.addEventListener("click", async () => {
                const password = document.getElementById("password").value;
                const email = document.getElementById("email").value;
                const response = await loginAutenticacion(email, password);
                if (response.status){
                    globalThis.Report.addSuccess_reload("Operación realizada correctamente"+response.message);
                }else{
                    globalThis.Report.addError("Operación fallida"+response.message);
                }
            });
        }
    }

    is_ready_login() {
        
        const email = localStorage.getItem(KEY_CACHE_EMAIL);
        const hash = localStorage.getItem(KEY_CACHE_PASS);
        const fecha = localStorage.getItem(KEY_CACHE_TEMP);
        const hoy = new Date().toISOString().substring(0, 10);

        // Evaluamos si la sesion es valida
        let sesion_is_valid = (email && hash && fecha === hoy)

        // Si falta algo o la fecha expira → destruir sesión
        if (!sesion_is_valid) {
            localStorage.removeItem(KEY_CACHE_EMAIL);
            localStorage.removeItem(KEY_CACHE_PASS);
            localStorage.removeItem(KEY_CACHE_TEMP);
            // Redirigir a login
            if ( Navigate.here_not_is(Navigate.PATHS.LOGIN) ){
                Navigate.to(Navigate.PATHS.LOGIN)
            }
        }

        // Sesión válida
        if ( sesion_is_valid && Navigate.here_is(Navigate.PATHS.LOGIN) ){
            Navigate.to(Navigate.PATHS.HOME)
        }
        
        return { ok: true, email, hash, hoy };
    }
}