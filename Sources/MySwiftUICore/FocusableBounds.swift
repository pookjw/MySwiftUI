private import CoreGraphics

package struct FocusableBounds: Sendable {
    private var bounds: CGRect
    private var isLazyContainer: Bool
    
    // TODO
}

extension FocusableBounds {
    package struct Key: PreferenceKey {
        package static let defaultValue: [FocusableBounds] = []
        
        package static func reduce(value: inout [FocusableBounds], nextValue: () -> [FocusableBounds]) {
            fatalError("TODO")
        }
    }
}
