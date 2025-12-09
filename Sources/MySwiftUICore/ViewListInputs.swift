private import AttributeGraph

public struct _ViewListInputs {
    private var base: _GraphInputs
    private var implicitID: Int
    private var options: _ViewListInputs.Options
    @OptionalAttribute private var traits: ViewTraitCollection?
    private var traitKeys: ViewTraitKeys?
    private var containerContext: ContainerContext.Type?
    private weak var debugReplaceableViewCount: MutableBox<Int?>?
    private var contentOffset: ViewContentOffset?
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
