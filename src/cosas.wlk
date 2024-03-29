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
	var cantidadDeLadrillos = 0
	method setCantidadDeLadrillos(cantidad) { cantidadDeLadrillos = cantidad}
	method peso() { return 2*cantidadDeLadrillos }
	method nivelPeligrosidad() { return 2 }
}

object arenaAGranel {
	var peso = 0
	method setPeso(unPeso) { peso = unPeso}
	method peso() = peso
	method nivelPeligrosidad() = 1
}

object bateriaAntiaerea {
	var property conMisiles = true
	method peso() {return if (conMisiles) { 300 } else { 200 } }
	method nivelPeligrosidad() {return if (conMisiles) { 100 } else { 0 } }	
}

object contenedorPortuario {
	const contenido = []
	method cargarCosa(unaCosa) { contenido.add(unaCosa) }
	method peso() { return 100 + contenido.sum( { c => c.peso() } ) }
	method nivelPeligrosidad() {return contenido.max( { c => c.nivelPeligrosidad() } ).nivelPeligrosidad() }
}

object residuosRadioactivos {
	var peso
	method setPeso(unPeso) { peso = unPeso }
	method peso() = peso
	method nivelPeligrosidad() = 200
}

object embalajeDeSeguridad {
	var contieneA
	method setContieneA(unaCosa) { contieneA = unaCosa}
	method peso() = contieneA.peso()
	method nivelPeligrosidad() = contieneA.nivelPeligrosidad()/2
}