onerror {quit -code 1}
source "/home/borg/Desktop/Z01.1-macarrao/Projetos/C-LogicaCombinacional/vunit_out/test_output/lib.tb_mux4way16.all_db1759aed647a09d3ab18e63fb0bb636943a1df6/modelsim/common.do"
set failed [vunit_load]
if {$failed} {quit -code 1}
set failed [vunit_run]
if {$failed} {quit -code 1}
quit -code 0
