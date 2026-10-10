from datetime import datetime

# ==========================================================
# STOCK INICIAL
# ==========================================================
stockProd1 = 20  # Blend Premium (250g)
stockProd2 = 10  # Blend Premium (500g)
stockProd3 = 5   # Blend Premium (1kg)
stockProd4 = 15  # Cafe Tradicion (250g)
stockProd5 = 10  # Cafe Tradicion (500g)
stockProd6 = 5   # Cafe Tradicion (1kg)
stockProd7 = 10  # Cafe Catuai (250g)
stockProd8 = 5   # Cafe Catuai (500g)
stockProd9 = 10  # Cafe Geisha (250g)

# ==========================================================
# PRODUCTOS
# ==========================================================
productos = {
    1: {"nombre": "Blend Premium (250g)", "presentacion": "(250g)", "precio": 32.00, "stock": 20},
    2: {"nombre": "Blend Premium (500g)", "presentacion": "(500g)", "precio": 52.00, "stock": 10},
    3: {"nombre": "Blend Premium (1kg)", "presentacion": "(1kg)", "precio": 72.00, "stock": 5},
    4: {"nombre": "Cafe Tradicion (250g)", "presentacion": "(250g)", "precio": 28.00, "stock": 15},
    5: {"nombre": "Cafe Tradicion (500g)", "presentacion": "(500g)", "precio": 48.00, "stock": 10},
    6: {"nombre": "Cafe Tradicion (1kg)", "presentacion": "(1kg)", "precio": 68.00, "stock": 5},
    7: {"nombre": "Cafe Catuai (250g)", "presentacion": "(250g)", "precio": 35.00, "stock": 10},
    8: {"nombre": "Cafe Catuai (500g)", "presentacion": "(500g)", "precio": 65.00, "stock": 5},
    9: {"nombre": "Cafe Geisha (250g)", "presentacion": "(250g)", "precio": 45.00, "stock": 10},
}

# ==========================================================
# DELIVERY
# ==========================================================
COSTO_DELIVERY = 15.00
DIAS_ENTREGA = "1 a 3 dias"

distritosLima = [
    "Cercado de Lima", "Brena", "La Victoria", "Rimac", "San Luis", "Lince",
    "Jesus Maria", "Pueblo Libre", "Magdalena del Mar", "San Miguel",
    "San Isidro", "Miraflores", "Surquillo", "Barranco", "San Borja",
    "Santiago de Surco", "Chorrillos", "La Molina", "Los Olivos",
    "San Martin de Porres", "Independencia", "Comas", "Carabayllo",
    "Puente Piedra", "Ancon", "Santa Anita", "Ate", "El Agustino",
    "San Juan de Lurigancho", "Lurigancho", "Chaclacayo",
    "San Juan de Miraflores", "Villa El Salvador", "Villa Maria del Triunfo",
]

# ==========================================================
# PEDIDOS (listas paralelas)
# ==========================================================
pedidosId = []
pedidosFecha = []
pedidosHora = []
pedidosCliente = []
pedidosProducto = []
pedidosCantidad = []
pedidosEntrega = []
pedidosDireccion = []
pedidosReferencia = []
pedidosTelContacto = []
pedidosDias = []
pedidosTotal = []
pedidosEstado = []


# ==========================================================
# FUNCIONES
# ==========================================================
def limpiarPantalla():
    for i in range(3):
        print()


def setStock(stockActual, nuevoStock):
    stockActual = nuevoStock
    return stockActual


def pedirCelular(mensaje):
    while True:
        telefono = input(mensaje)
        try:
            numero = int(telefono)
            if len(telefono) == 9 and telefono[0] == "9":
                return telefono
            print("Error: el celular debe tener 9 digitos y empezar con 9.")
        except ValueError:
            print("Error: el celular debe contener solo numeros.")


def generarIdPedido():
    numero = len(pedidosId) + 1
    if numero < 10:
        return f"PED-000{numero}"
    elif numero < 100:
        return f"PED-00{numero}"
    elif numero < 1000:
        return f"PED-0{numero}"
    else:
        return f"PED-{numero}"


def obtenerStock(numero):
    if numero == 1:
        return stockProd1
    elif numero == 2:
        return stockProd2
    elif numero == 3:
        return stockProd3
    elif numero == 4:
        return stockProd4
    elif numero == 5:
        return stockProd5
    elif numero == 6:
        return stockProd6
    elif numero == 7:
        return stockProd7
    elif numero == 8:
        return stockProd8
    else:
        return stockProd9


def mostrarCatalogo():
    print("\n=========================================================")
    print("           CATALOGO FINCA GRANDEZ Y STOCK")
    print("=========================================================")
    print("   ID    Presentacion    Precio         Stock")
    for numero in range(1, 10):
        if numero == 1:
            print("\n BLEND PREMIUM")
        elif numero == 4:
            print("\n CAFE TRADICION")
        elif numero == 7:
            print("\n CAFE CATUAI")
        elif numero == 9:
            print("\n CAFE GEISHA")
        presentacion = productos[numero]["presentacion"]
        precio = productos[numero]["precio"]
        stock = obtenerStock(numero)
        print(f"   [{numero}]  {presentacion}\t\tS/ {precio:.2f}\t\t{stock} und.")
    print("=========================================================\n")


def elegirDistrito():
    print("\nDistritos con delivery (solo Lima):")
    for i in range(len(distritosLima)):
        print(f"{i + 1}. {distritosLima[i]}")
    while True:
        try:
            opcion = int(input("Elija su distrito (numero): "))
            if opcion >= 1 and opcion <= len(distritosLima):
                return distritosLima[opcion - 1]
            print("Error: ingrese un numero de la lista.")
        except ValueError:
            print("Error: ingrese solo el numero del distrito.")


def buscarPedido():
    print("\n--- BUSCAR PEDIDO ---")
    idBuscado = input("Ingrese el ID del pedido (ej. PED-0001): ").strip().upper()
    encontrado = False
    for i in range(len(pedidosId)):
        if pedidosId[i] == idBuscado:
            encontrado = True
            print("\nPedido encontrado")
            print(f"Estado:     {pedidosEstado[i]}")
            print("Detalle:")
            print(f"  ID:        {pedidosId[i]}")
            print(f"  Fecha:     {pedidosFecha[i]} {pedidosHora[i]}")
            print(f"  Cliente:   {pedidosCliente[i]}")
            print(f"  Producto:  {pedidosProducto[i]} x {pedidosCantidad[i]}")
            print(f"  Entrega:   {pedidosEntrega[i]} - {pedidosDireccion[i]}")
            if pedidosEntrega[i] == "Delivery":
                print(f"  Referencia:       {pedidosReferencia[i]}")
                print(f"  Tel. contacto:    {pedidosTelContacto[i]}")
                print(f"  Entrega estimada: {pedidosDias[i]}")
            print(f"  Total:     S/ {pedidosTotal[i]:.2f}\n")
    if not encontrado:
        print("El pedido no existe.\n")


def reporteDiario():
    print("\n--- REPORTE DIARIO DE PEDIDOS ---")
    cantidadPedidos = 0
    totalVendido = 0.0
    totalDelivery = 0
    totalRecojo = 0
    print("---------------------------------------------------------")
    for i in range(len(pedidosId)):
        if pedidosFecha[i]:
            cantidadPedidos = cantidadPedidos + 1
            totalVendido = totalVendido + pedidosTotal[i]
            if pedidosEntrega[i] == "Delivery":
                totalDelivery = totalDelivery + 1
            else:
                totalRecojo = totalRecojo + 1
            print(f"{pedidosId[i]} | {pedidosHora[i]} | {pedidosCliente[i]} | "
                  f"{pedidosProducto[i]} x {pedidosCantidad[i]} | S/ {pedidosTotal[i]:.2f}")
    if cantidadPedidos == 0:
        print("No hay pedidos registrados hoy.")
    print("---------------------------------------------------------")
    print(f"Pedidos del dia:   {cantidadPedidos}")
    print(f"  - Delivery:      {totalDelivery}")
    print(f"  - Recojo:        {totalRecojo}")
    print(f"Total vendido:     S/ {totalVendido:.2f}\n")


def mostrarBoleta():
    print("\n=========================================================")
    if tipoComprobante == "1":
        print("           BOLETA DE VENTA - FINCA GRANDEZ")
        tipoDocumento = "BOLETA"
    else:
        print("              FACTURA - FINCA GRANDEZ")
        tipoDocumento = "FACTURA"
    print("=========================================================")
    print(f"ID Pedido:      {idPedido}")
    print("---------------------------------------------------------")
    print(f"Documento:      {tipoDocumento}")
    if tipoComprobante == "2":
        print(f"RUC:            {numDocumento}")
        print(f"Razon Social:   {razonSocial}")
        print(f"Contacto:       {nombreCliente}")
    else:
        print(f"DNI:            {numDocumento}")
        print(f"Cliente:        {nombreCliente}")
    print(f"Telefono:       {telefonoCliente}")
    print(f"Direccion:      {direccionCliente}, {distritoCliente}")
    if textoEntrega == "Delivery":
        print(f"Referencia:     {referenciaCliente}")
        print(f"Tel. contacto:  {telContacto}")
        print(f"Entrega en:     {diasEntregas}")
    else:
        print("Entrega:        Recojo en tienda")
    print("---------------------------------------------------------")
    print(f"Producto:       {nombreProducto}")
    print(f"Cantidad:       {cantidad}")
    print(f"Precio unit.:   S/ {precioProducto:.2f}")
    print("---------------------------------------------------------")
    print(f"SUBTOTAL PEDIDO:  S/ {subtotal:.2f}")
    print(f"COSTO ENVIO:      S/ {costoDelivery:.2f}")
    print("---------------------------------------------------------")
    print(f"TOTAL A PAGAR:    S/ {totalPagar:.2f}")
    print("=========================================================")
    print("Metodo Pago:    YAPE")
    print("Pagado a:       987 654 321 (Finca Grandez)")
    print(f"Operacion ID:   {codigoOperacionYape}")
    print("=========================================================")
    print("       *Pedido registrado correctamente!\n")


# ==========================================================
# PROGRAMA PRINCIPAL
# ==========================================================
cuentacreada = False
sesionIniciada = False
listacorreos = []
listaUsuarios = []
usuarioRegistrado = ""
claveRegistrada = ""

while True:
    limpiarPantalla()
    print("=========================================================")
    print("      SISTEMA DE PEDIDOS - FINCA GRANDEZ")
    print("=========================================================")
    print("1. Crear cuenta")
    print("2. Iniciar sesion")
    print("3. Salir")
    opcionInicio = input("Ingrese una opcion (1-3): ")

    # ------------------------------------------------------
    # CREAR CUENTA
    # ------------------------------------------------------
    if opcionInicio == "1":
        print("\n--- CREACION DE CUENTA ---")

        # Correo
        while True:
            correoInput = input("Correo electronico: ").strip().lower()
            if correoInput == "":
                print("Error: el correo no puede estar vacio.")
            elif "@" not in correoInput:
                print("Error: el correo debe contener el simbolo '@'.")
            elif not correoInput.endswith(".com"):
                print("Error: el correo debe terminar obligatoriamente en '.com'.")
            elif correoInput.startswith("@") or correoInput.split("@")[1] == ".com":
                print("Error: el correo esta incompleto.")
            elif correoInput in listacorreos:
                print("Error: ese correo ya esta registrado. Use otro.")
            else:
                correoNuevo = correoInput
                break
        listacorreos.append(correoNuevo)

        # Usuario
        while True:
            usuarioNuevo = input("Nombre de usuario : ").strip().lower()
            if len(usuarioNuevo) < 3:
                print("Error: el usuario debe tener al menos 3 caracteres.")
            elif usuarioNuevo in listaUsuarios:
                print("Error: ese usuario ya existe. Elija otro.")
            else:
                break

        # Contraseña
        while True:
            claveTemporal = input("Contrasena (minimo 4 caracteres): ")
            if len(claveTemporal) >= 4:
                break
            print("Error: la contrasena debe tener al menos 4 caracteres.")

        # Confirmar contraseña
        while True:
            claveConfirmacion = input("Confirme su contrasena: ")
            if claveConfirmacion != claveTemporal:
                print("Error: las contrasenas no coinciden.")
            else:
                break

        listaUsuarios.append(usuarioNuevo)
        usuarioRegistrado = usuarioNuevo
        claveRegistrada = claveConfirmacion
        cuentacreada = True
        print("\n*Cuenta creada exitosamente! Ahora puede iniciar sesion.\n")

    # ------------------------------------------------------
    # INICIAR SESION
    # ------------------------------------------------------
    elif opcionInicio == "2":
        if not cuentacreada:
            print("Error: primero debe crear una cuenta (opcion 1).\n")
        else:
            # Validar usuario
            usuarioValido = False
            while not usuarioValido:
                usuarioIngresado = input("Usuario: ").strip().lower()
                if usuarioIngresado == usuarioRegistrado:
                    usuarioValido = True
                else:
                    print("Error: usuario incorrecto. Intente de nuevo.")

            # Validar contraseña
            claveValida = False
            while not claveValida:
                claveIngresada = input("Contrasena: ")
                if claveIngresada == claveRegistrada:
                    claveValida = True
                else:
                    print("Error: contrasena incorrecta. Intente de nuevo.")

            print("\nInicio de sesion exitoso.\n")
            sesionIniciada = True

            # ==============================================
            # MENU INTERNO (CON SESION INICIADA)
            # ==============================================
            while sesionIniciada:
                limpiarPantalla()
                print("=========================================================")
                print("       BIENVENIDO A FINCA GRANDEZ")
                print("=========================================================")
                print("1. Ver Catalogo de Productos y Stock")
                print("2. Realizar un Pedido")
                print("3. Buscar un Pedido")
                print("4. Reporte Diario de Pedidos")
                print("5. Cerrar sesion")
                opcionMenu = input("Ingrese una opcion (1-5): ")

                # ------------------------------------------
                # 1. VER CATALOGO
                # ------------------------------------------
                if opcionMenu == "1":
                    mostrarCatalogo()
                    while True:
                        deseaPedido = input("¿Desea realizar un pedido? (S = Si / N = No): ").strip().upper()
                        if deseaPedido == "S" or deseaPedido == "N":
                            break
                        print("Error: responda S o N.")
                    if deseaPedido == "S":
                        opcionMenu = "2"

                # ------------------------------------------
                # 2. REALIZAR PEDIDO
                # ------------------------------------------
                if opcionMenu == "2":
                    mostrarCatalogo()
                    totalProductos = len(productos)

                    # Elegir producto
                    while True:
                        try:
                            productoElegido = int(input(f"Elija el numero de producto (1-{totalProductos}): "))
                            if productoElegido >= 1 and productoElegido <= totalProductos:
                                break
                            print("Error: opcion de producto invalida.")
                        except ValueError:
                            print("Error: ingrese solo el numero del producto.")

                    precioProducto = productos[productoElegido]["precio"]
                    nombreProducto = productos[productoElegido]["nombre"]
                    stockActual = obtenerStock(productoElegido)

                    # Elegir cantidad (se repite hasta que no supere el stock)
                    while True:
                        try:
                            cantidad = int(input("Ingrese la cantidad a comprar (Paquetes): "))
                            if cantidad <= 0:
                                print("Error: la cantidad debe ser mayor a 0.")
                            elif cantidad > stockActual:
                                print(f"Error: debe ingresar una cantidad menor o igual al stock ({stockActual} und.).")
                            else:
                                break
                        except ValueError:
                            print("Error: ingrese solo numeros.")

                    print("\nStock confirmado. Procediendo al registro del cliente...")
                    subtotal = precioProducto * cantidad



                    # ---- 2. DATOS DEL CLIENTE ----
                    print("\n--- 2. DATOS DEL CLIENTE ---")
                    while True:
                        nombreCliente = input("Nombre completo: ").strip()
                        tieneNumero = False
                        for letra in nombreCliente:
                            if letra in "0123456789":
                                tieneNumero = True
                        if len(nombreCliente) >= 3 and not tieneNumero:
                            break
                        print("Error: el nombre debe tener al menos 3 caracteres y no contener numeros.")

                    telefonoCliente = pedirCelular("Telefono celular: ")

                    # ---- 3. METODO DE ENTREGA ----
                    print("\n--- 3. METODO DE ENTREGA ---")
                    print("1. Delivery (solo Lima - S/ 15.00)")
                    print("2. Recojo en Tienda (Gratis)")
                    while True:
                        tipoEntrega = input("Seleccione una opcion (1-2): ")
                        if tipoEntrega == "1" or tipoEntrega == "2":
                            break
                        print("Error: opcion invalida.")

                    if tipoEntrega == "1":
                        # Delivery
                        while True:
                            direccionCliente = input("Direccion exacta de entrega: ").strip()
                            if len(direccionCliente) >= 7:
                                break
                            print("Error: ingrese una direccion valida (minimo 7 caracteres).")

                        while True:
                            referenciaCliente = input("Referencia (ej. frente al parque, porton negro): ").strip()
                            if len(referenciaCliente) >= 5:
                                break
                            print("Error: ingrese una referencia valida (minimo 5 caracteres).")

                        distritoCliente = elegirDistrito()
                        costoDelivery = COSTO_DELIVERY
                        diasEntregas = DIAS_ENTREGA
                        print(f"Distrito elegido: {distritoCliente} (costo de envio: S/ {costoDelivery:.2f})")
                        print(f"Tiempo estimado de entrega: {diasEntregas}")

                        telContacto = pedirCelular("Telefono de contacto para la entrega: ")
                        textoEntrega = "Delivery"
                    else:
                        # Recojo en tienda
                        direccionCliente = "C. Jose Antonio Encinas 184"
                        distritoCliente = "Pueblo Libre 15084"
                        costoDelivery = 0.00
                        referenciaCliente = "-"
                        telContacto = "-"
                        diasEntregas = "-"
                        textoEntrega = "Recojo en tienda"

                    totalPagar = subtotal + costoDelivery
                    print(f"Costo de envio calculado: S/ {costoDelivery:.2f}")

                    # ---- 4. METODO DE PAGO (YAPE) ----
                    print("\n--- 4. METODO DE PAGO ---")
                    print("Unico metodo disponible: YAPE")
                    print(f"Realice el pago de S/ {totalPagar:.2f} al siguiente numero:")
                    print("*** 987 654 321 - Finca Grandez ***\n")

                    while True:
                        confirmacionPago = input("¿Ya realizo el pago por Yape? (S = Si / N = No): ").strip().upper()
                        if confirmacionPago == "S":
                            break
                        elif confirmacionPago == "N":
                            print("Por favor realice el pago antes de continuar.")
                        else:
                            print("Error: responda S o N.")

                    while True:
                        codigoOperacionYape = input("Ingrese el codigo de operacion de Yape (8 digitos): ")
                        try:
                            numero = int(codigoOperacionYape)
                            if len(codigoOperacionYape) == 8:
                                break
                            print("Error: el codigo debe tener exactamente 8 digitos.")
                        except ValueError:
                            print("Error: el codigo debe contener solo numeros.")

                    # ---- 5. TIPO DE COMPROBANTE ----
                    razonSocial = ""
                    while True:
                        print("\n--- 5. TIPO DE COMPROBANTE ---")
                        print("1. Boleta (requiere DNI)")
                        print("2. Factura (requiere RUC y Razon Social)")
                        while True:
                            tipoComprobante = input("Elija el tipo de comprobante (1-2): ")
                            if tipoComprobante == "1" or tipoComprobante == "2":
                                break
                            print("Error: opcion invalida.")

                        volver = False
                        if tipoComprobante == "1":
                            # Boleta (DNI)
                            while True:
                                numDocumento = input("Ingrese su DNI (8 digitos) o 0 para volver: ").strip()
                                if numDocumento == "0":
                                    volver = True
                                    break
                                try:
                                    numero = int(numDocumento)
                                    if len(numDocumento) == 8:
                                        break
                                    print("Error: el DNI debe tener exactamente 8 digitos.")
                                except ValueError:
                                    print("Error: el DNI debe contener solo numeros.")
                        else:
                            # Factura (RUC y Razón Social)
                            while True:
                                numDocumento = input("Ingrese su RUC (11 digitos) o 0 para volver: ").strip()
                                if numDocumento == "0":
                                    volver = True
                                    break
                                try:
                                    numero = int(numDocumento)
                                    if len(numDocumento) == 11:
                                        break
                                    print("Error: el RUC debe tener exactamente 11 digitos.")
                                except ValueError:
                                    print("Error: el RUC debe contener solo numeros.")

                            # Pedir Razón Social si no canceló
                            if not volver:
                                while True:
                                    razonSocial = input("Ingrese la Razon Social (o 0 para volver): ").strip()
                                    if razonSocial == "0":
                                        volver = True
                                        break
                                    elif len(razonSocial) >= 3:
                                        break
                                    print("Error: la Razon Social debe tener al menos 3 caracteres.")

                        if not volver:
                            break

                    # ---- DESCONTAR STOCK ----
                    if productoElegido == 1:
                        stockProd1 = setStock(stockProd1, stockProd1 - cantidad)
                    elif productoElegido == 2:
                        stockProd2 = setStock(stockProd2, stockProd2 - cantidad)
                    elif productoElegido == 3:
                        stockProd3 = setStock(stockProd3, stockProd3 - cantidad)
                    elif productoElegido == 4:
                        stockProd4 = setStock(stockProd4, stockProd4 - cantidad)
                    elif productoElegido == 5:
                        stockProd5 = setStock(stockProd5, stockProd5 - cantidad)
                    elif productoElegido == 6:
                        stockProd6 = setStock(stockProd6, stockProd6 - cantidad)
                    elif productoElegido == 7:
                        stockProd7 = setStock(stockProd7, stockProd7 - cantidad)
                    elif productoElegido == 8:
                        stockProd8 = setStock(stockProd8, stockProd8 - cantidad)
                    else:
                        stockProd9 = setStock(stockProd9, stockProd9 - cantidad)

                    # ---- GUARDAR PEDIDO ----
                    idPedido = generarIdPedido()

                    pedidosId.append(idPedido)
                    pedidosCliente.append(nombreCliente)
                    pedidosProducto.append(nombreProducto)
                    pedidosCantidad.append(cantidad)
                    pedidosEntrega.append(textoEntrega)
                    pedidosDireccion.append(direccionCliente + ", " + distritoCliente)
                    pedidosReferencia.append(referenciaCliente)
                    pedidosTelContacto.append(telContacto)
                    pedidosDias.append(diasEntregas)
                    pedidosTotal.append(totalPagar)
                    ahora = datetime.now()
                    pedidosFecha.append(ahora.strftime("%Y-%m-%d"))
                    pedidosHora.append(ahora.strftime("%H:%M"))

                    if textoEntrega == "Delivery":
                        pedidosEstado.append("Pagado - Pendiente de entrega")
                    else:
                        pedidosEstado.append("Pagado - Listo para recojo")

                    # ---- BOLETA / FACTURA FINAL ----
                    mostrarBoleta()
                    input("Presione Enter para continuar...")

                # ------------------------------------------
                # 3. BUSCAR PEDIDO
                # ------------------------------------------
                elif opcionMenu == "3":
                    buscarPedido()
                    input("Presione Enter para continuar...")

                # ------------------------------------------
                # 4. REPORTE DIARIO
                # ------------------------------------------
                elif opcionMenu == "4":
                    reporteDiario()
                    input("Presione Enter para continuar...")

                # ------------------------------------------
                # 5. CERRAR SESION
                # ------------------------------------------
                elif opcionMenu == "5":
                    print("\nCerrando sesion...\n")
                    sesionIniciada = False

                elif opcionMenu != "1":
                    print("Opcion no valida, intente de nuevo.\n")

    # ------------------------------------------------------
    # SALIR DEL SISTEMA
    # ------------------------------------------------------
    elif opcionInicio == "3":
        print("\nSaliendo del sistema...")
        break

    else:
        print("Opcion no valida, intente de nuevo.\n")