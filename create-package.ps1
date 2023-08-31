if ($null -eq (Get-Command "divine.exe" -ErrorAction SilentlyContinue)) {
    Write-Host "ERROR: divine.exe not found. Please add `{LSlib}/Tools` to your path."
    Exit
}

$modPath = "C:/Dev/Baldur's Gate 3/Mods/UtilitySpells"
$modName = "UtilitySpells"
if ($PSBoundParameters.ContainsKey("p1")) {
    Write-Host "Mod path provided. The package will be sourced from ""${p1}/${modName}"""
    $modPath = $p1
}
else {
    Write-Host "WARNING: no path provided. Using the default value as LSlib requires an absolute value."
}
Write-Host "Mod path provided. The package will be sourced from ""${modPath}/${modName}"""

Write-Host "Creating package from source files"
divine.exe -a create-package -g bg3 -s "${modPath}/${modName}" -d "${modPath}/release/${modName}.pak"