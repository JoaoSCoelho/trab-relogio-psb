Relógio de Psb

## Pre-requisitos
* SimuliIDE
* AVRA Compiler

# Como usar?

## 1 - Clone ou baixe o repositório
![alt text](image-1.png)
## 2 - Extraia os arquivos 
![alt text](image.png)
## 3 - Compile o código
No terminal, navegue até a pasta que você extraiu e execute o comando
```cmd
...\trab-relogio-psb-main> avra main.asm
```
para compilçar
![alt text](image-2.png)
## Carregue o circuito
Abra seu programa SimuliIDE e clique em Abrir circuito (CTRL + O)
![alt text](image-3.png)
Navegue até a pasta que você extraiu e selecione o arquivo `CIRCUIT.sim1`
![alt text](image-4.png)
Clique com o botão direito do mouse sobre o microcontrolador ATMega328 e clique em "Carregar firmware"
![alt text](image-5.png)
Navegue até a pasta onde extraiu e selecione o arquivo "main.hex" gerado pelo compilar AVRA
![alt text](image-6.png)
Clique no botão "Start Simulation" para iniciar a simulação e ligar o relógio.
![alt text](image-7.png)

## Use o relógio
* O botão mais abaixo alterna a visualização entre horas:minutos e minutos:segundos
![alt text](image-8.png)
---
O botão mais acima alterna do modo relógio (contagem crescente) para temporizador (contagem decrescente) e vice-versa
![alt text](image-9.png)