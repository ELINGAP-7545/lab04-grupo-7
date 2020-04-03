transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/RESPALDO/Documentos/Universidad\ Profesional/6/Arquitectura/Corte\ 2/lab04-grupo-7/7\ segmentos\ 1\ display {C:/RESPALDO/Documentos/Universidad Profesional/6/Arquitectura/Corte 2/lab04-grupo-7/7 segmentos 1 display/BCDtoSSeg.v}

vlog -vlog01compat -work work +incdir+C:/RESPALDO/Documentos/Universidad\ Profesional/6/Arquitectura/Corte\ 2/lab04-grupo-7/7\ segmentos\ 1\ display {C:/RESPALDO/Documentos/Universidad Profesional/6/Arquitectura/Corte 2/lab04-grupo-7/7 segmentos 1 display/BCDtoSSeg_TB.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  BCDtoSSeg_TB

add wave *
view structure
view signals
run -all
