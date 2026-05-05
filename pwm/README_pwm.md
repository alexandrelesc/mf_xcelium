# Projeto PWM em SystemVerilog

## Descrição
Este projeto implementa um gerador de PWM (Pulse Width Modulation) utilizando SystemVerilog.

Aplicações:
- Controle de LEDs
- Controle de motores
- Geração de sinais analógicos aproximados

---

## Funcionamento
O PWM é gerado comparando um contador com o valor de duty:

pwm_out = (counter < duty)

---

## Estrutura

pwm_project/
├── pwm.sv
├── tb_pwm.sv
├── pwm.vcd
└── README.md

---

## Execução

### Icarus Verilog
cd run
xrun -64bit -sv ../source/pwm.sv ../tb/tb_pwm.sv

### GTKWave
gtkwave pwm.vcd

---

## Comportamento

Duty | Saída
-----|------
0    | Sempre 0
64   | ~25%
128  | ~50%
192  | ~75%
255  | ~100%

---

## Conceitos
- always_ff
- lógica sequencial
- contadores
- comparação digital

---

## Extensões
- PWM com controle de frequência
- PWM multi-canal
- Integração com UART

---
