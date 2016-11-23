# https://devcenter.heroku.com/articles/ssl-certificate-self

openssl genrsa -des3 -passout pass:x -out server.pass.key 2048
# Generate SSL Private Key
openssl rsa -passin pass:x -in server.pass.key -out server.key
rm server.pass.key
# Generate SSL Certificate Signing Request
openssl req -new -key server.key -out server.csr

# Generate SSL certificate
openssl x509 -req -sha256 -days 365 -in server.csr -signkey server.key -out server.crt
