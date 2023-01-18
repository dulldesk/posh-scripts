function ls-recent {
  param($n=5)
  $a = $args
  try {
    $n = [int]$n

    if ($n -lt 0) {
      Write-Error "Cannot query a negative number of items"
      return
    }
  } catch {
    $a = @($n) + $args
    $n = 5
  }
  return ls @a | sort lastwritetime -desc | select -first $n
}

set-alias -name ls-rec -val ls-recent
