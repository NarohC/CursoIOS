struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

//GET
let someResolution = Resolution()
let someVideoMode = VideoMode()
print("The width of someResolution is \(someResolution.width)")
print("The width of someVideoMode is \(someVideoMode.resolution.width)")

//SET
someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")

// An structure has an automatic initializer
let vga = Resolution(width: 640, height: 480)
print("The width of someResolution is \(vga.width)")

// Struct are value types
var cinema=vga
cinema.height
cinema.height=640
cinema.height  // 640
vga.height     // 480


// Classes are reference types
let hd = Resolution(width: 1920, height: 1080)
let tenEighty = VideoMode()  //instance of a class
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0
tenEighty

let alsoTenEighty = tenEighty     // Its a reference
alsoTenEighty.frameRate = 30.0

tenEighty           // The same object is modified
alsoTenEighty


// Check if two constants are associated with the same instance
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}

// Error, only apply to classes
//if cinema === vga {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
//}
    // error: binary operator '===' cannot be applied to two 'Resolution' operands


let anotherTenEighty = VideoMode() // A new object

if tenEighty === anotherTenEighty {  // False
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}

// Lazy properties
class DataImporter {
    /*
    DataImporter is a class to import data from an external file.
    The class is assumed to take a non-trivial amount of time to initialize.
    */
    var fileName = "data.txt"
    // the DataImporter class would provide data importing functionality here
}
class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
    // the DataManager class would provide data management functionality here
}

let manager = DataManager()
/*
  manager: DataManager = {
  importer.storage = nil
  data = 0 values
}
*/
manager.data.append("Some data")
manager.data.append("Some more data")
manager
// the DataImporter instance for the importer property has not yet been created
/*
   $R7: DataManager = {
  importer.storage = nil
  data = 2 values {
    [0] = "Some data"
    [1] = "Some more data"
  }
}
*/		
print(manager.importer.fileName)
    // data.txt
manager
/*
   $R8: DataManager = {
  importer.storage = (fileName = "data.txt") {
    fileName = "data.txt"
  }
  data = 2 values {
    [0] = "Some data"
    [1] = "Some more data"
  }
}

*/

// Computed properties

class Rectangle {
    var width = 0.0
    var height = 0.0

    var area:Double {
        get { return width * height}
        set {
            self.width = newValue.squareRoot()
            self.height = newValue.squareRoot()
        }
    }
}

var rectangle = Rectangle()
rectangle.area // 0
rectangle.area = 120 // call the set
rectangle.height // $R0: Double = 10.954451150103322
rectangle.width // $R1: Double = 10.954451150103322
rectangle.area // $R2: Double = 120

// Computed property read only
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}

let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)") //40




// Property observer
class StepCounter {
    // The observers are inside var body
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {  // Just before the value is stored
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}

let stepCounter = StepCounter()
/*
   stepCounter: StepCounter = {
   totalSteps = 0
}

*/
stepCounter.totalSteps = 200
// About to set totalSteps to 200
// Added 200 steps
stepCounter.totalSteps = 360
// About to set totalSteps to 360
// Added 160 steps
stepCounter.totalSteps = 896
// About to set totalSteps to 896
// Added 536 steps
stepCounter.totalSteps = 5
// About to set totalSteps to 5
stepCounter 
/*
$R3: StepCounter = {
  totalSteps = 5
}
*/


// Type property

struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 1
    }
}

enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 6
    }
}

class SomeClass {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

print(SomeStructure.storedTypeProperty) // prints "Some value."
SomeStructure.storedTypeProperty = "Another value."
print(SomeStructure.storedTypeProperty) // prints "Another value."
print(SomeEnumeration.computedTypeProperty) // prints "6"
print(SomeClass.computedTypeProperty) // prints "27"


// Instance methods
class Counter {
    var count = 0
    func increment() {
        //++count
        count+=1
    }
    func incrementBy(amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}

let counter = Counter()
counter.increment()

class Counter {
    var count: Int = 0
    func incrementBy(amount: Int, numberOfTimes: Int) {
        count += amount * numberOfTimes
    }
}

let counter = Counter()
counter.incrementBy(amount:5, numberOfTimes: 3)

/*
$R4: Counter = {
  count = 15
}
*/

// Type method is the same as class methods in Java
class Budget {
    class func budgetTypeMethod(){
        print("Budget info to be delivered")
    }
}

class InheritedBudget: Budget {
    override class func budgetTypeMethod() {
        print("Printing something else")
    }
}

InheritedBudget.budgetTypeMethod() // Printing something else


// Subscipts
struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")


// Herencia

// Swift3: open class Vehicle 
// Tomar todo el codigo, tanto la padre como la hija
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // do nothing - an arbitrary vehicle doesn't necessarily make a noise
    }
}

class Bicycle:Vehicle {
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.description)")

// Override method
open class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // do nothing - an arbitrary vehicle doesn't necessarily make a noise
    }
}

class Bicycle:Vehicle {
    var hasBasket = false
}

class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}

let train = Train()
train.makeNoise() // prints "Choo Choo"


// Override properties
open class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // do nothing - an arbitrary vehicle doesn't necessarily make a noise
    }
}
class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}

let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")
// Car: traveling at 25.0 miles per hour in gear 3

// Override property observers
open class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // do nothing - an arbitrary vehicle doesn't necessarily make a noise
    }
}
class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10.0) + 1
        }
    }
}

let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.description)")
// AutomaticCar: traveling at 35.0 miles per hour in gear 4
print("AutomaticCar: \(automatic.gear)") // AutomaticCar: 4

// Initializer
struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}

var f = Fahrenheit()
print("The default temperature is \(f.temperature)° Fahrenheit")

// Initializer with parameters
struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}

let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
// boilingPointOfWater.temperatureInCelsius is 100.0
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
// freezingPointOfWater.temperatureInCelsius is 0.0


