protocol Prototype {
    func clone() -> Prototype
}

class ConcretePrototypeA: Prototype {
    var property: String

    init(property: String) {
        self.property = property
    }

    func clone() -> Prototype {
        return ConcretePrototypeA(property: property)
    }
}

class ConcretePrototypeB: Prototype {
    var anotherProperty: Int

    init(anotherProperty: Int) {
        self.anotherProperty = anotherProperty
    }

    func clone() -> Prototype {
        return ConcretePrototypeB(anotherProperty: anotherProperty)
    }
}

let prototypeA = ConcretePrototypeA(property: "Property Value A")
let clonedA = prototypeA.clone() as! ConcretePrototypeA

print(prototypeA.property)  // Output: Property Value A
print(clonedA.property)     // Output: Property Value A

let prototypeB = ConcretePrototypeB(anotherProperty: 42)
let clonedB = prototypeB.clone() as! ConcretePrototypeB

print(prototypeB.anotherProperty)  // Output: 42
print(clonedB.anotherProperty)    // Output: 42
