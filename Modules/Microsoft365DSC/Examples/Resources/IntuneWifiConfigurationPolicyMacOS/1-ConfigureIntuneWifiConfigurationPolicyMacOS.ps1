<#
This example is used to test new resources and showcase the usage of new resources being worked on.
It is not meant to use as a production baseline.
#>

Configuration Example
{
    param(
        [Parameter(Mandatory = $true)]
        [PSCredential]
        $credsGlobalAdmin
    )
    Import-DscResource -ModuleName Microsoft365DSC

    node localhost
    {
        IntuneWifiConfigurationPolicyMacOS 'myWifiConfigMacOSPolicy'
        {
            Id                             = 'cad22363-785b-4820-9909-28d5f35048c2'
            DisplayName                    = 'macos wifi'
            Assignments =MSFT_DeviceManagementConfigurationPolicyAssignments {
                deviceAndAppManagementAssignmentFilterType = 'none'
                dataType                                   = '#microsoft.graph.allDevicesAssignmentTarget'
            }
            ConnectAutomatically           = $True
            ConnectWhenNetworkNameIsHidden = $True
            NetworkName                    = 'ea1cf5d7-8d3e-40ca-9cb8-b8c8a4c6170b'
            ProxyAutomaticConfigurationUrl = 'AZ500PrivateEndpoint22'
            ProxySettings                  = 'automatic'
            Ssid                           = 'aaaaaaaaaaaaa'
            WiFiSecurityType               = 'wpaPersonal'
            Ensure                         = 'Present'
            Credential                     = $credsGlobalAdmin
        }
    }
}
