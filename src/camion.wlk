import cosas.*

object camion {
	const property cosas = []
	
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}
	
	method descargar(unaCosa){
		cosas.remove(unaCosa)
	}
	
	method todoPesoPar(){
		return (cosas.peso().all().even())
	}
	
	method hayAlgunoQuePesa(peso){
		
	}
	
	method elDeNivel(nivel){
		
	}
	
	method pesoTotal(){
		
	}
	
	method excedidoDePeso(){
		
	}
	
	method objetosQueSuperanPeligrosidad(nivel){
		
	}
	
	method objetosMasPeligrososQue(cosa){
		
	}
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad){
		
	}
}
