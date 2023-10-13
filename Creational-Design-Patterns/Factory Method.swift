
// Factory Method

/*
Define an interface for creating an object, but let subclasses decide which class to instantiate. Factory Method lets a class defer instantiation to subclasses.
*/


// Base class for Graphical User Interface.
class GUI { }

class TextField: GUI {
    func input(_ text: String) {
        fatalError("Subclasses must implement this method")
    }
}

class Button: GUI {
    func press() {
        fatalError("Subclasses must implement this method")
    }
}


class MacButton: Button {
    func press() {
        print("MacButton pressed")
    }
}

class WindowButton: Button {
    func press() {
        print("WindowButton pressed")
    }
}


class MacTextField: TextField {
    func input(_ text: String) {
        print("MacTextField input \(text)")
    }
}

class WindowTextField: TextField {
    func input(_ text: String) {
        print("WindowTextField input \(text)")
    }
}

class GUIFactory {
    func createTextField() {
        fatalError("Subclasses must implement this method")
    }
    
    func createButton() {
        fatalError("Subclasses must implement this method")
    }
}

class WindowFactory: GUIFactory {
    func createTextField() -> TextField {
        return MacTextField()
    }

    func createButton() -> Button {
        return MacButton()
    }
}

class MacFactory: GUIFactory {
    func createTextField() -> TextField {
        return WindowTextField()
    }

    func createButton() -> Button {
        return WindowButton()
    }
}


var guiFactory: GUIFactory = MacFactory()

let type = "WindowFactory"
if type == "WindowFactory" {
    guiFactory = WindowFactory()
}

/*

// Create a registry that maps strings to factory objects
class GUIFactoryRegistry {
    private var factories: [String: GUIFactory] = [:]

    // Register a factory for a given string key
    func registerFactory(_ key: String, factory: GUIFactory) {
        factories[key] = factory
    }

    // Create a product based on the provided string key
    func factory(withKey key: String) -> GUIFactory? {
        guard let factory = factories[key] else { return nil }
        return factory
    }
}

let registry = GUIFactoryRegistry()
registry.registerFactory("WindowFactory", factory: WindowFactory())
registry.registerFactory("MacFactory", factory: MacFactory())

if let factory = registry.factory(withKey: "WindowFactory") {
    factory.createButton()
    factory.createTextField()
}

if let factory = registry.factory(withKey: "MacFactory") {
    factory.createButton()
    factory.createTextField()
}

*/


import Foundation

// Base class for documents
class Document {
    func createHeader() -> String {
        fatalError("Subclasses must implement createHeader()")
    }

    func createBody() -> String {
        fatalError("Subclasses must implement createBody()")
    }

    func createFooter() -> String {
        fatalError("Subclasses must implement createFooter()")
    }

    func printDocument() {
        let header = createHeader()
        let body = createBody()
        let footer = createFooter()
        print(header)
        print(body)
        print(footer)
    }
}

/*
// Concrete document types
class Resume: Document {
    override func createHeader() -> String {
        return "Resume Header"
    }

    override func createBody() -> String {
        return "Resume Body"
    }

    override func createFooter() -> String {
        return "Resume Footer"
    }
}

class CoverLetter: Document {
    override func createHeader() -> String {
        return "Cover Letter Header"
    }

    override func createBody() -> String {
        return "Cover Letter Body"
    }

    override func createFooter() -> String {
        return "Cover Letter Footer"
    }
}

// Client code
func createAndPrintDocument(documentType: Document.Type) {
    let document = documentType.init()
    document.printDocument()
}

// Usage
createAndPrintDocument(documentType: Resume.self)
createAndPrintDocument(documentType: CoverLetter.self)
*/
