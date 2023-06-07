pip list

mkdocs new .

mkdocs serve

http://127.0.0.1:8000/micros-k8s/
http://127.0.0.1:8000

in case of following error, kill the process and run the mkdocs serve

# OSError: [Errno 48] Address already in use

sudo lsof -i :8000 

kill -9 1012 

# Reference  - https://stackoverflow.com/questions/19071512/socket-error-errno-48-address-already-in-use