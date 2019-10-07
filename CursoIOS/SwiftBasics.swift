xcrun swift
// *************** Variables and constants ***************
// El compilador infiere el tipo de dato
"Hola " + "Mundo"
   $R0: String = "Hola Mundo"
20+5
   $R1: Int = 25
$r1
   repl.swift:3:1: error: use of unresolved identifier '$r1'
$R1
   $R2: Int = 25

// Constantes con let
let maximumNumberOfLoginAttempts = 10
    //maximumNumberOfLoginAttempts: Int = 10
// Variables con var
var currentLoginAttempt = 0
    //currentLoginAttempt: Int = 0
var x = 0.0, y = 0.0, z = 0.0
   //x: Double = 0
   //y: Double = 0
   //z: Double = 0

// Se puede usar como separador __
var w = 123_456.12
   //w: Double = 123456.12

// *************** Variables and constants with data types ***************
// Se puede especificar el tipo de dato con :
var welcomeMessage: String = "Hola"
   //welcomeMessage: String = "Hola"

// Una variable puede tener otro tipo de dato
// x es Double
x = "X"
   repl.swift:8:3: error: cannot assign a value of type 'String' to a value of type 'Double'
// Se redefine x
var x = "X"
    //x: String = "X"

// *************** Conversions ***************
// No existen conversiones automaticas
let etiqueta = "Ancho: "
let ancho = 32
let etiquetaAncho = etiqueta+ancho
    //repl.swift:3:19: error: binary operator '+' cannot be applied to operands 
    //of type 'String' and 'Int'

let etiquetaAncho = etiqueta+String(ancho)

// Una constante no se puede modificar

let languageName = "Swift" 
languageName = "Swift++" 
    //repl.swift:10:14: error: cannot assign to 'let' value 'languageName'
    //languageName = "Swift++"

// *************** String interpolation ***************
// Imprimir
print(languageName)
// Swift uses string interpolation to include the name of a constant or variable 
// as a placeholder in a longer string
print("The current value of language is \(languageName)")

// SWIFT 2
// In the new swift 2, the println has been renamed to print
// The separator parameter defines a string that is used to separate the values of the variables/constant in the print() function. By default, the print() function separates each variable/constant with a space
// The terminator parameter defines what character is put at the end of the line. By default, the newline character is added at the end of the line

var name1 = "Javier"
var name2 = "Pedro"
var name3 = "Sandra"
var line = ""

// Default separator is " ", default terminator is end of line
print(name1,name2)
print(name1,name2,separator: ",",terminator: "\n")


// Multiple staments, separate with ;

let cat="Felix";print(cat)

// *************** Literals ***************

// Las literales con punto son por default double
3.141516
   //$R3: Double = 3.1415160000000002
Float(34_123.12)
   //$R9: Float = 34123.1211
1e-2
   //$R10: Double = 0.01
0x1p-1 // 2 elevado a la -1
   //$R11: Double = 0.5

let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0 //(12x16^0 + 3x16^-1) * 2^0

// Las literales sin punto son por default int
1
   //$R4: Int = 1
 
// Otras literales
0b1111  //binary
0o123   //octal
0123    //int
0x11    //hexadecimal

let minValue = UInt8.min
let maxValue = UInt8.max
let cannotBeNegative: UInt8 = -1
      //repl.swift:26:31: error: integer literal overflows when stored into 'UInt8'
// integer overflow
let tooBig:Int8 = Int8.max + 1
    //repl.swift:26:28: error: arithmetic operation '127 + 1' (on type 'Int8') 
    // results in an overflow

let twoThousand:UInt16 = 2_000

// floating are truncated when initialized with an integer
let pi=3.1416
let integerPi = Int(pi)
   //pi: Double = 3.1415999999999999
   //integerPi: Int = 3

// *************** Type alias ***************
typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min
    //maxAmplitudeFound: UInt16 = 0

// If you want an identifier as a reserved word, use `

class `func` {
    func `if`() {
        let `class` = 1
    }
}

// *************** Tuples ***************
// Can store any kind of value
let http404Error = (404, "Not Found")
    // This is the result:
    //http404Error: (Int, String) = {
    //      0 = 404
    //      1 = "Not Found"
    //}

let z=(404,"Not Found","Found")
    //z: (Int, String, String) = {
    //      0 = 404
    //      1 = "Not Found"
    //      2 = "Found"
    //}

// Obtener los valores de la tupla

let (statusCode, statusMessage) = http404Error
     //statusCode: Int = 404
     //statusMessage: String = "Not Found”

print("The status message is \(statusMessage)")
print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")

// Se pueden nombrar los elementos de la tupla
let http200Status = (statusCode: 200, description: "OK")
    //http200Status: (statusCode: Int, description: String) = {
    //    statusCode = 200
    //    description = "OK"
    //}

print("The status code is \(http200Status.statusCode)")

// Si solamente algunos valores de la tupla e ignorar los otros usar _
   let(soloUnValor,_)=http404Error
   print(soloUnValor) //404

// *************** Collections ***************
// *************** Arrays and dictionaries ***************
// Las posiciones inician en 0
// Array
var shopping2 = [ "Milk", "Eggs", "Coffee", ] 
    //shopping2: [String] = 3 values {
    //   [0] = "Milk"
    //   [1] = "Eggs"
    //   [2] = "Coffee"
    //}

// Dictionaries, order in the keys is not guarranteed
// Note a [N], This N value is not the same for each declaration of costs
var costs = [ "Milk":1, "Eggs":2, "Coffee":3, ]
    /* costs: [String : Int] = 3 key/value pairs {
        [0] = {
            key = "Eggs"
            value = 2
        }
       [1] = {
            key = "Coffee"
            value = 3
        }
       [2] = {
            key = "Milk"
            value = 1
       }
    }
    */

// Para recuperar el valor, usar la sintaxis subscript, pasando el indice o
// el valor que requerimos recuperar
shopping2[0]
   //$R12: String = "Milk"
costs["Milk"]   // Observar que el tipo de dato es Int?, es un optional
   //$R13: Int? = 1

shopping2+=["Tea"]
shopping2
/*
    $R14: [String] = 4 values {
        [0] = "Milk"
        [1] = "Eggs"
        [2] = "Coffee"
        [3] = "Tea"
    }
*/
// *************** Empty Arrays and dictionaries ***************
// Otra forma de crear arreglos y diccionarios
var arregloVacio=[String]()
var diccionarioVacio=[String:Float]()
let emptyDic:Dictionary<Int, String> = [:]
var threeDoubles = Array(repeating: 0.0,count: 3)
    /*
    threeDoubles: [Double] = 3 values {
        [0] = 0
        [1] = 0
        [2] = 0
    }
    */

arregloVacio.append("Hola")
arregloVacio+=["Bye"]
arregloVacio
diccionarioVacio["Dic1"]=23.45
diccionarioVacio // Does not display the value in dictionary
diccionarioVacio["Dic1"]
    $R21: Float? = 23.45
diccionarioVacio["Ene1"]=13.45
diccionarioVacio // Does not display the value in dictionary
/*
    $R22: [String : Float] = 2 key/value pairs {
  [0] = {
    key = "Dic1"
    value = 0
  }
  [1] = {
    key = "Ene1"
    value = 0
  }
}
*/
diccionarioVacio["Ene1"]
    // $R23: Float? = 13.4499998
for (code, name) in diccionarioVacio {
    print("\(code): \(name)")
}
    /*
    Dic1: 23.45
    Ene1: 13.45  
    */
// *************** Arrays operations ***************
if arregloVacio.isEmpty {
    print("El arreglo esta vacio")
} else {
    print("El arreglo no esta vacio")
}
// Modificar un item del arreglo
arregloVacio
    /*
    $R20: [String] = 2 values {
    [0] = "Hola"
    [1] = "Bye"
    }
    */

arregloVacio[1] = "GoodBye"
arregloVacio[3] = "See you later" // Fatal error: Index out of range
arregloVacio.append("Bonjour")
    /*
    $R23: [String] = 3 values {
    [0] = "Hola"
    [1] = "GoodBye"
    [2] = "Bonjour"
    }
    */
arregloVacio.insert("Hasta la vista baby", at: 1)
    /*
    $R24: [String] = 4 values {
    [0] = "Hola"
    [1] = "Hasta la vista baby"
    [2] = "GoodBye"
    [3] = "Bonjour"
    }
    */
// Cambiar un rango de valores
arregloVacio[1...2] = ["N/A","Unknown"]
  /*
  $R25: [String] = 4 values {
  [0] = "Hola"
  [1] = "N/A"
  [2] = "Unknown"
  [3] = "Bonjour"
  }
  */

// Eliminar un elemento del arreglo, se actualizan los indices
arregloVacio.remove(at: 1)
    /*
    $R27: [String] = 3 values {
    [0] = "Hola"
    [1] = "Unknown"
    [2] = "Bonjour"
    }
    */

// Iterar sobre un arreglo
for it in arregloVacio {
    print(it)
}

for(index,value) in arregloVacio.enumerated() {
     print("Item \(index + 1): \(value)")
}

// *************** Sets ***************
// Create an empty set
var letters = Set<Character>()
    // letters: Set<Character> = {}
//letters.insert("abc") // Error we insert a String instead of Character
letters.insert("a")
  /*
  $R0: (inserted: Bool, memberAfterInsert: Character) = {
  inserted = true
  memberAfterInsert = {
    _representation = smallUTF16 {
      smallUTF16 = 97
    }
  }
  }
  */
letters
    /*
    $R1: Set<Character> = {
  [0] = {
    _representation = smallUTF16 {
      smallUTF16 = 97
    }
  }
}
    */
// Sets can be initialized with an Array
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
favoriteGenres.insert("NewAge")
favoriteGenres.insert("Rock") // It does not insert, already exists
favoriteGenres  // Displays unordened
  /*
  $R6: Set<String> = {
  [0] = "Rock"
  [1] = "Classical"
  [2] = "NewAge"
  [3] = "Hip hop"
}
 */
 print("Number of items in the set \(favoriteGenres.count)") //4
 print("Is set empty? \(favoriteGenres.isEmpty)") //false
 // Remove an item in the Set and return the item removed
let removedGenre = favoriteGenres.remove("Rock")
removedGenre
    // $R9: String? = "Rock"
favoriteGenres
    /*
    $R10: Set<String> = {
  [0] = "Classical"
  [1] = "NewAge"
  [2] = "Hip hop"
}
   */

// Order a Set
favoriteGenres.sorted()

print("Contains NewAge ? \(favoriteGenres.contains("NewAge"))") //true
// Iterate over a set
for genre in favoriteGenres {
    print("\(genre)")
}
// Access individual elements
favoriteGenres.first
    // $R12: String? = "Classical"
favoriteGenres.contains("Hip hop")
    // $R13: Bool = true

// Union
let a: Set = [1, 3, 5, 7, 9]
let b: Set = [0, 2, 4, 6, 8]
print(a.union(b)) //[6, 8, 9, 2, 4, 7, 5, 3, 0, 1]
// Intersection
let a: Set = [1, 3, 5, 7, 9]
let b: Set = [0, 3, 7, 6, 8]
print(a.intersection(b)) // [7, 3]
// Substracting
let a: Set = [1, 3, 5, 7, 9]
let b: Set = [0, 3, 7, 6, 8]
print(a.subtracting(b)) // [1, 5, 9]

// *************** More of Dictionaries ***************
var namesOfIntegers = [Int: String]()
namesOfIntegers[16] = "sixteen"
namesOfIntegers
    /*
    $R14: [Int : String] = 1 key/value pair {
    [0] = {
        key = 16
        value = "sixteen"
    }
    }
    */
// Return to an empty dictionary
namesOfIntegers = [:]
namesOfIntegers
    //$R15: [Int : String] = 0 key/value pairs
// Some operations and properties
var airports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
print("The airports dictionary contains \(airports.count) items.") // 2
print("The airports dictionary is empty ? \(airports.isEmpty)") // false
// Add a new item
airports["LHR"] = "London"
// Modify an item
airports["LHR"] = "London Heathrow"
// sets a value for a key if none exists, or updates the value if that key 
// already exists
// returns an optional value of the dictionary’s value type
// prints: The old value for DUB was Dublin.
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue).") // This is printed
}
airports
/*
    $R18: [String : String] = 3 key/value pairs {
  [0] = {
    key = "LHR"
    value = "London Heathrow"
  }
  [1] = {
    key = "YYZ"
    value = "Toronto Pearson"
  }
  [2] = {
    key = "DUB"
    value = "Dublin Airport"
  }
}
*/

// Remove a key/value pair
airports["APL"] = "Apple International"
airports["APL"] = "Apple International"
airports // The keys can not be duplicated, only one is inserted
airports["APL"] = nil
airports  // The key is removed if associted to a nil
// Iterating
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}

for airportName in airports.values {
    print("Airport name: \(airportName)")
}


// *************** Optionals ***************
// Optionals, se utilizan cuando el valor es ausente
let possibleNumber = "123"
       // possibleNumber: String = "123”
let convertedNumber = Int(possibleNumber)
       convertedNumber: Int? = 123  // Observar que el tipo de dato es optional

let possibleNumber1 = "123a"
       // possibleNumber1: String = "123a"
let convertedNumber1 = Int(possibleNumber1)
     convertedNumber1: Int? = nil  // Regresa nil

// Si es opcional el tipo de dato, acepta nil
// El nil en Swift no es igual al nil en ObjectiveC
// En Swift nil no es un apuntador, es una estructura
// En ObjectiveC nil es un apuntador a un objeto que no existe

// A constant initialized does not accept nil
let possibleNumber2=123
    // possibleNumber2: Int = 123
possibleNumber2=nil
    // repl.swift:51:16: error: cannot assign to 'let' value 'possibleNumber2'
    // possibleNumber2=nil

var surveyAnswer: String?
   // surveyAnswer: String? = nil

var possibleNumberX = "123"

if let actualNumber = Int(possibleNumberX) {
        print("\'\(possibleNumberX)\' has an integer value of \(actualNumber)")
    } else {
        print("\'\(possibleNumberX)\' could not be converted to an integer")
    }

print(actualNumber)    // Aqui ya no existe porque fue creada temporalmente
                       // en el bloque if
                       // error: use of unresolved identifier



// *************** Unpack ***************

var opt:Int? = 1
opt == nil
   // $R15: Bool = false
// unpack
opt!
   // $R16: Int = 1
opt+2
   // error: value of optional type 'Int?' not unwrapped;
// unpack
opt!+2
   // $R17: Int = 3
opt=nil
opt!
    // fatal error: unexpectedly found nil while unwrapping an Optional value
    // Execution interrupted.

// *************** Unwrap optional ***************
var opt1:Int! = 1
opt1 == nil
   // $R18: Bool = false
// unpack
opt1!
   // $R19: Int = 1
opt1+2               // No error, unwrap automatically
opt1=nil
opt1
   // $R21: Int! = nil // No marca fatal error

// *************** Optional binding ***************
// You use optional binding to find out whether an optional contains a value, 
// and if so, to make that value available as a temporary constant or variable.
// The if is false if the condition is nil

var myOptional:Int? = 1
//var myOptional:Int? = nil

if let temp = myOptional {
    print(temp)
    print("Can not use temp outside of the if bracket")
} else {
    print("myOptional was nil")
}

// Another example
var myOptional: String?

myOptional = "Jon"
print("Outside: \(myOptional)")      //Jon

if var myOptional = myOptional {
    myOptional = "test"
    print("Inside:  \(myOptional)")  //test - myoptional defined in if overrides
}                                    //the outer optional
print("Outside: \(myOptional)")      //Jon - myoptional defined in if is destroyed


// Nil coalescing operator

1 ?? 2   // Si no es nil, regresa el valor (izquierda de ??)
         //$R0: Int = 1
nil ?? 2 // Si es nil, regresa lo que hay a la derecha de ??
         //$R1: Int = 2

// var costs = [ "Milk":1, "Eggs":2, "Coffee":3, ]
costs["Eggs"] ?? 0
       // $R2: Int = 2    // Regresa el valor 2
costs["Sugar"] ?? 0       // Not exists, regresa valor 0
       // $R3: Int = 0

// *************** if ***************
var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
}

temperatureInFahrenheit = 40
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}

temperatureInFahrenheit = 90
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen.")
} else {
    print("It's not that cold. Wear a t-shirt.")
}

// *************** switch ***************
var pos = 21
switch pos {   
   case 1: print("First")
   case 2: print("Second")   
   case 3: print("Third")   
   case 4...20: print("\(pos)th")   
   case pos where (pos % 10) == 1: print("\(pos)st")   
   case let p where (p % 10) == 2: print("\(p)nd")   
   case let p where (p % 10) == 3: print("\(p)rd")   
   default: print("\(pos)th")
 }

    //21st
    //pos: Int = 21

// Probar el switch quitando el default
// error: switch must be exhaustive, consider adding a default clause

// Switch con tuplas
var somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("(0, 0) is at the origin")
case (_, 0):
    print("(\(somePoint.0), 0) is on the x-axis")
case (0, _):
    print("(0, \(somePoint.1)) is on the y-axis")
case (-2...2, -2...2):
    print("(\(somePoint.0), \(somePoint.1)) is inside the box")
default:
    print("(\(somePoint.0), \(somePoint.1)) is outside of the box")
}
// (1, 1) is inside the box
somePoint=(0,0) 
// Regresa (0, 0) is at the origin

// Value binding using switch
var anotherPoint = (2, 0)

switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}

// on the x-axis with an x value of 2
//x //error: unresolved identifier

// Switch and where
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some arbitrary point")
}
// (1, -1) is on the line x == -y

// Switch with multiples items with a single case
var char : Character = "e"
switch char {
 case "a", "e", "i", "o", "u":
    print("letter is a vowel")
 case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
      "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("letter is a consonant")
default:
    print("unknown letter")
}

// letter is a vowel

// *************** for ***************
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i])")
}
/*
    Person 1 is called Anna
    Person 2 is called Alex
    Person 3 is called Brian
    Person 4 is called Jack
*/

for name in names[2...] {
    print(name) // Brian Jack
}

for name in names[...2] {
    print(name) // Anna Alex", Brian"
} 

for i in 1...12 { 
   print("i is \(i)") 
} // Prints i is 1 until i is 12

for _ in 1...12 {
    print("Looping...")
} // Loop without control variable

for number in 1...30 {
    if number % 2 == 0 {
        print(number)
    }
}

for number in 1...30 where number % 2 == 0 {
    print(number)
} // Solo 15 ciclos


// An optional is an enumeration and includes .some and .none
let x: String? = "Hello Optional"
switch x {
  // value represents the value assigned to optional
  case .some(let value): print("Value: \(value)") // if not nil
  case .none: print("nothing stored inside the enum") // if nil
}
// Value: Hello Optional

// Array with nil values
let myNumbers: [Int?] = [1, 2, nil, 4, 5, nil, 6]

// Filter nil values, .some is called if value in a optional is not nil
for case let .some(num) in myNumbers {
    print(num) // 1 2 4 5 6
}

var shopping = [ "Milk", "Eggs", "Coffee", "Tea", ]
var costs = [ "Milk":1, "Eggs":2, "Coffee":3, "Tea":4,]
var cost = 0
for item in shopping {
    if let itemCost = costs[item] {
      cost += itemCost
    }
}

cost
  // $R0: Int = 10


Array(costs.keys)
Array(costs.values)
for item in costs.keys {
    print(item)
}

for (item,cost) in costs {
   print("The \(item) costs \(cost)")
}

// Not available since Swift 3
/*
var sum = 0
for var i=0; i<=10; ++i {
   sum += i
}
*/

// Since Swift3
// Returns a sequence from a starting value to, but not including, an end value,
// stepping by the specified amount.
var sum = 0
for i in stride(from:0, to:10,by:1) {
   sum += i
}

// *************** While ***************
var w = 0
while(w < 5){
  w+=1;
  print("Valor \(w)");
}

w = 0
repeat {
  w+=1;
  print(w);
} while (w < 5)


// *************** Range operators ***************
//... is a range
// ~= contains
4...10 ~= 4
   //$R2: Bool = true
4...10 ~= 21
   //$R3: Bool = false
4..<10 ~= 10
   //$R4: Bool = false

// *************** Character ***************
let unSoloChar: Character="a"
    // unSoloChar: Character = "a"
let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
let catString = String(catCharacters) // Convertir Character a String

let latinCapitalLetterA: Character = "\u{41}"
let cyrillicCapitalLetterA: Character = "\u{0410}" //Used in Rusia
// The characters are visually similar, but do not have the same linguistic meaning
if latinCapitalLetterA != cyrillicCapitalLetterA {
    print("These two characters are not equivalent")
}
   //These two characters are not equivalent

// *************** String operations ***************
var welcome="hello"
welcome.insert("!", at: welcome.endIndex) //hello!
// Insert at the end
// // hello there!
welcome.insert(contentsOf:" there".characters, at:welcome.index(before:welcome.endIndex)) 
welcome.remove(at: welcome.index(welcome.endIndex,offsetBy: -1)) //hello there
let range = welcome.index(welcome.endIndex,offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)
welcome // hello





// Fallthrough in switch
// When the selected case finds a fallthrough, process the next case
// without validating the condition. If there is no other fallthrougn
// process as normal (end the case and end the switch)

let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"

switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
//case 0:
//    description = "0"
default:
    description += " an integer."
}

description
    // $R3: String = "The number 5 is a prime number, and also an integer."

// Now remove the comments in the switch 
description
    // 0



// Un objeto en Swift puede ser extendido
//  In Swift, there are no scalars; all types are ultimately object types
// Int is a struct
// In Swift we have struct, enum, class

extension Int {
    func sayHello() {
        print("Hello, I'm \(self)")
    }
}
1.sayHello() // outputs: "Hello, I'm 1"

