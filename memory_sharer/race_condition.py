from threading import Thread
from time import sleep

acumulador = 0
repeticoes = 10000

def incrementador(repeticoes: int):
    global acumulador
    for _ in range(repeticoes):
        acumulador += 10
        sleep(0.001)

def decrementador(repeticoes: int):
    global acumulador
    for _ in range(repeticoes):
        acumulador -= 1
        sleep(0.001)

if __name__ == "__main__":
    thread1 = Thread(target=incrementador, args=(repeticoes,))
    thread2 = Thread(target=decrementador, args=(repeticoes,))

    thread1.start()
    thread2.start()

    thread1.join()
    thread2.join()

    print(f'Resultado Final: {acumulador}')
