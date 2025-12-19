// ---------------------------------------
// IMPORTAR VARIABLES DEL ENTORNO
// ---------------------------------------
import {
  URL_AUT_LOGIN,
  KEY_CACHE_EMAIL,
  KEY_CACHE_PASS,
  KEY_CACHE_TEMP
} from "../env.js";

// ---------------------------------------
// PBKDF2: generar hash en el cliente
// ---------------------------------------
async function generarHash(password, salt) {
  const encoder = new TextEncoder();

  const keyMaterial = await crypto.subtle.importKey(
    "raw",
    encoder.encode(password),
    "PBKDF2",
    false,
    ["deriveBits", "deriveKey"]
  );

  const key = await crypto.subtle.deriveKey(
    {
      name: "PBKDF2",
      salt: encoder.encode(salt),
      iterations: 150000,
      hash: "SHA-256",
    },
    keyMaterial,
    { name: "AES-GCM", length: 256 },
    true,
    ["encrypt", "decrypt"]
  );

  const rawKey = await crypto.subtle.exportKey("raw", key);

  return btoa(String.fromCharCode(...new Uint8Array(rawKey)));
}


// ---------------------------------------
// LOGIN PRINCIPAL
// ---------------------------------------
export async function loginAutenticacion(email, password) {
  // 1) Crear hash PBKDF2 con SALT = email
  const hash = await generarHash(password, email);
  const action = "outh"

  // 2) Enviar a API Apps Script
  const res = await fetch(URL_AUT_LOGIN, {
    method: "POST", 
    body: JSON.stringify({ email, hash, action })
  });

  const json = await res.json();

  // 3) Si autorizado → guardar en cache
  if (json.status === true) {
    const hoy = new Date().toISOString().substring(0, 10);

    localStorage.setItem(KEY_CACHE_EMAIL, email);
    localStorage.setItem(KEY_CACHE_PASS, hash);
    localStorage.setItem(KEY_CACHE_TEMP, hoy);

    return json;
  }

  // 4) Acceso denegado
  return json;
}