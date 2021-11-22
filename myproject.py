from flask import Flask
app = Flask(__name__)

@app.route("/app")
def hello():
    return "<h1>hello there !!!!!!!!!!!!!!!!!!!!!!!</h1>"

if __name__ == "__main__":
    app.run()