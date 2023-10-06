### Enabling Auto Dial-in for active users AD Users
````
get-aduser -filter "Enabled -eq '$true' " |set-aduser -replace @{msnpallowdialin=$true}
````
