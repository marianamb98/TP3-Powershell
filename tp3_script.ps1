<#
================================================================================
Trabajo Practico 3: PowerShell
Modulo: Programacion para Seguridad Informatica
Docente: Lic. Carlos Pacheco
================================================================================
Descripcion:
Script interactivo que solicita un numero limite al usuario mediante Read-Host,
utiliza un ciclo for para recorrer del 1 al limite, evalua la paridad con un if,
y muestra en consola el estado junto con la hora exacta obtenida con Get-Date.
================================================================================
#>

# Asegurar codificacion UTF-8 en consola
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Encabezado visual informativo
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host "   TRABAJO PRACTICO 3 - POWERSHELL: CONTROL DE FLUJO     " -ForegroundColor Cyan
Write-Host "   Modulo: Programacion para Seguridad Informatica       " -ForegroundColor Cyan
Write-Host "==========================================================" -ForegroundColor Cyan
Write-Host ""

# 1. Pide al usuario que introduzca un numero limite usando Read-Host
$entrada = Read-Host "Por favor, introduzca un numero limite"

# Validacion y conversion segura a numero entero mayor o igual a 1
[int]$limite = 0

while (-not [int]::TryParse($entrada, [ref]$limite) -or $limite -lt 1) {
    Write-Host "[ADVERTENCIA] Por favor, ingrese un numero entero positivo valido (mayor o igual a 1)." -ForegroundColor Yellow
    $entrada = Read-Host "Introduzca el numero limite"
}

Write-Host "`n--- Iniciando iteraciones (1 hasta $limite) ---`n" -ForegroundColor Green

# 2. Utiliza un ciclo for para contar desde 1 hasta ese numero limite
for ($i = 1; $i -le $limite; $i++) {
    
    # Integra el cmdlet Get-Date para capturar la hora exacta en cada iteracion
    $horaExacta = Get-Date -Format "HH:mm:ss"

    # 3. Condicion if para identificar si el numero es par o impar
    if ($i % 2 -eq 0) {
        # Si el resto de dividir por 2 es 0, es PAR
        Write-Host "[$horaExacta] El numero $i es PAR" -ForegroundColor Cyan
    } else {
        # En caso contrario, es IMPAR
        Write-Host "[$horaExacta] El numero $i es IMPAR" -ForegroundColor Magenta
    }
}

Write-Host "`n==========================================================" -ForegroundColor Green
Write-Host "   Proceso finalizado correctamente.                     " -ForegroundColor Green
Write-Host "==========================================================" -ForegroundColor Green