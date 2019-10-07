// variables y constantes
"Hola " + "Mundo"
var currentLoginAttempts = 10
let maximumNumberOfLogins = 28
var x = 0.0, y=0.0, z=0.0
var w = 123_456 //Caracter de agrupamiento
var welcomeMessage: String = "Hola"
var x = "X" //redefinir
//Conversiones
let etiqueta = "Ancho: "
let ancho = 32
let etiquetaAncho = etiqueta + ancho //error de conversiones
let etiquetaAncho = etiqueta + String(ancho)
print(etiquetaAncho)
//Constante no puede modificarse
let etiquetaAncho = "Swift" //error es inmutable
//Conversiones
let minValue = UInt8.minValue
let maxValue = UInt8.maxValue
let tooBig:Int8.max + 1 //overflow
let cannotBeNegative: UInt8 = -1 //negative not valid
let twoThousand: UInt16 = 2_000
let pi = 3.1416
let integerPi = Int(pi) // Truncate

typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min
//Interpolar cadenas
let languageName = "Swift"
print("El lenguaje que se esta usando es \(languageName)")
var name1 = "Bryan"
var name2 = "Rocha"
var line = "David"
print(name1,name2)
print(name1,name2, separator: ":", terminator: "\n")

//separar instrucciones en la misma linea ;
let cat = "Felix"; print(cat)

//literales numericas
0b1111 //binario
0o123 //octal
0123 //decimal
0x11 //Hexadecimal

//Tuplas
let http404error = (404, "Error Not Found")
let z = (404, "Not Found", "Found")

//Trasladar los valores de una tupla a variabes/constantes
let(statusCode, statusMessage) = http404error
print("El codigo de status es \(statusCode)")
print("El codigo de status es \(http404error.0)")
let http200Status = (statusC: 0, descriptionC: "OK")
print("El codigo de status es: \(http200Status.statusC)")
let (statusCode,_) = http404error

// Coleciones
  //Array
var shopping = ["Milk","Eggs","Coffee"]
  //Dictionary
var costs = ["Milk":1,"Eggs":2,"Coffee":3]
  //Leer datos
shopping[0]
costs["Milk"]
shopping += ["Smithy"]
  //Otras fromas de crear arreglos vacios
var arregloVacio = [String]()
var diccionarioVacio = [String:Float]()
let emptyDic:Dictionary<Int,String> = [:]
let threeDoubles = Array(repeating: 0.0, count:3)//arreglo que guarda 0 3 veces

arregloVacio.append("Hola")
arregloVacio += ["Bye"]
arregloVacio

diccionarioVacio["Dic1"] = 23.45
diccionarioVacio
diccionarioVacio["Ene1"] = 233.45
diccionarioVacio
diccionarioVacio["Ene1"] = 233.45

 //Iterar
for (code,name) in diccionarioVacio{
    print("\(code) : \(name)")
}

 //Checar si arreglo esta vacio
if arregloVacio.isEmpty {
    print("arreglo vacio")
}else {
    print("arreglo tiene datos")
}






