onerror {quit -code 1}
source "/home/borg/Desktop/Z01.1-macarrao/Projetos/C-LogicaCombinacional/vunit_out/test_output/lib.tb_mux8way16.all_bb14d33e746ee3d85cb7ba2b460e0aeab8347928/modelsim/common.do"
set failed [vunit_load]
if {$failed} {quit -code 1}
set failed [vunit_run]
if {$failed} {quit -code 1}
quit -code 0
