
## Step 3: Configure Oh-My-Posh

Once Oh-My-Posh is installed, you can configure your PowerShell prompt to use a custom theme. Oh-My-Posh comes with several built-in themes that you can choose from. To configure your prompt, follow these steps:

1. **Open your PowerShell profile for editing**:

   If you haven't created a PowerShell profile, you can create one by running:

   ```powershell
   if (!(Test-Path -Path $PROFILE )) { New-Item -Type File -Path $PROFILE -Force }
   ```

   Then, open the profile in your preferred text editor:

   ```powershell
   notepad.exe $PROFILE
   ```

2. **Set your preferred Oh-My-Posh theme**:

   Add the following line to your PowerShell profile, replacing `'agnoster'` with the name of the theme you want to use (e.g., `'agnoster'`, `'paradox'`, `'fish'`, etc.):

   ```powershell
   Set-PoshPrompt -Theme 'agnoster'
   ```

3. **Save and close your profile**.

4. **Reload your PowerShell session** or open a new Windows Terminal instance to see the updated prompt with your chosen theme.

## Step 4: Verify Oh-My-Posh Installation

To verify that Oh-My-Posh is correctly installed and configured, open Windows Terminal and ensure that you see your custom prompt with the selected theme. You should see a stylish and informative prompt that includes Git status, time, and other relevant information.

Congratulations! You've successfully set up Windows Terminal with Oh-My-Posh, enhancing your command-line experience on Windows.

## Resources

Here are some useful resources for further customization and troubleshooting:

- [Oh-My-Posh GitHub Repository](https://github.com/JanDeDobbeleer/oh-my-posh): The official Oh-My-Posh GitHub repository, where you can find documentation and additional themes.

- [Windows Terminal GitHub Repository](https://github.com/microsoft/terminal): The official Windows Terminal GitHub repository for updates, issues, and contributions.

- [PowerShell Gallery](https://www.powershellgallery.com/): The official PowerShell Gallery, where you can find and explore various PowerShell modules, including Oh-My-Posh.

With Windows Terminal and Oh-My-Posh, you can enjoy a visually appealing and highly customizable terminal experience on your Windows system. Feel free to explore different themes and configurations to make it your own.