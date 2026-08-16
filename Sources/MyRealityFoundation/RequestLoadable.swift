// A05BACD5D05BAECBAA46406B7FD2B6C5
private import Foundation

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
    
    @TaskLocal fileprivate static var clientIsOptingOutOfFlickerMitigations = false
    
    static let categoriesSupportingResourceSharingBeforeECSCommits: Set<NetworkSendBlockingCategory> = {
        // $s17RealityFoundation24RequestLoadableUtilitiesC51categoriesSupportingResourceSharingBeforeECSCommitsShyAA27NetworkSendBlockingCategoryOGvpZfiAGyXEfU_
        if let value = UserDefaults.standard.object(forKey: "com.apple.re.syncLoadsShouldBlockECSNetworkSends") as? Bool {
            // <+212>
            if value {
                // <+224>
                return Set(NetworkSendBlockingCategory.allCases)
            } else {
                // <+504>
                return []
            }
        } else {
            // <+260>
            let categories: [NetworkSendBlockingCategory] = NetworkSendBlockingCategory
                .allCases
                .filter { category in
                    // $s17RealityFoundation24RequestLoadableUtilitiesC51categoriesSupportingResourceSharingBeforeECSCommitsShyAA27NetworkSendBlockingCategoryOGvpZfiAGyXEfU_SbAFXEfU_
                    if let value = UserDefaults.standard.object(forKey: "com.apple.re.syncLoadsShouldBlockECSNetworkSends.\(category.rawValue)") as? Bool {
                        return value
                    } else {
                        return true
                    }
                }
            
            return Set(categories)
        }
    }()
    
    static func enforceResourceSharingBeforeECSCommits(_ lodables: [any RequestLoadable]) throws {
        let assetService = __ServiceLocator.shared.assetService
        
        guard assetService.syncLoadsShouldInitiateResourceSharing else {
            return
        }
        
        let endIndex = lodables.endIndex
        var flag = (endIndex == 0) // true -> <+456> / false -> <+440>
        
        for i in lodables.indices {
            let lodable = lodables[i]
            let categories = RequestLoadableUtilities.categoriesSupportingResourceSharingBeforeECSCommits
            let category = lodable.networkSendBlockingCategory
            
            if !categories.contains(category){
                // <+440>
                break
            } else {
                if i == (endIndex &- 1) {
                    flag = true
                    break
                } else {
                    continue
                }
            }
        }
        
        let scheduling: __AssetLoadRequest.ResourceSharingSchedulingRequirement
        if flag {
            // <+456>
            if RequestLoadableUtilities.clientIsOptingOutOfFlickerMitigations {
                scheduling = .initiateNowAndWaitForPeers(blockECSUpdateSends: false)
            } else {
                scheduling = .initiateNowAndWaitForPeers(blockECSUpdateSends: true)
            }
            // <+496>
        } else {
            // <+440>
            scheduling = .initiateNowAndWaitForPeers(blockECSUpdateSends: false)
            // <+496>
        }
        
        // <+496>
        let request = try __AssetLoadRequest(assetService: assetService, resourceSharingScheduling: scheduling)
        request.setCompletionHandler { success in
            // $s17RealityFoundation24RequestLoadableUtilitiesC38enforceResourceSharingBeforeECSCommitsyySayAA0cD0_pGKFZySbcfU0_TA
            assertUnimplemented()
        }
        
        for lodable in lodables {
            lodable.addToLoadRequest(request)
        }
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
