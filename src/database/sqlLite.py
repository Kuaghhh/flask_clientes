import sqlite3


def getSQLite():
    try:
        con = sqlite3.connect('dbLite.sqlite3') 
        cursor = con.cursor() 
        # Nombre de la tabla que quieres verificar 
        table_name = "Clientes" 
        # Consulta para verificar si la tabla existe 
        cursor.execute(f"SELECT name FROM sqlite_master WHERE type='table' AND name='{table_name}';") 
        if cursor.fetchone(): 
            print(f"La tabla '{table_name}' existe.") 
        else: 
            print(f"La tabla '{table_name}' no existe.")
            with open('.\src\database\create_tables.sql','r') as archivo:
                contenido = archivo.read()
                print(f"Este es el contenido: {contenido}")
                # Divide las instrucciones por punto y coma 
                instrucciones_sql = contenido.split(';') 
                for instruccion in instrucciones_sql: 
                    if instruccion.strip(): 
                        # Evita ejecutar instrucciones vacías 
                        cursor.execute(instruccion.strip() + ';') 
                        print(f"INSTRUCCION : {instruccion}")
                        con.commit()
        return con
    except Exception as e:
        print(f"Sin conexión: {e}")