//: Playground - noun: a place where people can play

import DummyCFramework

typealias GEOSCallbackFunction = @convention(c) (UnsafeMutablePointer<CChar>) -> Void

let swiftCallback : GEOSCallbackFunction = { args in
    let firstArg:UnsafeMutablePointer<CChar> = unsafeBitCast(args, UnsafeMutablePointer<CChar>.self)
    let secondArg:UnsafeMutablePointer<CChar> = unsafeBitCast(args + Int(strlen(firstArg)) + 1, UnsafeMutablePointer<CChar>.self)
    
    if let string1 = String.fromCString(firstArg),
        let string2 = String.fromCString(secondArg)
    {
        let string = String(format: string1, secondArg)
        print("GEOSwift # " + string + ".")
    }
}

initCAPI(unsafeBitCast(swiftCallback, GEOSMessageHandler.self))
triggerCallback()
