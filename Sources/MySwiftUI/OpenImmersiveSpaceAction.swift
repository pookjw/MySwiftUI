// E9ADBE8A4025300D40698E090BDABFC1
public import MySwiftUICore
private import os.log
private import MRUIKit

@available(macOS 26.0, visionOS 1.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@MainActor public struct OpenImmersiveSpaceAction: Sendable {
    public enum Result: Sendable {
        case opened
        case userCancelled
        case error
    }
    
    fileprivate private(set) var namespace: SceneList.Namespace
    
    @discardableResult
    @MainActor public func callAsFunction(id: String) async -> OpenImmersiveSpaceAction.Result {
        // $s7SwiftUI24OpenImmersiveSpaceActionV14callAsFunction2idAC6ResultOSS_tYaFTY1_
        let strategy = SceneNavigationStrategy_Phone.shared
        
        if strategy.sceneNavigationEnabled {
            let result = await strategy.openImmersiveSpace(
                namespace: self.namespace,
                id: id,
                remoteSessionInfo: nil,
                initialData: nil
            )
            
            // $s7SwiftUI24OpenImmersiveSpaceActionV14callAsFunction2idAC6ResultOSS_tYaFTY3_
            return self.translatedResult(result)
        }
        
        // <+204>
        unsafe os_log(.fault, log: .runtimeIssuesLog, "Use of OpenImmersiveSpaceAction requires the SwiftUI App Lifecycle.")
        return .error
    }
    
    @discardableResult
    @MainActor public func callAsFunction<D>(value: D) async -> OpenImmersiveSpaceAction.Result where D: Decodable, D: Encodable, D: Hashable {
        assertUnimplemented()
    }
    
    @discardableResult
    @MainActor public func callAsFunction<D>(id: String, value: D) async -> OpenImmersiveSpaceAction.Result where D: Decodable, D: Encodable, D: Hashable {
        assertUnimplemented()
    }
    
    fileprivate func translatedResult(_ result: SceneNavigationStrategy_Phone.Result) -> OpenImmersiveSpaceAction.Result {
        // result -> x0 -> x20
        switch result {
        case .failure(let error):
            switch error {
            case .system(let error):
                // <+60>
                for underlyingError in error.underlyingErrors {
                    let nsError = (underlyingError as NSError)
                    if nsError.domain == MRUISceneErrorDomain && nsError.code == MRUISceneError0xc8 {
                        // <+336>
                        return .userCancelled
                    }
                }
                
                return .error
                assertUnimplemented()
            case .userActivityEncoding:
                return .error
            case .invalidRequest:
                return .error
            }
        case .opened:
            return .opened
        }
    }
}

@available(macOS 26.0, visionOS 1.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension EnvironmentValues {
    public var openImmersiveSpace: OpenImmersiveSpaceAction {
        return self[EnvironmentValues.OpenImmersiveSpaceActionKey.self]
    }
    
    fileprivate struct OpenImmersiveSpaceActionKey: EnvironmentKey {
        static var defaultValue: OpenImmersiveSpaceAction {
            return OpenImmersiveSpaceAction(namespace: .app)
        }
    }
}
