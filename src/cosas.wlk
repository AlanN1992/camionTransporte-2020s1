object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
}

object paqueteDeLadrillos {
	var cantidadLadrillos = 0 
	
	method setCantidad(cantidad) { cantidadLadrillos = cantidad }
	method peso() { return (cantidadLadrillos * 2) }
	method nivelPeligrosidad(){ return 2 }
}

object arenaAGranel {
	var pesoArena = 0
	
	method setPesoArena(peso){ pesoArena = peso}
	method peso(){ return pesoArena }
	method nivelPeligrosidad() { return 1 }
}

object bateriaAntiaerea{
	var tieneMisiles = true
	
	method setTieneMisiles(tieneMisil){ tieneMisiles = tieneMisil } 
	method peso(){ return if (tieneMisiles) { 300 } else { 200 } }
	method nivelPeligrosidad() { return if (tieneMisiles) { 100 } else { 0 } }
}

object contenedorPortuario{
	const contenido = []
	
	method setContenido(objeto) { contenido.add(objeto) }
	method peso(){ return ( 100 + contenido.peso().sum() ) }
	method nivelPeligrosidad() { return if ( contenido.isEmpty() ) { 0 } else { contenido.nivelPeligrosidad().max() } }
}

object residuosRadioactivos{
	var pesoResiduos = 0
	
	method setPeso(peso) { pesoResiduos = peso}
	method peso() { return pesoResiduos}
	method nivelPeligrosidad() { return 200 }
}

object embalajeDeSeguridad{
	const contenido = []
	
	method setContenido(objeto){ contenido.add(objeto)}
	method peso() { return ( contenido.peso() )}
	method nivelPeligrosiad () {return ( contenido.nivelPeligrosidad() / 2 ) }
}