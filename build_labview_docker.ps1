#Define variables
$src_folder="src"
$nipm_version="22.8"
$labview_version_21="21.0"
$labview_version_22="22.3"
$bitness_32="32bit"
$bitness_64="64bit"
$vianalyzer_version="21.0"
$utf_version="21.0"
$docker_user="danyallard"

$package_name_list = [System.Collections.ArrayList]::new()
$package_name_list.Add("nipm")
$package_name_list.Add("labview")
$package_name_list.Add("vianalyzer")
$package_name_list.Add("utf")

$labview_version_list = [System.Collections.ArrayList]::new()
$labview_version_list.Add($labview_version_21)
$labview_version_list.Add($labview_version_22)

$package_bitness_list = [System.Collections.ArrayList]::new()
$package_bitness_list.Add($bitness_32)
$package_bitness_list.Add($bitness_64)

$package_version_list = [System.Collections.ArrayList]::new()
$package_version_list.Add($nipm_version)
$package_version_list.Add($labview_version_list)
$package_version_list.Add($vianalyzer_version)
$package_version_list.Add($utf_version)

Clear-Host

foreach($package_name in $package_name_list)
{
    if ($package_name -eq "nipm"){
        # NI Package Manager Layer
        $package_version = $nipm_version
        Write-Output "Building NI Package Manager Image Layer Version: $nipm_version."
        docker build --rm -f .\$src_folder\$package_name\$package_version\Dockerfile `
                     -t $docker_user/${package_name}:$package_version `
                     ".\$src_folder\$package_name\$package_version"
        #Write-Output "Pushing NI Package Manager Image..."
        #docker image push --all-tags $docker_user/nipm
    }else {
        foreach($package_bitness in $package_bitness_list)
        {
            foreach($labview_version in $labview_version_list)
            {
                $package_version_bitness = "$labview_version-$package_bitness"
                Write-Output "Building $package_name Image Layer Version: $package_version_bitness."
                Write-Output ".\$src_folder\$package_name\$package_bitness\$labview_version\Dockerfile"
                Write-Output "$docker_user/${package_name}:$package_version_bitness"
                Write-Output ".\$src_folder\$package_name\$package_bitness\$labview_version"
                docker build --rm -f .\$src_folder\$package_name\$package_bitness\$labview_version\Dockerfile `
                                -t $docker_user/${package_name}:$package_version_bitness `
                                ".\$src_folder\$package_name\$package_bitness\$labview_version"
            }
            
        }
        #Write-Output "Pushing $docker_user/$package_name Image..."
        #docker image push --all-tags $docker_user/$package_name
    }
}
