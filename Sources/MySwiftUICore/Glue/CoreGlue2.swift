#warning("TODO")
public import Foundation
private import _MySwiftUIShims

@_spi(Internal)
@objc(MySwiftUICoreGlue2)
open class CoreGlue2: NSObject {
    static nonisolated(unsafe) var shared: CoreGlue2 = _initializeMyCoreGlue2() as! CoreGlue2
    
    open func configureEmptyEnvironment(_ environmentValues: inout EnvironmentValues) {
        fatalError() // abstract
    }
}
