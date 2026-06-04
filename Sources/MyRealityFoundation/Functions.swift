public import Darwin

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public func blend(_ x: any BlendTreeNode, _ y: any BlendTreeNode, name: String = "", isAdditive: Bool = false) -> any BlendTreeNode {
    assertUnimplemented()
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public func blend(sources: [any BlendTreeNode], name: String = "", isAdditive: Bool = false) -> any BlendTreeNode {
    assertUnimplemented()
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@inlinable internal func convertToDegrees(radians: Float) -> Float {
        return radians * Float(180.0) / Float.pi
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@inlinable internal func convertToRadians(degrees: Float) -> Float {
        return degrees * Float.pi / Float(180.0)
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@inlinable internal func log2RoundUp(_ v: Int32) -> Int32 {
        return Int32(ceil(log2(Double(v))))
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public func __RERetain(_ ptr: OpaquePointer?) {
    assertUnimplemented()
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public func __RERelease(_ ptr: OpaquePointer?) {
    assertUnimplemented()
}
