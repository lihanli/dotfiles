if `powershell.exe -c '[System.Security.Principal.WindowsIdentity]::GetCurrent().Name'`.include?('work')
  system(%{powershell.exe -c 'Set-TimeZone -Id "Pacific Standard Time"'})
else
  system(%{powershell.exe -c 'Set-TimeZone -Id "SE Asia Standard Time"'})
end
