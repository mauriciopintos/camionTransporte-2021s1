import cosas2.*

object camion {
	const cosas = []
	
	method cargar(cosa) {
		cosas.add(cosa)
		cosa.consecuencia()
	}
	
	method descargar(cosa) { cosas.remove(cosa) }
	
	method todoPesoPar() { return cosas.all( { c => c.peso() % 2 == 0 } ) }
	
	method hayAlgunoQuePesa(peso) { return cosas.any( { c => c.peso() == peso } ) }
	
	method elDeNivel(nivel) { return cosas.find( { c => c.nivelPeligrosidad() == nivel } ) }
	
	method pesoTotal() { return cosas.sum( { c => c.peso() } ) + 1000 }
	
	method excedidoDePeso() { return self.pesoTotal() > 2500 }
	
	method objetosQueSuperanPeligrosidad(nivel) { return cosas.filter( { c => c.nivelPeligrosidad() > nivel } ) }
	
	method objetosMasPeligrososQue(cosa) { return self.objetosQueSuperanPeligrosidad(cosa.nivelPeligrosidad()) }
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		return not self.excedidoDePeso() and self.objetosQueSuperanPeligrosidad(nivelMaximoPeligrosidad).size() == 0
	}
	
	method tieneAlgoQuePesaEntre(min, max) { return cosas.any( { c => c.peso().between(min,max) } ) }
	
	method cosaMasPesada() { return cosas.max( { c => c.peso() } ) }
	
	method pesos() { return cosas.map( { c => c.peso() } ) }
	
	method totalBultos() { return cosas.sum( { c => c.bultos() } ) }
}
