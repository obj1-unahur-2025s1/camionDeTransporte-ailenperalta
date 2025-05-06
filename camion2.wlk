object camion {
    const carga = []

    method cargarCosa(unaCosa) {
        carga.add(unaCosa)
        unaCosa.sufrirConsecuenciaDeLaCarga()
    }

    method descargarCosa(unaCosa) {
        carga.remove(unaCosa)
    }

    method pesoTotal() = 1000 + self.cargaTotal()

    method cargaTotal() = carga.sum({c => c.peso()})

    method todoPesoEsPar() = carga.all({c => c.peso().even()})

    method hayCosaQuePesa(unPeso) = carga.any({c => c.peso() == unPeso})

    method primeraCosaConPeligrosidad(nivelPeligrosidad) = carga.find({c => c.peligrosidad() == nivelPeligrosidad})

    method cosasConPeligrosidadMayorA(nivelPeligrosidad) = carga.filter({c => c.peligrosidad() > nivelPeligrosidad})

    method cosasConMayorPeligrosidadQue(unaCosa) = self.cosasConPeligrosidadMayorA(unaCosa.peligrosidad())   //mejor opcion

    //method cosasConMayorPeligrosidadQue(unaCosa) = carga.filter({c => c.peligrosidad() > unaCosa.peligrosidad()})

    method estaExcedidoDePeso() = self.pesoTotal() > 2500

    method puedeCircular(nivelPeligrosidad) = !self.estaExcedidoDePeso() and self.cosasConPeligrosidadMayorA(nivelPeligrosidad).isEmpty()

    method hayCosaQuePesaEntre(min, max) = carga.any({c => c.peso().between(min, max)})

    method cosaMasPesada() = carga.max({c => c.peso()})
}