#!/usr/bin/env python

from flask import Flask, redirect

__author__ = "Vilhelm Prytz"
__email__ = "vilhelm@prytznet.se"

app = Flask(__name__)


@app.route("/", defaults={"path": ""})
@app.route("/<path:path>")
def catch_all(path):
    return redirect(f"https://github.com/{path}")


if __name__ == "__main__":
    app.run(host="0.0.0.0", port="7258")
