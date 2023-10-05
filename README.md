# Windows Event Collector scripts

These scripts are taken from the repository https://github.com/ElasticSA/wec_pepped which was created by Elastic.co
The Elastic.co repository provides additional features that have been removed from this version for simplicity.

The concepts are based on the original blog: https://learn.microsoft.com/en-gb/archive/blogs/russellt/creating-custom-windows-event-forwarding-logs

This version of the scripts provides the following features aimed at creating custom windows event forwarding logs.
- create manifest and dll needed for the custom log channels and providers: this is done with the scripts gen_manifest.ps1 and build_man2dll.ps1
- install the manifest and dll in the system32 directory and registering these files: this is done with the script install_channels.ps1
- uninstall the manifest and dll: this is done with the script uninstall_channels.ps1

In order for the build_man2dll.ps1 script to work, it is needed to install the Windows 8.1 SDK that is available from this archive:
https://developer.microsoft.com/en-us/windows/downloads/sdk-archive/

The build of the dll can be done on a different computer and then moved on the computer on which the dll is installed. This means that the target computer do not need to have the Windows 8.1 SDK installed.

In order to configure the channels and providers that are built into the manifest and dll files, edit the wec_config.ps1 file.
Then run the two scripts gen_manifest.ps1 and build_man2dll.ps1 to create the manifest and dll.
Finally, move the entire repo on the target computer if it is a different unit and run the final script, install_channels.ps1, with admin priviledged


# Licence

AGPL v3

