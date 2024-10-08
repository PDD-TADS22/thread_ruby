require 'thread'

class Produtor
  def initialize(fila)
    @fila = fila
    @thread = Thread.new { run }
  end

  def run
    5.times do
      i = rand(1..1000)
      puts "Produzido #{i}"
      @fila << i
      sleep(2)
    end
  end

  def join
    @thread.join
  end
end

class Consumidor
  def initialize(fila)
    @fila = fila
    @thread = Thread.new { run }
  end

  def run
    5.times do
      i = @fila.pop
      puts "Consumindo #{i}"
      sleep(3)
    end
  end

  def join
    @thread.join
  end
end

if __FILE__ == $0
  fila = Queue.new

  produtor = Produtor.new(fila)
  consumidor = Consumidor.new(fila)

  produtor.join
  consumidor.join
end
