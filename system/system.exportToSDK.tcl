proc exportToSDK {} {
  cd /home/karol/antmicro/parallella/lcd_bare/fpga/lcd_bare/system
  if { [ catch { xload xmp system.xmp } result ] } {
    exit 10
  }
  if { [run exporttosdk] != 0 } {
    return -1
  }
  return 0
}

if { [catch {exportToSDK} result] } {
  exit -1
}

set sExportDir [ xget sdk_export_dir ]
set sExportDir [ file join "/home/karol/antmicro/parallella/lcd_bare/fpga/lcd_bare/system" "$sExportDir" "hw" ] 
if { [ file exists /home/karol/antmicro/parallella/lcd_bare/fpga/lcd_bare/edkBmmFile_bd.bmm ] } {
   puts "Copying placed bmm file /home/karol/antmicro/parallella/lcd_bare/fpga/lcd_bare/edkBmmFile_bd.bmm to $sExportDir" 
   file copy -force "/home/karol/antmicro/parallella/lcd_bare/fpga/lcd_bare/edkBmmFile_bd.bmm" $sExportDir
}
if { [ file exists /home/karol/antmicro/parallella/lcd_bare/fpga/lcd_bare/system_top.bit ] } {
   puts "Copying bit file /home/karol/antmicro/parallella/lcd_bare/fpga/lcd_bare/system_top.bit to $sExportDir" 
   file copy -force "/home/karol/antmicro/parallella/lcd_bare/fpga/lcd_bare/system_top.bit" $sExportDir
}
exit $result
