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
    static let shared: Mutex<CoreMaterialCache> = {
        assertUnimplemented()
    }()
    
    static func parseColor(_: Any?) -> Color.ResolvedHDR? {
        assertUnimplemented()
    }
    
    subscript(material: Material.ResolvedMaterial) -> [Material.Layer] {
        assertUnimplemented()
    }
    
    subscript(style: ContentStyle.MaterialStyle) -> [DisplayList.Effect] {
        assertUnimplemented()
    }
    
    func loadEffects(style: ContentStyle.MaterialStyle) -> [DisplayList.Effect] {
        assertUnimplemented()
    }
    
    func loadBlendModeEffect(_: [String : Any]) -> DisplayList.Effect? {
        assertUnimplemented()
    }
    
    func loadTintAlphaEffect(_: [String : Any]) -> DisplayList.Effect? {
        assertUnimplemented()
    }
    
    func load(material: Material.ResolvedMaterial) -> [Material.Layer] {
        assertUnimplemented()
    }
}
