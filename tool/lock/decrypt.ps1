param (
    [string]$targetDir,
    [string]$key
)

Function Decrypt-File {
    param ($path, $key)
    $bytes = [System.IO.File]::ReadAllBytes($path)
    for ($i = 0; $i -lt $bytes.Length; $i++) {
        $bytes[$i] = $bytes[$i] -bxor $key[$i % $key.Length]
    }
    $decPath = $path -replace "\.locked$", ""
    [System.IO.File]::WriteAllBytes($decPath, $bytes)
    Remove-Item $path
}

Get-ChildItem -Path $targetDir -Recurse -Filter *.locked | ForEach-Object {
    Decrypt-File $_.FullName ([System.Text.Encoding]::UTF8.GetBytes($key))
}
