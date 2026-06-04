public import ARKit
public import CoreGraphics
public import CoreText
public import UIKit

@available(iOS 13.0, macCatalyst 13.0, visionOS 1.0, tvOS 26.0, *)
@available(macOS, unavailable)
extension MeshResource {
    public typealias Font = UIFont
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension MeshResource {
    @available(tvOS, unavailable)
    @MainActor @preconcurrency public static func generateText(_ string: String, extrusionDepth: Float = 0.25, font: MeshResource.Font = .systemFont(ofSize: MeshResource.Font.systemFontSize), containerFrame: CGRect = CGRect.zero, alignment: CTTextAlignment = .left, lineBreakMode: CTLineBreakMode = .byTruncatingTail) -> MeshResource {
        assertUnimplemented()
    }
    
    @available(tvOS, unavailable)
    @MainActor @preconcurrency public static func __generateText(_ string: String, extrusionDepth: Float = 0.25, font: MeshResource.Font = .systemFont(ofSize: MeshResource.Font.systemFontSize), containerFrame: CGRect = CGRect.zero, alignment: CTTextAlignment = .left, lineBreakMode: CTLineBreakMode = .byTruncatingTail, segmentCount: UInt8 = 6) -> MeshResource {
        assertUnimplemented()
    }
}

extension MeshResource {
    @available(visionOS 2.0, *)
    @available(macOS, unavailable)
    @available(macCatalyst, unavailable)
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @MainActor @preconcurrency convenience public init(from meshAnchor: MeshAnchor) async throws {
        assertUnimplemented()
    }
    
    @available(visionOS 2.0, *)
    @available(macOS, unavailable)
    @available(macCatalyst, unavailable)
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @MainActor @preconcurrency convenience public init(from planeAnchor: PlaneAnchor) async throws {
        assertUnimplemented()
    }
}
