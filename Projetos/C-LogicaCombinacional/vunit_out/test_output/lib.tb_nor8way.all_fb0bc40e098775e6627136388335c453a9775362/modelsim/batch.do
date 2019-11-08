onerror {quit -code 1}
source "/home/borg/Desktop/Z01.1-macarrao/Projetos/C-LogicaCombinacional/vunit_out/test_output/lib.tb_nor8way.all_fb0bc40e098775e6627136388335c453a9775362/modelsim/common.do"
set failed [vunit_load]
if {$failed} {quit -code 1}
set failed [vunit_run]
if {$failed} {quit -code 1}
quit -code 0
