# Hiding the full file path in VSCode Terminal

In this guide, we'll walk through the steps to hide the full file path and only show the current folder name in your PowerShell prompt.

The customization involves modifying the PowerShell profile.

## Step 1: Open the PowerShell Terminal in VSCode

Launch Visual Studio Code and open the integrated terminal by selecting  `Terminal`

## Step 2: Open the PowerShell Profile

Type the following command into the terminal and press Enter:

```powershell
code $PROFILE
```

or 

you can open the profile in `Notepad` by using the following command:

```powershell
notepad $PROFILE
```

## Step 3: Add Custom Prompt Function


```powershell
Function Prompt { "$( ( get-item $pwd).Name )> " }
```

or

```powershell
function prompt {
  $p = Split-Path -leaf -path (Get-Location)
  "$p> "
}
```

This modification ensures that only the current folder name is displayed in the PowerShell prompt.

## Step 4: Save the Profile

Save the changes to the profile file and close the editor.

## Step 5: Restart PowerShell

To apply the changes, restart your PowerShell session.

Now, when you open a new PowerShell terminal in Visual Studio Code, you will notice that the full file path is hidden, and only the current folder name is displayed in the prompt.

before 

![Alt text](images\image-2.png)

after 

![Alt text](images\image-1.png)

## Conclusion

Customizing the PowerShell prompt in Visual Studio Code allows you to hide the full file path and displaying only the current folder name.
<!-- 
**Reference:**
For additional information, you can refer to [this reference](https://superuser.com/questions/446827/configure-windows-powershell-to-display-only-the-current-folder-name-in-the-shel). -->