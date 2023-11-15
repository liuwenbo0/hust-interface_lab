onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+swerv_soc -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.swerv_soc xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {swerv_soc.udo}

run -all

endsim

quit -force
