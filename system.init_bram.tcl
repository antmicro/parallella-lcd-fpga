cd /home/karol/antmicro/parallella/lcd_bare/fpga/lcd_bare/system
if { [ catch { xload xmp system.xmp } result ] } {
  exit 10
}

if { [catch {run init_bram} result] } {
  exit -1
}

exit 0
