import wollok.vm.*
object pepe {
    var faltas = 0
    var categoría = cadete
    var sueldo = 0

    method categoría(_categoría)
    {
        categoría = _categoría
    }

    method faltas(_faltas)
    {
        faltas = _faltas
    }

    method sueldo(tipoResultados, tipoPresentismo) {
        sueldo = categoría.neto() + self.bonoResultados(tipoResultados) + self.bonoPresentismo(tipoPresentismo)
        return sueldo
    }

    method bonoResultados(tipo) {
        if (tipo == "porcentaje")
        {
            return categoría.neto() * 0.1
        }
        else if (tipo == "fijo")
        {
            return 800
        }
        else
        {
            return 0
        }
    }

    method bonoPresentismo(_tipo) {
        if (_tipo == "normal")
        {
            return self.bonoPresentismoNormal()
        } else if (_tipo == "ajuste") {
            return self.bonoPresentismoAjuste()
        } else if (_tipo == "demagógico") {
            return self.bonoPresentismoDemagogico()
        } else {
            return 0
        }
    }

    method bonoPresentismoNormal() {
        if (faltas == 0) {
            return 2000
        } else if (faltas == 1) {
            return 1000
        } else {
            return 0
        }
    }

    method bonoPresentismoAjuste() {
        if (faltas == 0) {
            return 100
        } else {
            return 0
        }
    }

    method bonoPresentismoDemagogico() {
        if (categoría.neto() < 18000) {
            return 500
        } else {
            return 300
        }
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