@_spi(Internal) internal import MySwiftUICore
internal import Foundation

@objc(MySwiftUIGlue2) class MySwiftUIGlue2: CoreGlue2 {
    
}

@_cdecl("MySwiftUIGlue2Class")
package func MySwiftUIGlue2Class() -> AnyClass {
    return MySwiftUIGlue2.self
}
