require 'socket'

PORT= 2000
HOST= 'localhost'

server = TCPServer.new(HOST,PORT)

puts "Server started on port #{PORT} and address #{HOST}"

loop do
  client = server.accept
  puts  client
  puts "New client connected from #{client.peeraddr[2]}"
  puts client.gets.chomp
  client.close
end