#warning("TODO")

package struct GestureCategory: RawRepresentable {
    package static var drag: GestureCategory { return GestureCategory(rawValue: 1 << 2) }
    package static var select: GestureCategory { return GestureCategory(rawValue: 1 << 3) }
    package static var longPress: GestureCategory { return GestureCategory(rawValue: 1 << 4) }
    package static var windowDrag: GestureCategory { return GestureCategory(rawValue: 1 << 5) }
    
    package let rawValue: Int
    
    package init(rawValue: Int) {
        self.rawValue = rawValue
    }
}

extension GestureCategory {
    package static var defaultValue: GestureCategory { return GestureCategory(rawValue: 0) }
}

extension GestureCategory {
    package struct Key: PreferenceKey {
        package static var defaultValue: GestureCategory { return GestureCategory.defaultValue }
    }
}
