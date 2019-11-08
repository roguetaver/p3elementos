onerror {quit -code 1}
source "/home/borg/Desktop/Z01.1-macarrao/Projetos/C-LogicaCombinacional/vunit_out/test_output/lib.tb_or16.all_cfb9f3841c28e91861188c31754b6dea4385f15a/modelsim/common.do"
set failed [vunit_load]
if {$failed} {quit -code 1}
set failed [vunit_run]
if {$failed} {quit -code 1}
quit -code 0
