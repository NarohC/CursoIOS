func bisiesto(_ anio:Int) -> Int {
    var respuesta = 28
    if anio % 4 == 0 && anio % 100 != 0 || anio % 400 == 0{
	    respuesta = 29
    }
    return respuesta
}

func diasMes(_ mes:Int) -> Int {
    let dicMes = [1:31,2:28,3:31,4:30,5:31,6:30,7:31,8:31,9:30,10:31,11:30,12:31]
    return dicMes[mes]!
}

func renta(_ dia:Int, _ mes:Int, _ anio:Int, diasRenta:Int = 15 ) -> String {
    var dias = diasMes(mes)
    var respuesta = " "
    let diaEntrega = dia + diasRenta - 1
    if diasRenta > 15 {
        respuesta = "Solo se puede rentar de 15 dias o menos"
        return respuesta
    }else if diasRenta <= 0 {
        respuesta = "Agregue por lo menos 1 dia"
        return respuesta
    }
    if mes == 2 {
        dias = bisiesto(anio)
    }
    if diaEntrega > dias && mes != 12 {
        respuesta = "Su dia de entrega es \(diaEntrega - dias)/\(mes + 1)/\(anio) "
    } else if diaEntrega > dias && mes == 12 {
        respuesta = "Su dia de entrega es \(diaEntrega - dias)/1/\(anio + 1) "
    }else {
        respuesta = "Su dia de entrega es \(diaEntrega)/\(mes)/\(anio) "
    }

    return respuesta
}

print(renta(30,12,1996, diasRenta:3))