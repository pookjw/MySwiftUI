private import _SwiftUICorePrivate
@testable @_private(sourceFile: "ViewSize3D.swift") private import MySwiftUICore
internal import Testing
private import SwiftUI
private import Spatial

struct ViewSize3DTests {
    // TODO
}

extension _SwiftUICorePrivate.ViewSize3D {
    fileprivate var _proposal: Size3D {
        return Mirror(reflecting: self).descendant("_prpoposal") as! Size3D
    }
}
