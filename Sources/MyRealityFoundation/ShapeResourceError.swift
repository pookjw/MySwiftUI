public import Foundation

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
public enum ShapeResourceError : LocalizedError {
    case staticMeshGenerationFailed
    case convexPolyhedronGenerationFailed
    
    public var errorDescription: String? {
        get {
            assertUnimplemented()
        }
    }
    
    public static func == (a: ShapeResourceError, b: ShapeResourceError) -> Bool {
        assertUnimplemented()
    }
    
    public func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
    
    public var hashValue: Int {
        get {
            assertUnimplemented()
        }
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension ShapeResourceError : Equatable {}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension ShapeResourceError : Hashable {}
