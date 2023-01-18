Function Recycle-Item {
	[CmdletBinding()]
	param(
		[Parameter(Mandatory, ValueFromPipelineByPropertyName)][string]$FullName
	)
	begin{
		Add-Type -AssemblyName Microsoft.VisualBasic
	}

	process {
		$pth = $FullName
		if (test-path ("$pwd\$pth")) {$pth = "$pwd\$pth"}

		if (Test-Path $pth -pathtype leaf) {
			[Microsoft.VisualBasic.FileIO.FileSystem]::DeleteFile($pth,'OnlyErrorDialogs','SendToRecycleBin')
		}
		elseif (Test-Path $pth -pathtype container) {
			[Microsoft.VisualBasic.FileIO.FileSystem]::DeleteDirectory($pth,'OnlyErrorDialogs','SendToRecycleBin')
		}
		else {
			throw "Path $pth does not exist"
		}
	}
	end{}
}

Set-Alias -Name recycle -Value Recycle-Item
