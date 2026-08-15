protocol RequestLoadable {
    var networkSendBlockingCategory: NetworkSendBlockingCategory { get }
    func addToLoadRequest(_ request: __AssetLoadRequest)
}

extension RequestLoadable {
    func enforceResourceSharingBeforeECSCommits() throws {
        assertUnimplemented()
    }
    
    func awaitForResourceSharing() async throws {
        assertUnimplemented()
    }
}

final class RequestLoadableUtilities {
    static func awaitForResourceSharing(_ lodables: [any RequestLoadable]) async throws {
        assertUnimplemented()
    }
    
    static var categoriesSupportingResourceSharingBeforeECSCommits: Set<NetworkSendBlockingCategory> {
        assertUnimplemented()
    }
    
    static func enforceResourceSharingBeforeECSCommits(_ lodables: [RequestLoadable]) throws {
        assertUnimplemented()
    }
}

enum NetworkSendBlockingCategory : String, Hashable, CaseIterable {
     case animation
     case audio
     case environment
     case builtInMaterial
     case shaderGraphMaterial
     case mesh
     case physics
     case texture
     case entityLoad
     case video
 }
