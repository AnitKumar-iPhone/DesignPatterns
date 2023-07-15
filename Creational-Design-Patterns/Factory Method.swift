protocol Product {
    func getProduct()
}

class ConcreteProductA: Product {
    func getProduct() {
        print("Using ConcreteProductA")
    }
}

class ConcreteProductB: Product {
    func getProduct() {
        print("Using ConcreteProductB")
    }
}

class ProductFactory {
    func createProduct(type: String) -> Product? {
        switch type {
        case "TypeA":
            return ConcreteProductA()
        case "TypeB":
            return ConcreteProductB()
        default:
            return nil
        }
    }
}

let factory = ProductFactory()

if let productA: Product = factory.createProduct(type: "TypeA") {
    print(productA)
}

if let productB: Product = factory.createProduct(type: "TypeB") {
    print(productB)
}
