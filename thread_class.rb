require 'thread'
require 'securerandom'

class MinhaThread
  def initialize(i)
    @i = i
  end

  def run
    sleep(rand(1..5))
    puts "Olá, agora com classe !! #{@i}"
  end
end

threads = []

puts "Iniciando o processo principal"
puts "Criando Threads..."

10.times do |a|
  thread = Thread.new do
    MinhaThread.new(a).run
  end
  threads << thread
end

threads.each(&:join)

puts "Finalizando o processo principal"