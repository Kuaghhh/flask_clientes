from flask import Flask
from src.controladores.clientesControlador import clientes
from src.database import sqlLite
app = Flask(__name__)

sqlLite.getSQLite()

app.register_blueprint(clientes,url_prefix='/clientes')


if __name__ == "__name__":
    app.run(host='0.0.0.0')