package struct PlatformItem {
    // TODO
}

extension PlatformItem {
    package struct AccessibilityContent {
        // TODO
    }
    
    package struct Features : OptionSet {
        package let rawValue: Int
        
        package init(rawValue: Int) {
            self.rawValue = rawValue
        }
        
        static var titleSubtitle: PlatformItem.Features {
            return [.secondaryText, .text]
        }
        
        static var textStyle: PlatformItem.Features {
            return PlatformItem.Features(rawValue: (1 << 4))
        }
        
        static var geometry: PlatformItem.Features {
            return PlatformItem.Features(rawValue: (1 << 5))
        }
        
        static var selection: PlatformItem.Features {
            return PlatformItem.Features(rawValue: (1 << 6))
        }
        
        static var secondaryText: PlatformItem.Features {
            return PlatformItem.Features(rawValue: (1 << 7))
        }
        
        static var iconText: PlatformItem.Features {
            return PlatformItem.Features(rawValue: (1 << 8))
        }
        
        static var children: PlatformItem.Features {
            return PlatformItem.Features(rawValue: (1 << 9))
        }
        
        package static var accessibility: PlatformItem.Features {
            return PlatformItem.Features(rawValue: (1 << 10))
        }
        
        static var textAccessibility: PlatformItem.Features {
            return PlatformItem.Features(rawValue: (1 << 11))
        }
        
        static var staticKind: PlatformItem.Features {
            return PlatformItem.Features(rawValue: (1 << 0))
        }
        
        static var text: PlatformItem.Features {
            return PlatformItem.Features(rawValue: (1 << 1))
        }
        
        static var image: PlatformItem.Features {
            return PlatformItem.Features(rawValue: (1 << 2))
        }
        
        static var shape: PlatformItem.Features {
            return PlatformItem.Features(rawValue: (1 << 3))
        }
    }
}

package struct PlatformItems {
    // TODO
}

extension _ViewInputs {
    package func requestsPlatformItem(for features: PlatformItem.Features) -> Bool {
        assertUnimplemented()
    }
}

package protocol PlatformItemsModifier : UnaryViewModifier {
    static nonisolated var features: PlatformItem.Features { get }
    static nonisolated func updateItems(modifier: Self, items: inout PlatformItems)
}

extension PlatformItemsModifier {
    package nonisolated static func _makeView(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        assertUnimplemented()
    }
    
    package nonisolated static func transformPlatformItemsOutputs<T : PlatformItemsModifier>(_: inout _ViewOutputs, inputs: _ViewInputs, modifier: _GraphValue<T>) {
        assertUnimplemented()
    }
}
