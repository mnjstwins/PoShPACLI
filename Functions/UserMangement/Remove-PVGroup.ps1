﻿Function Remove-PVGroup {

	<#
		.SYNOPSIS
			Deletes a CyberArk group from the Vault

		.DESCRIPTION
			Exposes the PACLI Function: "DELETEGROUP"

		.PARAMETER vault
		The name of the Vault containing the group.

		.PARAMETER user
		The Username of the User who is carrying out the command

		.PARAMETER group
		The name of the group to delete.

		.PARAMETER sessionID
			The ID number of the session. Use this parameter when working
				with multiple scripts simultaneously. The default is ‘0’.

		.EXAMPLE
			Remove-PVGroup -vault Lab -user administrator -group old_group

			Deletes group old_group from Vault.

		.NOTES
			AUTHOR: Pete Maan
			LASTEDIT: August 2017
		#>

	[CmdLetBinding()]
	param(
		[Parameter(Mandatory = $True)][string]$vault,
		[Parameter(Mandatory = $True)][string]$user,
		[Parameter(Mandatory = $True)][string]$group,
		[Parameter(Mandatory = $False)][int]$sessionID
	)

	If(!(Test-PACLI)) {

		#$pacli variable not set or not a valid path

	}

	Else {

		#$PACLI variable set to executable path

		$Return = Invoke-PACLICommand $pacli DELETEGROUP $($PSBoundParameters.getEnumerator() | ConvertTo-ParameterString)

		if($Return.ExitCode) {

			Write-Error $Return.StdErr

		}

		else {

			Write-Verbose "Deleted Group $group"

			Write-Debug "Command Complete. Exit Code:$($Return.ExitCode)"

		}

	}

}