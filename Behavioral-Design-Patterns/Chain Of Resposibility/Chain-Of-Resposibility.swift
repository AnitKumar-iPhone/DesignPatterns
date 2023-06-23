// Idea - Chain of Responsibility will let you pass requests through a chain of handlers. The handler decides whether to process the request or send it to the next handler.

public protocol Handler {
    var handler: Handler? { get set}
    mutating func setNext(handle: Handler)
    func execute(request: Int)
}

public struct ValidationHandler: Handler {
    public var handler: Handler?

    public mutating func setNext(handle: Handler) {
        handler = handle
    }

    public func execute(request: Int) {
        guard request != 0 else {
            print("Value should be greater than zero")
            return
        }

        handler?.execute(request: request)
    }
}

public struct Computer1: Handler {
    public var handler: Handler?

    public mutating func setNext(handle: Handler) {
        handler = handle
    }

    public func execute(request: Int) {
        guard request > 10 else {
            print("Able to handle all requests - Computer1")
            return
        }

        handler?.execute(request: request - 10)
    }
}

public struct Computer2: Handler {
    public var handler: Handler?

    public mutating func setNext(handle: Handler) {
        handler = handle
    }

    public func execute(request: Int) {
        guard request > 10 else {
            print("Able to handle all requests - Computer2")
            return
        }

        handler?.execute(request: request - 10)
    }
}

public struct Computer3: Handler {
    public var handler: Handler?

    public mutating func setNext(handle: Handler) {
        handler = handle
    }

    public func execute(request: Int) {
        guard request > 10 else {
            print("Able to handle all requests - Computer3")
            return
        }

        handler?.execute(request: request - 10)
    }
}

var computer3 = Computer3()
var computer2 = Computer2()
computer2.setNext(handle: computer3)

var computer1 = Computer1()
computer1.setNext(handle: computer2)

var validationHandler = ValidationHandler()
validationHandler.setNext(handle: computer1)

validationHandler.execute(request: 15)
