// 1136DDC987AEEDFF1217B91AA2732172
private import Synchronization

extension ContentStyle.MaterialResolved {
    @inline(always) // 원래 없음
    var effects: [DisplayList.Effect] {
        switch self.material.id {
        case .intelligenceLightSource_Unreactive, .intelligenceLightSource_AudioReactive:
            return []
        case .coreMaterial, .provider, .layers, .ultraThin, .thin, .regular, .thick, .ultraThick, .systemBars, .pinched, .selected, .disabled, .vibrantGlassContent, .darkerGlass, .lighterGlass, .ultraDarkerGlass:
            let style = ContentStyle.MaterialStyle(
                material: self.material,
                base: ContentStyle.Style(
                    id: self.id,
                    primitive: self.primitive
                )
            )
            
            return CoreMaterialCache.shared.withLock { cache in
                return cache[style]
            }
        }
    }
}

// nominal type descriptor가 없음
fileprivate struct CoreMaterialCache {
    static let shared = Mutex(CoreMaterialCache())
    
    static func parseColor(_: Any?) -> Color.ResolvedHDR? {
        assertUnimplemented()
    }
    
    private var layers: [Material.ResolvedMaterial: [Material.Layer]] = [:]
    private var effects: [ContentStyle.MaterialStyle: [DisplayList.Effect]] = [:]
    
    private init() {}
    
    subscript(material: Material.ResolvedMaterial) -> [Material.Layer] {
        mutating get {
            if let existing = self.layers[material] {
                return existing
            }
            
            // <+104>
            let layers = self.load(material: material)
            self.layers[material] = layers
            
            return layers
        }
    }
    
    subscript(style: ContentStyle.MaterialStyle) -> [DisplayList.Effect] {
        mutating get {
            if let existing = self.effects[style] {
                return existing
            }
            
            // <+124>
            let effects = self.loadEffects(style: style)
            self.effects[style] = effects
            
            return effects
        }
    }
    
    private func loadEffects(style: ContentStyle.MaterialStyle) -> [DisplayList.Effect] {
        assertUnimplemented()
    }
    
    private func loadBlendModeEffect(_: [String : Any]) -> DisplayList.Effect? {
        assertUnimplemented()
    }
    
    private func loadTintAlphaEffect(_: [String : Any]) -> DisplayList.Effect? {
        assertUnimplemented()
    }
    
    private func load(material: Material.ResolvedMaterial) -> [Material.Layer] {
        assertUnimplemented()
    }
}
