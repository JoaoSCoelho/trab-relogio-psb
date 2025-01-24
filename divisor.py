reg1 = 1
reg2 = 0
reg3 = 1
resultado = 0
divisor = 9

while (True):
    print(f"reg1: {reg1}, reg2: {reg2}, reg3: {reg3}, resultado: {resultado}")
    reg3 -= divisor
    resultado += 1

    if (reg3 < 0):
        reg2 -= 1
        reg3 += 9
        reg3 += 1

        if (reg2 < 0):
            reg1 -= 1
            reg2 += 9
            reg2 += 1

    if (reg1 < 0):
        resultado += 1
        break

print(resultado)
