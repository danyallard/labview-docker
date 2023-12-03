#Define variables
$src_folder="src"
$nipm_version="22.8"
$labview_version_21="21.0"
$labview_version_22="22.3"
#$labview_version_23="23.3"
$bitness_32="32bit"
$bitness_64="64bit"
$vianalyzer_version_21="21.0"
$vianalyzer_version_22="22.3"
$utf_version_21="21.0"
$utf_version_22="22.3"
$docker_user="danyallard"

$package_name_list = [System.Collections.ArrayList]::new()
$package_name_list.Add("nipm")
$package_name_list.Add("labview")
$package_name_list.Add("vianalyzer")
$package_name_list.Add("utf")

$labview_version_list = [System.Collections.ArrayList]::new()
$labview_version_list.Add($labview_version_21)
$labview_version_list.Add($labview_version_22)
#$labview_version_list.Add($labview_version_23)

$vianalyzer_version_list = [System.Collections.ArrayList]::new()
$vianalyzer_version_list.Add($vianalyzer_version_21)
$vianalyzer_version_list.Add($vianalyzer_version_22)
#$vianalyzer_version_list.Add($vianalyzer_version_23)

$utf_version_list = [System.Collections.ArrayList]::new()
$utf_version_list.Add($utf_version_21)
$utf_version_list.Add($utf_version_22)
#$utf_version_list.Add($utf_version_23)


$package_bitness_list = [System.Collections.ArrayList]::new()
$package_bitness_list.Add($bitness_32)
$package_bitness_list.Add($bitness_64)

$package_version_list = [System.Collections.ArrayList]::new()
$package_version_list.Add($nipm_version)
$package_version_list.Add($labview_version_list)
$package_version_list.Add($vianalyzer_version_list)
$package_version_list.Add($utf_version_list)

Clear-Host

foreach($package_name in $package_name_list)
{
    if ($package_name -eq "nipm"){
        # NI Package Manager Layer
        $package_version = $nipm_version
        Write-Output "Building NI Package Manager Image Layer Version: $nipm_version."
        docker build --rm -f ".\$src_folder\$package_name\$package_version\Dockerfile" `
                     -t $docker_user/${package_name}:$package_version `
                     ".\$src_folder\$package_name\$package_version"
        Write-Output "Pushing NI Package Manager Image..."
        #docker image push --all-tags $docker_user/nipm
    }else {
        foreach($package_bitness in $package_bitness_list)
        {
            foreach($labview_version in $labview_version_list)
            {
                $package_version_bitness = "$labview_version-$package_bitness"
                Write-Output "Building $package_name Image Layer Version: $package_version_bitness."
                docker build --rm -f .\$src_folder\$package_name\$package_bitness\$labview_version\Dockerfile `
                             -t $docker_user/${package_name}:$package_version_bitness `
                             ".\$src_folder\$package_name\$package_bitness\$labview_version"
            }
            
            foreach($vianalyzer_version in $vianalyzer_version_list)
            {
                $package_version_bitness = "$vianalyzer_version-$package_bitness"
                Write-Output "Building $package_name Image Layer Version: $package_version_bitness."
                docker build --rm -f .\$src_folder\$package_name\$package_bitness\$vianalyzer_version\Dockerfile `
                             -t $docker_user/${package_name}:$package_version_bitness `
                             ".\$src_folder\$package_name\$package_bitness\$vianalyzer_version"
            }
            
            foreach($utf_version in $utf_version_list)
            {
                $package_version_bitness = "$utf_version-$package_bitness"
                Write-Output "Building $package_name Image Layer Version: $package_version_bitness."
                docker build --rm -f .\$src_folder\$package_name\$package_bitness\$utf_version\Dockerfile `
                             -t $docker_user/${package_name}:$package_version_bitness `
                             ".\$src_folder\$package_name\$package_bitness\$utf_version"
            }

        }
        Write-Output "Pushing $docker_user/$package_name Image..."
        #docker image push --all-tags $docker_user/$package_name
    }
}
