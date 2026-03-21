private import _SwiftUICorePrivate
@testable @_private(sourceFile: "SizingPreferences.swift") private import MySwiftUICore
internal import Testing
private import CoreGraphics
private import Spatial
private import MySwiftUITestUtils

fileprivate struct SizingPreferencesTests {}

extension SizingPreferencesTests {
    @Test
    func test_init_equivalence() {
        let cases: [InitInput] = [
            InitInput(
                width: nil,
                height: nil,
                depth: nil,
                minimumWidth: nil,
                minimumHeight: nil,
                minimumDepth: nil,
                maximumWidth: nil,
                maximumHeight: nil,
                maximumDepth: nil,
                use3D: false
            ),
            InitInput(
                width: 120,
                height: 80,
                depth: nil,
                minimumWidth: nil,
                minimumHeight: nil,
                minimumDepth: nil,
                maximumWidth: nil,
                maximumHeight: nil,
                maximumDepth: nil,
                use3D: false
            ),
            InitInput(
                width: 120,
                height: 80,
                depth: 40,
                minimumWidth: 20,
                minimumHeight: 10,
                minimumDepth: 5,
                maximumWidth: 300,
                maximumHeight: 200,
                maximumDepth: 100,
                use3D: true
            ),
            InitInput(
                width: .nan,
                height: .infinity,
                depth: -CGFloat.infinity,
                minimumWidth: .nan,
                minimumHeight: nil,
                minimumDepth: .infinity,
                maximumWidth: -CGFloat.infinity,
                maximumHeight: .nan,
                maximumDepth: nil,
                use3D: true
            ),
            InitInput(
                width: nil,
                height: 44,
                depth: nil,
                minimumWidth: 1,
                minimumHeight: nil,
                minimumDepth: nil,
                maximumWidth: nil,
                maximumHeight: 88,
                maximumDepth: nil,
                use3D: false
            ),
            InitInput(
                width: 10,
                height: nil,
                depth: 12,
                minimumWidth: nil,
                minimumHeight: 0,
                minimumDepth: .nan,
                maximumWidth: .infinity,
                maximumHeight: nil,
                maximumDepth: -CGFloat.infinity,
                use3D: true
            )
        ]
        
        for input in cases {
            let original = _SwiftUICorePrivate.SizingPreferences(
                width: input.width,
                height: input.height,
                depth: input.depth,
                minimumWidth: input.minimumWidth,
                minimumHeight: input.minimumHeight,
                minimumDepth: input.minimumDepth,
                maximumWidth: input.maximumWidth,
                maximumHeight: input.maximumHeight,
                maximumDepth: input.maximumDepth,
                use3D: input.use3D
            )
            
            let impl = MySwiftUICore.SizingPreferences(
                width: input.width,
                height: input.height,
                depth: input.depth,
                minimumWidth: input.minimumWidth,
                minimumHeight: input.minimumHeight,
                minimumDepth: input.minimumDepth,
                maximumWidth: input.maximumWidth,
                maximumHeight: input.maximumHeight,
                maximumDepth: input.maximumDepth,
                use3D: input.use3D
            )
            
            assertEquivalent(original: original, impl: impl)
        }
    }
    
    @Test
    func test_window_equivalence() {
        let cases: [WindowInput] = [
            WindowInput(size: nil, minimum: nil, maximum: nil),
            WindowInput(size: CGSize(width: 120, height: 80), minimum: nil, maximum: nil),
            WindowInput(
                size: CGSize(width: 120, height: 80),
                minimum: CGSize(width: 20, height: 10),
                maximum: CGSize(width: 300, height: 200)
            ),
            WindowInput(
                size: CGSize(width: CGFloat.nan, height: CGFloat.infinity),
                minimum: nil,
                maximum: CGSize(width: -CGFloat.infinity, height: CGFloat.nan)
            ),
            WindowInput(
                size: nil,
                minimum: CGSize(width: 1, height: 2),
                maximum: nil
            ),
            WindowInput(
                size: nil,
                minimum: nil,
                maximum: CGSize(width: CGFloat.infinity, height: -CGFloat.infinity)
            )
        ]
        
        for input in cases {
            let original = _SwiftUICorePrivate.SizingPreferences.window(
                size: input.size,
                minimum: input.minimum,
                maximum: input.maximum
            )
            let impl = MySwiftUICore.SizingPreferences.window(
                size: input.size,
                minimum: input.minimum,
                maximum: input.maximum
            )
            
            assertEquivalent(original: original, impl: impl)
        }
    }
    
    @Test
    func test_volume_equivalence() {
        let cases: [VolumeInput] = [
            VolumeInput(size: nil, minimum: nil, maximum: nil),
            VolumeInput(size: Size3D(width: 120, height: 80, depth: 40), minimum: nil, maximum: nil),
            VolumeInput(
                size: Size3D(width: 120, height: 80, depth: 40),
                minimum: Size3D(width: 20, height: 10, depth: 5),
                maximum: Size3D(width: 300, height: 200, depth: 100)
            ),
            VolumeInput(
                size: Size3D(width: .nan, height: .infinity, depth: -CGFloat.infinity),
                minimum: nil,
                maximum: Size3D(width: -CGFloat.infinity, height: .nan, depth: .infinity)
            ),
            VolumeInput(
                size: nil,
                minimum: Size3D(width: 1, height: 2, depth: 3),
                maximum: nil
            ),
            VolumeInput(
                size: nil,
                minimum: nil,
                maximum: Size3D(width: .infinity, height: -CGFloat.infinity, depth: .nan)
            )
        ]
        
        for input in cases {
            let original = _SwiftUICorePrivate.SizingPreferences.volume(
                size: input.size,
                minimum: input.minimum,
                maximum: input.maximum
            )
            let impl = MySwiftUICore.SizingPreferences.volume(
                size: input.size,
                minimum: input.minimum,
                maximum: input.maximum
            )
            
            assertEquivalent(original: original, impl: impl)
        }
    }
    
    @Test
    func test_equatable_matrix() {
        let cases: [InitInput] = [
            InitInput(
                width: nil,
                height: nil,
                depth: nil,
                minimumWidth: nil,
                minimumHeight: nil,
                minimumDepth: nil,
                maximumWidth: nil,
                maximumHeight: nil,
                maximumDepth: nil,
                use3D: false
            ),
            InitInput(
                width: 120,
                height: 80,
                depth: nil,
                minimumWidth: nil,
                minimumHeight: nil,
                minimumDepth: nil,
                maximumWidth: nil,
                maximumHeight: nil,
                maximumDepth: nil,
                use3D: false
            ),
            InitInput(
                width: 120,
                height: 80,
                depth: 40,
                minimumWidth: 20,
                minimumHeight: 10,
                minimumDepth: 5,
                maximumWidth: 300,
                maximumHeight: 200,
                maximumDepth: 100,
                use3D: true
            ),
            InitInput(
                width: .nan,
                height: .infinity,
                depth: -CGFloat.infinity,
                minimumWidth: .nan,
                minimumHeight: nil,
                minimumDepth: .infinity,
                maximumWidth: -CGFloat.infinity,
                maximumHeight: .nan,
                maximumDepth: nil,
                use3D: true
            )
        ]
        
        let originalValues = cases.map {
            _SwiftUICorePrivate.SizingPreferences(
                width: $0.width,
                height: $0.height,
                depth: $0.depth,
                minimumWidth: $0.minimumWidth,
                minimumHeight: $0.minimumHeight,
                minimumDepth: $0.minimumDepth,
                maximumWidth: $0.maximumWidth,
                maximumHeight: $0.maximumHeight,
                maximumDepth: $0.maximumDepth,
                use3D: $0.use3D
            )
        }
        
        let implValues = cases.map {
            MySwiftUICore.SizingPreferences(
                width: $0.width,
                height: $0.height,
                depth: $0.depth,
                minimumWidth: $0.minimumWidth,
                minimumHeight: $0.minimumHeight,
                minimumDepth: $0.minimumDepth,
                maximumWidth: $0.maximumWidth,
                maximumHeight: $0.maximumHeight,
                maximumDepth: $0.maximumDepth,
                use3D: $0.use3D
            )
        }
        
        for i in originalValues.indices {
            for j in originalValues.indices {
                #expect((originalValues[i] == originalValues[j]) == (implValues[i] == implValues[j]))
            }
        }
    }
    
    @Test
    func test_size2D_set_modify_equivalence() {
        assert2DPropertySetModifyEquivalence(
            originalKeyPath: \.size2D,
            implKeyPath: \.size2D
        )
    }
    
    @Test
    func test_size3D_set_modify_equivalence() {
        assert3DPropertySetModifyEquivalence(
            originalKeyPath: \.size3D,
            implKeyPath: \.size3D
        )
    }
    
    @Test
    func test_minimum2D_set_modify_equivalence() {
        assert2DPropertySetModifyEquivalence(
            originalKeyPath: \.minimum2D,
            implKeyPath: \.minimum2D
        )
    }
    
    @Test
    func test_maximum2D_set_modify_equivalence() {
        assert2DPropertySetModifyEquivalence(
            originalKeyPath: \.maximum2D,
            implKeyPath: \.maximum2D
        )
    }
    
    @Test
    func test_minimum3D_set_modify_equivalence() {
        assert3DPropertySetModifyEquivalence(
            originalKeyPath: \.minimum3D,
            implKeyPath: \.minimum3D
        )
    }
    
    @Test
    func test_maximum3D_set_modify_equivalence() {
        assert3DPropertySetModifyEquivalence(
            originalKeyPath: \.maximum3D,
            implKeyPath: \.maximum3D
        )
    }
    
    @Test
    func test_use3D_set_modify_equivalence() {
        let cases: [InitInput] = [
            InitInput(
                width: nil,
                height: nil,
                depth: nil,
                minimumWidth: nil,
                minimumHeight: nil,
                minimumDepth: nil,
                maximumWidth: nil,
                maximumHeight: nil,
                maximumDepth: nil,
                use3D: false
            ),
            InitInput(
                width: 10,
                height: 20,
                depth: 30,
                minimumWidth: 1,
                minimumHeight: 2,
                minimumDepth: 3,
                maximumWidth: 100,
                maximumHeight: 200,
                maximumDepth: 300,
                use3D: true
            )
        ]
        
        for input in cases {
            var original = makeOriginal(input)
            var impl = makeImpl(input)
            
            original.use3D = !input.use3D
            impl.use3D = !input.use3D
            #expect(original.use3D == impl.use3D)
            
            applyModify(&original.use3D) { value in
                value.toggle()
            }
            applyModify(&impl.use3D) { value in
                value.toggle()
            }
            
            #expect(original.use3D == impl.use3D)
            assertPrivateStorageEquivalent(original: original, impl: impl)
        }
    }
    
    @Test
    func test_size2D_set_modify_clears_depth() {
        let input = InitInput(
            width: 100,
            height: 200,
            depth: 300,
            minimumWidth: 10,
            minimumHeight: 20,
            minimumDepth: 30,
            maximumWidth: 400,
            maximumHeight: 500,
            maximumDepth: 600,
            use3D: true
        )
        
        var original = makeOriginal(input)
        var impl = makeImpl(input)
        
        original.size2D = CGSize(width: 11, height: 22)
        impl.size2D = CGSize(width: 11, height: 22)
        
        #expect(original.depthForTest == nil)
        #expect(impl.depthForTest == nil)
        
        applyModify(&original.size2D) { value in
            guard var current = value else {
                return
            }
            current.width += 3
            current.height += 4
            value = current
        }
        
        applyModify(&impl.size2D) { value in
            guard var current = value else {
                return
            }
            current.width += 3
            current.height += 4
            value = current
        }
        
        #expect(original.depthForTest == nil)
        #expect(impl.depthForTest == nil)
        assertEquivalent(original: original, impl: impl)
    }
    
    @Test
    func test_minimum2D_set_modify_clears_minimumDepth() {
        let input = InitInput(
            width: 100,
            height: 200,
            depth: 300,
            minimumWidth: 10,
            minimumHeight: 20,
            minimumDepth: 30,
            maximumWidth: 400,
            maximumHeight: 500,
            maximumDepth: 600,
            use3D: true
        )
        
        var original = makeOriginal(input)
        var impl = makeImpl(input)
        
        original.minimum2D = CGSize(width: 1, height: 2)
        impl.minimum2D = CGSize(width: 1, height: 2)
        
        #expect(original.minimumDepthForTest == nil)
        #expect(impl.minimumDepthForTest == nil)
        
        applyModify(&original.minimum2D) { value in
            guard var current = value else {
                return
            }
            current.width += 7
            current.height += 8
            value = current
        }
        
        applyModify(&impl.minimum2D) { value in
            guard var current = value else {
                return
            }
            current.width += 7
            current.height += 8
            value = current
        }
        
        #expect(original.minimumDepthForTest == nil)
        #expect(impl.minimumDepthForTest == nil)
        assertEquivalent(original: original, impl: impl)
    }
    
    @Test
    func test_maximum2D_set_modify_clears_maximumDepth() {
        let input = InitInput(
            width: 100,
            height: 200,
            depth: 300,
            minimumWidth: 10,
            minimumHeight: 20,
            minimumDepth: 30,
            maximumWidth: 400,
            maximumHeight: 500,
            maximumDepth: 600,
            use3D: true
        )
        
        var original = makeOriginal(input)
        var impl = makeImpl(input)
        
        original.maximum2D = CGSize(width: 111, height: 222)
        impl.maximum2D = CGSize(width: 111, height: 222)
        
        #expect(original.maximumDepthForTest == nil)
        #expect(impl.maximumDepthForTest == nil)
        
        applyModify(&original.maximum2D) { value in
            guard var current = value else {
                return
            }
            current.width -= 5
            current.height -= 6
            value = current
        }
        
        applyModify(&impl.maximum2D) { value in
            guard var current = value else {
                return
            }
            current.width -= 5
            current.height -= 6
            value = current
        }
        
        #expect(original.maximumDepthForTest == nil)
        #expect(impl.maximumDepthForTest == nil)
        assertEquivalent(original: original, impl: impl)
    }
}

fileprivate struct InitInput {
    let width: CGFloat?
    let height: CGFloat?
    let depth: CGFloat?
    let minimumWidth: CGFloat?
    let minimumHeight: CGFloat?
    let minimumDepth: CGFloat?
    let maximumWidth: CGFloat?
    let maximumHeight: CGFloat?
    let maximumDepth: CGFloat?
    let use3D: Bool
}

fileprivate struct WindowInput {
    let size: CGSize?
    let minimum: CGSize?
    let maximum: CGSize?
}

fileprivate struct VolumeInput {
    let size: Size3D?
    let minimum: Size3D?
    let maximum: Size3D?
}

fileprivate struct Mutation2DInput {
    let initial: InitInput
    let setValue: CGSize?
    let modifyDelta: CGSize
}

fileprivate struct Mutation3DInput {
    let initial: InitInput
    let setValue: Size3D?
    let modifyDelta: Size3D
}

fileprivate let mutation2DInputs: [Mutation2DInput] = [
    Mutation2DInput(
        initial: InitInput(
            width: 100,
            height: 200,
            depth: 300,
            minimumWidth: 10,
            minimumHeight: 20,
            minimumDepth: 30,
            maximumWidth: 400,
            maximumHeight: 500,
            maximumDepth: 600,
            use3D: true
        ),
        setValue: CGSize(width: 11, height: 22),
        modifyDelta: CGSize(width: 3, height: 4)
    ),
    Mutation2DInput(
        initial: InitInput(
            width: 10,
            height: 20,
            depth: nil,
            minimumWidth: nil,
            minimumHeight: nil,
            minimumDepth: nil,
            maximumWidth: nil,
            maximumHeight: nil,
            maximumDepth: nil,
            use3D: false
        ),
        setValue: nil,
        modifyDelta: CGSize(width: 1, height: 1)
    ),
    Mutation2DInput(
        initial: InitInput(
            width: .nan,
            height: .infinity,
            depth: -CGFloat.infinity,
            minimumWidth: .nan,
            minimumHeight: .infinity,
            minimumDepth: -CGFloat.infinity,
            maximumWidth: .infinity,
            maximumHeight: .nan,
            maximumDepth: nil,
            use3D: true
        ),
        setValue: CGSize(width: CGFloat.nan, height: CGFloat.infinity),
        modifyDelta: CGSize(width: 1, height: -1)
    )
]

fileprivate let mutation3DInputs: [Mutation3DInput] = [
    Mutation3DInput(
        initial: InitInput(
            width: 100,
            height: 200,
            depth: 300,
            minimumWidth: 10,
            minimumHeight: 20,
            minimumDepth: 30,
            maximumWidth: 400,
            maximumHeight: 500,
            maximumDepth: 600,
            use3D: true
        ),
        setValue: Size3D(width: 11, height: 22, depth: 33),
        modifyDelta: Size3D(width: 3, height: 4, depth: 5)
    ),
    Mutation3DInput(
        initial: InitInput(
            width: 10,
            height: 20,
            depth: 30,
            minimumWidth: nil,
            minimumHeight: nil,
            minimumDepth: nil,
            maximumWidth: nil,
            maximumHeight: nil,
            maximumDepth: nil,
            use3D: true
        ),
        setValue: nil,
        modifyDelta: Size3D(width: 1, height: 1, depth: 1)
    ),
    Mutation3DInput(
        initial: InitInput(
            width: .nan,
            height: .infinity,
            depth: -CGFloat.infinity,
            minimumWidth: .nan,
            minimumHeight: .infinity,
            minimumDepth: -CGFloat.infinity,
            maximumWidth: .infinity,
            maximumHeight: .nan,
            maximumDepth: nil,
            use3D: true
        ),
        setValue: Size3D(width: .nan, height: .infinity, depth: -CGFloat.infinity),
        modifyDelta: Size3D(width: 1, height: -1, depth: 2)
    )
]

fileprivate func makeOriginal(_ input: InitInput) -> _SwiftUICorePrivate.SizingPreferences {
    _SwiftUICorePrivate.SizingPreferences(
        width: input.width,
        height: input.height,
        depth: input.depth,
        minimumWidth: input.minimumWidth,
        minimumHeight: input.minimumHeight,
        minimumDepth: input.minimumDepth,
        maximumWidth: input.maximumWidth,
        maximumHeight: input.maximumHeight,
        maximumDepth: input.maximumDepth,
        use3D: input.use3D
    )
}

fileprivate func makeImpl(_ input: InitInput) -> MySwiftUICore.SizingPreferences {
    MySwiftUICore.SizingPreferences(
        width: input.width,
        height: input.height,
        depth: input.depth,
        minimumWidth: input.minimumWidth,
        minimumHeight: input.minimumHeight,
        minimumDepth: input.minimumDepth,
        maximumWidth: input.maximumWidth,
        maximumHeight: input.maximumHeight,
        maximumDepth: input.maximumDepth,
        use3D: input.use3D
    )
}

fileprivate func assert2DPropertySetModifyEquivalence(
    originalKeyPath: WritableKeyPath<_SwiftUICorePrivate.SizingPreferences, CGSize?>,
    implKeyPath: WritableKeyPath<MySwiftUICore.SizingPreferences, CGSize?>
) {
    for input in mutation2DInputs {
        var original = makeOriginal(input.initial)
        var impl = makeImpl(input.initial)
        
        original[keyPath: originalKeyPath] = input.setValue
        impl[keyPath: implKeyPath] = input.setValue
        
        let originalReadAfterSet = original[keyPath: originalKeyPath]
        let implReadAfterSet = impl[keyPath: implKeyPath]
        assertOptionalCGSizeEquivalent(lhs: originalReadAfterSet, rhs: implReadAfterSet)
        
        applyModify(&original[keyPath: originalKeyPath]) { value in
            guard var current = value else {
                return
            }
            current.width += input.modifyDelta.width
            current.height += input.modifyDelta.height
            value = current
        }
        
        applyModify(&impl[keyPath: implKeyPath]) { value in
            guard var current = value else {
                return
            }
            current.width += input.modifyDelta.width
            current.height += input.modifyDelta.height
            value = current
        }
        
        let originalReadAfterModify = original[keyPath: originalKeyPath]
        let implReadAfterModify = impl[keyPath: implKeyPath]
        assertOptionalCGSizeEquivalent(lhs: originalReadAfterModify, rhs: implReadAfterModify)
        
        assertEquivalent(original: original, impl: impl)
    }
}

fileprivate func assert3DPropertySetModifyEquivalence(
    originalKeyPath: WritableKeyPath<_SwiftUICorePrivate.SizingPreferences, Size3D?>,
    implKeyPath: WritableKeyPath<MySwiftUICore.SizingPreferences, Size3D?>
) {
    for input in mutation3DInputs {
        var original = makeOriginal(input.initial)
        var impl = makeImpl(input.initial)
        
        original[keyPath: originalKeyPath] = input.setValue
        impl[keyPath: implKeyPath] = input.setValue
        
        let originalReadAfterSet = original[keyPath: originalKeyPath]
        let implReadAfterSet = impl[keyPath: implKeyPath]
        assertOptionalSize3DEquivalent(lhs: originalReadAfterSet, rhs: implReadAfterSet)
        
        applyModify(&original[keyPath: originalKeyPath]) { value in
            guard var current = value else {
                return
            }
            current.width += input.modifyDelta.width
            current.height += input.modifyDelta.height
            current.depth += input.modifyDelta.depth
            value = current
        }
        
        applyModify(&impl[keyPath: implKeyPath]) { value in
            guard var current = value else {
                return
            }
            current.width += input.modifyDelta.width
            current.height += input.modifyDelta.height
            current.depth += input.modifyDelta.depth
            value = current
        }
        
        let originalReadAfterModify = original[keyPath: originalKeyPath]
        let implReadAfterModify = impl[keyPath: implKeyPath]
        assertOptionalSize3DEquivalent(lhs: originalReadAfterModify, rhs: implReadAfterModify)
        
        assertEquivalent(original: original, impl: impl)
    }
}

fileprivate func applyModify<T>(_ value: inout T, _ body: (inout T) -> Void) {
    body(&value)
}

fileprivate func assertEquivalent(
    original: _SwiftUICorePrivate.SizingPreferences,
    impl: MySwiftUICore.SizingPreferences
) {
    assertPrivateStorageEquivalent(original: original, impl: impl)
    
    assertOptionalCGSizeEquivalent(lhs: original.size2D, rhs: impl.size2D)
    assertOptionalSize3DEquivalent(lhs: original.size3D, rhs: impl.size3D)
    
    assertOptionalCGSizeEquivalent(lhs: original.minimum2D, rhs: impl.minimum2D)
    assertOptionalCGSizeEquivalent(lhs: original.maximum2D, rhs: impl.maximum2D)
    
    assertOptionalSize3DEquivalent(lhs: original.minimum3D, rhs: impl.minimum3D)
    assertOptionalSize3DEquivalent(lhs: original.maximum3D, rhs: impl.maximum3D)
    
    #expect(original.description == impl.description)
}

fileprivate func assertPrivateStorageEquivalent(
    original: _SwiftUICorePrivate.SizingPreferences,
    impl: MySwiftUICore.SizingPreferences
) {
    assertOptionalCGFloatBitPatternEqual(lhs: original.widthForTest, rhs: impl.widthForTest)
    assertOptionalCGFloatBitPatternEqual(lhs: original.heightForTest, rhs: impl.heightForTest)
    assertOptionalCGFloatBitPatternEqual(lhs: original.depthForTest, rhs: impl.depthForTest)
    
    assertOptionalCGFloatBitPatternEqual(lhs: original.minimumWidthForTest, rhs: impl.minimumWidthForTest)
    assertOptionalCGFloatBitPatternEqual(lhs: original.minimumHeightForTest, rhs: impl.minimumHeightForTest)
    assertOptionalCGFloatBitPatternEqual(lhs: original.minimumDepthForTest, rhs: impl.minimumDepthForTest)
    
    assertOptionalCGFloatBitPatternEqual(lhs: original.maximumWidthForTest, rhs: impl.maximumWidthForTest)
    assertOptionalCGFloatBitPatternEqual(lhs: original.maximumHeightForTest, rhs: impl.maximumHeightForTest)
    assertOptionalCGFloatBitPatternEqual(lhs: original.maximumDepthForTest, rhs: impl.maximumDepthForTest)
    
    #expect(original.use3D == impl.use3D)
}

fileprivate func assertOptionalCGFloatBitPatternEqual(lhs: CGFloat?, rhs: CGFloat?) {
    #expect(lhs?.bitPattern == rhs?.bitPattern)
}

fileprivate func assertOptionalCGSizeEquivalent(lhs: CGSize?, rhs: CGSize?) {
    switch (lhs, rhs) {
    case let (.some(lhs), .some(rhs)):
        #expect(lhs.isEqual(to: rhs))
    case (.none, .none):
        break
    default:
        #expect(Bool(false))
    }
}

fileprivate func assertOptionalSize3DEquivalent(lhs: Size3D?, rhs: Size3D?) {
    switch (lhs, rhs) {
    case let (.some(lhs), .some(rhs)):
        #expect(lhs.isEqual(to: rhs))
    case (.none, .none):
        break
    default:
        #expect(Bool(false))
    }
}

fileprivate func extractOptionalCGFloat(from value: Any?) -> CGFloat? {
    guard let value else {
        return nil
    }
    
    let mirror = Mirror(reflecting: value)
    if mirror.displayStyle == .optional {
        guard let wrapped = mirror.children.first?.value else {
            return nil
        }
        return extractCGFloat(from: wrapped)
    } else {
        return extractCGFloat(from: value)
    }
}

fileprivate func extractCGFloat(from value: Any) -> CGFloat? {
    if let mirroredCGFloat = Mirror(reflecting: value).descendant("value") as? CGFloat {
        return mirroredCGFloat
    }
    if let mirroredDouble = Mirror(reflecting: value).descendant("value") as? Double {
        return CGFloat(mirroredDouble)
    }
    
    if let directCGFloat = value as? CGFloat {
        return directCGFloat
    }
    if let directDouble = value as? Double {
        return CGFloat(directDouble)
    }
    
    return nil
}

extension _SwiftUICorePrivate.SizingPreferences {
    fileprivate var widthForTest: CGFloat? {
        extractOptionalCGFloat(from: Mirror(reflecting: self).descendant("width"))
    }
    
    fileprivate var heightForTest: CGFloat? {
        extractOptionalCGFloat(from: Mirror(reflecting: self).descendant("height"))
    }
    
    fileprivate var depthForTest: CGFloat? {
        extractOptionalCGFloat(from: Mirror(reflecting: self).descendant("depth"))
    }
    
    fileprivate var minimumWidthForTest: CGFloat? {
        extractOptionalCGFloat(from: Mirror(reflecting: self).descendant("minimumWidth"))
    }
    
    fileprivate var minimumHeightForTest: CGFloat? {
        extractOptionalCGFloat(from: Mirror(reflecting: self).descendant("minimumHeight"))
    }
    
    fileprivate var minimumDepthForTest: CGFloat? {
        extractOptionalCGFloat(from: Mirror(reflecting: self).descendant("minimumDepth"))
    }
    
    fileprivate var maximumWidthForTest: CGFloat? {
        extractOptionalCGFloat(from: Mirror(reflecting: self).descendant("maximumWidth"))
    }
    
    fileprivate var maximumHeightForTest: CGFloat? {
        extractOptionalCGFloat(from: Mirror(reflecting: self).descendant("maximumHeight"))
    }
    
    fileprivate var maximumDepthForTest: CGFloat? {
        extractOptionalCGFloat(from: Mirror(reflecting: self).descendant("maximumDepth"))
    }
}

extension MySwiftUICore.SizingPreferences {
    fileprivate var widthForTest: CGFloat? {
        extractOptionalCGFloat(from: Mirror(reflecting: self).descendant("width"))
    }
    
    fileprivate var heightForTest: CGFloat? {
        extractOptionalCGFloat(from: Mirror(reflecting: self).descendant("height"))
    }
    
    fileprivate var depthForTest: CGFloat? {
        extractOptionalCGFloat(from: Mirror(reflecting: self).descendant("depth"))
    }
    
    fileprivate var minimumWidthForTest: CGFloat? {
        extractOptionalCGFloat(from: Mirror(reflecting: self).descendant("minimumWidth"))
    }
    
    fileprivate var minimumHeightForTest: CGFloat? {
        extractOptionalCGFloat(from: Mirror(reflecting: self).descendant("minimumHeight"))
    }
    
    fileprivate var minimumDepthForTest: CGFloat? {
        extractOptionalCGFloat(from: Mirror(reflecting: self).descendant("minimumDepth"))
    }
    
    fileprivate var maximumWidthForTest: CGFloat? {
        extractOptionalCGFloat(from: Mirror(reflecting: self).descendant("maximumWidth"))
    }
    
    fileprivate var maximumHeightForTest: CGFloat? {
        extractOptionalCGFloat(from: Mirror(reflecting: self).descendant("maximumHeight"))
    }
    
    fileprivate var maximumDepthForTest: CGFloat? {
        extractOptionalCGFloat(from: Mirror(reflecting: self).descendant("maximumDepth"))
    }
}
