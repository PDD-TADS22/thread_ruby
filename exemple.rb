nome = ARGV[0]

begin
  arq = File.open(nome, "r")
  linhas = arq.readlines
  puts linhas
ensure
  arq.close if arq
end
