class Pizza {
    var crust: String = ""
    var sauce: String = ""
    var toppings: [String] = []

    func describe() {
        print("Pizza with \(crust) crust, \(sauce) sauce, and toppings: \(toppings.joined(separator: ", "))")
    }
}

protocol PizzaBuilder {
    func setCrust(_ crust: String)
    func setSauce(_ sauce: String)
    func addTopping(_ topping: String)
    func build() -> Pizza
}

class MargheritaPizzaBuilder: PizzaBuilder {
    private var pizza = Pizza()

    func setCrust(_ crust: String) {
        pizza.crust = crust
    }

    func setSauce(_ sauce: String) {
        pizza.sauce = sauce
    }

    func addTopping(_ topping: String) {
        pizza.toppings.append(topping)
    }

    func build() -> Pizza {
        return pizza
    }
}

class MeatLoversPizzaBuilder: PizzaBuilder {
    private var pizza = Pizza()

    func setCrust(_ crust: String) {
        pizza.crust = crust
    }

    func setSauce(_ sauce: String) {
        pizza.sauce = sauce
    }

    func addTopping(_ topping: String) {
        pizza.toppings.append(topping)
    }

    func build() -> Pizza {
        return pizza
    }
}

class PizzaDirector {
    private var builder: PizzaBuilder

    init(builder: PizzaBuilder) {
        self.builder = builder
    }

    func constructPizza() -> Pizza {
        builder.setCrust("Thin")
        builder.setSauce("Tomato")
        builder.addTopping("Cheese")
        builder.addTopping("Basil")
        return builder.build()
    }
}

let margheritaBuilder = MargheritaPizzaBuilder()
let meatLoversBuilder = MeatLoversPizzaBuilder()

let margheritaPizza = margheritaBuilder.build()
let meatLoversPizza = meatLoversBuilder.build()

margheritaPizza.describe()
meatLoversPizza.describe()

// Using a director
let pizzaDirector = PizzaDirector(builder: margheritaBuilder)
let customPizza = pizzaDirector.constructPizza()
customPizza.describe()
