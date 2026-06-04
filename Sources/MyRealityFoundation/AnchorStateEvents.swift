@available(visionOS 26.0, iOS 26.0, macCatalyst 26.0, macOS 26.0, tvOS 26.0, *)
public enum AnchorStateEvents {
    @available(visionOS 26.0, iOS 26.0, macCatalyst 26.0, macOS 26.0, *)
    public struct DidAnchor : Event {
        @available(visionOS 26.0, iOS 26.0, macCatalyst 26.0, macOS 26.0, *)
        public enum Reason : Sendable, Equatable {
            case newAnchor
            case reanchor
            
            public static func == (a: AnchorStateEvents.DidAnchor.Reason, b: AnchorStateEvents.DidAnchor.Reason) -> Bool {
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
        
        public let entity: Entity
        
        public let reason: AnchorStateEvents.DidAnchor.Reason
    }
    
    @available(visionOS 26.0, iOS 26.0, macCatalyst 26.0, macOS 26.0, *)
    public struct WillUnanchor : Event {
        @available(visionOS 26.0, iOS 26.0, macCatalyst 26.0, macOS 26.0, *)
        public enum Reason : Sendable, Hashable {
            case anchorDisqualified
            case authorizationFailed
            
            public static func == (a: AnchorStateEvents.WillUnanchor.Reason, b: AnchorStateEvents.WillUnanchor.Reason) -> Bool {
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
        
        public let entity: Entity
        
        public let reason: AnchorStateEvents.WillUnanchor.Reason
    }
    
    @available(visionOS 26.0, iOS 26.0, macCatalyst 26.0, macOS 26.0, *)
    public struct DidFailToAnchor : Event {
        @available(visionOS 26.0, iOS 26.0, macCatalyst 26.0, macOS 26.0, *)
        public enum Reason : Sendable, Hashable {
            case addAnchorFailed
            case maximumLimitReached
            case anchorNotSupported
            case unspecified
            
            public static func == (a: AnchorStateEvents.DidFailToAnchor.Reason, b: AnchorStateEvents.DidFailToAnchor.Reason) -> Bool {
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
        
        public let entity: Entity
        
        public let reason: AnchorStateEvents.DidFailToAnchor.Reason
    }
}

@available(tvOS 26.0, visionOS 26.0, iOS 26.0, macCatalyst 26.0, macOS 26.0, *)
extension AnchorStateEvents.DidAnchor.Reason : Hashable {}
