// Ensure they only have one instance.
/*
Here's an example of implementing a singleton in Swift:
class MessageManager {
    static let shared = MySingleton()

    private init() {
        // Private initializer to prevent external instantiation
    }

    func someMethod() {
        // Implementation of your singleton's methods
    }
}
*/

// Singletons should not be cloneable.
/*

 /// The Singleton class declaration.
 class MessageManager /*: NSCopying*/ {
     /// static constains - To access the singleton instance.
     static let shared = MessageManager()
     /// private initializer - To create the object.
     private init() { }

     /// - Note: Singletons should not be cloneable.
     func copy(with zone: NSZone? = nil) -> Any {
         return self
     }
 }

 // let object1 = MessageManager.shared
 // let object2 = MessageManager.shared.copy() as! MessageManager
 // print(ObjectIdentifier(object1))
 // print(ObjectIdentifier(object2))
 // print(object1 === object2)

 /// The Singleton class declaration.
 class MessageManager /*: NSCopying*/ {
     /// static constains - To access the singleton instance.
     static let shared = MessageManager()
     /// private initializer - To create the object.
     private init() { }

     /// - Note: Singletons should not be cloneable.
     func copy(with zone: NSZone? = nil) -> Any {
         return MessageManager()
     }
 }

 // let object1 = MessageManager.shared
 // let object2 = MessageManager.shared.copy() as! MessageManager
 // print(ObjectIdentifier(object1))
 // print(ObjectIdentifier(object2))
 // print(object1 === object2)
 */

/*
 /// Mocking
 protocol MessageServices {
     func getMessages() -> [String]
 }

 class MessageManager {
     /// static constains - To access the singleton instance.
     static let shared = MessageManager()
     /// Private initializer - To create the object.
     private init() { }
 }

 extension MessageManager: MessageServices {
     func getMessages() -> [String] {
         return ["Message1", "Message2", "Message3", "Message4"]
     }
 }
 */

/*
 /// Mocking
 protocol MessageServices {
     func getMessages() -> [String]
 }

 class MessageManager {
     /// static constains - To access the singleton instance.
     static let shared = MessageManager()
     /// Private initializer - To create the object.
     private init() { }
 }

 extension MessageManager: MessageServices {
     func getMessages() -> [String] {
         return ["Message1", "Message2", "Message3", "Message4"]
     }
 }
 */

/*
class MessageManager {
    /// static constains - To access the singleton instance.
    static let shared = MessageManager()
    /// Private initializer - To create the object.
    init() { }
}
*/

protocol MessageServices {
    func getMessages() -> [String]
}

class MessageManager {
    /// static constains - To access the singleton instance.
    static let shared = MessageManager()
    /// Private initializer - To create the object.
    private init() { }
}

extension MessageManager: MessageServices {
    func getMessages() -> [String] {
        return ["Message1", "Message2", "Message3", "Message4"]
    }
}


// Anti-patterns are common solutions to ineffective problems and cause more problems than they solve
/*
 Single-responsibility - Singletons also violate the single-responsibility principle because they are responsible for enforcing their own uniqueness along with performing their normal functions

 Global State - Singletons often represent global state, which can make it difficult to track dependencies and understand the flow of data in your code. Global state can lead to unexpected side effects and make your code harder to test and maintain.

 Tight Coupling - Singleton classes are tightly coupled to the rest of the codebase. Any object that relies on a singleton has a direct dependency on it, which can make the code less modular and harder to refactor.

 Difficult to Test - Singleton dependencies can make unit testing challenging. Since singletons are globally accessible, it can be difficult to isolate and test individual components in your codebase without introducing unwanted side effects.

 Thread Safety - Managing concurrent access and ensuring thread safety with singletons can be complex. If multiple threads try to access or modify the singleton simultaneously, it may lead to race conditions or other synchronization issues.

 Difficulty in Extension - Singletons are often difficult to extend or modify because they rely on a single instance. If you need to introduce different behavior or multiple instances in the future, it can be challenging to adapt a singleton to these changes.

 Dependency Injection - Singletons make it harder to use dependency injection effectively. Since they are globally accessible, it's challenging to replace the singleton instance with a mock or substitute during testing or for alternate implementations.

 Hidden Dependencies - Dependencies of a singleton are hidden, as they are typically accessed directly within the singleton class. This makes it harder to identify and manage the dependencies of the singleton.
 */
