param(
    [Parameter(Mandatory=$true)]
    [string]$LabInstance
)

$AzureContext = Get-AzContext

# Create a new resource group
New-AzResourceGroup -Name rg-juiceshop-prod-lod -Location 'East US' -Tag @{ LabInstance = $LabInstance; Environment = 'Prod' }
New-AzResourceGroup -Name rg-juiceshop-dev-lod -Location "East US" -Tag @{ LabInstance = $LabInstance; Environment = 'Dev' }


$Providers = Get-AzResourceProvider -ListAvailable

foreach ($Provider in $Providers) {
    if ($Provider.RegistrationState -ne "Registered") {
        Write-Host "Registering $($Provider.ProviderNamespace)..."
        Register-AzResourceProvider -ProviderNamespace $Provider.ProviderNamespace -ErrorAction SilentlyContinue
    } else {
        Write-Host "$($Provider.ProviderNamespace) is already registered."
    }
}