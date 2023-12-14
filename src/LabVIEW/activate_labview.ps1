# Activate LabVIEW 2021 License and verify if it's activated

IF (( $null -ne $Args[0] ) -and ( $null -ne $Args[1] ) -and ( $null -ne $Args[2] ) -and ( $null -ne $Args[3] ) -and ( $null -ne $Args[4] )) {   

# Set input parameters to variable
$SERIALNUMBER = $Args[0]
$FIRSTNAME = $Args[1]
$LASTNAME = $Args[2]
$ORGANIZATIONNAME = $Args[3]
$LABVIEWVERSION = $Args[4]

# Execute Activation Command
Write-Output "---Activate LabVIEW ---"
& "C:\Program Files (x86)\National Instruments\Shared\License Manager\bin\nilmUtil.exe" -s `
-activate "LabVIEW_PDSD_PKG $LABVIEWVERSION" `
-serialnumber "$SERIALNUMBER" `
-firstname "$FIRSTNAME" `
-lastname "$LASTNAME" `
-organizationname "$ORGANIZATIONNAME"

Write-Output "---Verify Activation---"
& labviewcli.exe -OperationName ExecuteBuildSpec -Help

IF ($LastExitCode -ne 0) { Write-Output "Error Level : $LastExitCode" }

EXIT $LastExitCode

}

# Usage Section
Write-Output "----------------------------------- Usage -----------------------------------"
Write-Output "activate_labview.ps1 ""SerialNumber"" ""FirstName"" ""LastName"" ""OrganisationName"""
Write-Output "-----------------------------------------------------------------------------"
Write-Output "Serial Number     : Serial Number Provided by NI e.g. ""X00X00000"""
Write-Output "First Name        : First Name e.g. ""John"""
Write-Output "Last Name         : Last Name e.g. ""Doe"""
Write-Output "Organization Name : Organization Name used to purchase the LabVIEW License.\"
Write-Output "                    e.g.""ACME"""
Write-Output "LabVIEW Version   : LabVIEW Version e.g. ""21.0"" "
Write-Output "-----------------------------------------------------------------------------"
