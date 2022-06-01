onerror {quit -f}
vlib work
vlog -work work AUEB_PROCESSOR.vo
vlog -work work AUEB_PROCESSOR.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.forwarder_vlg_vec_tst
vcd file -direction AUEB_PROCESSOR.msim.vcd
vcd add -internal forwarder_vlg_vec_tst/*
vcd add -internal forwarder_vlg_vec_tst/i1/*
add wave /*
run -all
