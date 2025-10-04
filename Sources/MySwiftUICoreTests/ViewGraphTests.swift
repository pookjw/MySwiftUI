private import _SwiftUICorePrivate
@testable @_private(sourceFile: "_GraphInputs.swift") private import MySwiftUICore
internal import Testing
private import SwiftUI

struct ViewGraphTests {
    @Test
    func test_updateGraphPhase() {
        let impl = MySwiftUICore.ViewGraph(rootViewType: MySwiftUICore.EmptyView.self, requestedOutputs: .defaults)
        let native = _SwiftUICorePrivate.ViewGraph(rootViewType: SwiftUI.EmptyView.self, requestedOutputs: .defaults)

        #expect(impl.data.phase.value == native.data.phase.value)

        do {
            impl.updateGraphPhase(oldParentPhase: nil, newParentPhase: .invalid)
            native.updateGraphPhase(oldParentPhase: nil, newParentPhase: .invalid)
            #expect(impl.data.phase.value == native.data.phase.value)
        }

        do {
            var oldI = MySwiftUICore._GraphInputs.Phase()
            oldI.resetSeed = 7
            oldI.isBeingRemoved = false

            var newI = MySwiftUICore._GraphInputs.Phase()
            newI.resetSeed = 7
            newI.isBeingRemoved = true

            var oldN = SwiftUICore._GraphInputs.Phase()
            oldN.resetSeed = 7
            oldN.isBeingRemoved = false

            var newN = SwiftUICore._GraphInputs.Phase()
            newN.resetSeed = 7
            newN.isBeingRemoved = true

            impl.updateGraphPhase(oldParentPhase: oldI, newParentPhase: newI)
            native.updateGraphPhase(oldParentPhase: oldN, newParentPhase: newN)
            #expect(impl.data.phase.value == native.data.phase.value)
        }

        do {
            var oldI = MySwiftUICore._GraphInputs.Phase()
            oldI.resetSeed = 10
            oldI.isBeingRemoved = false

            var newI = MySwiftUICore._GraphInputs.Phase()
            newI.resetSeed = 11
            newI.isBeingRemoved = false

            var oldN = SwiftUICore._GraphInputs.Phase()
            oldN.resetSeed = 10
            oldN.isBeingRemoved = false

            var newN = SwiftUICore._GraphInputs.Phase()
            newN.resetSeed = 11
            newN.isBeingRemoved = false

            impl.updateGraphPhase(oldParentPhase: oldI, newParentPhase: newI)
            native.updateGraphPhase(oldParentPhase: oldN, newParentPhase: newN)
            #expect(impl.data.phase.value == native.data.phase.value)
        }

        do {
            var oldI = MySwiftUICore._GraphInputs.Phase()
            oldI.resetSeed = 42
            oldI.isBeingRemoved = false

            var newI = MySwiftUICore._GraphInputs.Phase()
            newI.resetSeed = 42
            newI.isBeingRemoved = true

            var oldN = SwiftUICore._GraphInputs.Phase()
            oldN.resetSeed = 42
            oldN.isBeingRemoved = false

            var newN = SwiftUICore._GraphInputs.Phase()
            newN.resetSeed = 42
            newN.isBeingRemoved = true

            impl.updateGraphPhase(oldParentPhase: oldI, newParentPhase: newI)
            native.updateGraphPhase(oldParentPhase: oldN, newParentPhase: newN)
            #expect(impl.data.phase.value == native.data.phase.value)
        }

        do {
            var oldI = MySwiftUICore._GraphInputs.Phase()
            oldI.resetSeed = 7
            oldI.isBeingRemoved = false

            var newI = MySwiftUICore._GraphInputs.Phase()
            newI.resetSeed = 7
            newI.isBeingRemoved = false

            var oldN = SwiftUICore._GraphInputs.Phase()
            oldN.resetSeed = 7
            oldN.isBeingRemoved = false

            var newN = SwiftUICore._GraphInputs.Phase()
            newN.resetSeed = 7
            newN.isBeingRemoved = false

            impl.updateGraphPhase(oldParentPhase: oldI, newParentPhase: newI)
            native.updateGraphPhase(oldParentPhase: oldN, newParentPhase: newN)
            #expect(impl.data.phase.value == native.data.phase.value)
        }

        do {
            impl.updateGraphPhase(oldParentPhase: nil, newParentPhase: .invalid)
            native.updateGraphPhase(oldParentPhase: nil, newParentPhase: .invalid)
            #expect(impl.data.phase.value == native.data.phase.value)

            var o1I = MySwiftUICore._GraphInputs.Phase()
            o1I.resetSeed = 1
            o1I.isBeingRemoved = false
            
            var n1I = MySwiftUICore._GraphInputs.Phase()
            n1I.resetSeed = 3
            n1I.isBeingRemoved = false
            
            var o1N = SwiftUICore._GraphInputs.Phase()
            o1N.resetSeed = 1
            o1N.isBeingRemoved = false
            
            var n1N = SwiftUICore._GraphInputs.Phase()
            n1N.resetSeed = 3
            n1N.isBeingRemoved = false
            
            impl.updateGraphPhase(oldParentPhase: o1I, newParentPhase: n1I)
            native.updateGraphPhase(oldParentPhase: o1N, newParentPhase: n1N)
            #expect(impl.data.phase.value == native.data.phase.value)

            var o2I = MySwiftUICore._GraphInputs.Phase(); o2I.resetSeed = 4;  o2I.isBeingRemoved = true
            var n2I = MySwiftUICore._GraphInputs.Phase(); n2I.resetSeed = 4;  n2I.isBeingRemoved = false
            var o2N = SwiftUICore._GraphInputs.Phase();   o2N.resetSeed = 4;  o2N.isBeingRemoved = true
            var n2N = SwiftUICore._GraphInputs.Phase();   n2N.resetSeed = 4;  n2N.isBeingRemoved = false
            impl.updateGraphPhase(oldParentPhase: o2I, newParentPhase: n2I)
            native.updateGraphPhase(oldParentPhase: o2N, newParentPhase: n2N)
            #expect(impl.data.phase.value == native.data.phase.value)
        }
    }
}

extension SwiftUICore._GraphInputs.Phase {
    fileprivate var value: UInt32 {
        Mirror(reflecting: self).descendant("value") as! UInt32
    }
}
