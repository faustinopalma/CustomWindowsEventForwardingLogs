###
# Copyright: Elastic NV (https://www.elastic.co/) 2021
# Licence: AGPL 3.0
# Author: Thorben Jändling
# 

cd $PSScriptRoot


# ~~~~~~~~~~~~~~~~~~~ Configurables Start Here ~~~~~~~~~~~~~~~~~~~~~~

# List of Providers with
# - A unique GUID; Use [guid]::NewGuid() to get new GUIDs, if you want to add new Providers
# - The (channel) Logs Directory; Recommend using dedicated disks/storage e.g. D:\Logs
# - The max Log Size before rollover
# - The AD Groups that map hosts to them (Include/Exclude)
# NOTE: The AD Groups listed here will be created if missing!
$ProviderList = @{

    "WecFwdLog-Domain-Clients" = @{
        GUID = "{ea76befc-2be5-4a24-bfab-3d9303ac27d5}";
        LogDir = "C:\Logs"
        LogSize = 10737418240 # 10G per channel/file
    };

    "WecFwdLog-Domain-Controllers" = @{
        GUID = "{4f365d6b-57ea-466d-ad6e-22864307ad5f}";
        LogDir = "C:\Logs"
        LogSize = 10737418240 # 10G per channel/file
    };


    "WecFwdLog-Domain-Misc" = @{
        GUID = "{5bb6e603-33c4-4be3-bf40-102476243076}";
        LogDir = "C:\Logs"
        LogSize = 10737418240 # 10G per channel/file
    };

    "WecFwdLog-Domain-Privileged" = @{
        GUID = "{c00ccb56-d596-40de-9a88-4e6c2a4244d4}";
        LogDir = "C:\Logs"
        LogSize = 10737418240 # 10G per channel/file
    };

    "WecFwdLog-Domain-Servers" = @{
        GUID= "{1673d607-4c45-4cbf-80ee-554eaf561626}";
        LogDir = "C:\Logs"
        LogSize = 10737418240 # 10G per channel/file
    };

}


# List of Channels (log files) and their Forwarding event selector Filters
# The Filter used is set via $FFProfile (above) in the form "FF${FFProfile}"
$ChannelList = @{

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Application
    "Application" = @{};

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Misc
    "Misc" = @{};

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Script (PowerShell)
    "Script" = @{}

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Security
    "Security" = @{};

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Service
    "Service" = @{};

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Sysmon
    "Sysmon" = @{};

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ System
    "System" = @{};

#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ End

} # $ChannelList

# Extra processors to include in the generated winlogbeat.yml
$WlbProcessorsExtras = @"
- add_observer_metadata: ~
"@

# Extra Event Log inputs to include in the generated winlogbeat.yml
$wlbEventLogsExtras = @"
"@

# Extra options to add to each Event Log input in the generated winlogbeat.yml
$wlbEventLogOptions = @"
"@



# Base name for our WEC Forward Channels files
$wfcName = "WecFwdChans"

# Paths to the SDK tools
$SdkPath = "C:\Program Files (x86)\Windows Kits\8.1\bin\x64"
$DotNetPath = "C:\Windows\Microsoft.NET\Framework64\v4.0.30319"
 
