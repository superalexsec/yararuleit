# This PS1 will connect into remote server trought Invoke-Command, copy CrowdResponse.exe bin and a file named "all.yar" to the destination path and run it against the target dir.
# This script do not copy the result report to local machine, you must copy it manualy or add it to the script.

# Receives the input file containing a LIST OF DESTINATION servers
$servers_list = Get-Content 'c:\yararuler\input.txt'

# The report output on REMOTE HOST
$remote_output = 'C:\temp\out'

# The temp folder used by the script (Need Write permission)
$remote_temp = 'c:\Windows\temp'

# The remote directory that you wanna check with yara rules
$remote_target_dir = 'C:\Users\target'

# Server hosting the CrowdResponse.exe bin
$server = '192.168.1.10'

# For looping that will read the remote servers IPs
foreach ($server_unit in $servers_list) {
    $checarca = New-PSSessionOption -SkipCACheck
    Invoke-Command -computername $server_unit -usessl -sessionoption $checarca -scriptblock {
        # This part copy the exe and yar files to the target
        powershell.exe -exec bypass -c "Invoke-WebRequest -Uri "http://$server/crowdresponse.exe" -outfile "$remote_temp\cr.exe"
        powershell.exe -exec bypass -c "Invoke-WebRequest -Uri "http://$server/all.yar" -outfile "$remote_temp\all.yar"
        # Execution of the bin with the yara file, writing a report after
        cmd.exe /c "$remote_temp\cr.exe @Yara -t $remote_target_dir -h -s -y $remote_temp"
        # Clean the remote path
        del $remote_temp\cr.exe
        del $remote_temp\cr64.exe
        del $remote_temp\all.yar
        # Save the results on REMOTE server
    } > $remote_output\report_$server_unit.xml
}
