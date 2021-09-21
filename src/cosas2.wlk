object knightRider {
	method consecuencia() {}
	method bultos() = 1
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object bumblebee {
	var transformadoEnAuto = true
	
	method consecuencia() { self.transformar() }
	method bultos() = 2
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
}

object paqueteDeLadrillos {
	var cantidadDeLadrillos = 0
	
	method consecuencia() { cantidadDeLadrillos += 12 }
	method bultos() {
		var cantBultos = 2
		if (cantidadDeLadrillos > 300) {
			cantBultos = 3
		} else if (cantidadDeLadrillos <= 100) {
			cantBultos = 1
		}
		return cantBultos
	}
	 
	method setCantidadDeLadrillos(cantidad) { cantidadDeLadrillos = cantidad}
	method peso() { return 2*cantidadDeLadrillos }
	method nivelPeligrosidad() { return 2 }
}

object arenaAGranel {
	var peso = 0
	
	method consecuencia() { peso += 20 }
	method bultos() = 1
	method setPeso(unPeso) { peso = unPeso}
	method peso() = peso
	method nivelPeligrosidad() = 1
}

object bateriaAntiaerea {
	var property conMisiles = true
	
	method consecuencia() { conMisiles = true } 
	method bultos() { return if(conMisiles){2} else {1} }
	method peso() {return if (conMisiles) { 300 } else { 200 } }
	method nivelPeligrosidad() {return if (conMisiles) { 100 } else { 0 } }	
}

object contenedorPortuario {
	const contenido = []
	
	method consecuencia() { contenido.forEach( { c => c.consecuencia() } ) }
	method bultos() { return 1 + contenido.sum( { c => c.bultos() } ) } 
	method cargarCosa(unaCosa) { contenido.add(unaCosa) }
	method peso() { return 100 + contenido.sum( { c => c.peso() } ) }
	method nivelPeligrosidad() {return contenido.max( { c => c.nivelPeligrosidad() } ) }
}

object residuosRadioactivos {
	var peso
	
	method consecuencia() { peso += 15 }
	method bultos() = 1
	method setPeso(unPeso) { peso = unPeso }
	method peso() = peso
	method nivelPeligrosidad() = 200
}

object embalajeDeSeguridad {
	var contieneA
	
	method consecuencia() { }
	method bultos() = 2
	method setContieneA(unaCosa) { contieneA = unaCosa}
	method peso() = contieneA.peso()
	method nivelPeligrosidad() = contieneA.nivelPeligrosidad()/2
}