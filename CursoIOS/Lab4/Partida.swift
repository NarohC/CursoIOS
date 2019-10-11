class Partida {
    private var id:Int
    private var product:Product
    private var qty:Int

    var toString(){
        return "id: \(id) , Product: [\(product.toString())] , qty: \(qty)"
        
    }

    init(id:Int, product:Product, qty:Int){
        self.id = id
        self.Product = product
        self.qty = qty
    }

}

