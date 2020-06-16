object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method bultos(){return 1}
}

object bumblebee {
	var transformadoEnRobot
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (not transformadoEnRobot) { 15 } else { 30 }  }
	method transformarEnRobot(value) { transformadoEnRobot = value }
	method bultos(){return 2}
}

object paqueteDeLadrillos {
	var cantidadLadrillos = 0 
	
	method setCantidad(cantidad) { cantidadLadrillos = cantidad }
	method peso() { return (cantidadLadrillos * 2) }
	method nivelPeligrosidad(){ return 2 }
	method bultos(){
		if (cantidadLadrillos <= 100){return 1}
		else if (cantidadLadrillos.between(101,300)) {return 2} else {return 3}
	}
}

object arenaAGranel {
	var pesoArena = 0
	
	method setPesoArena(peso){ pesoArena = peso}
	method peso(){ return pesoArena }
	method nivelPeligrosidad() { return 1 }
	method bultos(){return 1}
}

object bateriaAntiaerea{
	var tieneMisiles
	
	method setTieneMisiles(tieneMisil){ tieneMisiles = tieneMisil } 
	method peso(){ return if (tieneMisiles) { 300 } else { 200 } }
	method nivelPeligrosidad() { return if (tieneMisiles) { 100 } else { 0 } }
	method bultos(){return if (tieneMisiles){2} else {1}}
}

object contenedorPortuario{
	const contenido = []
	
	method setContenido(objeto) { contenido.add(objeto) }
	method removeContenido(objeto) {contenido.remove(objeto)}
	method mostrarContenido(){return contenido}
	method peso(){ return ( 100 + contenido.sum({cosa=>cosa.peso() } ) ) }
	method nivelPeligrosidad() {
		 if ( contenido.isEmpty() ) 
		 	{return 0 } 
		 else 
		 { return contenido.max({cosa=>cosa.nivelPeligrosidad()}).nivelPeligrosidad()  } 
	}
	method bultos(){ return ( 1 + contenido.sum({cosa=>cosa.bultos() } ) ) }

}

object residuosRadioactivos{
	var pesoResiduos = 0
	
	method setPeso(peso) { pesoResiduos = peso}
	method peso() { return pesoResiduos}
	method nivelPeligrosidad() { return 200 }
	method bultos(){return 1}
}

object embalajeDeSeguridad{
	var contenido 
	
	method setContenido(objeto){ contenido = objeto}
	method peso() { return ( contenido.peso() )}
	method nivelPeligrosidad () {return ( contenido.nivelPeligrosidad() / 2 ) }
	method bultos(){return 2}
}