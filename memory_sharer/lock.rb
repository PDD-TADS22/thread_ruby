require 'thread'
require 'securerandom'

acumulador = 0
repeticoes = 5
mutex = Mutex.new

def incrementa(mutex, acumulador)
  mutex.synchronize do
    acumulador[:valor] += 1
  end

  t = rand(1..20)
  puts "INC - Dormindo por #{t}s"
  sleep(t)
end

def decrementa(mutex, acumulador)
  mutex.synchronize do
    acumulador[:valor] -= 1
  end

  t = rand(1..20)
  puts "DEC - Dormindo por #{t}s"
  sleep(t)
end

def incrementador(mutex, acumulador, repeticoes)
  repeticoes.times do
    incrementa(mutex, acumulador)
  end
end

def decrementador(mutex, acumulador, repeticoes)
  repeticoes.times do
    decrementa(mutex, acumulador)
  end
end

if __FILE__ == $0
  acumulador = { valor: 0 }

  t1 = Thread.new { incrementador(mutex, acumulador, repeticoes) }
  t2 = Thread.new { decrementador(mutex, acumulador, repeticoes) }

  t1.join
  t2.join

  puts "Resultado final: #{acumulador[:valor]}"
end
