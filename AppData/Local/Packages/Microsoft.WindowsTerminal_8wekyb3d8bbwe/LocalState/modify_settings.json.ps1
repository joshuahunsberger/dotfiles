$ErrorActionPreference = 'Stop'

try {
    # Safely read stdin from pipeline without relying on Win32 Console handles
    $jsonInput = @($input) -join "`n"
    if ([string]::IsNullOrWhiteSpace($jsonInput)) {
        $settings = [PSCustomObject]@{}
    } else {
        $settings = $jsonInput | ConvertFrom-Json
    }

    function Set-PSProperty {
        param($Obj, [string]$Name, $Value)
        if (-not $Obj.PSObject.Properties[$Name]) {
            Add-Member -InputObject $Obj -MemberType NoteProperty -Name $Name -Value $Value -Force
        } else {
            $Obj.$Name = $Value
        }
    }

    # 1. Ensure Dracula scheme is in schemes
    $draculaScheme = [PSCustomObject]@{
        name = "Dracula"
        background = "#282A36"
        foreground = "#F8F8F2"
        cursorColor = "#F8F8F2"
        selectionBackground = "#44475A"
        black = "#21222C"
        blue = "#BD93F9"
        cyan = "#8BE9FD"
        green = "#50FA7B"
        purple = "#FF79C6"
        red = "#FF5555"
        white = "#F8F8F2"
        yellow = "#F1FA8C"
        brightBlack = "#6272A4"
        brightBlue = "#D6ACFF"
        brightCyan = "#A4FFFF"
        brightGreen = "#69FF94"
        brightPurple = "#FF92DF"
        brightRed = "#FF6E6E"
        brightWhite = "#FFFFFF"
        brightYellow = "#FFFFA5"
    }

    if (-not $settings.PSObject.Properties['schemes'] -or -not $settings.schemes) {
        Set-PSProperty $settings 'schemes' @()
    }
    $existingSchemes = @($settings.schemes | Where-Object { $_.name -ne 'Dracula' })
    Set-PSProperty $settings 'schemes' ($existingSchemes + $draculaScheme)

    # 2. Set defaults in profiles.defaults
    if (-not $settings.PSObject.Properties['profiles'] -or -not $settings.profiles) {
        Set-PSProperty $settings 'profiles' ([PSCustomObject]@{})
    }
    if (-not $settings.profiles.PSObject.Properties['defaults'] -or -not $settings.profiles.defaults) {
        Set-PSProperty $settings.profiles 'defaults' ([PSCustomObject]@{})
    }

    Set-PSProperty $settings.profiles.defaults 'colorScheme' "Dracula"
    Set-PSProperty $settings.profiles.defaults 'font' ([PSCustomObject]@{ face = "MesloLGM Nerd Font" })

    # 3. Set defaultProfile
    Set-PSProperty $settings 'defaultProfile' "{574e775e-4f2a-5b96-ac1e-a2962a402336}"

    # Output modified JSON to stdout (Chezmoi writes this to settings.json)
    $settings | ConvertTo-Json -Depth 10 | Write-Output
} catch {
    # Send any runtime errors to stderr so Chezmoi aborts instead of corrupting settings.json with error text!
    [Console]::Error.WriteLine("Error modifying Windows Terminal settings: $_")
    exit 1
}
