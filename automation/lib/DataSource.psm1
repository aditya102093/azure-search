﻿Import-Module (Join-Path $PSScriptRoot "CRUDHelpers.psm1") -DisableNameChecking

$baseUri = "https://$Global:serviceName.search.windows.net/datasources"

function Get-DataSource
{
    param ($dataSourceName)

    return Get-Entity $baseUri $dataSourceName
}

function Create-DataSource
{
    param ($dataSourceDefinition)

    $name = $entityDefinition.name
    Write-Host "Creating data source $name..."

    return Create-Entity $baseUri $dataSourceDefinition
}

function Update-DataSource
{
    param ($dataSourceName, $dataSourceDefinition)

    Write-Host "Updating data source $dataSourceName..."
    return Update-Entity $baseUri $dataSourceName $dataSourceDefinition
}

function Delete-DataSource
{
    param ($dataSourceName)

    Write-Host "Deleting data source $dataSourceName..."
    return Delete-Entity $baseUri $dataSourceName
}

function List-DataSources
{
    return List-Entities $baseUri
}

Export-ModuleMember -Function Get-DataSource
Export-ModuleMember -Function Create-DataSource
Export-ModuleMember -Function Update-DataSource
Export-ModuleMember -Function Delete-DataSource
Export-ModuleMember -Function List-DataSources