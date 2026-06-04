@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public protocol __RKEntityInteractionService : AnyObject {
    var areInteractionsEnabled: Bool { get set }
    var customTriggerIdentifiers: [String] { get }
    var customActionIdentifiers: [String] { get }
    @discardableResult
    func performInteractions(matchingCustomTriggerWithIdentifier customTriggerIdentifier: String, customArguments: [String : String]?, overrides: [String : Entity]?) -> Bool
    func setCustomActionHandler(for identifier: String, handler: ((Entity?) -> Void)?)
    @discardableResult
    func __performInteractions(matchingCustomTriggerWithIdentifier customTriggerIdentifier: String, with customArguments: [String : String], on elements: [Entity]?) -> Bool
    func __setCustomPackageActionHandler(withIdentifier identifier: String, actionHandler: ((Entity?, [String : String]?) -> Void)?)
    var automaticallyInvokesStartTrigger: Bool { get set }
}
