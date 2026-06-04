@available(visionOS 2.0, iOS 18.0, macCatalyst 18.0, macOS 15.0, tvOS 26.0, *)
public struct Reverb : Hashable, Sendable {
    @safe public static nonisolated(unsafe) let anechoic: Reverb = {
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
        @safe public static nonisolated(unsafe) let outside: Reverb.Preset = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let concertHall: Reverb.Preset = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let veryLargeRoom: Reverb.Preset = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let largeRoom: Reverb.Preset = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let largeRoomTreated: Reverb.Preset = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let mediumRoomDry: Reverb.Preset = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let mediumRoomTreated: Reverb.Preset = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let smallRoomBright: Reverb.Preset = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let smallRoom: Reverb.Preset = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let verySmallRoomBright: Reverb.Preset = {
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
