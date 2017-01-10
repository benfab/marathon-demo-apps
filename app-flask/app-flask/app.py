from flask import Flask, render_template
import socket

app = Flask(__name__)
ip_address = socket.gethostbyname(socket.gethostname())
docker_hostname = socket.gethostname()

@app.route('/')
def hello_world():
    return render_template('index.html', hostname=docker_hostname,myip=ip_address)

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=int(8359))
