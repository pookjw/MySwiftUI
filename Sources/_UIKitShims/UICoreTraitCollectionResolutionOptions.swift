package struct UICoreTraitCollectionResolutionOptions: OptionSet {
    package var forImageAssetsOnly: UICoreTraitCollectionResolutionOptions {
        return UICoreTraitCollectionResolutionOptions(rawValue: 1 << 0)
    }
    
    package let rawValue: Int
    
    package init(rawValue: Int) {
        self.rawValue = rawValue
    }
}
