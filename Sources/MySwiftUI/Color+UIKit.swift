// 6DC24D5146AF4B80347A1025025F68EE
public import UIKit
public import MySwiftUICore
private import _MySwiftUIShims

@safe fileprivate nonisolated(unsafe) let dynamicColorCache = NSMapTable<ObjcColor, UIColor>.strongToWeakObjects()

@available(iOS, introduced: 13.0, deprecated: 100000.0, message: "Use Color(uiColor:) when converting a UIColor, or create a standard Color directly")
@available(macOS, unavailable)
@available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "Use Color(uiColor:) when converting a UIColor, or create a standard Color directly")
@available(watchOS, introduced: 6.0, deprecated: 100000.0, message: "Use Color(uiColor:) when converting a UIColor, or create a standard Color directly")
@available(visionOS, introduced: 1.0, deprecated: 100000.0, message: "Use Color(uiColor:) when converting a UIColor, or create a standard Color directly")
extension Color {
    @_disfavoredOverload public init(_ color: UIColor) {
        self.init(uiColor: color)
    }
}

@available(iOS 15.0, tvOS 15.0, watchOS 8.0, *)
@available(macOS, unavailable)
extension Color {
    public init(uiColor: UIColor) {
        self.init(_platformColor: uiColor, definition: UIKitPlatformColorDefinition.self)
    }
}

extension UIColor {
  @available(iOS 14.0, tvOS 14.0, watchOS 7.0, *)
  @available(macOS, unavailable)
    convenience public init(_ color: Color) {
        /*
         self -> x20 -> x21
         color -> x0 -> x19
         */
        // <+156>
        if let provider = color.provider.as(UIKitPlatformColorProvider.self) {
            self.init(color__swiftUI__: provider.platformColor)
            return
        }
        
        if let cgColor = color.cgColor {
            self.init(cgColor: cgColor)
            return
        }
        
        // <+404>
        let objcColor = ObjcColor(color)
        
        if let cached = dynamicColorCache.object(forKey: objcColor) {
            self.init(color__swiftUI__: cached)
            return
        }
        
        if let kitColor = color.provider.kitColor {
            self.init(color__swiftUI__: kitColor as! UIColor)
            dynamicColorCache.setObject(self, forKey: objcColor)
            return
        }
        
        self.init { traitCollection in
            // $sSo7UIColorC7SwiftUIEyAbC5ColorVcfcABSo17UITraitCollectionCcfU_TA
            /*
             traitCollection -> x0
             color -> x1
             */
            assertUnimplemented()
        }
        
        dynamicColorCache.setObject(self, forKey: objcColor)
    }
}
