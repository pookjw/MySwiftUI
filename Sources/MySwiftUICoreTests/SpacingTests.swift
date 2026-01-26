internal import Testing
@testable private import MySwiftUICore 
private import MySwiftUITestUtils
private import _SwiftUICorePrivate
private import SwiftUI
private import CoreGraphics

fileprivate struct SpacingTests {
    @Test func test_init_minima() {
        let impl = MySwiftUICore.Spacing(
            minima: [
                MySwiftUICore.Spacing.Key(category: .default, edge: .top): MySwiftUICore.Spacing.Value.distance(1),
                MySwiftUICore.Spacing.Key(category: .edgeBelowText, edge: .left): MySwiftUICore.Spacing.Value.distance(2),
            ]
        )
        
        let original = _SwiftUICorePrivate.Spacing(
            minima: [
                _SwiftUICorePrivate.Spacing.Key(category: .default, edge: .top): _SwiftUICorePrivate.Spacing.Value.distance(1),
                _SwiftUICorePrivate.Spacing.Key(category: .edgeBelowText, edge: .left): _SwiftUICorePrivate.Spacing.Value.distance(2)
            ]
        )
        
        #expect(isEqual(impl: impl, original: original))
    }
    
    @Test func test_init() {
        let impl = MySwiftUICore.Spacing()
        let original = _SwiftUICorePrivate.Spacing()
        #expect(isEqual(impl: impl, original: original))
    }
    
    @Test func test_defaultMinimum() {
        MySwiftUICore.Spacing.defaultValue = CGSize(width: 10, height: 20)
        _SwiftUICorePrivate.Spacing.defaultValue = CGSize(width: 10, height: 20)
        #expect(MySwiftUICore.Spacing.defaultMinimum == _SwiftUICorePrivate.Spacing.defaultMinimum)
        
        MySwiftUICore.Spacing.defaultValue = CGSize(width: 20, height: 10)
        _SwiftUICorePrivate.Spacing.defaultValue = CGSize(width: 20, height: 10)
        #expect(MySwiftUICore.Spacing.defaultMinimum == _SwiftUICorePrivate.Spacing.defaultMinimum)
        
        MySwiftUICore.Spacing.defaultValue = CGSize(width: CGFloat.nan, height: 20)
        _SwiftUICorePrivate.Spacing.defaultValue = CGSize(width: CGFloat.nan, height: 20)
        #expect(MySwiftUICore.Spacing.defaultMinimum.bitPattern == _SwiftUICorePrivate.Spacing.defaultMinimum.bitPattern)
        
        MySwiftUICore.Spacing.defaultValue = CGSize(width: 20, height: CGFloat.nan)
        _SwiftUICorePrivate.Spacing.defaultValue = CGSize(width: 20, height: CGFloat.nan)
        #expect(MySwiftUICore.Spacing.defaultMinimum.bitPattern == _SwiftUICorePrivate.Spacing.defaultMinimum.bitPattern)
    }
    
    @Test func test_defaultValue() {
        #expect(MySwiftUICore.Spacing.defaultValue == _SwiftUICorePrivate.Spacing.defaultValue)
    }
    
    @Test func test_zero() {
        let impl = MySwiftUICore.Spacing.zero
        let original = _SwiftUICorePrivate.Spacing.zero
        #expect(isEqual(impl: impl, original: original))
    }
    
    @Test func test_all() {
        let impl = MySwiftUICore.Spacing.all(1)
        let original = _SwiftUICorePrivate.Spacing.all(1)
        #expect(isEqual(impl: impl, original: original))
    }
    
    @Test func test_horizontal() {
        let impl = MySwiftUICore.Spacing.horizontal(1)
        let original = _SwiftUICorePrivate.Spacing.horizontal(1)
        #expect(isEqual(impl: impl, original: original))
    }
    
    @Test func test_vertical() {
        let impl = MySwiftUICore.Spacing.vertical(1)
        let original = _SwiftUICorePrivate.Spacing.vertical(1)
        #expect(isEqual(impl: impl, original: original))
    }
}

extension SpacingTests {
    fileprivate struct Test_distanceToSuccessorView: Sendable {
        let selfSpacing: _SwiftUICorePrivate.Spacing
        let axis: SwiftUI.Axis
        let layoutDirection: SwiftUI.LayoutDirection
        let preferring: _SwiftUICorePrivate.Spacing
        
        static let allCases: [Test_distanceToSuccessorView] = {
            let scalars: [CGFloat] = [
                .nan,
                .infinity,
                -.infinity
            ]
            
            let textMetrics: [_SwiftUICorePrivate.Spacing.TextMetrics] = [
                .init(ascend: 10, descend: 4, leading: 2, pixelLength: 16)
            ]
            
            let distanceValues: [_SwiftUICorePrivate.Spacing.Value] =
            scalars.map { .distance($0) }
            
            let textValues: [_SwiftUICorePrivate.Spacing.Value] = [
//                .topTextMetrics(textMetrics[0]),
//                .bottomTextMetrics(textMetrics[0])
            ]
            
            let categories: [_SwiftUICorePrivate.Spacing.Category] = [
                .default,
                .edgeAboveText
            ]
            
            func makeSpacing(
                _ value: _SwiftUICorePrivate.Spacing.Value,
                category: _SwiftUICorePrivate.Spacing.Category
            ) -> _SwiftUICorePrivate.Spacing {
                .init(
                    minima: [
                        .init(category: category, edge: .left): value,
                        .init(category: category, edge: .right): value,
                        .init(category: category, edge: .top): value,
                        .init(category: category, edge: .bottom): value
                    ]
                )
            }
            
            var result: [Test_distanceToSuccessorView] = []
            
            for category in categories {
                for selfValue in distanceValues + textValues {
                    for prefValue in distanceValues + textValues {
                        let selfSpacing = makeSpacing(selfValue, category: category)
                        let prefSpacing = makeSpacing(prefValue, category: category)
                        
                        result.append(
                            .init(
                                selfSpacing: selfSpacing,
                                axis: .horizontal,
                                layoutDirection: .leftToRight,
                                preferring: prefSpacing
                            )
                        )
                    }
                }
            }
            
            return result
        }()
    }
    
    @Test(arguments: Test_distanceToSuccessorView.allCases) func test_distanceToSuccessorView(data: Test_distanceToSuccessorView) {
        let original = data.selfSpacing
            .distanceToSuccessorView(
                along: data.axis,
                layoutDirection: data.layoutDirection,
                preferring: data.preferring
            )
        
        let impl = MySwiftUICore.Spacing(original: data.selfSpacing)
            .distanceToSuccessorView(
                along: data.axis == .horizontal ? .horizontal : .vertical,
                layoutDirection: data.layoutDirection == .leftToRight ? .leftToRight : .rightToLeft,
                preferring: MySwiftUICore.Spacing(original: data.preferring)
            )
        
        #expect(original?.bitPattern == impl?.bitPattern)
    }
}

fileprivate struct SpacingTextMetricsTests {
    @Test func test_init() async throws {
        let ascend: CGFloat = 1
        let descend: CGFloat = 2
        let leading: CGFloat = 3
        let pixelLength: CGFloat = 4
        
        let impl = MySwiftUICore.Spacing.TextMetrics(ascend: ascend, descend: descend, leading: leading, pixelLength: pixelLength)
        let original = _SwiftUICorePrivate.Spacing.TextMetrics(ascend: ascend, descend: descend, leading: leading, pixelLength: pixelLength)
        
        #expect(impl.ascend == original.ascend)
        #expect(impl.descend == original.descend)
        #expect(impl.leading == original.leading)
        #expect(impl.pixelLength == original.pixelLength)
    }
    
    @Test func test_lineSpacing() {
        let ascend: CGFloat = 1
        let descend: CGFloat = 2
        let leading: CGFloat = 3
        let pixelLength: CGFloat = 4
        
        let impl = MySwiftUICore.Spacing.TextMetrics(ascend: ascend, descend: descend, leading: leading, pixelLength: pixelLength)
        let original = _SwiftUICorePrivate.Spacing.TextMetrics(ascend: ascend, descend: descend, leading: leading, pixelLength: pixelLength)
        
        #expect(impl.lineSpacing == original.lineSpacing)
    }
    
    @Test func test_greaterThan() {
        let ascend_1: CGFloat = 1
        let descend_1: CGFloat = 2
        let leading_1: CGFloat = 3
        let pixelLength_1: CGFloat = 4
        let ascend_2: CGFloat = 5
        let descend_2: CGFloat = 6
        let leading_2: CGFloat = 7
        let pixelLength_2: CGFloat = 0
        
        let impl_1 = MySwiftUICore.Spacing.TextMetrics(ascend: ascend_1, descend: descend_1, leading: leading_1, pixelLength: pixelLength_1)
        let impl_2 = MySwiftUICore.Spacing.TextMetrics(ascend: ascend_2, descend: descend_2, leading: leading_2, pixelLength: pixelLength_2)
        #expect(impl_1 < impl_2)
        
        let original_1 = _SwiftUICorePrivate.Spacing.TextMetrics(ascend: ascend_1, descend: descend_1, leading: leading_1, pixelLength: pixelLength_1)
        let original_2 = _SwiftUICorePrivate.Spacing.TextMetrics(ascend: ascend_2, descend: descend_2, leading: leading_2, pixelLength: pixelLength_2)
        #expect(original_1 < original_2)
    }
    
    @Test func test_spacing() {
        // TODO
    }
}

fileprivate struct SpacingValueTests {
    @Test func test_init() {
        let impl = MySwiftUICore.Spacing.Value(3)
        let test_1: Bool
        if case .distance(let value) = impl {
            test_1 = value == 3
        } else {
            test_1 = false
        }
        #expect(test_1)
        
        let original = _SwiftUICorePrivate.Spacing.Value(3)
        let test_2: Bool
        if case .distance(let value) = original {
            test_2 = value == 3
        } else {
            test_2 = false
        }
        #expect(test_2)
    }
    
    @Test func test_value() {
        let impl_topTextMetrics = MySwiftUICore.Spacing.TextMetrics(ascend: 1, descend: 2, leading: 3, pixelLength: 4)
        let impl_bottomTextMetrics = MySwiftUICore.Spacing.TextMetrics(ascend: 5, descend: 6, leading: 7, pixelLength: 8)
        let impl_1 = MySwiftUICore.Spacing.Value.distance(3)
        #expect(impl_1.value == 3)
        let impl_2 = MySwiftUICore.Spacing.Value.topTextMetrics(impl_topTextMetrics)
        #expect(impl_2.value == nil)
        let impl_3 = MySwiftUICore.Spacing.Value.bottomTextMetrics(impl_bottomTextMetrics)
        #expect(impl_3.value == nil)
        
        let original_topTextMetrics = _SwiftUICorePrivate.Spacing.TextMetrics(ascend: 1, descend: 2, leading: 3, pixelLength: 4)
        let original_bottomTextMetrics = _SwiftUICorePrivate.Spacing.TextMetrics(ascend: 5, descend: 6, leading: 7, pixelLength: 8)
        let original_1 = _SwiftUICorePrivate.Spacing.Value.distance(3)
        #expect(original_1.value == 3)
        let original_2 = _SwiftUICorePrivate.Spacing.Value.topTextMetrics(original_topTextMetrics)
        #expect(original_2.value == nil)
        let original_3 = _SwiftUICorePrivate.Spacing.Value.bottomTextMetrics(original_bottomTextMetrics)
        #expect(original_3.value == nil)
    }
    
    @Test func test_distance() {
        do {
            let impl_1 = MySwiftUICore.Spacing.Value.distance(2)
            let impl_2 = MySwiftUICore.Spacing.Value.distance(3)
            #expect(impl_1.distance(to: impl_2) == 5)
            
            let original_1 = _SwiftUICorePrivate.Spacing.Value.distance(2)
            let original_2 = _SwiftUICorePrivate.Spacing.Value.distance(3)
            #expect(original_1.distance(to: original_2) == 5)
        }
        
        do {
            let impl_1 = MySwiftUICore.Spacing.Value.distance(20)
            let impl_2 = MySwiftUICore.Spacing.Value.topTextMetrics(MySwiftUICore.Spacing.TextMetrics(ascend: 0, descend: 1, leading: 2, pixelLength: 3))
            #expect(impl_1.distance(to: impl_2) == 20)
            
            let original_1 = _SwiftUICorePrivate.Spacing.Value.distance(20)
            let original_2 = _SwiftUICorePrivate.Spacing.Value.topTextMetrics(_SwiftUICorePrivate.Spacing.TextMetrics(ascend: 0, descend: 1, leading: 2, pixelLength: 3))
            #expect(original_1.distance(to: original_2) == 20)
        }
        
        do {
            let impl_1 = MySwiftUICore.Spacing.Value.bottomTextMetrics(MySwiftUICore.Spacing.TextMetrics(ascend: 1, descend: 2, leading: 3, pixelLength: 4))
            let impl_2 = MySwiftUICore.Spacing.Value.topTextMetrics(MySwiftUICore.Spacing.TextMetrics(ascend: 5, descend: 6, leading: 7, pixelLength: 8))
            // TODO
//            #expect(impl_1.distance(to: impl_2) == 8)
            
            let original_1 = _SwiftUICorePrivate.Spacing.Value.bottomTextMetrics(_SwiftUICorePrivate.Spacing.TextMetrics(ascend: 1, descend: 2, leading: 3, pixelLength: 4))
            let original_2 = _SwiftUICorePrivate.Spacing.Value.topTextMetrics(_SwiftUICorePrivate.Spacing.TextMetrics(ascend: 5, descend: 6, leading: 7, pixelLength: 8))
            #expect(original_1.distance(to: original_2) == 8)
        }
        
        do {
            let impl_1 = MySwiftUICore.Spacing.Value.bottomTextMetrics(MySwiftUICore.Spacing.TextMetrics(ascend: 1, descend: 2, leading: 3, pixelLength: 4))
            let impl_2 = MySwiftUICore.Spacing.Value.bottomTextMetrics(MySwiftUICore.Spacing.TextMetrics(ascend: 5, descend: 6, leading: 7, pixelLength: 8))
            #expect(impl_1.distance(to: impl_2) == nil)
            
            let original_1 = _SwiftUICorePrivate.Spacing.Value.bottomTextMetrics(_SwiftUICorePrivate.Spacing.TextMetrics(ascend: 1, descend: 2, leading: 3, pixelLength: 4))
            let original_2 = _SwiftUICorePrivate.Spacing.Value.bottomTextMetrics(_SwiftUICorePrivate.Spacing.TextMetrics(ascend: 5, descend: 6, leading: 7, pixelLength: 8))
            #expect(original_1.distance(to: original_2) == nil)
        }
    }
}

fileprivate func isEqual(impl: MySwiftUICore.Spacing, original: _SwiftUICorePrivate.Spacing) -> Bool {
    let keys_1 = impl.minima.keys
    let keys_2 = original.minima.keys
    
    guard keys_1.count == keys_2.count else {
        return false
    }
    
    var keyToKey: [MySwiftUICore.Spacing.Key: _SwiftUICorePrivate.Spacing.Key] = [:]
    keyToKey.reserveCapacity(keys_2.count)
    
    for key_1 in keys_1 {
        for key_2 in keys_2 {
            let matchesCategory: Bool
            if key_1.category == .default && key_2.category == .default {
                matchesCategory = true
            } else if key_1.category == .textToText && key_2.category == .textToText {
                matchesCategory = true
            } else if key_1.category == .textToText && key_2.category == .textToText {
                matchesCategory = true
            } else if key_1.category == .edgeAboveText && key_2.category == .edgeAboveText {
                matchesCategory = true
            } else if key_1.category == .edgeBelowText && key_2.category == .edgeBelowText {
                matchesCategory = true
            } else if key_1.category == .textBaseline && key_2.category == .textBaseline {
                matchesCategory = true
            } else if key_1.category == .edgeLeftText && key_2.category == .edgeLeftText {
                matchesCategory = true
            } else if key_1.category == .edgeRightText && key_2.category == .edgeRightText {
                matchesCategory = true
            } else if key_1.category == .leftTextBaseline && key_2.category == .leftTextBaseline {
                matchesCategory = true
            } else if key_1.category == .rightTextBaseline && key_2.category == .rightTextBaseline {
                matchesCategory = true
            } else {
                matchesCategory = false
            }
            
            guard matchesCategory else {
                continue
            }
            
            if key_1.edge.rawValue == key_2.edge.rawValue {
                keyToKey[key_1] = key_2
                break
            }
        }
    }
    
    guard keyToKey.count == keys_2.count else {
        return false
    }
    
    for (key_1, key_2) in keyToKey {
        guard
            let value_1 = impl.minima[key_1],
            let value_2 = original.minima[key_2]
        else {
            return false
        }
        
        switch (value_1, value_2) {
        case (.distance(let lhs), .distance(let rhs)):
            guard lhs == rhs else {
                return false
            }
        case (.topTextMetrics(let lhs), .topTextMetrics(let rhs)):
            guard
                lhs.ascend == rhs.ascend,
                lhs.descend == rhs.descend,
                lhs.leading == rhs.leading,
                lhs.pixelLength == rhs.pixelLength
            else {
                return false
            }
        case (.bottomTextMetrics(let lhs), .bottomTextMetrics(let rhs)):
            guard
                lhs.ascend == rhs.ascend,
                lhs.descend == rhs.descend,
                lhs.leading == rhs.leading,
                lhs.pixelLength == rhs.pixelLength
            else {
                return false
            }
        default:
            return false
        }
    }
    
    return true
}

extension MySwiftUICore.Spacing {
    fileprivate init(original: _SwiftUICorePrivate.Spacing) {
        var minima: [MySwiftUICore.Spacing.Key: MySwiftUICore.Spacing.Value] = [:]
        minima.reserveCapacity(original.minima.count)
        
        for (originalKey, originalValue) in original.minima {
            minima[.init(original: originalKey)] = .init(original: originalValue)
        }
        
        self.init(minima: minima)
    }
}

extension MySwiftUICore.Spacing.Key {
    fileprivate init(original: _SwiftUICorePrivate.Spacing.Key) {
        self.init(
            category: .init(original: original.category),
            edge: .init(rawValue: original.edge.rawValue)!
        )
    }
}

extension MySwiftUICore.Spacing.Category {
    fileprivate init(original: _SwiftUICorePrivate.Spacing.Category) {
        self.init()
        
        if original.base == _SwiftUICorePrivate.Spacing.Category.default.base {
            self.base = MySwiftUICore.Spacing.Category.default.base
        } else if original.base == _SwiftUICorePrivate.Spacing.Category.textToText.base {
            self.base = MySwiftUICore.Spacing.Category.textToText.base
        } else if original.base == _SwiftUICorePrivate.Spacing.Category.edgeAboveText.base {
            self.base = MySwiftUICore.Spacing.Category.edgeAboveText.base
        } else if original.base == _SwiftUICorePrivate.Spacing.Category.edgeBelowText.base {
            self.base = MySwiftUICore.Spacing.Category.edgeBelowText.base
        } else if original.base == _SwiftUICorePrivate.Spacing.Category.textBaseline.base {
            self.base = MySwiftUICore.Spacing.Category.textBaseline.base
        } else if original.base == _SwiftUICorePrivate.Spacing.Category.edgeLeftText.base {
            self.base = MySwiftUICore.Spacing.Category.edgeLeftText.base
        } else if original.base == _SwiftUICorePrivate.Spacing.Category.edgeRightText.base {
            self.base = MySwiftUICore.Spacing.Category.edgeRightText.base
        } else if original.base == _SwiftUICorePrivate.Spacing.Category.leftTextBaseline.base {
            self.base = MySwiftUICore.Spacing.Category.leftTextBaseline.base
        } else if original.base == _SwiftUICorePrivate.Spacing.Category.rightTextBaseline.base {
            self.base = MySwiftUICore.Spacing.Category.rightTextBaseline.base
        } else {
            fatalError()
        }
    }
}

extension MySwiftUICore.Spacing.Value {
    fileprivate init(original: _SwiftUICorePrivate.Spacing.Value) {
        switch original {
        case .distance(let distance):
            self = .distance(distance)
        case .topTextMetrics(let metrics):
            self = .topTextMetrics(MySwiftUICore.Spacing.TextMetrics(ascend: metrics.ascend, descend: metrics.descend, leading: metrics.leading, pixelLength: metrics.pixelLength))
        case .bottomTextMetrics(let metrics):
            self = .bottomTextMetrics(MySwiftUICore.Spacing.TextMetrics(ascend: metrics.ascend, descend: metrics.descend, leading: metrics.leading, pixelLength: metrics.pixelLength))
        default:
            fatalError()
        }
    }
}
