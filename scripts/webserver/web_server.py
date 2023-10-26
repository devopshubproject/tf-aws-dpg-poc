from flask import Flask
import socket

app = Flask(__name)

@app.route('/')
def get_hostname():
    hostname = socket.gethostname()
    return f"Hostname: {hostname}\n"

@app.route('/health')
def health_check():
    return "OK"

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
