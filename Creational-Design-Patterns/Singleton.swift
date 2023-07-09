// Singleton Rules -
// 1. Ensure they only have one instance.
// 2. Singletons should not be cloneable.
// 3. Any Synchronized issue.
protocol MessageServices {
    func getMessages() -> [String]
}

/// The Singleton class declaration.
class MessageManager /*: NSCopying*/ {
    /// - Note: In swift, we don't need to write any extra code to deal with threading issue, like Synchronized in Java.
    /// static constains - To access the singleton instance.
    static let shared = MessageManager()
    /// private initializer - To create the object.
    private init() { }
    /// - Note: Singletons should not be cloneable.
    // func copy(with zone: NSZone? = nil) -> Any { return self }
    // func copy(with zone: NSZone? = nil) -> Any { return MessageManager() }
}

extension MessageManager: MessageServices {
    func getMessages() -> [String] {
        return ["Message1", "Message2", "Message3", "Message4"]
    }
}

// let object1 = MessageManager.shared
// let object2 = MessageManager.shared.copy() as! MessageManager
// print(ObjectIdentifier(object1))
// print(ObjectIdentifier(object2))
// print(object1 === object2)

/*
    Implementation with NSCopying

    ~~~
      func copy(with zone: NSZone? = nil) -> Any { return self }
    ~~~

    Output -
    ObjectIdentifier(0x0000600003bfc030)
    ObjectIdentifier(0x0000600003bfc030)
    true - As Memory adress are same

    ~~~
      func copy(with zone: NSZone? = nil) -> Any { return self }
    ~~~

    Output -
    ObjectIdentifier(0x00006000017d41a0)
    ObjectIdentifier(0x00006000017ec6e0)
    false - As Memory adress are diffrent
*/

// Problems - Singletons also violate the single-responsibility principle because they are responsible for enforcing their own uniqueness along with performing their normal functions
// Anti-patterns are common solutions to ineffective problems and cause more problems than they solve
