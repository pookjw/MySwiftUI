private import _SwiftUICorePrivate
@testable private import MySwiftUICore
internal import Testing
private import SwiftUI
private import Spatial
private import MySwiftUITestUtils

fileprivate struct ProposedViewSizeTests {
}

extension ProposedViewSizeTests {
    struct Input_init: Hashable {
        let width: CGFloat?
        let height: CGFloat?
    }
    
    struct Output_init {
        let width: CGFloat?
        let height: CGFloat?
    }
    
    static let init_expectations: [Input_init: Output_init] = [
        Input_init(
            width: 10,
            height: 20
        ): Output_init(
            width: 10,
            height: 20
        ),
        
        Input_init(
            width: nil,
            height: nil
        ): Output_init(
            width: nil,
            height: nil
        ),
        
        Input_init(
            width: CGFloat.infinity,
            height: CGFloat.nan
        ): Output_init(
            width: CGFloat.infinity,
            height: CGFloat.nan
        )
    ]
    
    @Test(arguments: Self.init_expectations)
    func test_init(input: Input_init, output: Output_init) {
        let implSource = MySwiftUICore._ProposedSize(
            width: input.width,
            height: input.height
        )
        let impl = MySwiftUICore.ProposedViewSize(implSource)
        
        #expect(impl.width?.bitPattern == output.width?.bitPattern)
        #expect(impl.height?.bitPattern == output.height?.bitPattern)
        
        let originalSource = SwiftUI._ProposedSize(
            width: input.width,
            height: input.height
        )
        let original = SwiftUI.ProposedViewSize(originalSource)
        
        #expect(original.width?.bitPattern == output.width?.bitPattern)
        #expect(original.height?.bitPattern == output.height?.bitPattern)
    }
}

extension ProposedViewSizeTests {
    struct Input_init_in_by: Hashable {
        let value: CGFloat?
        let axis: SwiftUI.Axis
        let other: CGFloat?
    }
    
    struct Output_init_in_by {
        let width: CGFloat?
        let height: CGFloat?
    }
    
    static let init_in_by_expectations: [Input_init_in_by: Output_init_in_by] = [
        Input_init_in_by(value: 1, axis: .horizontal, other: 2):
            Output_init_in_by(width: 1, height: 2),
        
        Input_init_in_by(value: 1, axis: .vertical, other: 2):
            Output_init_in_by(width: 2, height: 1),
        
        Input_init_in_by(value: nil, axis: .horizontal, other: 2):
            Output_init_in_by(width: nil, height: 2),
        
        Input_init_in_by(value: 1, axis: .horizontal, other: nil):
            Output_init_in_by(width: 1, height: nil),
        
        Input_init_in_by(value: nil, axis: .horizontal, other: nil):
            Output_init_in_by(width: nil, height: nil),
        
        Input_init_in_by(value: nil, axis: .vertical, other: 2):
            Output_init_in_by(width: 2, height: nil),
        
        Input_init_in_by(value: 1, axis: .vertical, other: nil):
            Output_init_in_by(width: nil, height: 1),
        
        Input_init_in_by(value: 0, axis: .horizontal, other: 10):
            Output_init_in_by(width: 0, height: 10),
        
        Input_init_in_by(value: 0, axis: .vertical, other: 10):
            Output_init_in_by(width: 10, height: 0),
        
        Input_init_in_by(value: -5, axis: .horizontal, other: 3):
            Output_init_in_by(width: -5, height: 3),
        
        Input_init_in_by(value: -5, axis: .vertical, other: 3):
            Output_init_in_by(width: 3, height: -5),
        
        Input_init_in_by(value: .infinity, axis: .horizontal, other: 4):
            Output_init_in_by(width: .infinity, height: 4),
        
        Input_init_in_by(value: .infinity, axis: .vertical, other: 4):
            Output_init_in_by(width: 4, height: .infinity),
        
        Input_init_in_by(value: .nan, axis: .horizontal, other: 6):
            Output_init_in_by(width: .nan, height: 6),
        
        Input_init_in_by(value: .nan, axis: .vertical, other: 6):
            Output_init_in_by(width: 6, height: .nan)
    ]

    
    @Test(arguments: init_in_by_expectations) func test_init_in_by(input: Input_init_in_by, output: Output_init_in_by) {
        let implAxis: MySwiftUICore.Axis = input.axis == .horizontal ? .horizontal : .vertical
        let impl = MySwiftUICore.ProposedViewSize(input.value, in: implAxis, by: input.other)
        let original = SwiftUI.ProposedViewSize(input.value, in: input.axis, by: input.other)
        
        #expect(impl.width?.bitPattern == original.width?.bitPattern)
        #expect(impl.height?.bitPattern == original.height?.bitPattern)
    }
}

extension ProposedViewSizeTests {
    struct Input_subscript_axis: Hashable {
        let initialWidth: CGFloat?
        let initialHeight: CGFloat?
        let axis: SwiftUI.Axis
        let setValue: CGFloat?
        let modifyDelta: CGFloat?
    }
    
    struct Output_subscript_axis {
        let afterSetWidth: CGFloat?
        let afterSetHeight: CGFloat?
        let readAfterSet: CGFloat?
        let afterModifyWidth: CGFloat?
        let afterModifyHeight: CGFloat?
        let readAfterModify: CGFloat?
    }
    
    static let subscript_axis_expectations: [Input_subscript_axis: Output_subscript_axis] = [
        Input_subscript_axis(
            initialWidth: 10,
            initialHeight: 20,
            axis: .horizontal,
            setValue: 100,
            modifyDelta: 10
        ): Output_subscript_axis(
            afterSetWidth: 100,
            afterSetHeight: 20,
            readAfterSet: 100,
            afterModifyWidth: 110,
            afterModifyHeight: 20,
            readAfterModify: 110
        ),
        
        Input_subscript_axis(
            initialWidth: 10,
            initialHeight: 20,
            axis: .vertical,
            setValue: 200,
            modifyDelta: 10
        ): Output_subscript_axis(
            afterSetWidth: 10,
            afterSetHeight: 200,
            readAfterSet: 200,
            afterModifyWidth: 10,
            afterModifyHeight: 210,
            readAfterModify: 210
        ),
        
        Input_subscript_axis(
            initialWidth: CGFloat.nan,
            initialHeight: 20,
            axis: .horizontal,
            setValue: CGFloat.infinity,
            modifyDelta: 1
        ): Output_subscript_axis(
            afterSetWidth: CGFloat.infinity,
            afterSetHeight: 20,
            readAfterSet: CGFloat.infinity,
            afterModifyWidth: CGFloat.infinity,
            afterModifyHeight: 20,
            readAfterModify: CGFloat.infinity
        ),
        
        Input_subscript_axis(
            initialWidth: 10,
            initialHeight: CGFloat.nan,
            axis: .vertical,
            setValue: nil,
            modifyDelta: nil
        ): Output_subscript_axis(
            afterSetWidth: 10,
            afterSetHeight: nil,
            readAfterSet: nil,
            afterModifyWidth: 10,
            afterModifyHeight: nil,
            readAfterModify: nil
        )
    ]
    
    @Test(arguments: Self.subscript_axis_expectations)
    func test_subscript_axis(input: Input_subscript_axis, output: Output_subscript_axis) throws {
        var impl = MySwiftUICore.ProposedViewSize(
            MySwiftUICore._ProposedSize(
                width: input.initialWidth,
                height: input.initialHeight
            )
        )
        
        let implAxis: MySwiftUICore.Axis = input.axis == .horizontal ? .horizontal : .vertical
        impl[implAxis] = input.setValue
        let implReadAfterSet = impl[implAxis]
        
        if let delta = input.modifyDelta {
            var value = try #require(impl[implAxis])
            value += delta
            impl[implAxis] = value
        }
        
        let implReadAfterModify = impl[implAxis]
        
        #expect(impl.width?.bitPattern == output.afterModifyWidth?.bitPattern)
        #expect(impl.height?.bitPattern == output.afterModifyHeight?.bitPattern)
        #expect(implReadAfterSet?.bitPattern == output.readAfterSet?.bitPattern)
        #expect(implReadAfterModify?.bitPattern == output.readAfterModify?.bitPattern)
        
        var original = SwiftUI.ProposedViewSize(
            SwiftUI._ProposedSize(
                width: input.initialWidth,
                height: input.initialHeight
            )
        )
        
        let originalAxis: SwiftUI.Axis = input.axis == .horizontal ? .horizontal : .vertical
        original[originalAxis] = input.setValue
        let originalReadAfterSet = original[originalAxis]
        
        if let delta = input.modifyDelta {
            var value = try #require(original[originalAxis])
            value += delta
            original[originalAxis] = value
        }
        
        let originalReadAfterModify = original[originalAxis]
        
        #expect(original.width?.bitPattern == output.afterModifyWidth?.bitPattern)
        #expect(original.height?.bitPattern == output.afterModifyHeight?.bitPattern)
        #expect(originalReadAfterSet?.bitPattern == output.readAfterSet?.bitPattern)
        #expect(originalReadAfterModify?.bitPattern == output.readAfterModify?.bitPattern)
    }
}
