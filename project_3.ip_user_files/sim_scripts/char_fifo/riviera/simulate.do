onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+char_fifo -L xil_defaultlib -L xpm -L fifo_generator_v13_1_4 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.char_fifo xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {char_fifo.udo}

run -all

endsim

quit -force
