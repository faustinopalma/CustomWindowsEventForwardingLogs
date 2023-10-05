###
# Copyright: Elastic NV (https://www.elastic.co/) 2021
# Licence: AGPL 3.0
# Author: Thorben Jändling
# 

$ErrorActionPreference = "Stop"

# Assume the .dll file is in the same dir as this script
cd $PSScriptRoot

. .\wec_config.ps1

# Uninstall any previously installed Channels
If (Test-Path -Path "${env:SystemRoot}\System32\${wfcNAme}.man") {
    & wevtutil.exe um "${env:SystemRoot}\System32\${wfcNAme}.man"
}

# These are the two files to remove
Remove-Item -Path "${env:SystemRoot}\System32\${wfcName}.dll"
Remove-Item -Path "${env:SystemRoot}\System32\${wfcName}.man"

