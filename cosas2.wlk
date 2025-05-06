object knightRider {
    method peso() = 500

    method peligrosidad() = 10

    method bultosQueOcupa() = 1

    method sufrirConsecuenciaDeLaCarga() {}
}

object bumblebee {
    var estaComoRobot = false

    method estaComoRobot() = estaComoRobot   //si es falso ya se que esta como auto y viceversa 

    method transformarseEnAuto() {
        estaComoRobot = false
    }

    method transformarseEnRobot() {
        estaComoRobot = true
    }

    method peso() = 800

    method peligrosidad() = if (estaComoRobot) 30 else 15   //expresion ternaria (no necesita puntos ni llaves)

    method bultosQueOcupa() = 2

    method sufrirConsecuenciaDeLaCarga() {
        self.transformarseEnRobot()
    }
}

object paqueteDeLadrillos {
    var cantidad = 0

    method cambiarCantidad(unaCantidad) {
        cantidad = unaCantidad
    }

    method peso() = 2 * cantidad

    method peligrosidad() = 2

    method bultosQueOcupa() = if (cantidad <= 100) 1 
                              else if (cantidad.between(101, 300)) 2 
                              else 3 

    //method bultosQueOcupa() = (2.min(1.max(cantidad-99))).max(3.min(cantidad-298))                          

    method sufrirConsecuenciaDeLaCarga() {
        cantidad += 12
    }
}

object arena {
    var peso = 0
    //var property peso = 0 --> define automaticamente un metodo de indicacion setter y uno de consulta getter (no necesito crearlos)
    //solo lo uso cuando si o si tienen que estar ambos metodos (cuando necesito cambiar el valor de la variable, no cuando se tiene que incrementar, por ej)
    //hace el atributo publico 

    method cambiarPeso(unPeso) {    //setter
        peso = unPeso
    }

    method peso() = peso           //getter 

    method peligrosidad() = 1

    method bultosQueOcupa() = 1

    method sufrirConsecuenciaDeLaCarga() {
        peso = 0.max(peso - 10)
    }
}

object bateriaAntiaerea {
    var tieneMisiles = false

    method tieneMisiles() = tieneMisiles

    method descargarMisiles() {
        tieneMisiles = false
    }

    method cargarMisiles() {
        tieneMisiles = true 
    }

    method peso() = if (tieneMisiles) 300 else 200

    method peligrosidad() = if (tieneMisiles) 100 else 0

    method bultosQueOcupa() = if (tieneMisiles) 2 else 1 

    method sufrirConsecuenciaDeLaCarga() {
        self.cargarMisiles()    
    }
}

object contenedorPortuario {
    const cosas = []

    method agregarCosa(unaCosa) {
        cosas.add(unaCosa)
    }

    method quitarCosa(unaCosa) {
        cosas.remove(unaCosa)
    }

    method agregarVariasCosas(unaListaDeCosas) {
        cosas.addAll(unaListaDeCosas)
    }

    method peso() = 100 + self.pesoCosas()

    method pesoCosas() = cosas.sum({c => c.peso()})

    method peligrosidad() = if (cosas.isEmpty()) 0 else self.mayorPeligrosidad()

    method mayorPeligrosidad() = cosas.max({c => c.peligrosidad()}).peligrosidad()

    method bultosQueOcupa() = 1 + cosas.sum({c => c.bultosQueOcupa()})

    method sufrirConsecuenciaDeLaCarga() {
        cosas.forEach({c => c.sufrirConsecuenciaDeLaCarga()})
    }
}

object residuosRadioactivos {
    var property peso = 0

    method peligrosidad() = 200

    method bultosQueOcupa() = 1

    method sufrirConsecuenciaDeLaCarga() {
        peso += 15
    }
}

object embalajeDeSeguridad {
    var property cosaEmbalada = arena

    method peso() = cosaEmbalada.peso()

    method peligrosidad() = cosaEmbalada.peligrosidad() / 2

    method bultosQueOcupa() = 2

    method sufrirConsecuenciaDeLaCarga() {}
}