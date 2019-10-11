class Partida {
    private var id:Int
    private var producto:Producto
    private var qty:Int

    var toString(){
        return "id: \(id) , Producto: [\(producto.toString)] , qty: \(qty)"
        
    }

    init(id:Int, producto:Producto, qty:Int){
        self.id = id
        self.producto = producto
        self.qty = qty
    }

}

