internal import MySwiftUICore
private import DesignLibrary

struct ResetGlassEnvironmentModifier {
    static func makeEnvironment(_ environment: inout EnvironmentValues) {
        // environment -> x0 -> x23
        // <+624>
        environment.glassMaterialContainerStyle = nil
        environment.glassFrost = .automatic
        environment.glassMaterialForeground = false
        
        // <+696>
        if let backgroundMaterial = environment.backgroundMaterial {
            // <+768>
            let provider = backgroundMaterial
                .provider(ofType: DesignLibrary::GlassMaterialProvider.ResolvedStyleProvider.self)
            
            if provider != nil {
                // <+1160>
                environment.backgroundMaterial = nil
                // <+1408>
                // <+1412>
            } else {
                // <+1396>
                // <+1412>
            }
        } else {
            // <+1412>
        }
        
        // <+1412>
        environment.glassMaterialPocketContainer = nil
    }
}
