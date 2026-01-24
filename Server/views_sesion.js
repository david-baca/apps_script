function change_password(data) {
  const email = data.email;
  const last_hash = data.last_hash;
  const new_hash = data.new_hash;

  if (!email) return ({ status: false, code: 400, message: "email es requerido" });
  if (!last_hash) return ({ status: false, code: 400, message: "last_hash es requerido" });
  if (!new_hash) return ({ status: false, code: 400, message: "new_hash es requerido" });

  const ss = SpreadsheetApp.openById(FILE_SHEET_ID);
  const sheet = getSheet(ss, "pass_secret");

  const { rowIndex, data: row } = findToSheet(sheet, email);

  if (!rowIndex) {
    return ({ status: false, code: 404, message: "Usuario no encontrado" });
  }

  const storedHash = row[1];

  if (storedHash !== last_hash) {
    return ({ status: false, code: 403, message: "Contraseña incorrecta" });
  }

  sheet.getRange(rowIndex, 2).setValue(new_hash);

  return ({ status: true, code:200, message: "Contraseña cambiada correctamente" });
}

