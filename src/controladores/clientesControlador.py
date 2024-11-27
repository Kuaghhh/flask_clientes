from src.servicios.clienteServicio import ClienteServicio
from flask import Blueprint,render_template

clientes = Blueprint("clientes",__name__)

@clientes.route('/')
def clienteMain():
    return render_template("añadir_clientes.html")

@clientes.route('/agregar',methods=['POST'])
def clienteNuevo():
    cliente = ClienteServicio.agregar()
    return render_template("añadir_clientes.html")

@clientes.route('/clientes',methods=['GET'])
def clientesTodos():
    clientes = ClienteServicio.todos()
    return render_template("clientes_todos.html", clientes=clientes)

@clientes.route("/clientes/<id>", methods=["GET"])
def clientesEditor():
    return "Editar los cliente"

@clientes.route('/clientes/<id>',methods=['GET'])
def clientesElimiar():
    return "Eliminar cliente"

@clientes.route('/clientes/<id>',methods=['GET'])
def clientesModificar():
    return "Todos los clientes"
