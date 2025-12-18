internal import MySwiftUICore

extension ViewRendererHost {
    func setPreferenceBridge(_ preferenceBridge: PreferenceBridge) {
        fatalError("TODO")
    }
    
    var shouldCreateUIInteractions: Bool {
        guard let hostingView else {
            return false
        }
        
        return hostingView.shouldCreateUIInteractions
    }
}
