import cosas2.*

object camion {
	const cosas = []
	
	method cargar(unaCosa) { 
		if (unaCosa == 'knightRider'){cosas.add(unaCosa)}
		else if (unaCosa == 'bumblebee'){unaCosa.transformarEnRobot(true)	cosas.add(unaCosa)}
		else if(unaCosa == 'paqueteDeLadrillos'){
			const nuevaCantidad = 12 + (unaCosa.peso()/2)
			unaCosa.setCantidad(nuevaCantidad)
			cosas.add(unaCosa)	}
		else if(unaCosa == 'arenaAGranel'){
			const nuevoPeso = 20 + unaCosa.peso()
			unaCosa.setPesoArena(nuevoPeso)
			cosas.add(unaCosa)	}
		else if (unaCosa == 'bateriaAntiaerea'){unaCosa.setTieneMisiles(true)	cosas.add(unaCosa)}
		else if(unaCosa == 'residuosRadioactivos'){
			const nuevoPeso = 15 + unaCosa.peso()
			unaCosa.setPeso(nuevoPeso)
			cosas.add(unaCosa)	}
		else if(unaCosa == 'embalajeDeSeguridad'){cosas.add(unaCosa)}
		else if(unaCosa == 'contenedorPortuario'){cosas.add(unaCosa)} 
		// Punto: contenedor portuario: hace que reaccione cada una de las cosas que tiene adentro -->> sin resolver. No sé como encararlo
	}
	method descargar(unaCosa){ cosas.remove(unaCosa) }
	method todoPesoPar(){ return (cosas.all({cosa=> cosa.peso()%2 == 0})) }
	method hayAlgunoQuePesa(peso){ return (cosas.any({cosa=>cosa.peso() == peso})) }
	method elDeNivel(nivel){ return (cosas.filter({cosa=>cosa.nivelPeligrosidad() == nivel}).first() ) }
	method pesoTotal(){
		const tara = 1000
		const pesoCargaCamion = cosas.sum({cosa=>cosa.peso()})
		return (tara + pesoCargaCamion)	
	}
	method excedidoDePeso(){ const cargaMaxima = 2500	 return (self.pesoTotal() > cargaMaxima)}
	method objetosQueSuperanPeligrosidad(nivel){ return(cosas.filter({cosa=>cosa.nivelPeligrosidad() > nivel})) }
	method objetosMasPeligrososQue(cosa){ return(cosas.filter({cos=>cos.nivelPeligrosidad() > cosa.nivelPeligrosidad()})) }
	method puedeCircularEnRuta(nivelMaximoPeligrosidad){return (not self.excedidoDePeso() && cosas.all({cosa=>cosa.nivelPeligrosidad() < nivelMaximoPeligrosidad})) }
	method tieneAlgoQuePesaEntre(min,max){return cosas.any({cosa=>cosa.peso().between(min,max)}) }
	method cosaMasPesada(){ return (cosas.max({cosa=>cosa.peso()})) }
	method pesos(){ return (cosas.map({cosa=>cosa.peso()}) ) }
}
