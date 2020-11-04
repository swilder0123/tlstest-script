# Usage notes:
# These commands were tested via cut-and-paste into the Powershell console
# For best results, copy the snippets into notepad and edit the accountName and rgName values
#
# PURPOSE
# Test connectivity from downlevel for storage connectivity
# REQUIREMENT
# You need an active Azure login in order for this scripts to work

# -------SNIP-------------

# Set the TLS version used by the PowerShell client to TLS 1.1.
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls11;

# Set the accountname below to an Azure Blob Storage account, configured with a minimum TLS level of 1.2
$accountName = "azblobacct"
$rgName = "azblobacct-rg"

# Attempt to create a new container - THIS SHOULD FAIL
write-host "Attempting to create a new container via TLS 1.1"
$storageAccount = Get-AzStorageAccount -ResourceGroupName $rgName -Name $accountName
$ctx = $storageAccount.Context
New-AzStorageContainer -Name "sample-container" -Context $ctx

# Set the accountname below to an Azure Data Lake Storage account, configured with a minimum TLS level of 1.2
$accountName = "azuredlsacct"
$rgName = "azuredlsacct-rg"

# Attempt to create a new folder in a ADLS - THIS SHOULD FAIL
write-host "Attempting to create a new folder via TLS 1.1"
$storageAccount = Get-AzStorageAccount -ResourceGroupName $rgName -Name $accountName
$ctx = $storageAccount.Context
New-AzStorageContainer -Name "sample-container" -Context $ctx

# --------SNIP------------

# Set the TLS version used by the PowerShell client to TLS 1.2.
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;

# Set the accountname below to an Azure Blob Storage account, configured with a minimum TLS level of 1.2
$accountName = "azblobacct"
$rgName = "azblobacct-rg"

# Attempt to create a new container - THIS SHOULD SUCCEED
write-host "Attempting to create a new container via TLS 1.2"
$storageAccount = Get-AzStorageAccount -ResourceGroupName $rgName -Name $accountName
$ctx = $storageAccount.Context
New-AzStorageContainer -Name "sample-container" -Context $ctx

# Set the accountname below to an Azure Data Lake Storage account, configured with a minimum TLS level of 1.2
$accountName = "azuredlsacct"
$rgName = "azuredlsacct-rg"

# Attempt to create a new folder in a ADLS - THIS SHOULD SUCCEED
write-host "Attempting to create a new folder via TLS 1.2"
$storageAccount = Get-AzStorageAccount -ResourceGroupName $rgName -Name $accountName
$ctx = $storageAccount.Context
New-AzStorageContainer -Name "sample-container" -Context $ctx
