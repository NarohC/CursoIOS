class Maths {
	let a: Int!
	let b: Int!
	// ? is a optional 
	// private var result: Int? = nil, is the same as code below
	//private var result: Int?
	var result: Int? 
	init(a: Int,b: Int) {
		self.a = a
		self.b = b
	}

	func add() {
		result = a + b
	}
	
	func displayResult() {
		print("Result: " + String(describing: result!))
	 }
}
