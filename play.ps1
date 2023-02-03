function play($f, [switch]$loop=$false) {
	if (test-path "$pwd\$f") {$f = "$pwd\$f"}
	$o = new-object system.media.soundplayer $f
	if ($loop) {$o.playlooping()} else {$o.play()}
	return $o
}

