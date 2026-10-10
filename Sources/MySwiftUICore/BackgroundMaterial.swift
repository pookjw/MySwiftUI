// B2CCB444DA7C00CFB13A219298A4122C
#if SwiftUICompatibility
public import SwiftUI
#endif

#if SwiftUICompatibility
extension EnvironmentValues {
    public var backgroundMaterial: SwiftUI::Material? {
        get {
            return self[BackgroundMaterialKey.self]
        }
        set {
            self[BackgroundMaterialKey.self] = newValue
        }
    }
}

fileprivate struct BackgroundMaterialKey : EnvironmentKey {
    static var defaultValue: SwiftUI::Material? {
        return nil
    }
}

#else
extension EnvironmentValues {
    public var backgroundMaterial: MySwiftUICore::Material? {
        get {
            return self[BackgroundMaterialKey.self]
        }
        set {
            self[BackgroundMaterialKey.self] = newValue
        }
    }
}

fileprivate struct BackgroundMaterialKey : EnvironmentKey {
    static var defaultValue: MySwiftUICore::Material? {
        return nil
    }
}
#endif

extension MySwiftUICore::_ShapeStyle_Shape {
#if SwiftUICompatibility
    // 원래 없음
    @inline(always)
    func resolveStyle(level: Int, material: SwiftUI::Material) -> _ShapeStyle_Pack.Style {
        return self.resolveStyle(id: ContentStyle.ID(truncatingLevel: level), material: material)
    }
    
    fileprivate func resolveStyle(id: ContentStyle.ID, material: SwiftUI::Material) -> _ShapeStyle_Pack.Style {
        /*
         id -> x0 -> w25
         material -> x1 -> x23/w24/w27
         */
        if let provider = self.environment.materialProvider(for: material) {
            // <+112>
//            provider.resolveLayers(in: SwiftUI::Material.Context(environment: <#T##EnvironmentValues#>))
        } else {
            // <+272>
        }
        assertUnimplemented()
    }
#else
    // 원래 없음
    @inline(always)
    func resolveStyle(level: Int, material: MySwiftUICore::Material) -> _ShapeStyle_Pack.Style {
        return self.resolveStyle(id: ContentStyle.ID(truncatingLevel: level), material: material)
    }
    
    fileprivate func resolveStyle(id: ContentStyle.ID, material: MySwiftUICore::Material) -> _ShapeStyle_Pack.Style {
        assertUnimplemented()
    }
#endif
}
