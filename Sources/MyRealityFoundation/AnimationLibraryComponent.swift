@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public struct AnimationLibraryComponent : Component, ExpressibleByDictionaryLiteral {
    public init(dictionaryLiteral elements: (String, AnimationResource)...) {
        assertUnimplemented()
    }
    
    public init(animations: [String : AnimationResource]) {
        assertUnimplemented()
    }
    
    public init() {
        assertUnimplemented()
    }
    
    public var defaultAnimation: AnimationResource? {
        get {
            assertUnimplemented()
        }
    }
    
    public var defaultKey: String? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public mutating func removeAll(resource: AnimationResource) {
        assertUnimplemented()
    }
    
    public var unkeyedResources: [AnimationResource]? {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public static func __fromCore(_ coreComponent: __ComponentRef) -> AnimationLibraryComponent {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func __toCore(_ coreComponent: __ComponentRef) {
        assertUnimplemented()
    }
    
    public static var __coreComponentType: __ComponentTypeRef {
        get {
            assertUnimplemented()
        }
    }
    
    public var animations: AnimationLibraryComponent.AnimationCollection
    
    public struct AnimationCollection : Collection {
        public typealias Element = (key: String, value: AnimationResource)
        
        public typealias SubSequence = Slice<AnimationLibraryComponent.AnimationCollection>
        
        public init(dictionaryLiteral elements: (String, AnimationResource)...) {
            assertUnimplemented()
        }
        
        public var count: Int {
            get {
                assertUnimplemented()
            }
        }
        
        public var isEmpty: Bool {
            get {
                assertUnimplemented()
            }
        }
        
        public var startIndex: AnimationLibraryComponent.AnimationCollection.Index {
            get {
                assertUnimplemented()
            }
        }
        
        public var endIndex: AnimationLibraryComponent.AnimationCollection.Index {
            get {
                assertUnimplemented()
            }
        }
        
        public __consuming func makeIterator() -> AnimationLibraryComponent.AnimationCollection.Iterator {
            assertUnimplemented()
        }
        
        public subscript(key: String) -> AnimationResource? {
            get {
                assertUnimplemented()
            }
            set(newValue) {
                assertUnimplemented()
            }
        }
        
        public subscript(bounds: Range<AnimationLibraryComponent.AnimationCollection.Index>) -> AnimationLibraryComponent.AnimationCollection.SubSequence {
            get {
                assertUnimplemented()
            }
        }
        
        public func index(after i: AnimationLibraryComponent.AnimationCollection.Index) -> AnimationLibraryComponent.AnimationCollection.Index {
            assertUnimplemented()
        }
        
        public func formIndex(after i: inout AnimationLibraryComponent.AnimationCollection.Index) {
            assertUnimplemented()
        }
        
        public subscript(position: AnimationLibraryComponent.AnimationCollection.Index) -> AnimationLibraryComponent.AnimationCollection.Element {
            get {
                assertUnimplemented()
            }
        }
        
        public struct Iterator : IteratorProtocol {
            public mutating func next() -> AnimationLibraryComponent.AnimationCollection.Element? {
                assertUnimplemented()
            }
            
            @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
            public typealias Element = AnimationLibraryComponent.AnimationCollection.Element
        }
        
        public struct Index : Comparable, Hashable, Sendable {
            public static func < (lhs: AnimationLibraryComponent.AnimationCollection.Index, rhs: AnimationLibraryComponent.AnimationCollection.Index) -> Bool {
                assertUnimplemented()
            }
            
            public static func == (a: AnimationLibraryComponent.AnimationCollection.Index, b: AnimationLibraryComponent.AnimationCollection.Index) -> Bool {
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
        
        @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
        public typealias Indices = DefaultIndices<AnimationLibraryComponent.AnimationCollection>
    }
    
    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias Key = String
    
    @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
    public typealias Value = AnimationResource
}
