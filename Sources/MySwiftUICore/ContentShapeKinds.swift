public struct ContentShapeKinds: OptionSet, Sendable {
    public var rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public static let interaction: ContentShapeKinds = {
        fatalError("TODO") 
    }()
    
    @available(watchOS, unavailable)
    @available(tvOS, unavailable)
    public static let dragPreview: ContentShapeKinds = {
        fatalError("TODO") 
    }()
    
    @available(tvOS 17.0, *)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    public static let contextMenuPreview: ContentShapeKinds = {
        fatalError("TODO") 
    }()
    
    @available(tvOS 18.0, *)
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    public static let hoverEffect: ContentShapeKinds = {
        fatalError("TODO") 
    }()
    
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(visionOS, unavailable)
    public static let focusEffect: ContentShapeKinds = {
        fatalError("TODO") 
    }()
    
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    public static let accessibility: ContentShapeKinds = {
        fatalError("TODO") 
    }()
}
