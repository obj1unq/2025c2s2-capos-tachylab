//Rolando y el castillo de piedra
object rolando {
    // Atributos (Constantes y Variables)
    var poderBase = 3

    var capacidadMochila = 2

    var casa = castilloPiedra

    const mochila = #{}

    const historialEncuentros = []

    //Metodos Lookers (Getters y Setters)
    method mochila() {
        return mochila
    }

    method historialEncuentros() {
        return historialEncuentros
    }

    method poderBase() {
        return poderBase
    }

    method capacidadMochila(_capacidadMochila) {
        capacidadMochila = _capacidadMochila
    }

    method poderBase(_poderBase) {
        poderBase = _poderBase
    }

    method casa(_casa) {
        casa = _casa
    }

    // Métodos Funcionales
    method encontrar(artefacto) {
        historialEncuentros.add(artefacto)
        if (mochila.size() < capacidadMochila) {
            mochila.add(artefacto)
        }
    }

    method almacenarEnCasa(artefacto) {
        mochila.remove(artefacto)
        casa.almacenar(artefacto)
    }

    method posesionesActuales() {
        return mochila.union(castilloPiedra.almacenamiento())
    }

    method poderPeleaTotal() {
        return poderBase + mochila.sum({artefacto => artefacto.aportePoder(self)})
    }

    method pelearBatalla() {
        mochila.forEach({artefacto => artefacto.efectoBatalla()})
    }

    method artefactoMasPoderoso() {
        return self.posesionesActuales().max({artefacto => artefacto.aportePoder(self)})
    }
}

object castilloPiedra {
    // Atributos (Constantes y Variables)
    const almacenamiento = #{}

    // Métodos Lookers (Getters y Setters)
    method almacenamiento() {
        return almacenamiento
    }

    // Métodos Funcionales
    method almacenar(artefacto) {
        almacenamiento.add(artefacto)
    }
}

// Artefactos
object espadaDestino {
    //Atributos (variables y constantes)
    var fueUsada = false

    //Metodos Lookers (Getters y Setters)
    method fueUsada(_fueUsada) {
        fueUsada = _fueUsada
    }

    //Metodos funcionales
    method aportePoder(portador) {
        if (not fueUsada) {
            return portador.poderBase()
        }
        else {
            return portador.poderBase() * 0.5
        }

    }

    method efectoBatalla() {
        fueUsada = true
}
}
object libroHechizos {
    //Atributos (variables y constantes)
    const listaHechizos = []

    //Metodos funcionales

    method proximoHechizo() {
        return listaHechizos.first()
    }
    method aportePoder(portador) {
        return self.proximoHechizo().poderHechizo(portador)
    }
}

object collarDivino {
    //Atributos (variables y constantes)
    var usosEnBatalla = 0

    const poderBase = 3

    //Metodos Lookers (Getters y Setters)
    method usosEnBatalla(_usosEnBatalla) {
        usosEnBatalla = _usosEnBatalla
    }

    //Metodos funcionales
    method efectoBatalla() {
        usosEnBatalla += 1
    }

    method aportePoder(portador) {
        if (portador.poderBase() > 6) {
            return poderBase + usosEnBatalla
        }
        return poderBase
    }

}

object armaduraValyrio {
    //Atributos (variables y constantes)

    const poderBase = 6
    //Metodos Lookers (Getters y Setters)

    method aportePoder(portador) {
        return poderBase
    }

    method efectoBatalla() {}
}

//Hechizos

object bendicion {
    //Metodos funcionales

    method efectoHechizo(portador) {
        return 4
    }
}

object invisibilidad {
    //Metodos funcionales

    method efectoHechizo(portador) {
        return portador.poderBase()
    }
}

object invocacion {
    //Metodos funcionales

    method efectoHechizo(portador) {
        portador.artefactoMasPoderoso()
    }
}