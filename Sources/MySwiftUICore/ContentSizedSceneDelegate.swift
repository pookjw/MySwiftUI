
package protocol ContentSizedSceneDelegate : AnyObject {
    var coalesceChanges: Bool { get }
    func updateSceneSizing(_ sizingPreferences: SizingPreferences, transaction: Transaction?)
    func updateSceneSizing(changes: [(SizingPreferences, Transaction?)])
    var shouldIgnoreBoundsAnimations: Bool { get }
}

extension ContentSizedSceneDelegate {
    package func updateSceneSizing(_ sizingPreferences: SizingPreferences, transaction: Transaction?) {
        assertUnimplemented()
    }
    
    package func updateSceneSizing(changes: [(SizingPreferences, Transaction?)]) {
        assertUnimplemented()
    }
}
