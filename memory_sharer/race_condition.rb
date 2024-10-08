$acumulador = 0
repeticoes = 100_000

def incrementa
  sleep(0.0001)
  $acumulador += 1
end

def decrementa
  sleep(0.0001)
  $acumulador -= 1
end

def incrementador(repeticoes)
  repeticoes.times do
    incrementa
  end
end

def decrementador(repeticoes)
  repeticoes.times do
    decrementa
  end
end

thread1 = Thread.new { incrementador(repeticoes) }
thread2 = Thread.new { decrementador(repeticoes) }

thread1.join
thread2.join

puts "Resultado final: #{$acumulador}"