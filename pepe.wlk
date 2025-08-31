object pepe {
    var faltas = 0
    var categoría = neto.cadete()

    method categoría(_categoría)
    {
        categoría = _categoría
    }

    method faltas(_faltas)
    {
        faltas = _faltas
    }

    method sueldo(tipoResultados) {
        return neto.neto(categoría) + self.bonoResultados(tipoResultados) + self.bonoPresentismo()
    }

    method bonoResultados(tipo) {
        if (tipo == "porcentaje")
        {
            return neto.neto(categoría) * 0.1
        }
        else if (tipo == "fijo")
        {
            return 3000
        }
        else
        {
            return 0
        }
    }

    method bonoPresentismo() {
        return self.bonoPresentismoNormal() + self.bonoPresentismoAjuste() + self.bonoPresentismoDemagogico()
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
        if (neto.neto(categoría) < 18000) {
            return 500
        } else {
            return 300
        }
    }
}

object neto {

    method cadete() {
        return 20000
    }
    method gerente() {
        return 15000
    }

    method neto(categoría) {
        return categoría
    }
}