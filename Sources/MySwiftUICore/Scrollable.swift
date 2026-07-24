// 425A368F5B4FB640C2ED9A96D72B5AF3
public import CoreGraphics
internal import AttributeGraph

struct ScrollablePreferenceKey : PreferenceKey {
    static var defaultValue: [any Scrollable] {
        return []
    }
    
    static func reduce(value: inout [any Scrollable], nextValue: () -> [any Scrollable]) {
        value.append(contentsOf: nextValue())
    }
}

protocol Scrollable {
    func scroll<T : Hashable>(to value: T) -> Bool
    func setContentTarget(_ block: (ScrollGeometry, LayoutDirection) -> ScrollTarget?) -> Bool
    var allowsContentOffsetAdjustments: Bool { get }
    func adjustContentOffset(by size: CGSize, reason: ContentOffsetAdjustmentReason) -> Bool
    func mapFirstChild<T, U>(ofType type: T.Type, body: (T) -> U) -> U?
}

extension Scrollable {
    func scrollToPosition(_ position: ScrollPosition) -> Bool {
        assertUnimplemented()
    }
}

protocol ScrollableCollection : Scrollable {
    var visibleCollectionViewIDs: [_ViewList_ID.Canonical] { get }
    func forEachVisibleSubview(_ block: (ScrollableCollectionSubview, inout Bool) -> Void)
    func subviewClosestTo(rect: CGRect) -> ScrollableCollectionSubview?
    func nextVisibleCollectionViewID(towards: UnitPoint, from viewID: _ViewList_ID.Canonical, border: CGSize, ignoring: PinnedScrollableViews) -> _ViewList_ID.Canonical?
    static func hasMultipleViewsInAxis(_ axis: Axis) -> Bool
    func firstCollectionViewIndex(of viewID: _ViewList_ID.Canonical) -> Int?
    func applyCollectionViewIDs(from index: inout Int, to block: (_ViewList_ID.Canonical, inout Bool) -> Void) -> Bool
    func collectionViewID(for subgraph: Subgraph) -> _ViewList_ID.Canonical?
    func scroll(toCollectionViewID: _ViewList_ID.Canonical, anchor: UnitPoint?) -> Bool
    static var accessibilityRole: AccessibilityLayoutRole? { get }
    var isLazy: Bool { get }
}

extension ScrollableCollection {
    static var accessibilityRole: AccessibilityLayoutRole? {
        return nil
    }
    
    var visibleCollectionViewIDs: [_ViewList_ID.Canonical] {
        return []
    }
    
    func siblingID(going: AccessibilityScrollableNavigationType, from viewID: _ViewList_ID.Canonical) -> _ViewList_ID.Canonical? {
        assertUnimplemented()
    }
}

protocol ScrollableContainer : Scrollable {
    var children: [any Scrollable]? { get }
    var parent: (any Scrollable)? { get }
    func makeTarget<T : Hashable>(for value: T) -> ((ScrollGeometry, LayoutDirection) -> ScrollTarget?)?
}

extension ScrollableContainer {
    func scroll<T : Hashable>(to value: T) -> Bool {
        assertUnimplemented()
    }
    
    func setParentTarget(_ block: (ScrollGeometry, LayoutDirection) -> ScrollTarget?) -> Bool {
        assertUnimplemented()
    }
    
    var allowsContentOffsetAdjustments: Bool {
        assertUnimplemented()
    }
    
    func setContentTarget(_ block: (ScrollGeometry, LayoutDirection) -> ScrollTarget?) -> Bool {
        assertUnimplemented()
    }
    
    func adjustContentOffset(by size: CGSize, reason: ContentOffsetAdjustmentReason) -> Bool {
        assertUnimplemented()
    }
    
    func mapFirstChild<T, U>(ofType type: T.Type, body: (T) -> U) -> U? {
        assertUnimplemented()
    }
    
    func siblingID(going: AccessibilityScrollableNavigationType, from viewID: _ViewList_ID.Canonical) -> _ViewList_ID.Canonical? {
        assertUnimplemented()
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
public struct ScrollTarget {
    public var rect: CGRect
    public var anchor: UnitPoint?
}

@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
extension ScrollTarget : Hashable, Equatable {
    public func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
    
    public static func == (a: ScrollTarget, b: ScrollTarget) -> Bool {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension ScrollTarget : Sendable {
}

enum ContentOffsetAdjustmentReason : UInt32, Hashable, CustomStringConvertible {
    case translation
    case positionTranslation
    case alignment
    case reset
    case resetPosition
    
    var description: String {
        assertUnimplemented()
    }
}

struct ScrollableCollectionSubview {
    private var id: _ViewList_ID
    private var frame: CGRect
    private var frameInContent: CGRect
    private var transform: ViewTransform
}

@available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
public struct PinnedScrollableViews : OptionSet, Sendable {
    public let rawValue: UInt32
    
    public init(rawValue: UInt32) {
        self.rawValue = rawValue
    }
    
    public static let sectionHeaders = PinnedScrollableViews(rawValue: 1 << 0)
    public static let sectionFooters = PinnedScrollableViews(rawValue: 1 << 1)
}

enum AccessibilityLayoutRole : Hashable {
    case stack
    case grid
}

enum AccessibilityScrollableNavigationType : Hashable {
    case previous
    case next
    case up
    case down
}

extension _GraphInputs {
    fileprivate struct ScrollableKey : ViewInput {
        static let defaultValue = OptionalAttribute<any Scrollable>()
    }
    
    var scrollable: OptionalAttribute<any Scrollable> {
        get {
            return self[_GraphInputs.ScrollableKey.self]
        }
        set {
            self[_GraphInputs.ScrollableKey.self] = newValue
        }
    }
}

extension _ViewInputs {
    var scrollable: OptionalAttribute<any Scrollable> {
        get {
            return self[_GraphInputs.ScrollableKey.self]
        }
        set {
            self[_GraphInputs.ScrollableKey.self] = newValue
        }
    }
}
