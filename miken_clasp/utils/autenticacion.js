import { URL_API, KEY_CACHE_EMAIL, KEY_CACHE_TOKEN } from "../env.js";

async function generarHash(password, salt) {
    const encoder = new TextEncoder();
    const keyMaterial = await crypto.subtle.importKey("raw", encoder.encode(password), "PBKDF2", false, ["deriveBits","deriveKey"]);
    const key = await crypto.subtle.deriveKey(
        { name: "PBKDF2", salt: encoder.encode(salt), iterations: 150000, hash: "SHA-256" },
        keyMaterial, { name: "AES-GCM", length: 256 }, true, ["encrypt","decrypt"]
    );
    const rawKey = await crypto.subtle.exportKey("raw", key);
    return btoa(String.fromCharCode(...new Uint8Array(rawKey)));
}

export async function loginAutenticacion(email, password) {
    const hash = await generarHash(password, email);
    const res = await fetch(URL_API, {
        method: "POST",
        body: JSON.stringify({ action: "login", email, password: hash }) // o enviar password en texto plano? Depende del backend
    });
    const json = await res.json();
    if (json.success === true) {
        localStorage.setItem(KEY_CACHE_EMAIL, email);
        localStorage.setItem(KEY_CACHE_TOKEN, json.token);
        return { success: true, token: json.token };
    }
    return { success: false, error: json.error };
}
