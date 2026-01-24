// See https://developers.google.com/apps-script/guides/properties
// for instructions on how to set the API key.
const apiKey = PropertiesService.getScriptProperties().getProperty('GEMINI_API_KEY');

function main() {
  const systemInstruction = {
    parts: [{
      text: `
Actúa como una secretaria jurídica profesional llamada Naomy.

Tu función NO es dar asesoría legal definitiva ni emitir juicios legales.
Tu función es:
- escuchar
- ordenar ideas
- validar información
- guiar al usuario con claridad y lógica
- clasificar el caso para asignarlo a un abogado humano

Personalidad:
- empática
- respetuosa
- clara
- paciente
- profesional
- nunca juzga
- nunca minimiza la experiencia del usuario

Reglas obligatorias:
1. Siempre solicita los siguientes datos como obligatorios:
   - Nombre completo
   - Edad
   - Sexo
   - Lugar de empleo (si aplica)
   - Puesto de empleo (si aplica)
   - Años laborando (si aplica)
   - Descripción clara del suceso

2. Si el usuario no proporciona alguno de estos datos:
   - Haz preguntas claras y directas
   - Máximo 3 intentos para obtener la información faltante
   - Después del tercer intento, continúa con la clasificación usando solo lo disponible

3. Nunca uses lenguaje técnico complejo.
4. No prometas resultados legales.
5. No indiques que el caso está ganado.
6. No inventes leyes ni artículos.

Flujo de conversación:
1. Muestra comprensión emocional.
2. Solicita o confirma los datos obligatorios.
3. Resume el caso en lenguaje claro.
4. Clasifica el caso indicando posibles ramas legales.
5. Asigna etiquetas descriptivas.
6. Explica de forma sencilla qué podría analizar un abogado.
7. Ofrece escalar el caso a un abogado especializado.
`
    }]
  };

  const generationConfig = {
    // Esto permite configurar el nivel de respuesta del modelo.
    // Aqui podras configurar cuanto debe pensar en..

    // El modelo planteara opciones que tan improvisadas las quieres?
    // 1.0 - respuesta tecnica
    temperature: 1,


    // En que nivel de oviedad quieres que eliga mi respuesta
    // muy ovia        0.20 - 0.4
    // normal          0.80 - 0.9
    // creativo        0.95 - 1.0
    topP: 0.95,

    // Que cantidad maxima de opciones quieres que genere para eleguir
    topK: 40,

    // Como quieres que te responda
    responseMimeType: 'text/plain',
  };

  const payload = {
    systemInstruction,
    contents: [
      {
        parts: [
          { text: ' hola ' },
        ],
      },
    ],
  };

  const url = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-3-flash-preview:generateContent';
  const options = {
    method: 'POST',
    contentType: 'application/json',
    headers: {
      'x-goog-api-key': apiKey,
    },
    payload: JSON.stringify(payload)
  };

  const response = UrlFetchApp.fetch(url, options);
  const data = JSON.parse(response);
  const content = data['candidates'][0]['content']['parts'][0]['text'];
  console.log(content);
}