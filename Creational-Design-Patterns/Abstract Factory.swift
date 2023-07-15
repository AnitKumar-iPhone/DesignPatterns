protocol Product {
    func getProduct()
}

class ConcreteProductA1: Product {
    func getProduct() {
        print("Using ConcreteProductA1")
    }
}

class ConcreteProductB1: Product {
    func getProduct() {
        print("Using ConcreteProductB1")
    }
}

class ConcreteProductA2: Product {
    func getProduct() {
        print("Using ConcreteProductA2")
    }
}

class ConcreteProductB2: Product {
    func getProduct() {
        print("Using ConcreteProductB2")
    }
}

protocol AbstractFactory {
    static func createProduct(type: String) -> Product?
}

class ProductFactory1: AbstractFactory {
    static func createProduct(type: String) -> Product? {
        switch type {
        case "TypeA":
            return ConcreteProductA1()
        case "TypeB":
            return ConcreteProductB1()
        default:
            return nil
        }
    }
}

class ProductFactory2: AbstractFactory {
    static func createProduct(type: String) -> Product? {
        switch type {
        case "TypeA":
            return ConcreteProductA2()
        case "TypeB":
            return ConcreteProductB2()
        default:
            return nil
        }
    }
}

var factory: AbstractFactory.Type = ProductFactory1.self
if let productA: Product = factory.createProduct(type: "TypeA") {
    print(productA)
}

factory = ProductFactory2.self
if let productB: Product = factory.createProduct(type: "TypeA") {
    print(productB)
}
