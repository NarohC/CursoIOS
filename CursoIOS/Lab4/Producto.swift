class Producto {
    private var id:Int
    private var name:String
    private var desc:String
    private var price:Double
    
    init(id:Int, name:String, desc:String, price:Double){
        
        self.id = id
        self.name = name
        self.desc = desc
        self.price = price

    }

    var toString() -> String{
        return "id: \(id) , name: \(name) , desc: \(desc) , price: \(price)"
        
    }
    
}