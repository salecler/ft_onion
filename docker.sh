docker build . -t imgdebian

docker run -v "$PWD"/hostname:/var/lib/tor/ --name container -p 80:80 -p 4242:4242 imgdebian
