#warning("TODO")

package struct AccessibilityVisibility: OptionSet, Hashable, Codable {
    package static var element: AccessibilityVisibility {
        return AccessibilityVisibility(rawValue: 1 << 0)
    }
    
    package static var container: AccessibilityVisibility {
        return AccessibilityVisibility(rawValue: 1 << 1)
    }
    
    package static var hidden: AccessibilityVisibility {
        return AccessibilityVisibility(rawValue: 1 << 2)
    }
    
    package static var transparent: AccessibilityVisibility {
        return AccessibilityVisibility(rawValue: 1 << 3)
    }
    
    package static var ignored: AccessibilityVisibility {
        return AccessibilityVisibility(rawValue: 1 << 4)
    }
    
    package static var host: AccessibilityVisibility {
        return AccessibilityVisibility(rawValue: 1 << 5)
    }
    
    package static var childrenIgnored: AccessibilityVisibility {
        return AccessibilityVisibility(rawValue: 1 << 6)
    }
    
    package static var stack: AccessibilityVisibility {
        return AccessibilityVisibility(rawValue: 1 << 7)
    }
    
    package static var containerElement: AccessibilityVisibility {
        return [.element, .container]
    }
    
    package let rawValue: UInt32
    
    package init(rawValue: UInt32) {
        self.rawValue = rawValue
    }
}
