#!/bin/bash

echo "Limpando arquivos antigos..."
rm -rf xrun.* INCA_libs *.log *.history *.vcd waves.shm

echo "Executando simulacao..."
xrun -64bit -sv -f files.txt -access +rwc -timescale 1ns/1ps -l xrun.log

echo "Finalizado."
