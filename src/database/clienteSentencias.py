class ClienteSentencia:

    @staticmethod
    def agregar():
        return "insert into Clientes(nombre, nrc, email, telefono, direccion, notas_adicionales) values(?,?,?,?,?,?)"
    
    @staticmethod
    def clientes():
        return "SELECT nombre,nrc,email,direccion FROM CLIENTES ORDER BY NOMBRE"
    
