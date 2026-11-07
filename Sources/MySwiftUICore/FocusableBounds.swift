package import CoreGraphics

package struct FocusableBounds {
    private var bounds: CGRect
    private var isLazyContainer: Bool
    
    package init(bounds: CGRect, isLazyContainer: Bool) {
        self.bounds = bounds
        self.isLazyContainer = isLazyContainer
    }
}

extension FocusableBounds {
    package struct Key : PreferenceKey {
        package static let defaultValue: [FocusableBounds] = []
        
        package static func reduce(value: inout [FocusableBounds], nextValue: () -> [FocusableBounds]) {
            assertUnimplemented()
        }
    }
}
