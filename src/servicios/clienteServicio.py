from flask import request
from src.database import sqlLite
from src.database.clienteSentencias import ClienteSentencia



class ClienteServicio:
    @staticmethod
    def todos():
        try:
            db = sqlLite.getSQLite()
            cursor = db.cursor()
            cursor.execute(ClienteSentencia.clientes())
            rows = cursor.fetchall()
            db.close()
            clientes=[]
            for row in rows:
                clientes.append({
                    "nombre":row[0],
                    "nrc":row[1],
                    "email":row[2],
                    "direccion":row[3],
                })
            return clientes
        except Exception as e:
            db.close()
            return None


    @staticmethod
    def agregar():
        try:
            print("Inicio")
            db = sqlLite.getSQLite()
            cursor = db.cursor()
            print("Cursor")
            nombre = request.form['nombre']
            nrc = request.form['nrc']
            email = request.form['email']
            telefono = request.form['telefono']
            direccion =request.form['direccion']
            notas_adicionales = request.form['notas_adicionales']
            print(f"Nombre {nombre}")
            cursor.execute(ClienteSentencia.agregar(), (nombre, nrc, email, telefono, direccion, notas_adicionales))
            db.commit()
            db.close()
            print("successs")
            return "success"
        except Exception as e:
            print(f"ERROR {e}")
            db.close()
            return None
