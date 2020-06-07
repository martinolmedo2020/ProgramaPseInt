
//IMPORTANTE! Para iniciar al panel de miembro de la empresa utilizar la palabra "admin" en usuario y contraseña

//SubProceso para calculo de descuentos
SubProceso CalcDescuento <- Descuento (A,B,C)
	Definir CalcDescuento Como Real;
	CalcDescuento <- C*(A*B)/100;
FinSubProceso

//SubProceso para calculo de ganancias
SubProceso CalcGanancias <- Ganancias (A,B,C,D)
	Definir CalcGanancias Como Real;
	CalcGanancias <- ((A*5) + (B*25) + (C*40)) - D*((A*5) + (B*25) + (C*40))/100;
FinSubProceso

//Subproceso para calculo consumidor
SubProceso Total <- Precio (A,B,C)
	Definir Total Como Real;
	Total <- (A*B)-C*(A*B)/100;
FinSubProceso

//Inicialización del programa
Proceso CotizacionAntivirus
	
//Definición de variables
	//Planes que se ofrecen
	Definir Basico como Entero;
	Definir Recomendado como Entero;
	Definir Premium como Entero;
	Definir EleccionPlan como Entero;
	//Meses de duracion del servicio
	Definir EleccionFecha como Entero;
	//Precios y descuentos
	Definir Oferta como Real;
	Definir PrecioFinal como Real;
	Definir DescuentoFinal como Real;
	//Info administracion de la empresa
	Definir usuario como Entero;
	Definir user como Texto;
	Definir password como Texto;
	Definir Administrar como Entero;
	//Herramientas administracion de la empresa
	Definir ventasBasico como Entero;
	Definir ventasRecomendado como Entero;
	Definir ventasPremium como Entero;
	Definir TotalGanMen Como Real;
	Definir TotalGanTri Como Real;
	Definir TotalGanSem Como Real;
	Definir TotalGan Como Real;
	
//Definicion de variables de precios por la empresa
	Basico <- 5;
	Recomendado <- 25;
	Premium <- 40;
	
//Selección de tipo de usuario
	Repetir
		
	Escribir "Bienvenido! a continuacion elija la opción que corresponda y sera dirigido a las herramientas de calculo segun corresponda";
	Escribir " ";	
	Escribir "Usted es?";
	Escribir "1-Consumidor  2- Miembro de la empresa";
	leer usuario;
		
	Segun usuario hacer
		1: // Bienvenida al consumidor y eleccion del plan del servicio
			Limpiar Pantalla;
			Escribir "A continuación elija lo que mas se adapte a  lo que necesite y nuestro programa calculara su costo";
			Escribir " ";
			Escribir ">>Presione una tecla para continuar<<";
			Esperar Tecla;
			Limpiar pantalla;
			Escribir "Primero seleccione el servicio que quiera contratar (todos cuentan con soporte y actualizaciones permanentes)";
			Escribir " ";
			Escribir "1- Basico(5$) 2- Recomendado(25$) 3- Premium(40$)";
			
			leer EleccionPlan;
			
			Mientras EleccionPlan < 1 o EleccionPlan > 3 Hacer
				Escribir "Introduzca una opcion numerica valida (1, 2 o 3)";
				leer EleccionPlan;
			FinMientras
			Escribir " ";
			
			//Elección del consumidor de la duración del plan
			Escribir "Y aquí seleccione la duración de su plan (1, 3 o 6 meses)";
			Escribir "**Oferta en planes de 3 y 6 meses (25% y 35% ahorro)**";
			leer EleccionFecha;
			
			Mientras EleccionFecha <> 1 Y EleccionFecha <> 3 Y EleccionFecha <> 6 Hacer
				Escribir "Introduzca una opcion valida (1, 3 o 6)";
				leer EleccionFecha;
			FinMientras
			Escribir ">>Presione una tecla para continuar<<";
			Esperar tecla;
			Limpiar Pantalla;
			
			//Comienzo del mensaje final que se va a visualizar
			Escribir " ";	
			Escribir "Duracion de su plan: ", EleccionFecha," mes/es";
			Escribir " ";
			Segun EleccionPlan Hacer
				1: escribir "Tipo de plan que escogió: Basico";
				2: escribir "Tipo de plan que escogió: Recomendado";
				3: escribir "Tipo de plan que escogió: Premium";
			FinSegun
			
			//Asignación del precio del plan escogido por el usuario
			
			Si EleccionPlan = 1 entonces EleccionPlan <- Basico; Sino FinSi
			Si EleccionPlan = 2 entonces EleccionPlan <- Recomendado; Sino FinSi
			Si EleccionPlan = 3 entonces EleccionPlan <- Premium; Sino FinSi
						
			//Descuentos de acuerdo a la eleccion del usuario (definidos por la empresa)		
			Si EleccionFecha = 1 entonces Oferta <- 0; Sino FinSi
			Si EleccionFecha = 3 entonces Oferta <- 25; Sino FinSi
			Si EleccionFecha = 6 entonces Oferta <- 35; Sino FinSi
									
			//Fin del mensaje final de acuerdo a los calculos del subproceso
			PrecioFinal <- Precio(EleccionPlan,EleccionFecha,Oferta);
			Escribir "Su TOTAL es de ", PrecioFinal, " $";
			DescuentoFinal <- Descuento(EleccionPlan,EleccionFecha,Oferta);
			Escribir "Se le hizo un descuento de ", DescuentoFinal, " $";
			Escribir "Gracias por elegirnos!";
			Escribir  " ";
			
		2:	//Verificación de credenciales y bienvenida al miembro de la empresa
			Limpiar Pantalla;
			Escribir "Bienvenido al panel de administracion de la empresa a continuacion presione una tecla para iniciar sesion";
			Esperar Tecla;
			Limpiar Pantalla;
			
			Escribir "Escriba el nombre de usuario";
			leer user;
			Limpiar Pantalla;
			Escribir "Escribe la contraseña";
			leer password;
			Limpiar Pantalla;
				
			//Acceso denegado al panel de administracion
			Mientras user <> "admin" o password <> "admin" Hacer
				Escribir "Usuario o contraseña incorrecta por favor reingresar";
				Esperar Tecla;
				Limpiar Pantalla;
				Escribir "Escriba el nombre de usuario";
				leer user;
				Limpiar Pantalla;
				Escribir "Escriba la contraseña";
				leer password;
				Limpiar Pantalla;
			FinMientras
				
			//Acceso exitoso al panel de administracion
			Escribir "Bienvenido al panel de administración, a continuación podrá calcular,las ganancias obtenidas este mes por las ventas realizadas, tenga en cuenta que no se toman los costos";
			Escribir " ";
			Limpiar Pantalla;
				
			//Entrada de informacion por parte del miembro de la empresa para hacer el calculo de ganancias
			Escribir "---------Especifique cuantas ventas del Servicio Basico hubo este mes del PLAN MENSUAL----------";
			leer ventasBasico;
			Escribir "Ahora especifique las ventas del Servicio Recomendado";
			leer ventasRecomendado;
			Escribir "Por ultimo las ventas del Servicio Premium";
			leer ventasPremium;
			TotalGanMen <- Ganancias (ventasBasico, ventasRecomendado, ventasPremium,0);
			Escribir "Sus ganancias este mes con el plan mensual fueron de ", TotalGanMen, " $";
			Escribir " ";
			Escribir "Presione una tecla para continuar";
			Esperar Tecla;
			Limpiar Pantalla;
			
			Escribir "----------Especifique cuantas ventas del Servicio Basico hubo este mes del PLAN TRIMESTRAL-----------";
			leer ventasBasico;
			Escribir "Ahora especifique las ventas del Servicio Recomendado";
			leer ventasRecomendado;
			Escribir "Por ultimo las ventas del Servicio Premium";
			leer ventasPremium;
			TotalGanTri <- Ganancias (ventasBasico, ventasRecomendado, ventasPremium, 25);
			Escribir "Sus ganancias este mes con el plan TRIMESTRAL fueron de ", TotalGanTri, " $";
			Escribir " ";
			Escribir "Presione una tecla para continuar";
			Esperar Tecla;
			Limpiar Pantalla;
				
			Escribir "----------Especifique cuantas ventas del Servicio Basico hubo este mes del PLAN SEMESTRAL------------";
			leer ventasBasico;
			Escribir "Ahora especifique las ventas del Servicio Recomendado";
			leer ventasRecomendado;
			Escribir "Por ultimo las ventas del Servicio Premium";
			leer ventasPremium;
			TotalGanSem <- Ganancias (ventasBasico, ventasRecomendado, ventasPremium,35);
			Escribir "Sus ganancias este mes con el plan SEMESTRAL fueron de ", TotalGanSem, " $";
			Escribir " ";
			Escribir "Presione una tecla para continuar";
			Esperar Tecla;
			Limpiar Pantalla;
			
			//Calculo final de ganancias y mensaje de despedida
			TotalGan <- TotalGanMen + TotalGanTri + TotalGanSem;
			Escribir "En total todas sus ventas generaron este mes una ganancia de ", TotalGan, " $";
			Escribir " ";
			Escribir "Gracias!";
			Escribir "Presione cualquier tecla para salir";
				
		De Otro Modo:
			Escribir "Por favor seleccione una de las dos opciones (1 o 2)";
			
	FinSegun
	Hasta Que usuario == 1 o usuario == 2;
FinProceso

