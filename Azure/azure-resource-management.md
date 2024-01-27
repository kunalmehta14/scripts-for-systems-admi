### Viewing the desired resource groups
> This command lets you view the resource groups with a certain value in the name:
````
az group list --subscription <SUBSCRIPTION-ID> --query="[?contains(name, '<VALUE>')]"
````

### To view resource inside resource groups with specific names
>
````
az resource list --subscription <SUBSCRIPTION-ID> --query="[?contains(resourceGroup, '<VALUE>')]" --query="[?contains(name, '<VALUE>')]" --output table
````

### Deleting a resource
````
az resource delete --name <RESOURCE-NAME> --resource-group <RESOURCE's GROUP NAME> --subscription <SUBSCRIPTION-ID> --resource-type <RESOURCE-TYPE For Example: "Microsoft.Compute/virtualMachines"> --verbose
````
> Deleting a VM:
````
az resource delete --name <VM-NAME> --resource-group <RESOURCE's GROUP NAME> --subscription <SUBSCRIPTION-ID> --resource-type "Microsoft.Compute/virtualMachines" --verbose
````
> Deleting a VM disk:
````
az resource delete --name <DISK-NAME> --resource-group <RESOURCE's GROUP NAME> --subscription <SUBSCRIPTION-ID> --resource-type "Microsoft.Compute/disks" --verbose
````
> Deleting a public IP:
````
az resource delete --name <PIP-NAME> --resource-group <RESOURCE's GROUP NAME> --subscription <SUBSCRIPTION-ID> --resource-type "Microsoft.Network/publicIPAddresses" --verbose
````
> Deleting a virtual NIC:
````
az resource delete --name <vNIC-NAME> --resource-group <RESOURCE's GROUP NAME> --subscription <SUBSCRIPTION-ID> --resource-type "Microsoft.Network/networkInterfaces" --verbose
````
