// Strategy is a behavioral design pattern that lets you define a family of algorithms, put each of them into a separate class, and make their objects interchangeable

// Problem - One day you decided to create a navigation app for casual travelers, A user should be able to enter an address and see the fastest route to thet destination desiplayed on the map. Use may like to traveled by car, walk and ship.

// Solution - The strategy pattern suggests that you take a class that does something specific in a lot of defferent ways and extract all of these algorithms into separate classes called strategies.


/// The strategy interface declares operations common to all
/// supported versions of some algorithm.
public protocol StrategicRouting {
    func route(source: String, destination: String)
}

/// Concrete strategies implement the algorithm while following
/// the base startegy interface.
public struct CarStrategy: StrategicRouting {
    public func route(source: String, destination: String) {
        print(source + " to " + destination + " via car")
    }
}

public struct WalkStrategy: StrategicRouting {
    public func route(source: String, destination: String) {
        print(source + " to " + destination + " via walk")
    }
}

public struct ShipStrategy: StrategicRouting {
    public func route(source: String, destination: String) {
        print(source + " to " + destination + " via ship")
    }
}

/// The `NavigationStrategy` defines the interface of interest to clients.
public struct NavigationStrategy {

    // The NavigationStrategy maintains a reference to one of the strategy
    // objects. The NavigationStrategy doesn't know the concrete class of a
    // strategy. It should work with all strategies via the
    // StrategicRouting interface.
    private var strategy: StrategicRouting?

    // Usually the NavigationStrategy accepts a strategy through the
    // constructor, and also provides a setter so that the
    // strategy can be switched at runtime.
    public mutating func set(strategy: StrategicRouting) {
        self.strategy = strategy
    }

    // The NavigationStrategy delegates some work to the strategy object
    // instead of implementing multiple versions of the
    // algorithm on its own.
    public func execute(source: String, destination: String) {
        strategy?.route(source: source, destination: destination)
    }
}

// The client code picks a concrete strategy and passes it to
// the context. The client should be aware of the differences
// between strategies in order to make the right choice.
var selectedRouteWay: String = "Car"

var navigationStrategy = NavigationStrategy()
if selectedRouteWay == "Car" {
    navigationStrategy.set(strategy: CarStrategy())
} else if selectedRouteWay == "Walk" {
    navigationStrategy.set(strategy: WalkStrategy())
} else {
    navigationStrategy.set(strategy: ShipStrategy())
}

navigationStrategy.execute(source: "Home", destination: "office")


// Applicability
/*
  Use the Strategy pattern when you want to use different variants of an algorithm within an object and be able to switch from one algorithm to another during runtime.

  The Strategy pattern lets you indirectly alter the object’s behavior at runtime by associating it with different sub-objects which can perform specific sub-tasks in different ways.
*/

/*
Use the Strategy when you have a lot of similar classes that only differ in the way they execute some behavior.

 The Strategy pattern lets you extract the varying behavior into a separate class hierarchy and combine the original classes into one, thereby reducing duplicate code.
*/

/*
 Use the pattern to isolate the business logic of a class from the implementation details of algorithms that may not be as important in the context of that logic.

 The Strategy pattern lets you isolate the code, internal data, and dependencies of various algorithms from the rest of the code. Various clients get a simple interface to execute the algorithms and switch them at runtime.
*/

/*
 Use the pattern when your class has a massive conditional statement that switches between different variants of the same algorithm.

 The Strategy pattern lets you do away with such a conditional by extracting all algorithms into separate classes, all of which implement the same interface. The original object delegates execution to one of these objects, instead of implementing all variants of the algorithm.
*/

/*
Pros
- You can swap algorithms used inside an object at runtime.
- You can isolate the implementation details of an algorithm from the code that uses it.
- You can replace inheritance with composition.
- Open/Closed Principle. You can introduce new strategies without having to change the context.
*/

/*
Cons
- If you only have a couple of algorithms and they rarely change, there’s no real reason to overcomplicate the program with new classes and interfaces that come along with the pattern.
- Clients must be aware of the differences between strategies to be able to select a proper one.
- A lot of modern programming languages have functional type support that lets you implement different versions of an algorithm inside a set of anonymous functions. Then you could use these functions exactly as you’d have used the strategy objects, but without bloating your code with extra classes and interfaces.
*/

