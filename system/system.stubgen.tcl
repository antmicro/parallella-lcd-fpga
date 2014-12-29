cd /home/karol/antmicro/parallella/lcd_bare/fpga/lcd_bare/system/
if { [ catch { xload xmp system.xmp } result ] } {
  exit 10
}
xset hdl vhdl
run stubgen
exit 0
