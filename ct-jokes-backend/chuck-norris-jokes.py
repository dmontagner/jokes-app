from flask import Flask, jsonify
import pyjokes

app = Flask(__name__)

@app.route("/get-chuck-joke")
def get_chuck_jokes():
    response = jsonify({ 'joke': pyjokes.get_joke(category='chuck', language='en') })
    response.headers.add('Access-Control-Allow-Origin', '*')
    return response

@app.route("/get-neutral-joke")
def get_neutral_joke():
    response = jsonify({ 'joke': pyjokes.get_joke(category='neutral', language='en') })
    response.headers.add('Access-Control-Allow-Origin', '*')
    return response
