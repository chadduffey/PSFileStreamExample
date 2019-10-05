[System.IO.FileInfo]$hashes = "C:\Users\ChadDuffey\Downloads\pwned-passwords-ntlm-ordered-by-count.txt"
$outfile = "C:\Users\ChadDuffey\Downloads\smaller.txt"

$fsHashes = New-Object IO.Filestream $hashes,'Open','Read','Read'
$frHashes = New-Object System.IO.StreamReader ($fsHashes)

while (($line = $frHashes.ReadLine()) -ne $null){
    if ([int]$line.Split(":")[1] -lt 24){
        write-host $line
        Add-Content $outfile $line
        Write-Host $line -ForegroundColor Green
    } else {
        Write-Host $line -ForegroundColor Gray
    }
}
