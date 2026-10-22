extension EnvironmentValues {
    package var isVibrantColorStyleEnabled: Bool {
        get {
            return self[VibrantColorStyleKey.self] != nil
        }
        set {
            if newValue {
                if isLinkedOnOrAfter(.v6) {
                    self[VibrantColorStyleKey.self] = SystemVibrantColorStyle_Vision.self
                } else {
                    self[VibrantColorStyleKey.self] = SystemVibrantColorStyle.self
                }
            } else {
                self[VibrantColorStyleKey.self] = nil
            }
        }
    }
    
    var vibrantColorStyle: (any VibrantColorStyle.Type)? {
        get {
            return self[VibrantColorStyleKey.self]
        }
        set {
            self[VibrantColorStyleKey.self] = newValue
        }
    }
}

protocol VibrantColorStyle {
    static func apply(_ colorType: SystemColorType, color: Color, material: Material, to shape: inout _ShapeStyle_Shape)
}

struct SystemVibrantColorStyle_Vision : VibrantColorStyle {
    static func apply(_ colorType: SystemColorType, color: Color, material: Material, to shape: inout _ShapeStyle_Shape) {
        if shape.environment.isVisionEnabled {
            // <+124>
            switch shape.operation {
            case .prepareText(_):
                // <+248>
                shape.result = .preparedText(.foregroundKeyColor)
            case .resolveStyle(let name, let levels):
                // <+148>
                guard !levels.isEmpty else {
                    return
                }
                
                let style = shape.resolveStyle(
                    id: ContentStyle.ID(truncatingLevel: levels.lowerBound),
                    material: material,
                    color: color
                )
                
                var pack: _ShapeStyle_Pack
                switch shape.result {
                case .pack(let _pack):
                    pack = _pack
                    shape.result = .none
                case .preparedText, .style, .color, .bool, .none:
                    pack = _ShapeStyle_Pack()
                }
                
                // <+524>
                pack[name, levels.lowerBound] = style
                shape.result = .pack(pack)
            case .fallbackColor(_):
                // <+272>
                let resolved = shape
                    .environment
                    .systemColorDefinition
                    .value(for: colorType, environment: shape.environment)
                
                shape.result = .color(Color(box: ColorBox(ResolvedColorProvider(color: resolved))))
            case .copyStyle, .modifyBackground, .multiLevel, .primaryStyle:
                // <+216>
                return
            }
        } else {
            // <+180>
            SystemVibrantColorStyle.apply(colorType, color: color, material: material, to: &shape)
        }
    }
}

struct SystemVibrantColorStyle : VibrantColorStyle {
    static func apply(_ colorType: SystemColorType, color: Color, material: Material, to shape: inout _ShapeStyle_Shape) {
        assertUnimplemented()
    }
}

fileprivate struct VibrantColorStyleKey : EnvironmentKey {
    static var defaultValue: (any VibrantColorStyle.Type)? {
        return nil
    }
}
