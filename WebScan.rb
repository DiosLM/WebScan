require 'socket'
include Socket::Constants
 
print "URL (exemple.com) => "
host = gets.chomp
print "Protocol(HTTP or HTTPS) => "
prot = gets.chomp
print "URL path => "
path = gets.chomp
if prot=="http" || prot=="HTTP"
 
protstand = "http"
port = 80
hostprotadd = "http://" + "#{host}"
 
end
 
if prot=="https" || prot=="HTTPS"
 
protstand = "https"
port = 443
hostprotadd = "https://" + "#{host}"
end
 
a = Socket.getaddrinfo("#{host}", "#{protstand}", nil, :STREAM)
b = a[0]
ip = b[2]
 
puts "Server IP => #{ip}"
 
# This is the HTTP request we send to fetch a file
request = "GET #{path} HTTP/1.0\r\n\r\n"
 
socket = TCPSocket.open(host,port)  # Connect to server
socket.print(request)               # Send request
response = socket.read              # Read complete response
# Split response 
headers,body = response.split("\n\r\n", 2)
 
 
 
 
 
puts "###################BODY###################################"
puts ""
puts body              
puts ""
puts "###################HEADERS###################################"                        
puts ""
puts headers
puts ""
