internal import MySwiftUICore
internal import CoreGraphics

extension EnvironmentValues {
    var defaultPresentationSize: CGSize? {
        get {
            return self[EnvironmentValues.__Key_defaultPresentationSize.self]
        }
        set {
            self[EnvironmentValues.__Key_defaultPresentationSize.self] = newValue
        }
    }
    
    // TODO: Entry Macro
    fileprivate struct __Key_defaultPresentationSize : EnvironmentKey {
        static var defaultValue: CGSize? {
            return nil
        }
    }
}
