class Fecha {
    private var dia: Int
    private var mes: Int
    private var anio: Int

    init( dia:Int, mes:Int, anio:Int){
        self.dia = dia
        self.mes = mes
        self.anio = anio
    }

    var toString() -> String{
        return "\(dia)/ \(mes)/\(anio)"
        
    }

    func bisiesto() -> Bool {
        var respuesta = false
        if anio % 4 == 0 && anio % 100 != 0 || anio % 400 == 0{
            respuesta = true
        }
        return respuesta
    }

    func calcUltimoDiaMes() -> Int {
        var diasMes = 31
        switch mes {
        case 4,6,9,11:
            diasMes = 30
        case 2:
            if bisiesto(){
                diasMes = 29
            }else {
                diasMes = 28
            }
        default:
            break
        }
        
        return diasMes
    }

    func agregarDias( _ dias:Int) -> Fecha {
        let diasMes = calcUltimoDiaMes()
        let diaEntrega = dia + dias
        var fechaEntrega: Fecha
        if diaEntrega > diasMes && mes != 12 {
            fechaEntrega = Fecha(dia: diaEntrega - diasMes, mes: mes + 1, anio:anio ) 
        } else if diaEntrega > diasMes && mes == 12 {
            fechaEntrega = Fecha(dia:diaEntrega - diasMes, mes:1, anio:anio + 1) 
        }else {
            fechaEntrega = Fecha(dia:diaEntrega, mes:mes, anio:anio) 
        }

        return fechaEntrega
    }
}

var f = Fecha(dia:30,mes:12,anio:1996)