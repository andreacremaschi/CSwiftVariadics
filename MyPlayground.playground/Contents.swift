//: Playground - noun: a place where people can play

import DummyCFramework

typealias GEOSCallbackFunction = @convention(c) (UnsafeMutablePointer<CChar>) -> Void

let swiftCallback : GEOSCallbackFunction = { args in
    let firstArg = unsafeBitCast(args, UnsafeMutablePointer<CChar>.self)
    var argPointer = firstArg
    var args = [CVarArgType]()
    while (argPointer.memory != 0) {
        argPointer = unsafeBitCast(argPointer + Int(strlen(argPointer)) + 1, UnsafeMutablePointer<CChar>.self)
        args.append( argPointer )
    }
    let string = String(format: String.fromCString(firstArg)!, arguments: args)
    print("Message: " + string + ".")
}

initCAPI(unsafeBitCast(swiftCallback, GEOSMessageHandler.self))
triggerCallback()
