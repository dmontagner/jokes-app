from flask import Flask
import pyjokes

app = Flask(__name__)

@app.route("/get-chuck-joke")
def get_chuck_jokes():
    return pyjokes.get_joke(category='chuck', language='en')

@app.route("/get-neutral-joke")
def get_neutral_joke():
    return pyjokes.get_joke(category='neutral', language='en')