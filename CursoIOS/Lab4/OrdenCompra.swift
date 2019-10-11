class OrdenCompra {
    var id: Int
    var fechaOrden: Fecha
    var items: [Partida]
    let static iva = 0.16
    var

    init(id:Int, fechaOrden:Fecha){
        self.id = id
        self.fechaOrden = fechaOrden
    }

    func agregarPartidas(partida:Partida) {
        items.append(partida)
    }

    func calcularTotal() -> Double {
        var total = 0.0
        //var subTotal = 0.0
        var conIva = 0.0
        for item in items {
            conIva = item.producto.price * iva + item.producto.price
            //subTotal = conIva + item.producto.price
            total += conIva * item.qty
        }
    }
"\t"
    toString() -> String{
        var respuesta: String
        respuesta = "Orden Compra id: \(id)\nFechaOrden: \(fechaOrden.toString)\nItems:"
        for item in items {
            respuesta += "\t\(item.toString)\n"
        }
        return respuesta
    }
}

