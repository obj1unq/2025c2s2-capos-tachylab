//Rolando y el castillo de piedra
object rolando {
    // Atributos (Constantes y Variables)
    var poderBase = 3

    var capacidadMochila = 2

    var casa = castilloPiedra

    const mochila = #{}

    const historialEncuentros = []

    const enemigos = #{}
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

    method enemigos() {
        return enemigos
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

    //Metodos de validaciones y condiciones
    method puedeVencer(enemigo) {
        return self.poderPeleaTotal() > enemigo.poderPelea()
    }

    method esPoderoso() {
        return self.enemigosDerrotables() == enemigos
    }

    method esFatalContra(artefacto, enemigo) {
        return artefacto.aportePoder(self) > enemigo.poderPelea()
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
        poderBase += 1
    }

    method poderArtefactoMasPoderosoGuardado() {
        return casa.poderArtefactoMasPoderoso(self)
    }

    method enemigosDerrotables() {
        return enemigos.filter({enemigo => self.puedeVencer(enemigo)})
    }

    method moradasConquistables() {
        const enemigosDerrotables = self.enemigosDerrotables()
        return enemigosDerrotables.map({enemigo => enemigo.casa()}).asSet()
    }

    method artefactoFatal(enemigo) {
        return mochila.find({artefacto => self.esFatalContra(artefacto, enemigo)})
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

    method poderArtefactoMasPoderoso(dueño) {
        const poderesArtefactos = almacenamiento.map({artefacto => artefacto.aportePoder(dueño)})
        return poderesArtefactos.max()
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

    //Metodos Lookers (Getters y Setters)
    method listaHechizos() {
        return listaHechizos
    }

    //Metodos funcionales

    method proximoHechizo() {
        return listaHechizos.first()
    }

    method efectoBatalla() {
        listaHechizos.remove(self.proximoHechizo())
    }
    method aportePoder(portador) {
        if (listaHechizos.isEmpty()) {
            return 0
        }
        else {
            return self.proximoHechizo().efectoHechizo(portador)
        }
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
        return portador.poderArtefactoMasPoderosoGuardado()
    }
}

//Enemigos

object caterina {
    //Atributos (Variables y Constantes)
    const poderPelea = 28

    const casa = fortalezaAcero
    //Metodos funcionales
    method poderPelea() {
        return poderPelea
    }

    method casa() {
        return casa
    }
}

object archibaldo {
    //Atributos (Variables y Constantes)
    const poderPelea = 16

    const casa = palacioMarmol
    //Metodos funcionales
    method poderPelea() {
        return poderPelea
    }

    method casa() {
        return casa
    }
}

object astra {
    //Atributos (Variables y Constantes)
    const poderPelea = 14

    const casa = torreMarfil
    //Metodos funcionales
    method poderPelea() {
        return poderPelea
    }

    method casa() {
        return casa
    }

}

//Moradas  de enemigos

object fortalezaAcero {
}

object palacioMarmol {
}

object torreMarfil {
}

