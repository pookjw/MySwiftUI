internal import Foundation
private import MySwiftUICore

@objc(MSUI_UICoreHostingViewForUIKitTester)
final class UICoreHostingViewForUIKitTester : NSObject {
    @objc static func make() -> UICoreHostingViewForUIKitTester {
        assertUnimplemented()
    }
    
    override init() {
        super.init()
    }
}
