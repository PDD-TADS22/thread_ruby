require 'socket'

PORT= 2000
HOST= 'localhost'

server = TCPSocket.new(HOST,PORT)

puts "Client started sending message to server"

message = gets.chomp
server.puts message

