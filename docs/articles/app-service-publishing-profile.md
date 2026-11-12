# Interacting with Azure App Service using a publishing profile

## Introduction

Interacting with Azure App Service using a publishing profile is something you might need in certain scenarios, developers may need to automate tasks such as file management within their App Service.

This article provides a step-by-step explanation of a PowerShell script designed to delete files from an Azure App Service using the Azure CLI and REST API.

## The Scenario

Consider a situation where you have files within a specific directory on your Azure App Service, and you want to automate the process of deleting these files. This could be part of a larger automation or maintenance workflow.

## The PowerShell Script

Let's break down the PowerShell script that accomplishes this task:

```powershell
# Get publishing profile for web application ( get credentials)

$publishingProfile = az webapp deployment list-publishing-credentials -n $WebAppServiceName -g $ResourceGroupName `
                        --query '{name:name, publishingUserName:publishingUserName, publishingPassword:publishingPassword}' | Out-String

$publishingProfileObject = ConvertFrom-JSON -InputObject $publishingProfile

# Create Base64 authorization header 
$username = $publishingProfileObject.publishingUserName
$password = $publishingProfileObject.publishingPassword 
$base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $username,$password)))

# Define Request Body
$bodyToPOST = @{   
    command = "find . -mindepth 1 -delete"
    dir = "/home/site/wwwroot/App_Data/jobs/triggered/job1"   
}   

# Splat all parameters together in $param   
$param = @{   
    Uri = "https://$WebAppServiceName.scm.azurewebsites.net/api/command"   
    Headers = @{Authorization=("Basic {0}" -f $base64AuthInfo)}   
    Method = "POST"   
    Body = (ConvertTo-Json $bodyToPOST)   
    ContentType = "application/json"   
}   

# Invoke REST call   
Invoke-RestMethod @param
```

Script Explanation

- **Get Publishing Profile:**
   - The script uses the `az` command-line interface to obtain publishing credentials for the specified Azure App Service. These credentials include a username and password required for authentication.

- **Create Base64 Authorization Header:**
   - The script extracts the publishing username and password from the obtained publishing profile and creates a Base64-encoded authorization header. This header is used for authentication when making the REST API call.

- **Define Request Body:**
   - The script defines a request body in the form of a hash table (`$bodyToPOST`). In this example, the command is set to "find . -mindepth 1 -delete," which is a command to delete files in a specified directory (`dir`).

- **Invoke REST Call:**
   - Using splatting, the script combines parameters into the `$param` hash table for the `Invoke-RestMethod` cmdlet. Parameters include the URI (REST API endpoint), headers (including the authorization header), HTTP method (POST), request body (converted to JSON), and content type.
   - The `Invoke-RestMethod` cmdlet is then used to make the REST API call to the Azure App Service's SCM (Site Control Manager) endpoint to execute the specified command.

## Conclusion

This PowerShell script provides a practical example of automating file deletion within an Azure App Service. Developers can customize the script for their specific scenarios, incorporating it into larger automation workflows or maintenance tasks. By leveraging Azure CLI and REST APIs, this script showcases the flexibility and extensibility of Azure App Service for managing web applications in the cloud.

