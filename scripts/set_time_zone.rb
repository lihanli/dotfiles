if `powershell.exe -c '(Get-WmiObject -Class Win32_ComputerSystem).UserName'`.include?('work')
  system(%{powershell.exe -c 'Set-TimeZone -Id "Pacific Standard Time"'})
else
  system(%{powershell.exe -c 'Set-TimeZone -Id "SE Asia Standard Time"'})
end
