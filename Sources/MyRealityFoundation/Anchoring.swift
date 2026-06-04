public import Foundation
public import simd

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@preconcurrency @MainActor public protocol HasAnchoring : Entity {
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension HasAnchoring {
    @available(macOS 10.15, iOS 13.0, macCatalyst 14.0, *)
    @MainActor @preconcurrency public var anchoring: AnchoringComponent {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(visionOS, deprecated, message: "Anchoring with ARAnchor is not available on visionOS.")
    @MainActor @preconcurrency public var anchorIdentifier: UUID? {
        assertUnimplemented()
    }
    
    @available(macOS 10.15, iOS 13.0, macCatalyst 14.0, *)
    @available(visionOS, deprecated, message: "reanchor(_:preservingWorldTransform:) is not supported on visionOS")
    @MainActor @preconcurrency public func reanchor(_ target: AnchoringComponent.Target, preservingWorldTransform: Bool = true) {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 14.0, tvOS 26.0, *)
public struct AnchoringComponent : Component, Equatable {
    public enum Target : Hashable {
        public struct Alignment : OptionSet {
            @safe public static nonisolated(unsafe) let horizontal: AnchoringComponent.Target.Alignment = {
                assertUnimplemented()
            }()
            
            @safe public static nonisolated(unsafe) let vertical: AnchoringComponent.Target.Alignment = {
                assertUnimplemented()
            }()
            
            @safe public static nonisolated(unsafe) let any: AnchoringComponent.Target.Alignment = {
                assertUnimplemented()
            }()
            
            public let rawValue: UInt8
            
            public init(rawValue: UInt8) {
                assertUnimplemented()
            }
            
            @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 14.0, *)
            public typealias ArrayLiteralElement = AnchoringComponent.Target.Alignment
            @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 14.0, *)
            public typealias Element = AnchoringComponent.Target.Alignment
            @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 14.0, *)
            public typealias RawValue = UInt8
        }
        
        public struct Classification : OptionSet {
            @safe public static nonisolated(unsafe) let wall: AnchoringComponent.Target.Classification = {
                assertUnimplemented()
            }()
            
            @safe public static nonisolated(unsafe) let floor: AnchoringComponent.Target.Classification = {
                assertUnimplemented()
            }()
            
            @safe public static nonisolated(unsafe) let ceiling: AnchoringComponent.Target.Classification = {
                assertUnimplemented()
            }()
            
            @safe public static nonisolated(unsafe) let table: AnchoringComponent.Target.Classification = {
                assertUnimplemented()
            }()
            
            @safe public static nonisolated(unsafe) let seat: AnchoringComponent.Target.Classification = {
                assertUnimplemented()
            }()
            
            @safe public static nonisolated(unsafe) let any: AnchoringComponent.Target.Classification = {
                assertUnimplemented()
            }()
            
            public let rawValue: UInt64
            public init(rawValue: UInt64) {
                assertUnimplemented()
            }
            
            @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 14.0, *)
            public typealias ArrayLiteralElement = AnchoringComponent.Target.Classification
            @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 14.0, *)
            public typealias Element = AnchoringComponent.Target.Classification
            @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 14.0, *)
            public typealias RawValue = UInt64
        }
        
        @available(visionOS 1.0, *)
        @available(macOS, unavailable)
        @available(iOS, unavailable)
        @available(macCatalyst, unavailable)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        public enum Chirality : Hashable {
            case right
            case left
            case either
            @available(visionOS, unavailable)
            case any
            
            public static func == (a: AnchoringComponent.Target.Chirality, b: AnchoringComponent.Target.Chirality) -> Bool {
                assertUnimplemented()
            }
            
            public func hash(into hasher: inout Hasher) {
                assertUnimplemented()
            }
        }
        
        @available(visionOS, unavailable)
        case camera
        case world(transform: float4x4)
        @available(visionOS, unavailable)
        case anchor(identifier: UUID)
        case plane(_: AnchoringComponent.Target.Alignment, classification: AnchoringComponent.Target.Classification, minimumBounds: SIMD2<Float>)
        case image(group: String, name: String)
        @available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, *)
        case referenceImage(from: AnchoringComponent.ImageAnchoringSource)
        @available(visionOS, unavailable, message: "Object anchoring with group and name is not available on visionOS.")
        case object(group: String, name: String)
        @available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, *)
        case referenceObject(from: AnchoringComponent.ObjectAnchoringSource)
        @available(visionOS, unavailable, message: "Face anchoring is not available on visionOS.")
        case face
        @available(visionOS, unavailable, message: "Body anchoring is not available on visionOS.")
        case body
        @available(visionOS 1.0, *)
        @available(macOS, unavailable)
        @available(iOS, unavailable)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        case hand(_: AnchoringComponent.Target.Chirality, location: AnchoringComponent.Target.HandLocation)
        @available(visionOS 1.0, *)
        @available(macOS, unavailable)
        @available(iOS, unavailable)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        case head
        @available(visionOS 26.0, *)
        @available(macOS, unavailable)
        @available(iOS, unavailable)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        case accessory(from: AnchoringComponent.AccessoryAnchoringSource, location: AnchoringComponent.AccessoryLocation)
        
        public static func == (lhs: AnchoringComponent.Target, rhs: AnchoringComponent.Target) -> Bool {
            assertUnimplemented()
        }
        
        public func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
    }
    
    public let target: AnchoringComponent.Target = {
        assertUnimplemented()
    }()
    
    public init(_ target: AnchoringComponent.Target) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func __toCore(_ component: __ComponentRef) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func __fromCore(_ coreComponent: __ComponentRef) -> AnchoringComponent {
        assertUnimplemented()
    }
    
    public static var __coreComponentType: __ComponentTypeRef {
        assertUnimplemented()
    }
    
    public static func == (a: AnchoringComponent, b: AnchoringComponent) -> Bool {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, *)
@available(macOS, unavailable, introduced: 26.0)
@available(iOS, unavailable, introduced: 18.0)
@available(macCatalyst, unavailable, introduced: 18.0)
@available(tvOS, unavailable)
extension AnchoringComponent.Target {
    @available(visionOS 1.0, *)
    @available(macOS, unavailable, introduced: 26.0)
    @available(iOS, unavailable, introduced: 18.0)
    @available(macCatalyst, unavailable, introduced: 18.0)
    @available(tvOS, unavailable)
    public struct HandLocation : Hashable {
        @safe public static nonisolated(unsafe) let wrist: AnchoringComponent.Target.HandLocation = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let palm: AnchoringComponent.Target.HandLocation = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let indexFingerTip: AnchoringComponent.Target.HandLocation = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let thumbTip: AnchoringComponent.Target.HandLocation = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let aboveHand: AnchoringComponent.Target.HandLocation = {
            assertUnimplemented()
        }()
        
        public static func == (a: AnchoringComponent.Target.HandLocation, b: AnchoringComponent.Target.HandLocation) -> Bool {
            assertUnimplemented()
        }
        
        public func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
        
        public var hashValue: Int {
            assertUnimplemented()
        }
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension AnchoringComponent {
    public struct TrackingMode : Hashable {
        @safe public static nonisolated(unsafe) let once: AnchoringComponent.TrackingMode = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let continuous: AnchoringComponent.TrackingMode = {
            assertUnimplemented()
        }()
        
        @available(visionOS 2.0, *)
        @safe public static nonisolated(unsafe) let predicted: AnchoringComponent.TrackingMode = {
            assertUnimplemented()
        }()
        
        public static func == (a: AnchoringComponent.TrackingMode, b: AnchoringComponent.TrackingMode) -> Bool {
            assertUnimplemented()
        }
        
        public func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
        
        public var hashValue: Int {
            assertUnimplemented()
        }
    }
    
    public var trackingMode: AnchoringComponent.TrackingMode {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public init(_ target: AnchoringComponent.Target, trackingMode: AnchoringComponent.TrackingMode) {
        assertUnimplemented()
    }
}

extension AnchoringComponent {
    @available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
    public struct ObjectAnchoringSource : Equatable, Hashable {
        @available(visionOS 2.0, *)
        @available(macOS, unavailable)
        @available(iOS, unavailable)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        public init(_ url: URL) {
            assertUnimplemented()
        }
        
        @available(visionOS 2.0, *)
        @available(macOS, unavailable)
        @available(iOS, unavailable)
        @available(tvOS, unavailable)
        @available(watchOS, unavailable)
        public init(name: String, in bundle: Bundle = .main) {
            assertUnimplemented()
        }
        
        @available(macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
        @available(visionOS, unavailable, message: "Object anchoring with group and name is not available on visionOS.")
        public init(group: String, name: String) {
            assertUnimplemented()
        }
        
        public static func == (a: AnchoringComponent.ObjectAnchoringSource, b: AnchoringComponent.ObjectAnchoringSource) -> Bool {
            assertUnimplemented()
        }
        
        public func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
        
        public var hashValue: Int {
            assertUnimplemented()
        }
    }
    
    @available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
    public struct ImageAnchoringSource : Equatable, Hashable {
        @available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, *)
        public init(_ url: URL, physicalSize: SIMD2<Float>) {
            assertUnimplemented()
        }
        
        @available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, *)
        public init(group: String, name: String) {
            assertUnimplemented()
        }
        
        public static func == (a: AnchoringComponent.ImageAnchoringSource, b: AnchoringComponent.ImageAnchoringSource) -> Bool {
            assertUnimplemented()
        }
        
        public func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
        
        public var hashValue: Int {
            assertUnimplemented()
        }
    }
    
    @available(visionOS 26.0, *)
    @available(macOS, unavailable)
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public struct AccessoryAnchoringSource : Equatable, Hashable {
        public func locationName(named: String) -> AnchoringComponent.AccessoryLocation? {
            assertUnimplemented()
        }
        
        public var accessoryLocations: [AnchoringComponent.AccessoryLocation] {
            assertUnimplemented()
        }
        
        public static func == (a: AnchoringComponent.AccessoryAnchoringSource, b: AnchoringComponent.AccessoryAnchoringSource) -> Bool {
            assertUnimplemented()
        }
        
        public func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
        
        public var hashValue: Int {
            assertUnimplemented()
        }
    }
    
    @available(visionOS 26.0, *)
    @available(macOS, unavailable)
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public struct AccessoryLocation : Equatable, Hashable {
        @safe public static nonisolated(unsafe) let origin: AnchoringComponent.AccessoryLocation = {
            assertUnimplemented()
        }()
        
        public var name: String? {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        @usableFromInline
        internal init(name: String) {
            assertUnimplemented()
        }
        
        @usableFromInline
        internal init() {
            assertUnimplemented()
        }
        
        public static func == (a: AnchoringComponent.AccessoryLocation, b: AnchoringComponent.AccessoryLocation) -> Bool {
            assertUnimplemented()
        }
        
        public func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
        
        public var hashValue: Int {
            assertUnimplemented()
        }
    }
}

@available(visionOS 2.0, *)
@available(macOS, unavailable, introduced: 26.0)
@available(iOS, unavailable, introduced: 26.0)
@available(macCatalyst, unavailable, introduced: 26.0)
@available(tvOS, unavailable)
extension AnchoringComponent.Target.HandLocation {
    @available(visionOS 2.0, *)
    @available(macOS, unavailable, introduced: 26.0)
    @available(iOS, unavailable, introduced: 26.0)
    @available(macCatalyst, unavailable, introduced: 26.0)
    @available(tvOS, unavailable)
    public struct HandJoint : Hashable {
        @safe public static nonisolated(unsafe) let wrist: AnchoringComponent.Target.HandLocation.HandJoint = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let thumbTip: AnchoringComponent.Target.HandLocation.HandJoint = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let indexFingerTip: AnchoringComponent.Target.HandLocation.HandJoint = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let thumbKnuckle: AnchoringComponent.Target.HandLocation.HandJoint = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let thumbIntermediateBase: AnchoringComponent.Target.HandLocation.HandJoint = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let thumbIntermediateTip: AnchoringComponent.Target.HandLocation.HandJoint = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let indexFingerMetacarpal: AnchoringComponent.Target.HandLocation.HandJoint = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let indexFingerKnuckle: AnchoringComponent.Target.HandLocation.HandJoint = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let indexFingerIntermediateBase: AnchoringComponent.Target.HandLocation.HandJoint = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let indexFingerIntermediateTip: AnchoringComponent.Target.HandLocation.HandJoint = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let middleFingerMetacarpal: AnchoringComponent.Target.HandLocation.HandJoint = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let middleFingerKnuckle: AnchoringComponent.Target.HandLocation.HandJoint = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let middleFingerIntermediateBase: AnchoringComponent.Target.HandLocation.HandJoint = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let middleFingerIntermediateTip: AnchoringComponent.Target.HandLocation.HandJoint = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let middleFingerTip: AnchoringComponent.Target.HandLocation.HandJoint = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let ringFingerMetacarpal: AnchoringComponent.Target.HandLocation.HandJoint = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let ringFingerKnuckle: AnchoringComponent.Target.HandLocation.HandJoint = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let ringFingerIntermediateBase: AnchoringComponent.Target.HandLocation.HandJoint = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let ringFingerIntermediateTip: AnchoringComponent.Target.HandLocation.HandJoint = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let ringFingerTip: AnchoringComponent.Target.HandLocation.HandJoint = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let littleFingerMetacarpal: AnchoringComponent.Target.HandLocation.HandJoint = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let littleFingerKnuckle: AnchoringComponent.Target.HandLocation.HandJoint = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let littleFingerIntermediateBase: AnchoringComponent.Target.HandLocation.HandJoint = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let littleFingerIntermediateTip: AnchoringComponent.Target.HandLocation.HandJoint = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let littleFingerTip: AnchoringComponent.Target.HandLocation.HandJoint = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let forearmWrist: AnchoringComponent.Target.HandLocation.HandJoint = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let forearmArm: AnchoringComponent.Target.HandLocation.HandJoint = {
            assertUnimplemented()
        }()
        
        public static func == (a: AnchoringComponent.Target.HandLocation.HandJoint, b: AnchoringComponent.Target.HandLocation.HandJoint) -> Bool {
            assertUnimplemented()
        }
        
        public func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
        
        public var hashValue: Int {
            assertUnimplemented()
        }
    }
    
    @available(visionOS 2.0, *)
    @available(macOS, unavailable, introduced: 26.0)
    @available(iOS, unavailable, introduced: 26.0)
    @available(tvOS, unavailable)
    public static func joint(for joint: AnchoringComponent.Target.HandLocation.HandJoint) -> AnchoringComponent.Target.HandLocation {
        assertUnimplemented()
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension AnchoringComponent {
    public enum PhysicsSimulation : Hashable {
        case none
        case isolated
        
        public static func == (a: AnchoringComponent.PhysicsSimulation, b: AnchoringComponent.PhysicsSimulation) -> Bool {
            assertUnimplemented()
        }
        
        public func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
        
        public var hashValue: Int {
            assertUnimplemented()
        }
    }
    
    public init(_ target: AnchoringComponent.Target, trackingMode: AnchoringComponent.TrackingMode, physicsSimulation: AnchoringComponent.PhysicsSimulation = .isolated) {
        assertUnimplemented()
    }
    
    public var physicsSimulation: AnchoringComponent.PhysicsSimulation {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public enum __REAnchoringType : Codable, Equatable {
    case surface(alignment: __REAnchoringType.Alignment, classification: __REAnchoringType.Classification)
    case image(url: URL, physicalWidth: Measurement<UnitLength>)
    case face(meshVertex: Int)
    case object(url: URL)
    
    public enum Name : String, CaseIterable {
        case surface
        case image
        case face
        case object
        
        public init?(rawValue: String) {
            assertUnimplemented()
        }
        
        @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
        public typealias AllCases = [__REAnchoringType.Name]
        @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
        public typealias RawValue = String
        
        nonisolated public static var allCases: [__REAnchoringType.Name] {
            assertUnimplemented()
        }
        
        public var rawValue: String {
            assertUnimplemented()
        }
    }
    
    public var name: __REAnchoringType.Name {
        assertUnimplemented()
    }
    
    public init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
    
    public func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    public struct Alignment : OptionSet, Codable {
        public init(rawValue: Int) {
            assertUnimplemented()
        }
        
        public let rawValue: Int
        
        @safe public static nonisolated(unsafe) let horizontal: __REAnchoringType.Alignment = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let vertical: __REAnchoringType.Alignment = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let any: __REAnchoringType.Alignment = {
            assertUnimplemented()
        }()
        
        @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
        public typealias ArrayLiteralElement = __REAnchoringType.Alignment
        @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
        public typealias Element = __REAnchoringType.Alignment
        @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
        public typealias RawValue = Int
    }
    
    public struct Classification : OptionSet, Codable {
        public init(rawValue: Int) {
            assertUnimplemented()
        }
        
        public let rawValue: Int
        
        @safe public static nonisolated(unsafe) let wall: __REAnchoringType.Classification = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let floor: __REAnchoringType.Classification = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let ceiling: __REAnchoringType.Classification = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let table: __REAnchoringType.Classification = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let seat: __REAnchoringType.Classification = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let any: __REAnchoringType.Classification = {
            assertUnimplemented()
        }()
        
        @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
        public typealias ArrayLiteralElement = __REAnchoringType.Classification
        @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
        public typealias Element = __REAnchoringType.Classification
        @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
        public typealias RawValue = Int
    }
    
    public static func == (a: __REAnchoringType, b: __REAnchoringType) -> Bool {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension __REAnchoringType.Name : Equatable {
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension __REAnchoringType.Name : Hashable {
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension __REAnchoringType.Name : RawRepresentable {
}
