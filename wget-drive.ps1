function wget-drive {
	param(
		[Parameter(Mandatory)][string]$id,
		[Parameter(Mandatory)][string]$outfile
	)

	wget.exe "https://drive.google.com/uc?export=download&id=$id&confirm=yes" -O $outfile
}
