
// Abstract Factory

/*
 Provide an interface for creating families of related or dependent objects without specifying their concrete classes.
*/


protocol ThemeFactory {
    func createButton() -> Button
    func createLabel() -> Label
}

protocol Button {
    func style()
}

protocol Label {
    func style()
}

class LightThemeFactory: ThemeFactory {
    func createButton() -> Button {
        return LightButton()
    }

    func createLabel() -> Label {
        return LightLabel()
    }
}

class DarkThemeFactory: ThemeFactory {
    func createButton() -> Button {
        return DarkButton()
    }

    func createLabel() -> Label {
        return DarkLabel()
    }
}

class LightButton: Button {
    func style() {
        print("Applying light button style")
    }
}

class LightLabel: Label {
    func style() {
        print("Applying light label style")
    }
}

class DarkButton: Button {
    func style() {
        print("Applying dark button style")
    }
}

class DarkLabel: Label {
    func style() {
        print("Applying dark label style")
    }
}

class App {
    private var themeFactory: ThemeFactory

    init(themeFactory: ThemeFactory) {
        self.themeFactory = themeFactory
    }

    func applyTheme() {
        let button = themeFactory.createButton()
        let label = themeFactory.createLabel()

        button.style()
        label.style()
    }
}

let lightThemeFactory = LightThemeFactory()
let darkThemeFactory = DarkThemeFactory()

let appWithLightTheme = App(themeFactory: lightThemeFactory)
let appWithDarkTheme = App(themeFactory: darkThemeFactory)

appWithLightTheme.applyTheme()
appWithDarkTheme.applyTheme()
