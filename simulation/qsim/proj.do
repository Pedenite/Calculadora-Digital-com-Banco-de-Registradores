onerror {quit -f}
vlib work
vlog -work work proj.vo
vlog -work work proj.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.Bin-BCD_vlg_vec_tst
vcd file -direction proj.msim.vcd
vcd add -internal Bin-BCD_vlg_vec_tst/*
vcd add -internal Bin-BCD_vlg_vec_tst/i1/*
add wave /*
run -all
