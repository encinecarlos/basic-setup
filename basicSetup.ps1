Write-Host "Installing basic components."

if(!(Get-Command -Name wsl)) {
    Write-Host "Installing wsl..."
    wsl.exe --install
    exit
}

if(!(Get-Command -Name winget)) {
    Write-Host "Winget not installed. Please, intall winget first"
    exit
}

$vsVersion = Read-Host "Visual studio Version"

$vsPackage = "Microsoft.VisualStudio.$vsVersion.Community"

$apps = @(
    @{name = "Microsoft.WindowsTerminal"}
    @{name = "Microsoft.VisualStudioCode"}
    @{name = "Git.Git"}
    @{name = "Postman.Postman"}
    @{name = "dbeaver.dbeaver"}
    @{name = "Amazon.Kindle"}
    @{name = "suse.RancherDesktop"}
    @{name = "JanDeDobbeleer.OhMyPosh"}
    @{name = $vsPackage}
)

Write-Host "Installing packages..."
foreach($app in $apps) {
    $listApp = winget --list -q $app.name

    if(![string]::Join("",$listApp).Contains($app.name)) {
        Write-Host "Instalando:" $app.name

        if($null -ne $app.source) {
            winget install --id $app.name -e -s $app.source --accept-package-agreements
        } else {
            winget install --id $app.name -e --accept-package-agreements
        }
    } else {
        Write-Host "Ignorar instalação do pacote " $app.name
    }
}
# winget install --id Microsoft.VisualStudioCode
# winget install --id Git.Git
# winget install --id Postman.Postman
# winget install --id dbeaver.dbeaver
# winget install --id Amazon.Kindle
# winget install --id suse.RancherDesktop
# winget install --id $vsPackage