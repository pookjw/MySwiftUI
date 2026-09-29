// E14CA9E2450D1DFE1A85139B1E8B1844
package import CoreGraphics

struct SeparatedOptionValues {
    private(set) var storage: [SeparatedOptionValues.Key: any AnySeparatedOption] = [:]
}

extension SeparatedOptionValues {
    struct Key : Hashable {
        private(set) var type: any AnySeparatedOptionKey.Type
        
        func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
        
        static func == (lhs: SeparatedOptionValues.Key, rhs: SeparatedOptionValues.Key) -> Bool {
            assertUnimplemented()
        }
    }
}

package protocol AnySeparatedOptionKey {
    static var keyPath: String { get }
    static var requiresSeparation: Bool { get }
    static var isRequiredEffect: Bool { get }
}

package protocol SeparatedOptionKey : AnySeparatedOptionKey, LayerProperty {
}

extension SeparatedOptionKey {
    package static var keyPathPrefix: String {
        return "separatedOptions."
    }
    
    package static var requiresSeparation: Bool {
        return false
    }
    
    package static var isRequiredEffect: Bool {
        return false
    }
}

protocol AnySeparatedOption {
    var key: any AnySeparatedOptionKey.Type { get }
    var keyPath: String { get }
    var requiresSeparation: Bool { get }
    var boxedValue: NSObject { get }
}

extension AnySeparatedOption {
    fileprivate func print(into printer: inout SExpPrinter) {
        assertUnimplemented()
    }
}

package enum SeparatedOptions {
    package enum SeparatedThickness : SeparatedOptionKey {
        package static var keyPath: String {
            return "separatedThickness"
        }
        
        package typealias Value = CGFloat
    }
    
    // TODO
}
