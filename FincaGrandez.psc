Algoritmo FincaGrandez
	Definir nombres, presentaciones, distritosLima Como Caracter
	Definir precios Como Real
	Definir stock Como Entero
	Dimension nombres[9], presentaciones[9], precios[9], stock[9]
	Dimension distritosLima[34]
	
	// Listas paralelas de pedidos
	Definir pedidosId, pedidosFecha, pedidosHora, pedidosCliente, pedidosProducto Como Caracter
	Definir pedidosEntrega, pedidosDireccion, pedidosReferencia, pedidosTelContacto Como Caracter
	Definir pedidosDias, pedidosEstado Como Caracter
	Definir pedidosCantidad Como Entero
	Definir pedidosTotal Como Real
	Dimension pedidosId[100], pedidosFecha[100], pedidosHora[100], pedidosCliente[100]
	Dimension pedidosProducto[100], pedidosCantidad[100], pedidosEntrega[100]
	Dimension pedidosDireccion[100], pedidosReferencia[100], pedidosTelContacto[100]
	Dimension pedidosDias[100], pedidosTotal[100], pedidosEstado[100]
	Definir cantPedidos Como Entero
	cantPedidos <- 0
	
	// Cuenta
	Definir listaCorreos, listaUsuarios Como Caracter
	Dimension listaCorreos[50], listaUsuarios[50]
	Definir cantCorreos, cantUsuarios Como Entero
	Definir cuentaCreada, sesionIniciada Como Logico
	Definir usuarioRegistrado, claveRegistrada Como Caracter
	cantCorreos <- 0
	cantUsuarios <- 0
	cuentaCreada <- Falso
	sesionIniciada <- Falso
	usuarioRegistrado <- ""
	claveRegistrada <- ""
	
	// Variables generales
	Definir opcionInicio, opcionMenu, deseaPedido, tipoEntrega, tipoComprobante Como Caracter
	Definir correoInput, correoNuevo, usuarioNuevo, claveTemporal, claveConfirmacion Como Caracter
	Definir usuarioIngresado, claveIngresada, textoLeido, confirmacionPago Como Caracter
	Definir nombreCliente, telefonoCliente, direccionCliente, referenciaCliente, telContacto Como Caracter
	Definir distritoCliente, diasEntregas, textoEntrega, codigoOperacionYape, numDocumento, razonSocial Como Caracter
	Definir idPedido, nombreProducto Como Caracter
	Definir productoElegido, cantidad, i, pos Como Entero
	Definir precioProducto, subtotal, costoDelivery, totalPagar Como Real
	Definir COSTO_DELIVERY Como Real
	Definir valido, usuarioValido, claveValida, volver, tieneNumero, repetido Como Logico
	COSTO_DELIVERY <- 15
	
	// ---------- DATOS INICIALES ----------
	nombres[1] <- "Blend Premium (250g)"
	nombres[2] <- "Blend Premium (500g)"
	nombres[3] <- "Blend Premium (1kg)"
	nombres[4] <- "Cafe Tradicion (250g)"
	nombres[5] <- "Cafe Tradicion (500g)"
	nombres[6] <- "Cafe Tradicion (1kg)"
	nombres[7] <- "Cafe Catuai (250g)"
	nombres[8] <- "Cafe Catuai (500g)"
	nombres[9] <- "Cafe Geisha (250g)"
	
	presentaciones[1] <- "(250g)"
	presentaciones[2] <- "(500g)"
	presentaciones[3] <- "(1kg)"
	presentaciones[4] <- "(250g)"
	presentaciones[5] <- "(500g)"
	presentaciones[6] <- "(1kg)"
	presentaciones[7] <- "(250g)"
	presentaciones[8] <- "(500g)"
	presentaciones[9] <- "(250g)"
	
	precios[1] <- 32
	precios[2] <- 52
	precios[3] <- 72
	precios[4] <- 28
	precios[5] <- 48
	precios[6] <- 68
	precios[7] <- 35
	precios[8] <- 65
	precios[9] <- 45
	
	stock[1] <- 20
	stock[2] <- 10
	stock[3] <- 5
	stock[4] <- 15
	stock[5] <- 10
	stock[6] <- 5
	stock[7] <- 10
	stock[8] <- 5
	stock[9] <- 10
	
	distritosLima[1] <- "Cercado de Lima"
	distritosLima[2] <- "Brena"
	distritosLima[3] <- "La Victoria"
	distritosLima[4] <- "Rimac"
	distritosLima[5] <- "San Luis"
	distritosLima[6] <- "Lince"
	distritosLima[7] <- "Jesus Maria"
	distritosLima[8] <- "Pueblo Libre"
	distritosLima[9] <- "Magdalena del Mar"
	distritosLima[10] <- "San Miguel"
	distritosLima[11] <- "San Isidro"
	distritosLima[12] <- "Miraflores"
	distritosLima[13] <- "Surquillo"
	distritosLima[14] <- "Barranco"
	distritosLima[15] <- "San Borja"
	distritosLima[16] <- "Santiago de Surco"
	distritosLima[17] <- "Chorrillos"
	distritosLima[18] <- "La Molina"
	distritosLima[19] <- "Los Olivos"
	distritosLima[20] <- "San Martin de Porres"
	distritosLima[21] <- "Independencia"
	distritosLima[22] <- "Comas"
	distritosLima[23] <- "Carabayllo"
	distritosLima[24] <- "Puente Piedra"
	distritosLima[25] <- "Ancon"
	distritosLima[26] <- "Santa Anita"
	distritosLima[27] <- "Ate"
	distritosLima[28] <- "El Agustino"
	distritosLima[29] <- "San Juan de Lurigancho"
	distritosLima[30] <- "Lurigancho"
	distritosLima[31] <- "Chaclacayo"
	distritosLima[32] <- "San Juan de Miraflores"
	distritosLima[33] <- "Villa El Salvador"
	distritosLima[34] <- "Villa Maria del Triunfo"
	
	// ---------- PROGRAMA PRINCIPAL ----------
	Repetir
		limpiarPantalla
		Escribir "========================================================="
		Escribir "      SISTEMA DE PEDIDOS - FINCA GRANDEZ"
		Escribir "========================================================="
		Escribir "1. Crear cuenta"
		Escribir "2. Iniciar sesion"
		Escribir "3. Salir"
		Escribir Sin Saltar "Ingrese una opcion (1-3): "
		Leer opcionInicio
		
		Si opcionInicio = "1" Entonces
			// ----- CREAR CUENTA -----
			Escribir ""
			Escribir "--- CREACION DE CUENTA ---"
			
			// Correo
			Repetir
				valido <- Falso
				Escribir Sin Saltar "Correo electronico: "
				Leer correoInput
				correoInput <- Minusculas(correoInput)
				pos <- posicionArroba(correoInput)
				Si Longitud(correoInput) = 0 Entonces
					Escribir "Error: el correo no puede estar vacio."
				SiNo
					Si pos = 0 Entonces
						Escribir "Error: el correo debe contener el simbolo @."
					SiNo
						Si Longitud(correoInput) < 4 Entonces
							Escribir "Error: el correo debe terminar obligatoriamente en .com."
						SiNo
							Si Subcadena(correoInput, Longitud(correoInput) - 3, Longitud(correoInput)) <> ".com" Entonces
								Escribir "Error: el correo debe terminar obligatoriamente en .com."
							SiNo
								Si pos = 1 O pos = Longitud(correoInput) - 3 Entonces
									Escribir "Error: el correo esta incompleto."
								SiNo
									repetido <- Falso
									Para i <- 1 Hasta cantCorreos Con Paso 1 Hacer
										Si listaCorreos[i] = correoInput Entonces
											repetido <- Verdadero
										FinSi
									FinPara
									Si repetido Entonces
										Escribir "Error: ese correo ya esta registrado. Use otro."
									SiNo
										correoNuevo <- correoInput
										valido <- Verdadero
									FinSi
								FinSi
							FinSi
						FinSi
					FinSi
				FinSi
			Hasta Que valido
			cantCorreos <- cantCorreos + 1
			listaCorreos[cantCorreos] <- correoNuevo
			
			// Usuario
			Repetir
				valido <- Falso
				Escribir Sin Saltar "Nombre de usuario: "
				Leer usuarioNuevo
				usuarioNuevo <- Minusculas(usuarioNuevo)
				Si Longitud(usuarioNuevo) < 3 Entonces
					Escribir "Error: el usuario debe tener al menos 3 caracteres."
				SiNo
					repetido <- Falso
					Para i <- 1 Hasta cantUsuarios Con Paso 1 Hacer
						Si listaUsuarios[i] = usuarioNuevo Entonces
							repetido <- Verdadero
						FinSi
					FinPara
					Si repetido Entonces
						Escribir "Error: ese usuario ya existe. Elija otro."
					SiNo
						valido <- Verdadero
					FinSi
				FinSi
			Hasta Que valido
			
			// Contrasena
			Repetir
				Escribir Sin Saltar "Contrasena (minimo 4 caracteres): "
				Leer claveTemporal
				Si Longitud(claveTemporal) < 4 Entonces
					Escribir "Error: la contrasena debe tener al menos 4 caracteres."
				FinSi
			Hasta Que Longitud(claveTemporal) >= 4
			
			// Confirmar contrasena
			Repetir
				Escribir Sin Saltar "Confirme su contrasena: "
				Leer claveConfirmacion
				Si claveConfirmacion <> claveTemporal Entonces
					Escribir "Error: las contrasenas no coinciden."
				FinSi
			Hasta Que claveConfirmacion = claveTemporal
			
			cantUsuarios <- cantUsuarios + 1
			listaUsuarios[cantUsuarios] <- usuarioNuevo
			usuarioRegistrado <- usuarioNuevo
			claveRegistrada <- claveConfirmacion
			cuentaCreada <- Verdadero
			Escribir ""
			Escribir "*Cuenta creada exitosamente! Ahora puede iniciar sesion."
			Escribir ""
		SiNo
			Si opcionInicio = "2" Entonces
				// ----- INICIAR SESION -----
				Si No cuentaCreada Entonces
					Escribir "Error: primero debe crear una cuenta (opcion 1)."
					Escribir ""
				SiNo
					usuarioValido <- Falso
					Mientras No usuarioValido Hacer
						Escribir Sin Saltar "Usuario: "
						Leer usuarioIngresado
						usuarioIngresado <- Minusculas(usuarioIngresado)
						Si usuarioIngresado = usuarioRegistrado Entonces
							usuarioValido <- Verdadero
						SiNo
							Escribir "Error: usuario incorrecto. Intente de nuevo."
						FinSi
					FinMientras
					
					claveValida <- Falso
					Mientras No claveValida Hacer
						Escribir Sin Saltar "Contrasena: "
						Leer claveIngresada
						Si claveIngresada = claveRegistrada Entonces
							claveValida <- Verdadero
						SiNo
							Escribir "Error: contrasena incorrecta. Intente de nuevo."
						FinSi
					FinMientras
					
					Escribir ""
					Escribir "Inicio de sesion exitoso."
					Escribir ""
					sesionIniciada <- Verdadero
					
					// ----- MENU INTERNO -----
					Mientras sesionIniciada Hacer
						limpiarPantalla
						Escribir "========================================================="
						Escribir "       BIENVENIDO FINCA GRANDEZ"
						Escribir "========================================================="
						Escribir "1. Ver Catalogo de Productos y Stock"
						Escribir "2. Realizar un Pedido"
						Escribir "3. Buscar un Pedido"
						Escribir "4. Reporte Diario de Pedidos"
						Escribir "5. Cerrar sesion"
						Escribir Sin Saltar "Ingrese una opcion (1-5): "
						Leer opcionMenu
						
						// 1. VER CATALOGO
						Si opcionMenu = "1" Entonces
							mostrarCatalogo(presentaciones, precios, stock)
							Repetir
								Escribir Sin Saltar "Desea realizar un pedido? (S = Si / N = No): "
								Leer deseaPedido
								deseaPedido <- Mayusculas(deseaPedido)
								Si deseaPedido <> "S" Y deseaPedido <> "N" Entonces
									Escribir "Error: responda S o N."
								FinSi
							Hasta Que deseaPedido = "S" O deseaPedido = "N"
							Si deseaPedido = "S" Entonces
								opcionMenu <- "2"
							FinSi
						FinSi
						
						// 2. REALIZAR PEDIDO
						Si opcionMenu = "2" Entonces
							mostrarCatalogo(presentaciones, precios, stock)
							
							// Elegir producto
							Repetir
								valido <- Falso
								Escribir Sin Saltar "Elija el numero de producto (1-9): "
								Leer textoLeido
								Si soloDigitos(textoLeido) Entonces
									productoElegido <- ConvertirANumero(textoLeido)
									Si productoElegido >= 1 Y productoElegido <= 9 Entonces
										valido <- Verdadero
									SiNo
										Escribir "Error: opcion de producto invalida."
									FinSi
								SiNo
									Escribir "Error: ingrese solo el numero del producto."
								FinSi
							Hasta Que valido
							
							precioProducto <- precios[productoElegido]
							nombreProducto <- nombres[productoElegido]
							
							// Elegir cantidad
							Repetir
								valido <- Falso
								Escribir Sin Saltar "Ingrese la cantidad a comprar (Paquetes): "
								Leer textoLeido
								Si soloDigitos(textoLeido) Entonces
									cantidad <- ConvertirANumero(textoLeido)
									Si cantidad <= 0 Entonces
										Escribir "Error: la cantidad debe ser mayor a 0."
									SiNo
										Si cantidad > stock[productoElegido] Entonces
											Escribir "Error: debe ingresar una cantidad menor o igual al stock (", stock[productoElegido], " und.)."
										SiNo
											valido <- Verdadero
										FinSi
									FinSi
								SiNo
									Escribir "Error: ingrese solo numeros."
								FinSi
							Hasta Que valido
							
							Escribir ""
							Escribir "Stock confirmado. Procediendo al registro del cliente..."
							subtotal <- precioProducto * cantidad
							
							// DATOS DEL CLIENTE
							Escribir ""
							Escribir "--- 2. DATOS DEL CLIENTE ---"
							Repetir
								valido <- Falso
								Escribir Sin Saltar "Nombre completo: "
								Leer nombreCliente
								tieneNumero <- Falso
								Para i <- 1 Hasta Longitud(nombreCliente) Con Paso 1 Hacer
									Si esDigito(Subcadena(nombreCliente, i, i)) Entonces
										tieneNumero <- Verdadero
									FinSi
								FinPara
								Si Longitud(nombreCliente) >= 3 Y No tieneNumero Entonces
									valido <- Verdadero
								SiNo
									Escribir "Error: el nombre debe tener al menos 3 caracteres y no contener numeros."
								FinSi
							Hasta Que valido
							
							telefonoCliente <- pedirCelular("Telefono celular: ")
							
							// METODO DE ENTREGA
							Escribir ""
							Escribir "--- 3. METODO DE ENTREGA ---"
							Escribir "1. Delivery (solo Lima - S/ 15.00)"
							Escribir "2. Recojo en Tienda (Gratis)"
							Repetir
								Escribir Sin Saltar "Seleccione una opcion (1-2): "
								Leer tipoEntrega
								Si tipoEntrega <> "1" Y tipoEntrega <> "2" Entonces
									Escribir "Error: opcion invalida."
								FinSi
							Hasta Que tipoEntrega = "1" O tipoEntrega = "2"
							
							Si tipoEntrega = "1" Entonces
								// Delivery
								Repetir
									Escribir Sin Saltar "Direccion exacta de entrega: "
									Leer direccionCliente
									Si Longitud(direccionCliente) < 7 Entonces
										Escribir "Error: ingrese una direccion valida (minimo 7 caracteres)."
									FinSi
								Hasta Que Longitud(direccionCliente) >= 7
								
								Repetir
									Escribir Sin Saltar "Referencia (ej. frente al parque, porton negro): "
									Leer referenciaCliente
									Si Longitud(referenciaCliente) < 5 Entonces
										Escribir "Error: ingrese una referencia valida (minimo 5 caracteres)."
									FinSi
								Hasta Que Longitud(referenciaCliente) >= 5
								
								distritoCliente <- elegirDistrito(distritosLima)
								costoDelivery <- COSTO_DELIVERY
								diasEntregas <- "1 a 3 dias"
								Escribir "Distrito elegido: ", distritoCliente, " (costo de envio: S/ ", costoDelivery, ")"
								Escribir "Tiempo estimado de entrega: ", diasEntregas
								
								telContacto <- pedirCelular("Telefono de contacto para la entrega: ")
								textoEntrega <- "Delivery"
							SiNo
								// Recojo en tienda
								direccionCliente <- "C. Jose Antonio Encinas 184"
								distritoCliente <- "Pueblo Libre 15084"
								costoDelivery <- 0
								referenciaCliente <- "-"
								telContacto <- "-"
								diasEntregas <- "-"
								textoEntrega <- "Recojo en tienda"
							FinSi
							
							totalPagar <- subtotal + costoDelivery
							Escribir "Costo de envio calculado: S/ ", costoDelivery
							
							// METODO DE PAGO (YAPE)
							Escribir ""
							Escribir "--- 4. METODO DE PAGO ---"
							Escribir "Unico metodo disponible: YAPE"
							Escribir "Realice el pago de S/ ", totalPagar, " al siguiente numero:"
							Escribir "*** 987 654 321 - Finca Grandez ***"
							Escribir ""
							
							Repetir
								Escribir Sin Saltar "Ya realizo el pago por Yape? (S = Si / N = No): "
								Leer confirmacionPago
								confirmacionPago <- Mayusculas(confirmacionPago)
								Si confirmacionPago = "N" Entonces
									Escribir "Por favor realice el pago antes de continuar."
								SiNo
									Si confirmacionPago <> "S" Entonces
										Escribir "Error: responda S o N."
									FinSi
								FinSi
							Hasta Que confirmacionPago = "S"
							
							Repetir
								valido <- Falso
								Escribir Sin Saltar "Ingrese el codigo de operacion de Yape (8 digitos): "
								Leer codigoOperacionYape
								Si soloDigitos(codigoOperacionYape) Entonces
									Si Longitud(codigoOperacionYape) = 8 Entonces
										valido <- Verdadero
									SiNo
										Escribir "Error: el codigo debe tener exactamente 8 digitos."
									FinSi
								SiNo
									Escribir "Error: el codigo debe contener solo numeros."
								FinSi
							Hasta Que valido
							
							// TIPO DE COMPROBANTE
							Repetir
								Escribir ""
								Escribir "--- 5. TIPO DE COMPROBANTE ---"
								Escribir "1. Boleta (requiere DNI)"
								Escribir "2. Factura (requiere RUC y Razon Social)"
								Repetir
									Escribir Sin Saltar "Elija el tipo de comprobante (1-2): "
									Leer tipoComprobante
									Si tipoComprobante <> "1" Y tipoComprobante <> "2" Entonces
										Escribir "Error: opcion invalida."
									FinSi
								Hasta Que tipoComprobante = "1" O tipoComprobante = "2"
								
								volver <- Falso
								valido <- Falso
								Si tipoComprobante = "1" Entonces
									// Boleta (DNI)
									razonSocial <- ""
									Repetir
										Escribir Sin Saltar "Ingrese su DNI (8 digitos) o 0 para volver: "
										Leer numDocumento
										Si numDocumento = "0" Entonces
											volver <- Verdadero
											valido <- Verdadero
										SiNo
											Si soloDigitos(numDocumento) Entonces
												Si Longitud(numDocumento) = 8 Entonces
													valido <- Verdadero
												SiNo
													Escribir "Error: el DNI debe tener exactamente 8 digitos."
												FinSi
											SiNo
												Escribir "Error: el DNI debe contener solo numeros."
											FinSi
										FinSi
									Hasta Que valido
								SiNo
									// Factura (RUC y Razon Social)
									Repetir
										Escribir Sin Saltar "Ingrese su RUC (11 digitos) o 0 para volver: "
										Leer numDocumento
										Si numDocumento = "0" Entonces
											volver <- Verdadero
											valido <- Verdadero
										SiNo
											Si soloDigitos(numDocumento) Entonces
												Si Longitud(numDocumento) = 11 Entonces
													valido <- Verdadero
												SiNo
													Escribir "Error: el RUC debe tener exactamente 11 digitos."
												FinSi
											SiNo
												Escribir "Error: el RUC debe contener solo numeros."
											FinSi
										FinSi
									Hasta Que valido
									
									Si No volver Entonces
										Repetir
											Escribir Sin Saltar "Ingrese la Razon Social de la empresa: "
											Leer razonSocial
											Si Longitud(razonSocial) < 3 Entonces
												Escribir "Error: la razon social debe tener al menos 3 caracteres."
											FinSi
										Hasta Que Longitud(razonSocial) >= 3
									FinSi
								FinSi
							Hasta Que volver = Falso
							
							// DESCONTAR STOCK
							stock[productoElegido] <- stock[productoElegido] - cantidad
							
							// GUARDAR PEDIDO
							cantPedidos <- cantPedidos + 1
							idPedido <- generarIdPedido(cantPedidos)
							pedidosId[cantPedidos] <- idPedido
							pedidosCliente[cantPedidos] <- nombreCliente
							pedidosProducto[cantPedidos] <- nombreProducto
							pedidosCantidad[cantPedidos] <- cantidad
							pedidosEntrega[cantPedidos] <- textoEntrega
							pedidosDireccion[cantPedidos] <- Concatenar(Concatenar(direccionCliente, ", "), distritoCliente)
							pedidosReferencia[cantPedidos] <- referenciaCliente
							pedidosTelContacto[cantPedidos] <- telContacto
							pedidosDias[cantPedidos] <- diasEntregas
							pedidosTotal[cantPedidos] <- totalPagar
							pedidosFecha[cantPedidos] <- ConvertirATexto(FechaActual())
							pedidosHora[cantPedidos] <- ConvertirATexto(HoraActual())
							
							Si textoEntrega = "Delivery" Entonces
								pedidosEstado[cantPedidos] <- "Pagado - Pendiente de entrega"
							SiNo
								pedidosEstado[cantPedidos] <- "Pagado - Listo para recojo"
							FinSi
							
							// BOLETA / FACTURA FINAL
							mostrarBoleta(tipoComprobante, idPedido, numDocumento, razonSocial, nombreCliente, telefonoCliente, direccionCliente, distritoCliente, textoEntrega, referenciaCliente, telContacto, diasEntregas, nombreProducto, cantidad, precioProducto, subtotal, costoDelivery, totalPagar, codigoOperacionYape)
							Escribir "Presione Enter para continuar..."
							Esperar Tecla
						SiNo
							Si opcionMenu = "3" Entonces
								buscarPedido(pedidosId, pedidosFecha, pedidosHora, pedidosCliente, pedidosProducto, pedidosCantidad, pedidosEntrega, pedidosDireccion, pedidosReferencia, pedidosTelContacto, pedidosDias, pedidosTotal, pedidosEstado, cantPedidos)
								Escribir "Presione Enter para continuar..."
								Esperar Tecla
							SiNo
								Si opcionMenu = "4" Entonces
									reporteDiario(pedidosId, pedidosHora, pedidosCliente, pedidosProducto, pedidosCantidad, pedidosEntrega, pedidosTotal, cantPedidos)
									Escribir "Presione Enter para continuar..."
									Esperar Tecla
								SiNo
									Si opcionMenu = "5" Entonces
										Escribir ""
										Escribir "Cerrando sesion..."
										Escribir ""
										sesionIniciada <- Falso
									SiNo
										Si opcionMenu <> "1" Entonces
											Escribir "Opcion no valida, intente de nuevo."
											Escribir ""
										FinSi
									FinSi
								FinSi
							FinSi
						FinSi
					FinMientras
				FinSi
			SiNo
				Si opcionInicio = "3" Entonces
					Escribir ""
					Escribir "Saliendo del sistema..."
				SiNo
					Escribir "Opcion no valida, intente de nuevo."
					Escribir ""
				FinSi
			FinSi
		FinSi
	Hasta Que opcionInicio = "3"
FinAlgoritmo

// ==========================================================
// FUNCIONES Y SUBPROCESOS
// ==========================================================
SubProceso limpiarPantalla
	Definir i Como Entero
	Para i <- 1 Hasta 3 Hacer
		Escribir ""
	FinPara
FinSubProceso

Funcion r <- esDigito(c)
	Definir r Como Logico
	r <- (c = "0" O c = "1" O c = "2" O c = "3" O c = "4" O c = "5" O c = "6" O c = "7" O c = "8" O c = "9")
FinFuncion

Funcion r <- soloDigitos(texto)
	Definir r Como Logico
	Definir i Como Entero
	r <- Verdadero
	Si Longitud(texto) = 0 Entonces
		r <- Falso
	FinSi
	Para i <- 1 Hasta Longitud(texto) Con Paso 1 Hacer
		Si No esDigito(Subcadena(texto, i, i)) Entonces
			r <- Falso
		FinSi
	FinPara
FinFuncion

Funcion pos <- posicionArroba(texto)
	Definir pos, i Como Entero
	pos <- 0
	Para i <- 1 Hasta Longitud(texto) Con Paso 1 Hacer
		Si Subcadena(texto, i, i) = "@" Y pos = 0 Entonces
			pos <- i
		FinSi
	FinPara
FinFuncion

Funcion telefono <- pedirCelular(mensaje)
	Definir telefono Como Caracter
	Definir valido Como Logico
	valido <- Falso
	Repetir
		Escribir Sin Saltar mensaje
		Leer telefono
		Si soloDigitos(telefono) Entonces
			Si Longitud(telefono) = 9 Y Subcadena(telefono, 1, 1) = "9" Entonces
				valido <- Verdadero
			SiNo
				Escribir "Error: el celular debe tener 9 digitos y empezar con 9."
			FinSi
		SiNo
			Escribir "Error: el celular debe contener solo numeros."
		FinSi
	Hasta Que valido
FinFuncion

Funcion id <- generarIdPedido(numero)
	Definir id Como Caracter
	Si numero < 10 Entonces
		id <- Concatenar("PED-000", ConvertirATexto(numero))
	SiNo
		Si numero < 100 Entonces
			id <- Concatenar("PED-00", ConvertirATexto(numero))
		SiNo
			Si numero < 1000 Entonces
				id <- Concatenar("PED-0", ConvertirATexto(numero))
			SiNo
				id <- Concatenar("PED-", ConvertirATexto(numero))
			FinSi
		FinSi
	FinSi
FinFuncion

SubProceso mostrarCatalogo(presentaciones, precios, stock)
	Definir numero Como Entero
	Escribir ""
	Escribir "========================================================="
	Escribir "           CATALOGO FINCA GRANDEZ Y STOCK"
	Escribir "========================================================="
	Escribir "   ID    Presentacion    Precio         Stock"
	Para numero <- 1 Hasta 9 Hacer
		Si numero = 1 Entonces
			Escribir ""
			Escribir " BLEND PREMIUM"
		FinSi
		Si numero = 4 Entonces
			Escribir ""
			Escribir " CAFE TRADICION"
		FinSi
		Si numero = 7 Entonces
			Escribir ""
			Escribir " CAFE CATUAI"
		FinSi
		Si numero = 9 Entonces
			Escribir ""
			Escribir " CAFE GEISHA"
		FinSi
		Escribir "   [", numero, "]  ", presentaciones[numero], "      S/ ", precios[numero], "     ", stock[numero], " und."
	FinPara
	Escribir "========================================================="
	Escribir ""
FinSubProceso

Funcion distrito <- elegirDistrito(distritosLima)
	Definir distrito, textoLeido Como Caracter
	Definir i, numDistrito Como Entero
	Definir valido Como Logico
	Escribir ""
	Escribir "Distritos con delivery (solo Lima):"
	Para i <- 1 Hasta 34 Hacer
		Escribir i, ". ", distritosLima[i]
	FinPara
	valido <- Falso
	Repetir
		Escribir Sin Saltar "Elija su distrito (numero): "
		Leer textoLeido
		Si soloDigitos(textoLeido) Entonces
			numDistrito <- ConvertirANumero(textoLeido)
			Si numDistrito >= 1 Y numDistrito <= 34 Entonces
				distrito <- distritosLima[numDistrito]
				valido <- Verdadero
			SiNo
				Escribir "Error: ingrese un numero de la lista."
			FinSi
		SiNo
			Escribir "Error: ingrese solo el numero del distrito."
		FinSi
	Hasta Que valido
FinFuncion

SubProceso buscarPedido(pedidosId, pedidosFecha, pedidosHora, pedidosCliente, pedidosProducto, pedidosCantidad, pedidosEntrega, pedidosDireccion, pedidosReferencia, pedidosTelContacto, pedidosDias, pedidosTotal, pedidosEstado, cantPedidos)
	Definir idBuscado Como Caracter
	Definir i Como Entero
	Definir encontrado Como Logico
	Escribir ""
	Escribir "--- BUSCAR PEDIDO ---"
	Escribir Sin Saltar "Ingrese el ID del pedido (ej. PED-0001): "
	Leer idBuscado
	idBuscado <- Mayusculas(idBuscado)
	encontrado <- Falso
	Para i <- 1 Hasta cantPedidos Con Paso 1 Hacer
		Si pedidosId[i] = idBuscado Entonces
			encontrado <- Verdadero
			Escribir ""
			Escribir "Pedido encontrado"
			Escribir "Estado:     ", pedidosEstado[i]
			Escribir "Detalle:"
			Escribir "  ID:        ", pedidosId[i]
			Escribir "  Fecha:     ", pedidosFecha[i], " ", pedidosHora[i]
			Escribir "  Cliente:   ", pedidosCliente[i]
			Escribir "  Producto:  ", pedidosProducto[i], " x ", pedidosCantidad[i]
			Escribir "  Entrega:   ", pedidosEntrega[i], " - ", pedidosDireccion[i]
			Si pedidosEntrega[i] = "Delivery" Entonces
				Escribir "  Referencia:        ", pedidosReferencia[i]
				Escribir "  Tel. contacto:     ", pedidosTelContacto[i]
				Escribir "  Entrega estimada: ", pedidosDias[i]
			FinSi
			Escribir "  Total:     S/ ", pedidosTotal[i]
			Escribir ""
		FinSi
	FinPara
	Si No encontrado Entonces
		Escribir "El pedido no existe."
		Escribir ""
	FinSi
FinSubProceso

SubProceso reporteDiario(pedidosId, pedidosHora, pedidosCliente, pedidosProducto, pedidosCantidad, pedidosEntrega, pedidosTotal, cantPedidos)
	Definir i, cantidadPedidos, totalDelivery, totalRecojo Como Entero
	Definir totalVendido Como Real
	Escribir ""
	Escribir "--- REPORTE DIARIO DE PEDIDOS ---"
	cantidadPedidos <- 0
	totalVendido <- 0
	totalDelivery <- 0
	totalRecojo <- 0
	Escribir "---------------------------------------------------------"
	Para i <- 1 Hasta cantPedidos Con Paso 1 Hacer
		cantidadPedidos <- cantidadPedidos + 1
		totalVendido <- totalVendido + pedidosTotal[i]
		Si pedidosEntrega[i] = "Delivery" Entonces
			totalDelivery <- totalDelivery + 1
		SiNo
			totalRecojo <- totalRecojo + 1
		FinSi
		Escribir pedidosId[i], " | ", pedidosHora[i], " | ", pedidosCliente[i], " | ", pedidosProducto[i], " x ", pedidosCantidad[i], " | S/ ", pedidosTotal[i]
	FinPara
	Si cantidadPedidos = 0 Entonces
		Escribir "No hay pedidos registrados hoy."
	FinSi
	Escribir "---------------------------------------------------------"
	Escribir "Pedidos del dia:   ", cantidadPedidos
	Escribir "  - Delivery:      ", totalDelivery
	Escribir "  - Recojo:        ", totalRecojo
	Escribir "Total vendido:     S/ ", totalVendido
	Escribir ""
FinSubProceso

SubProceso mostrarBoleta(tipoComprobante, idPedido, numDocumento, razonSocial, nombreCliente, telefonoCliente, direccionCliente, distritoCliente, textoEntrega, referenciaCliente, telContacto, diasEntregas, nombreProducto, cantidad, precioProducto, subtotal, costoDelivery, totalPagar, codigoOperacionYape)
	Definir tipoDocumento Como Caracter
	Escribir ""
	Escribir "========================================================="
	Si tipoComprobante = "1" Entonces
		Escribir "           BOLETA DE VENTA - FINCA GRANDEZ"
		tipoDocumento <- "BOLETA"
	SiNo
		Escribir "              FACTURA - FINCA GRANDEZ"
		tipoDocumento <- "FACTURA"
	FinSi
	Escribir "========================================================="
	Escribir "ID Pedido:      ", idPedido
	Escribir "---------------------------------------------------------"
	Escribir "Documento:      ", tipoDocumento
	Escribir "Nro. Doc:       ", numDocumento
	Si tipoComprobante = "2" Entonces
		Escribir "Razon Social:   ", razonSocial
	FinSi
	Escribir "Cliente/Cont.:  ", nombreCliente
	Escribir "Telefono:       ", telefonoCliente
	Escribir "Direccion:      ", direccionCliente, ", ", distritoCliente
	Si textoEntrega = "Delivery" Entonces
		Escribir "Referencia:     ", referenciaCliente
		Escribir "Tel. contacto:  ", telContacto
		Escribir "Entrega en:     ", diasEntregas
	SiNo
		Escribir "Entrega:        Recojo en tienda"
	FinSi
	Escribir "---------------------------------------------------------"
	Escribir "Producto:       ", nombreProducto
	Escribir "Cantidad:       ", cantidad
	Escribir "Precio unit.:   S/ ", precioProducto
	Escribir "---------------------------------------------------------"
	Escribir "SUBTOTAL PEDIDO:  S/ ", subtotal
	Escribir "COSTO ENVIO:      S/ ", costoDelivery
	Escribir "---------------------------------------------------------"
	Escribir "TOTAL A PAGAR:    S/ ", totalPagar
	Escribir "========================================================="
	Escribir "Metodo Pago:    YAPE"
	Escribir "Pagado a:       987 654 321 (Finca Grandez)"
	Escribir "Operacion ID:   ", codigoOperacionYape
	Escribir "========================================================="
	Escribir "       *Pedido registrado correctamente!"
	Escribir ""
FinSubProceso