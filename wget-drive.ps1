function wget-drive {
	param(
		[Parameter(Mandatory)][string]$url,
		[Parameter(Mandatory)][string]$outfile
	)

	try {
		$id = ($url | sls -pattern 'drive.google.com/file/d/([A-Za-z_\-0-9]+)/?').matches.groups[1]
	}
	catch {
		write-host "could not parse as drive url: $url" -fore red
		return
	}
	iwr "https://drive.google.com/uc?export=download&id=$id&confirm=yes" -OutFile $outfile
}
