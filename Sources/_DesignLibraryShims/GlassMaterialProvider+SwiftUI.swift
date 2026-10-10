package import MySwiftUICore
package import DesignLibrary

extension GlassMaterialProvider.ResolvedStyleProvider : MaterialProvider {
    package func resolveLayers(in context: MySwiftUICore.Material.Context) -> [MySwiftUICore.Material.Layer] {
        assertUnimplemented()
    }
    
    package func resolveForegroundStyle(level: Int, in context: MySwiftUICore.Material.Context) -> MySwiftUICore.Material.ForegroundStyle? {
        assertUnimplemented()
    }
    
    package func resolveAdaptiveColor(_ color: MySwiftUICore.Color.ResolvedHDR, in context: MySwiftUICore.Material.Context) -> MySwiftUICore.Material.ForegroundStyle {
        assertUnimplemented()
    }
    
    package func foregroundEnvironment(_ environment: inout MySwiftUICore.EnvironmentValues, for: MySwiftUICore.Material) {
        assertUnimplemented()
    }
    
    package func resolveBackgroundStyle(level: Int, in context: MySwiftUICore.Material.Context) -> MySwiftUICore.Material.ForegroundStyle? {
        assertUnimplemented()
    }
}
