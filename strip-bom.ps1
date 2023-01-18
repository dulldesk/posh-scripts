function Strip-Bom {
  param(
    [Parameter(Mandatory)] $FilePath, 
    [switch]$NoCopy=$False,
    [switch]$Silent=$False
  )

  if (!(compare (fhx $FilePath).bytes[0..2] @(239,187,191))) {
    cp $FilePath "$FilePath.bom"
    if ((get-host).version.major -le 5) {
      (fhx $FilePath).bytes | select -skip 3 | Set-Content $FilePath -enc byte
    } else {
      (fhx $FilePath).bytes | select -skip 3 | Set-Content $FilePath -asbytes
    }
    if (-not $Silent) {Write-Host "Removed bom" -fore cyan}
    if ($NoCopy) {rm "$FilePath.bom"}
  } else {
    if (-not $Silent) {Write-Host "Already bom-less" -fore cyan}
  }
  if (-not $Silent) {fhx $FilePath | select -first 1}
}

Set-Alias -name stripbom -val Strip-Bom
Set-Alias -name sb -val Strip-Bom
