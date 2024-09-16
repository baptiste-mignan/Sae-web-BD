from .app import app
from flask import render_template , send_from_directory


@app.route('/<path:filename>')  
def send_file(filename):  
    return send_from_directory(app.static_folder, filename)