//Rolando y el castillo de piedra
object rolando {
    // Atributos (Constantes y Variables)
    var poderBase = 3

    var capacidadMochila = 2

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

    // Métodos Funcionales
    method encontrar(artefacto) {
        historialEncuentros.add(artefacto)
        if (mochila.size() < capacidadMochila) {
            mochila.add(artefacto)
        }
    }

    method almacenarEnCastillo(artefacto) {
        mochila.remove(artefacto)
        castilloPiedra.almacenar(artefacto)
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
    var fueUsada = false

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

}

object collarDivino {
    var usosEnBatalla = 0

    const poderBase = 3

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
    const poderBase = 6

    method aportePoder(portador) {
        return poderBase
    }

    method efectoBatalla() {

    }

}