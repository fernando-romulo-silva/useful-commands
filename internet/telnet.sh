
# access a server using telnet
$ telnet <hostname> <port>

# example
$ telnet localhost 8000

# ask for a GET request
GET / HTTP/1.1

# ask for a POST request
POST /public/login HTTP/1.1
Content-Type: application/json
Content-length: 45

{"email": "geo@alura.com.br", "senha": "123"}