//: Playground - noun: a place where people can play

import DummyCFramework

typealias GEOSCallbackFunction = @convention(c) (UnsafeMutablePointer<CChar>) -> Void

let swiftCallback : GEOSCallbackFunction = { args in
    if let string = String.fromCString(args) {
        print("GEOSwift # " + string + ".")
    }
}

initCAPI(unsafeBitCast(swiftCallback, GEOSMessageHandler.self))
triggerCallback()