from flask import Flask, jsonify, make_response

app = Flask(__name__)


@app.route("/")
def hello_world():
    return make_response(jsonify({"message": "Welcome to GitOps! Hope you had a fun time!"}))
