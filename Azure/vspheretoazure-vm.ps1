#Upload VHD
Add-AzVhd -Destination "https://<storagebloburl>.blob.core.windows.net/<container-folder>/<file-name>.vhd" -LocalFilePath "<path-to-vm-vhd>" -ResourceGroupName "<resource-group-name>" -NumberOfUploaderThreads 32
#Create Variables
$resourceGroupName = "<resource-group-name>"
$destinationVhd = "https://<storagebloburl>.blob.core.windows.net/<container-folder>/<file-name>.vhd"
$virtualNetworkName = "<vnet-name>"
$locationName = "<location>"
#Create Virtual network
$virtualNetwork = Get-AzVirtualNetwork -ResourceGroupName $resourceGroupName -Name $virtualNetworkName
#Define Virtual NIC and subnet settings
$networkInterface = New-AzNetworkInterface -Name "<nic-name>" -ResourceGroupName $resourceGroupName -Location $locationName -SubnetId "/subscriptions/<subscription-id>/resourceGroups/<resource-group-name>/providers/Microsoft.Network/virtualNetworks/<vnet-name>/subnets/<snet-name>"  -IpConfigurationName "IPC-NIC-<vmname>" -DnsServer "8.8.8.8", "8.8.4.4"
#Define Virtual Machine parameters
$vmConfig = New-AzVMConfig -VMName "<vmname>" -VMSize "Standard_B1ms"
#VM OS Disk
$vmConfig = Set-AzVMOSDisk -VM $vmConfig -Name "OSdisk" -VhdUri $destinationVhd -CreateOption Attach -Windows
$vmConfig = Add-AzVMNetworkInterface -VM $vmConfig -Id $networkInterface.Id
$vm = New-AzVM -VM $vmConfig -Location $locationName -ResourceGroupName $resourceGroupName