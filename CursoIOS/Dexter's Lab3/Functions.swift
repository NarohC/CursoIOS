var shopping = ["Milk","Eggs","Coffee"]
var costs = ["Milk":1,"Eggs":2,"Coffee":3]

func costOf(items:[String],costs:[String:Int]) -> Int {
    var cost = 0
    for item in items {
        if let cm = costs[item]{
            cost += cm
        }
    }
    return cost
}

//Invocar a la funcion
costOf(items:shopping, costs:costs)
var salida = costOf(items:shopping, costs:costs)
_ = costOf(items:shopping, costs:costs)

//con etiquetas
func costOf1(basket items:[String],prices costs:[String:Int]) -> Int {
    var cost = 0
    for item in items {
        if let cm = costs[item]{
            cost += cm
        }
    }
    return cost
}
//costOf1(shopping, costs)
costOf1(basket: shopping, prices: costs)

//ignorar etiquetas y nombre de argumento de funcion
func echoString(_ s:String, times:Int) -> String {
    var result = ""
    for _ in 1 ... times {
        
        result += s
    }
    return result
}

echoString("hi ", times:3)

func costOf2( items:[String], costs:[String:Int] = costs ) -> Int { //Se le agrega un valor por default
    var cost = 0
    for item in items {
        if let cm = costs[item]{
            cost += cm
        }
    }
    return cost
}

costOf2(items:shopping)

func costOf3( items:[String], _ costs:[String:Int] = costs ) -> Int { //Se le agrega un valor por default
    var cost = 0
    for item in items {
        if let cm = costs[item]{
            cost += cm
        }
    }
    return cost
}

costOf3(items:shopping)

func minmax(_ numbers:Int...) -> (Int,Int) {
    var min = Int.max
    var max = Int.min

    for number in numbers {
        if number < min {
            min = number
        }
        if number > max {
            max = number
        }        
    }
    return (min,max)
}

minmax(1,2,3,4,10,2)

struct MinMax { 
    var min:Int 
    var max:Int 
}

func minmax1(_ numbers:Int...) -> MinMax {
    var minmax = MinMax (min:Int.max, max:Int.min)

    for number in numbers {
        if number < minmax.min {
            minmax.min = number
        }
        if number > minmax.max {
            minmax.max = number
        }        
    }
    return minmax
}
 //sin inout da error porque son constantes
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let tmp = a
    a = b
    b = tmp   
}

var v1 = 3
var v2 = 107
swapTwoInts(&v1, &v2)
print("v1 ahora es \(v1) y v2 ahora es \(v2)")

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

var reversedNames = names.sorted(by: backward)

var reversedNames = names.sorted(by: { (s1:String ,  s2:String) -> Bool in return s1 > s2})

var reversedNames = names.sorted(by: {$0 > $1})