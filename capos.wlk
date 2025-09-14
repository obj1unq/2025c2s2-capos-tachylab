//Rolando y el castillo de piedra
object rolando {
    // Atributos (Constantes y Variables)
    const mochila = #{}

    const capacidadMochila = 2

    const historialEncuentros = []

    //Metodos Lookers (Getters y Setters)
    method mochila() {
        return mochila
    }

    method historialEncuentros() {
        return historialEncuentros
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

}

object libroHechizos {

}

object collarDivino {

}

object armaduraValyrio {

}