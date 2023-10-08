### Export list of users in an Active Directory group
> The following PowerShell code lets you get the list of users in a specific group and export them as a csv. The following code get the "DisplayName" of the user and whether it's "Enabled" or not, more filters can be added.
````
$groupname = <group-name>
$ADuser = foreach ($Group in $groupname){Get-ADGroupMember -Identity $Group}
$username = $ADuser.Name
$Output = foreach ($User in $ADuser){ Get-ADUser $User -Properties * | select DisplayName, Enabled}
Write-Host $Output
$Output | Export-Csv C:\<list-of-users-group-name>.csv -NoTypeInformation
````
### Enabling Auto Dial-in for active users AD Users
````
get-aduser -filter "Enabled -eq '$true' " |set-aduser -replace @{msnpallowdialin=$true}
````
