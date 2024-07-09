Write-Host "Iniciando instalação de componentes  básicos."

if(!(Get-Command wsl.exe -Error-Action SilentlyContinue)) {
    Write-Host "wsl não esta instalado. Por Favor, instale-o primeiro"
    exit
}

if(!(Get-Command winget -Error-Action SilentlyContinue)) {
    Write-Host "Winget não esta instalado. Por Favor, instale-o primeiro"
    exit
}

$vsVersion = Read-Host "Informe a versão desejada do Visual Studio:"

$vsPackage = "Microsoft.VisualStudio.$vsVersion.Community"

Write-Host "Instalando wsl..."
wsl.exe --install

Write-Host "Instalando pacotes..."
winget install `
    Microsoft.VisualStudioCode `
    Git.Git `
    Postman.Postman `
    dbeaver.dbeaver `
    Amazon.Kindle `
    suse.RancherDesktop `
    JanDeDobbeleer.OhMyPosh `
    $vsPackage --accept-package-agreements --accept-source-agreements

