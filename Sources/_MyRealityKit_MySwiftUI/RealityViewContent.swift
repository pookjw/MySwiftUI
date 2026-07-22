public import MySwiftUICore
public import Spatial
private import CoreGraphics
internal import UIKit
internal import MyRealityFoundation
private import CoreRE

@available(visionOS 1.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension RealityViewContent {
    @MainActor @preconcurrency public struct Body<Placeholder> : View where Placeholder : View {
        private let placeholder: Placeholder // 0x0
        private let controller: AttachmentStateControllerBase? // 0x24
        private let make: @MainActor @Sendable (inout RealityViewContent) async -> Void // 0x28
        private let update: (@MainActor (inout RealityViewContent) -> Void)? // 0x2c
        private var _strongModel: State<_RealityViewModel> // 0x30
        
        var strongModel: _RealityViewModel {
            return self._strongModel.wrappedValue
        }
        
        init(
            placeholder: Placeholder,
            controller: AttachmentStateControllerBase?,
            make: @MainActor @Sendable @escaping (inout RealityViewContent) async -> Void,
            update: (@MainActor (inout RealityViewContent) -> Void)?,
            strongModel: _RealityViewModel
        ) {
            self.placeholder = placeholder
            self.controller = controller
            self.make = make
            self.update = update
            self._strongModel = State(wrappedValue: strongModel)
        }
        
        @MainActor @preconcurrency public var body: some View {
            GeometryReader3D { proxy in
                // $s19_RealityKit_SwiftUI0A11ViewContentV4BodyV4bodyQrvgAA01_aE5AsyncVyxG0cD015GeometryProxy3DVcfU_TA
                _RealityViewAsync(
                    make: unsafeBitCast(self.make, to: (@Sendable (inout RealityViewContent) async -> Void).self),
                    update: self.update,
                    placeholder: self.placeholder,
                    proxy: proxy,
                    controller: self.controller,
                    model: self.strongModel,
                    scene: Environment(\.realityKitScene),
                    pointsPerMeter: Environment(\.pointsPerMeter),
                    role: Environment(\.sceneSession?.role),
                    uiScene: Environment(\.sceneSession?.scene),
                    layoutOption: Environment(\.realityViewLayoutOption),
                    componentAddedSubscription: nil
                )
            }
            .frame(
                minWidth: (self.strongModel.idealSize != nil) ? self.strongModel.idealSize!.width : nil,
                idealWidth: (self.strongModel.idealSize != nil) ? self.strongModel.idealSize!.width : nil,
                maxWidth: (self.strongModel.idealSize != nil) ? self.strongModel.idealSize!.width : nil,
                minHeight: (self.strongModel.idealSize != nil) ? self.strongModel.idealSize!.height : nil,
                idealHeight: (self.strongModel.idealSize != nil) ? self.strongModel.idealSize!.height : nil,
                maxHeight: (self.strongModel.idealSize != nil) ? self.strongModel.idealSize!.height : nil,
                minDepth: (self.strongModel.idealSize != nil) ? self.strongModel.idealSize!.depth : nil,
                idealDepth: (self.strongModel.idealSize != nil) ? self.strongModel.idealSize!.depth : nil,
                maxDepth: (self.strongModel.idealSize != nil) ? self.strongModel.idealSize!.depth : nil,
                alignment: .back
            )
        }
    }
}

@available(visionOS 26.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
@MainActor extension RealityViewContent {
    @MainActor public func animate(body: () -> Void, completion: (() -> Void)? = nil) {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
public struct RealityViewContent : RealityViewContentProtocol {
    static let linkedOnOrAfterFall2024OSVersions = RELinkedOnOrAfterFall2024OSVersions()
    static let clientNeedsUninformedMakeClosure: Bool = {
        assertUnimplemented()
    }()
    
    private var _base: MyRealityFoundation.Entity // 0x0
    private var _rep: MyRealityFoundation.Entity // 0x8
    private var contentStorage: RealityViewContent.ContentStorage
    private var transaction: Transaction?
    private var debugOptions: DebugOptions
    var proxy: GeometryProxy3D? // 0x24 (field)
    var role: UISceneSession.Role? // 0x28 (field)
    weak var model: _RealityViewModel? // 0x2c (field)
    var pointsPerMeter: CGFloat // 0x30 (field)
    var scene: MyRealityFoundation.Scene? // 0x34 (field)
    
    public var entities: RealityViewEntityCollection {
        get {
            assertUnimplemented()
        }
        nonmutating set {
            assertUnimplemented()
        }
    }
    
    public func subscribe<E>(to event: E.Type, on sourceObject: (any EventSource)?, componentType: (any MyRealityFoundation.Component.Type)?, _ handler: @escaping (E) -> Void) -> EventSubscription where E : Event {
        assertUnimplemented()
    }
    
    @available(visionOS 1.0, *)
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @available(macOS, unavailable)
    @available(macCatalyst, unavailable)
    public typealias Entities = RealityViewEntityCollection
    
    @inline(always) // 원래 없음
    var baseEntity: MyRealityFoundation.Entity {
        if RealityViewContent.linkedOnOrAfterFall2024OSVersions {
            return self._rep
        } else {
            return self._base
        }
    }
}

@available(visionOS 1.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension RealityViewContent : RealityCoordinateSpaceConverting, RealityCoordinateSpace {
    public func _resolve(in context: __RealityCoordinateSpaceContext) -> __ResolvedRealityCoordinateSpace {
        assertUnimplemented()
    }
    
    public func transform(from: some RealityCoordinateSpace, to: some CoordinateSpaceProtocol) -> AffineTransform3D {
        assertUnimplemented()
    }
    
    public func transform(from: some CoordinateSpaceProtocol, to: some RealityCoordinateSpace) -> AffineTransform3D {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, *)
@available(macOS, unavailable)
@available(macCatalyst, unavailable)
@available(iOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension RealityViewContent.Body : Sendable {}

extension RealityViewContent {
    final class ContentStorage {
        // TODO
    }
}
