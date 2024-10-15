from threading import Thread

acumulador = 0
repeticoes = 1_000_000

def incrementa():
    global acumulador
    acumulador += 1

def decrementa():
    global acumulador
    acumulador -= 1

def incrementador(repeticoes: int):
    for _ in range(repeticoes):
        incrementa()

def decrementador(repeticoes: int):
    for _ in range(repeticoes):
        decrementa()

if __name__ == "__main__":
    thread1 = Thread(target=incrementador, args=(repeticoes,))
    thread2 = Thread(target=decrementador, args=(repeticoes,))

    thread1.start()
    thread2.start()

    thread1.join()
    thread2.join()

    print(f'Resultado Final: {acumulador}')
