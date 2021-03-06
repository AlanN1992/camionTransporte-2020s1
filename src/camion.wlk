import cosas.*

object camion {
	const cosas = []
	
	method cargar(unaCosa) { cosas.add(unaCosa) }
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
