require 'thread'

class Produtor
  def initialize(recurso, semaforo, mutex)
    @recurso = recurso
    @semaforo = semaforo
    @mutex = mutex
    @thread = Thread.new { run }
  end

  def run
    5.times do
      i = rand(1..1000)
      @mutex.synchronize do
        puts "Produzido #{i}"
        @recurso << i
      end
      @semaforo.signal
      sleep(2)
    end
    # Sinalizar que a produção acabou
    @mutex.synchronize { @semaforo.signal }
  end

  def join
    @thread.join
  end
end

class Consumidor
  def initialize(recurso, semaforo, mutex)
    @recurso = recurso
    @semaforo = semaforo
    @mutex = mutex
    @thread = Thread.new { run }
  end

  def run
    5.times do
      @mutex.synchronize do
        @semaforo.wait(@mutex) if @recurso.empty?
        item = @recurso.pop unless @recurso.empty?
        puts "Consumindo #{item}" if item
      end
      sleep(3)
    end
  end

  def join
    @thread.join
  end
end

if __FILE__ == $0
  recurso = []
  semaforo = ConditionVariable.new
  mutex = Mutex.new

  produtor = Produtor.new(recurso, semaforo, mutex)
  consumidor = Consumidor.new(recurso, semaforo, mutex)

  produtor.join
  consumidor.join
end
