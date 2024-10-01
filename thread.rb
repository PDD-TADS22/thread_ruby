require 'thread'
require 'securerandom'

def imprime(i)
  sleep(rand(1..5))
  puts "Olá Mundo - #{i}"
end

# threads = []

# puts "Criando Threads.."

# (0..9).each do |a|
#   thread = Thread.new { imprime(a) }
#   threads << thread
# end

# threads.each(&:join)

puts "Iniciando processo"
i = 0
t1 = Thread.new { imprime(i) }

t1.join

print "Finalizando o processo!\n"

end
