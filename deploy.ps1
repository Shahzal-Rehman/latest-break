# Variables
$resourceGroup = "break_group"
$location = "eastus"
$appName = "timeguardians-app-" + (Get-Random)
$zipPath = "package.zip"

# Compress project into zip
if (Test-Path $zipPath) { Remove-Item $zipPath }
Compress-Archive -Path * -DestinationPath $zipPath

# Create Static Web App
az staticwebapp create `
  --name $appName `
  --resource-group $resourceGroup `
  --location $location `
  --source $zipPath `
  --login-with-github `
  --branch main `
  --token "<YOUR_GITHUB_PAT>"

Write-Output "🚀 Deployment complete! Your app name is $appName"
