from flask import Flask, request
import subprocess

app = Flask(__name__)

@app.route("/", methods=["POST"])
def receive_alert():
    data = request.json
    print("Received alert:", data["alerts"][0]["annotations"]["summary"])
    
    # Trigger Ansible playbook
    subprocess.run(["ansible-playbook", "tindog_restart.yml"])
    
    return "OK", 200

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
