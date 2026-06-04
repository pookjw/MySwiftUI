@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@preconcurrency @MainActor public protocol HasModel : HasTransform {
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension HasModel {
    @MainActor @preconcurrency public var model: ModelComponent? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }
    
    @available(macOS 11.0, iOS 14.0, macCatalyst 14.0, tvOS 26.0, *)
    @MainActor @preconcurrency public var modelDebugOptions: ModelDebugOptionsComponent? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(*, unavailable, renamed: "modelDebugOptions")
    @MainActor @preconcurrency public var debugModel: ModelDebugOptionsComponent? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension HasModel {
    @MainActor @preconcurrency public var jointNames: [String] {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public var jointTransforms: [Transform] {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension HasModel {
    @MainActor @preconcurrency public var blendWeights: [[Float]] {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public var blendWeightNames: [[String]] {
        get {
            assertUnimplemented()
        }
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension HasModel {
    @MainActor @preconcurrency public func __generateCollisionShape() {
        assertUnimplemented()
    }
}
