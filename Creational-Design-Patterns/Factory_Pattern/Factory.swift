//
//  Factory.swift
//  Created by Anit Kumar on 17/08/24.
//

/*
 The Factory Method pattern is a creational pattern that provides an interface for creating objects in a superclass but allows subclasses to alter the type of objects that will be created.

 Use the Factory Method pattern when: Delegate the responsibility of creating a new instance of a class to a subclass.

 Note: This example uses classes to implement the Factory Method pattern, but it can also be achieved using protocols.
*/

// Base class for Graphical User Interface components.
class GUI { }

// Abstract class representing a text field in the GUI.
class TextField: GUI {
    // Method for inputting text into the text field.
    // Subclasses must override this method.
    func input(_ text: String) {
        fatalError("Subclasses must implement this method")
    }
}

// Abstract class representing a button in the GUI.
class Button: GUI {
    // Method to simulate the pressing of the button.
    // Subclasses must override this method.
    func press() {
        fatalError("Subclasses must implement this method")
    }
}

// Concrete class for a Mac-style button.
class MacButton: Button {
    // Overrides the press method to simulate pressing a Mac button.
    override func press() {
        print("MacButton pressed")
    }
}

// Concrete class for a Windows-style button.
class WindowButton: Button {
    // Overrides the press method to simulate pressing a Windows button.
    override func press() {
        print("WindowButton pressed")
    }
}

// Concrete class for a Mac-style text field.
class MacTextField: TextField {
    // Overrides the input method to simulate text input in a Mac text field.
    override func input(_ text: String) {
        print("MacTextField input \(text)")
    }
}

// Concrete class for a Windows-style text field.
class WindowTextField: TextField {
    // Overrides the input method to simulate text input in a Windows text field.
    override func input(_ text: String) {
        print("WindowTextField input \(text)")
    }
}

// Abstract factory class for creating GUI components.
class GUIFactory {
    // Method to create a text field. Subclasses must override this method.
    func createTextField() -> TextField {
        fatalError("Subclasses must implement this method")
    }
    
    // Method to create a button. Subclasses must override this method.
    func createButton() -> Button {
        fatalError("Subclasses must implement this method")
    }
}

// Concrete factory class for creating Windows-style GUI components.
class WindowFactory: GUIFactory {
    // Overrides the createTextField method to return a Windows-style text field.
    override func createTextField() -> TextField {
        return WindowTextField()
    }

    // Overrides the createButton method to return a Windows-style button.
    override func createButton() -> Button {
        return WindowButton()
    }
}

// Concrete factory class for creating Mac-style GUI components.
class MacFactory: GUIFactory {
    // Overrides the createTextField method to return a Mac-style text field.
    override func createTextField() -> TextField {
        return MacTextField()
    }

    // Overrides the createButton method to return a Mac-style button.
    override func createButton() -> Button {
        return MacButton()
    }
}

// Example of using the factory pattern to create GUI components.
var guiFactory: GUIFactory = MacFactory()

// Simulating configuration to use the appropriate factory.
let type = "WindowFactory"
if type == "WindowFactory" {
    guiFactory = WindowFactory()
}

// Create a button and a text field using the selected factory.
let button = guiFactory.createButton()
let textField = guiFactory.createTextField()

// Simulate interactions with the GUI components.
button.press()
textField.input("Hello, world!")
