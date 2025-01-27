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
  return get-childitem @a | sort-object lastwritetime -desc | select-object -first $n
}

set-alias ls-rec ls-recent
