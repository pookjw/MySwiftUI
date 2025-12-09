private import AttributeGraph

public struct _ViewListInputs {
    private var base: _GraphInputs
    private var implicitID: Int
    var options: _ViewListInputs.Options
    @OptionalAttribute private var traits: ViewTraitCollection?
    private var traitKeys: ViewTraitKeys?
    private var containerContext: (any ContainerContext.Type)?
    private weak var debugReplaceableViewCount: MutableBox<Int?>?
    private var contentOffset: ViewContentOffset?
    
    init(_ base: _GraphInputs, implicitID: Int = 0, options: _ViewListInputs.Options = []) {
        self._traits = OptionalAttribute()
        self.traitKeys = ViewTraitKeys()
        self.containerContext = nil
        self.debugReplaceableViewCount = nil
        self.contentOffset = nil
        
        self.base = base
        self.implicitID = implicitID
        self.options = options
    }
}

extension _ViewListInputs {
    struct Options: OptionSet {
        static var canTransition: _ViewListInputs.Options {
            return _ViewListInputs.Options(rawValue: 1 << 0)
        }
        
        static var disableTransitions: _ViewListInputs.Options {
            return _ViewListInputs.Options(rawValue: 1 << 1)
        }
        
        static var requiresDepthAndSections: _ViewListInputs.Options {
            return _ViewListInputs.Options(rawValue: 1 << 2)
        }
        
        static var requiresNonEmptyGroupParent: _ViewListInputs.Options {
            return _ViewListInputs.Options(rawValue: 1 << 3)
        }
        
        static var isNonEmptyParent: _ViewListInputs.Options {
            return _ViewListInputs.Options(rawValue: 1 << 4)
        }
        
        static var resetHeaderStyleContext: _ViewListInputs.Options {
            return _ViewListInputs.Options(rawValue: 1 << 5)
        }
        
        static var resetFooterStyleContext: _ViewListInputs.Options {
            return _ViewListInputs.Options(rawValue: 1 << 6)
        }
        
        static var layoutPriorityIsTrait: _ViewListInputs.Options {
            return _ViewListInputs.Options(rawValue: 1 << 7)
        }
        
        static var requiresSections: _ViewListInputs.Options {
            return _ViewListInputs.Options(rawValue: 1 << 8)
        }
        
        static var tupleViewCreatesUnaryElements: _ViewListInputs.Options {
            return _ViewListInputs.Options(rawValue: 1 << 9)
        }
        
        static var previewContext: _ViewListInputs.Options {
            return _ViewListInputs.Options(rawValue: 1 << 10)
        }
        
        static var needsDynamicTraits: _ViewListInputs.Options {
            return _ViewListInputs.Options(rawValue: 1 << 11)
        }
        
        static var allowsNestedSections: _ViewListInputs.Options {
            return _ViewListInputs.Options(rawValue: 1 << 12)
        }
        
        static var sectionsConcatenateFooter: _ViewListInputs.Options {
            return _ViewListInputs.Options(rawValue: 1 << 13)
        }
        
        static var needsArchivedAnimationTraits: _ViewListInputs.Options {
            return _ViewListInputs.Options(rawValue: 1 << 14)
        }
        
        static var sectionsAreHierarchical: _ViewListInputs.Options {
            return _ViewListInputs.Options(rawValue: 1 << 15)
        }
        
        static var requiresContentOffsets: _ViewListInputs.Options {
            return _ViewListInputs.Options(rawValue: 1 << 16)
        }
        
        let rawValue: Int
    }
}

extension _ViewInputs {
    var implicitRootBodyInputs: _ViewListInputs {
        let options = _ViewListInputs.Options(rawValue: self[ViewListOptionsInput.self])
        // <+88>
        var inputs = _ViewListInputs(base, options: options)
        
        if !isLinkedOnOrAfter(.v6) {
            inputs.options.insert(.disableTransitions)
        }
        
        return inputs
    }
}
