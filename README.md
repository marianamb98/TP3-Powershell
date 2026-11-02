# Trabajo Práctico 3: Scripting y Control de Flujo con PowerShell

**Módulo:** Programación para Seguridad Informática  
**Docente:** Lic. Carlos Pacheco  
**Materia/Carrera:** Seguridad Informática  
**Estudiante:** Mariana B. Mamani  
**Fecha:** Noviembre 2026  

---

## 1. Introducción y Objetivos

En el ámbito de la **Seguridad Informática** y la **Administración de Sistemas**, los scripts de consola (shell scripting) constituyen una herramienta fundamental para la automatización de tareas administrativas, la respuesta ante incidentes, el análisis forense y la recolección periódica de evidencias.

El entorno **PowerShell** (desarrollado por Microsoft) destaca por su arquitectura basada en objetos y su potente conjunto de comandos nativos (*cmdlets*). Este trabajo práctico tiene como objetivo principal afianzar los conceptos fundamentales de programación estructurada en PowerShell:
- Captura de datos interactiva del usuario (`Read-Host`).
- Estructuras de repetición controladas (`for`).
- Bifurcaciones lógicas condicionales (`if / else`).
- Integración de funciones de fecha y hora del sistema (`Get-Date`) para auditoría y trazabilidad cronológica.
- Control de versiones colaborativo y entrega formal mediante Git y GitHub.

---

## 2. Consignas del Trabajo Práctico

1. **Desarrollo del Script en PowerShell:**
   - Solicitar al usuario la introducción de un número límite mediante `Read-Host`.
   - Utilizar un bucle `for` para iterar desde 1 hasta dicho número límite.
   - Evaluar dentro de cada iteración mediante una condición `if` si el número actual es **par** o **impar**.
   - Integrar el cmdlet `Get-Date` para registrar e imprimir la hora exacta de la iteración junto con el mensaje explicativo en la consola.
2. **Control de Versiones:** Subir el código fuente y la documentación a una cuenta de **GitHub**.
3. **Entrega Institucional:** Subir a la plataforma educativa universitaria un archivo de texto de Bloc de Notas (`.txt`) con el enlace (URL) al repositorio online.

---

## 3. Estructura del Directorio del Proyecto

```text
tp3-powershell/
│
├── tp3_script.ps1       # Código fuente del script PowerShell
├── README.md            # Informe técnico detallado del trabajo realizado
└── entrega_url.txt      # Archivo de texto para entrega en la plataforma universitaria
```

---

## 4. Desarrollo Técnico y Explicación del Código

El script implementado se encuentra en el archivo `tp3_script.ps1`. A continuación se describe la lógica de cada sección:

### A. Entrada de datos y validación de tipos (`Read-Host`)
```powershell
$entrada = Read-Host "Por favor, introduzca un numero limite"
```
* **Explicación:** El cmdlet `Read-Host` suspende momentáneamente la ejecución para recibir la entrada del operador por teclado. Por defecto, PowerShell captura esta entrada como una cadena de caracteres (`System.String`). Para evitar errores lógicos al compararla con números enteros dentro del bucle, el script implementa un control con `[int]::TryParse` que valida que el valor ingresado sea efectivamente un número entero positivo mayor o igual a 1.

### B. Ciclo de iteración determinístico (`for`)
```powershell
for ($i = 1; $i -le $limite; $i++) {
    ...
}
```
* **Explicación:** Se define un bucle `for` clásico estructurado en tres expresiones:
  1. **Inicialización:** `$i = 1` establece la variable contadora en 1 (punto de inicio solicitado).
  2. **Condición de continuidad:** `$i -le $limite` (*Less than or Equal*) verifica que el contador no supere el número ingresado.
  3. **Paso de incremento:** `$i++` incrementa la variable en 1 unidad tras cada iteración.

### C. Registro temporal y trazabilidad (`Get-Date`)
```powershell
$horaExacta = Get-Date -Format "HH:mm:ss"
```
* **Explicación:** En operaciones de ciberseguridad, registrar la estampa de tiempo (*timestamp*) es vital para la correlación de eventos, logs y análisis forense. El cmdlet `Get-Date` obtiene el reloj del sistema. Aplicando el formato `-Format "HH:mm:ss"` se extrae la hora, minutos y segundos exactos en formato de 24 horas para cada ciclo.

### D. Evaluación de paridad (`if / else` y operador módulo `%`)
```powershell
if ($i % 2 -eq 0) {
    Write-Host "[$horaExacta] El numero $i es PAR" -ForegroundColor Cyan
} else {
    Write-Host "[$horaExacta] El numero $i es IMPAR" -ForegroundColor Magenta
}
```
* **Explicación:** 
  - Se utiliza el operador aritmético de módulo (`%`), el cual devuelve el resto de una división entera.
  - Si `$i % 2 -eq 0` (el resto de dividir el número por 2 es 0), el número es **PAR**.
  - Si el resto es distinto de 0, la bifurcación ingresa al bloque `else`, catalogándolo como **IMPAR**.
  - Se utiliza `Write-Host` con los parámetros `-ForegroundColor Cyan` y `-ForegroundColor Magenta` para diferenciar visualmente los estados en la terminal.

---

## 5. Instrucciones de Ejecución Paso a Paso

### Requisitos Previos
- Sistema Operativo Windows con **PowerShell 5.1** o **PowerShell 7+**.
- Editor de código: **Visual Studio Code** o **Visual Studio**.

### Paso 1: Abrir el proyecto en Visual Studio / VS Code
1. Abre **Visual Studio Code** (o Visual Studio).
2. Ve al menú superior: **Archivo (File) > Abrir carpeta (Open Folder...)**.
3. Selecciona la carpeta `tp3-powershell`.

### Paso 2: Abrir la terminal integrada
1. En el menú superior de VS Code, selecciona **Terminal > Nueva terminal (New Terminal)** o presiona el atajo `Ctrl + \` `.
2. Comprueba que el prompt indique que estás situado en la carpeta del proyecto.

### Paso 3: Habilitar ejecución de scripts (si estuviera restringida)
Por motivos de seguridad, las directivas por defecto de Windows pueden restringir la ejecución de scripts `.ps1`. Para habilitarlo en la sesión actual de la terminal sin alterar la configuración global del sistema, ejecuta:
```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

### Paso 4: Ejecutar el script
Invoca el script mediante la sintaxis:
```powershell
.\tp3_script.ps1
```

---

## 6. Ejemplo de Ejecución y Salida en Consola

Al ejecutar el script e ingresar el número límite `6`, la salida obtenida es la siguiente:

```text
==========================================================
   TRABAJO PRACTICO 3 - POWERSHELL: CONTROL DE FLUJO     
   Modulo: Programacion para Seguridad Informatica       
==========================================================

Por favor, introduzca un numero limite: 6

--- Iniciando iteraciones (1 hasta 6) ---

[20:09:27] El numero 1 es IMPAR
[20:09:27] El numero 2 es PAR
[20:09:27] El numero 3 es IMPAR
[20:09:27] El numero 4 es PAR
[20:09:27] El numero 5 es IMPAR
[20:09:27] El numero 6 es PAR

==========================================================
   Proceso finalizado correctamente.                     
==========================================================
```

---

## 7. Guía Paso a Paso para Subir a GitHub (Punto 2)

Sigue estos sencillos pasos desde la terminal de Visual Studio Code:

1. **Inicializar el repositorio Git local:**
   ```bash
   git init
   ```
2. **Añadir todos los archivos al seguimiento:**
   ```bash
   git add .
   ```
3. **Realizar el primer commit descriptivo:**
   ```bash
   git commit -m "Entrega Trabajo Practico 3 - PowerShell: Script y Documentacion"
   ```
4. **Crear el repositorio en GitHub:**
   - Ingresa a tu cuenta de [GitHub](https://github.com/).
   - Haz clic en el botón verde **"New"** (Nuevo repositorio).
   - Asigna un nombre (por ejemplo: `tp3-powershell-seguridad`).
   - Elige visibilidad **Pública** (*Public*).
   - Deja sin marcar las casillas de README o .gitignore.
   - Haz clic en **"Create repository"**.
5. **Vincular el repositorio remoto y subir el código:**
   ```bash
   git branch -M main
   git remote add origin https://github.com/marianamb98/tp3-powershell-seguridad.git
   git push -u origin main
   ```

---

## 8. Formato de Entrega para la Plataforma Universitaria (Punto 3)

La consigna solicita subir un archivo de **Bloc de Notas (`.txt`)** con la URL del repositorio de GitHub. 

Para este fin, se incluye en esta carpeta el archivo `entrega_url.txt` preparado para completar y adjuntar directamente en el campus de la universidad.

---

## 9. Conclusiones

Este trabajo práctico permitió aplicar las estructuras de control básicas de PowerShell en un escenario práctico de consola. La combinación de validación de entradas, iteración determinística, evaluación condicional y marcas temporales en tiempo real constituye la base para el desarrollo de scripts más avanzados en el área de seguridad informática, tales como monitoreo periódico de procesos sospechosos o escaneo de rangos de puertos e IPs.