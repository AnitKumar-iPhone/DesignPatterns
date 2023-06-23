// Idea - Strategy will let you define a group of algorithms, put each of them into a separate class, and make their objects interchangeable.

public protocol StrategicRouting {
    func route(source: String, destination: String)
}

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

public struct NavigationStrategy {

    private var strategy: StrategicRouting?

    public mutating func set(strategy: StrategicRouting) {
        self.strategy = strategy
    }

    public func execute(source: String, destination: String) {
        strategy?.route(source: source, destination: destination)
    }
}

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
