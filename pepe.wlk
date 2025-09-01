import wollok.vm.*
object pepe {
    var faltas = 0
    var categoría = cadete

    method categoría(_categoría)
    {
        categoría = _categoría
    }

    method faltas(_faltas)
    {
        faltas = _faltas
    }

    method sueldo(tipoResultados, tipoPresentismo) {
        return categoría.neto() + tipoResultados.bono(categoría)+ tipoPresentismo.bono(faltas, categoría)
    }
}

object cadete {
    var neto = 20000

    method neto() {
        return neto
    }

    method neto(_neto) {
        neto = _neto
    }
}

object gerente {
    var neto = 15000

    method neto() {
        return neto
    }

    method neto(_neto) {
        neto = _neto
    }
}

object bonoResultadosPorcentaje {
    method bono(categoría) {
        return categoría.neto() * 0.1
    }
}

object bonoResultadosFijo {
    method bono(categoría) {
        return 800
    }
}

object bonoPresentismoNormal {
    const ceroFaltas = 2000
    const unaFalta = 1000

    method bono(faltas, categoría) {
        if (faltas == 0) {
            return ceroFaltas
        } else if (faltas == 1) {
            return unaFalta
        } else {
            return 0
        }
    }
}

object bonoPresentismoAjuste {
    const ceroFaltas = 100

    method bono(faltas, categoría) {
        if (faltas == 0) {
            return ceroFaltas
        } else {
            return 0
        }
    }
}

object bonoPresentismoDemagógico {
    method bono(faltas, categoría) {
        if (categoría.neto() < 18000) {
            return 500
        } else {
            return 300
        }
    }
}

object bonoPresentismoNulo {
    method bono(faltas, categoría) {
        return 0
    }
}