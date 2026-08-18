@available(visionOS 2.0, iOS 18.0, macCatalyst 18.0, macOS 15.0, tvOS 26.0, *)
public struct Reverb : Hashable, Sendable {
    @safe public static let anechoic: Reverb = {
        assertUnimplemented()
    }()
    
    public static func preset(_ preset: Reverb.Preset) -> Reverb {
        assertUnimplemented()
    }
    
    public static func == (a: Reverb, b: Reverb) -> Bool {
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

@available(visionOS 2.0, iOS 18.0, macCatalyst 18.0, macOS 15.0, tvOS 26.0, *)
extension Reverb {
    public struct Preset : Hashable, Sendable {
        @safe public static let outside: Reverb.Preset = {
            assertUnimplemented()
        }()
        
        @safe public static let concertHall: Reverb.Preset = {
            assertUnimplemented()
        }()
        
        @safe public static let veryLargeRoom: Reverb.Preset = {
            assertUnimplemented()
        }()
        
        @safe public static let largeRoom: Reverb.Preset = {
            assertUnimplemented()
        }()
        
        @safe public static let largeRoomTreated: Reverb.Preset = {
            assertUnimplemented()
        }()
        
        @safe public static let mediumRoomDry: Reverb.Preset = {
            assertUnimplemented()
        }()
        
        @safe public static let mediumRoomTreated: Reverb.Preset = {
            assertUnimplemented()
        }()
        
        @safe public static let smallRoomBright: Reverb.Preset = {
            assertUnimplemented()
        }()
        
        @safe public static let smallRoom: Reverb.Preset = {
            assertUnimplemented()
        }()
        
        @safe public static let verySmallRoomBright: Reverb.Preset = {
            assertUnimplemented()
        }()
        
        public static func == (a: Reverb.Preset, b: Reverb.Preset) -> Bool {
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
}
