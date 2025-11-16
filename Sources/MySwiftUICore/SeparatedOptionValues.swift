#warning("TODO")

struct SeparatedOptionValues {
    private(set) var storage: [SeparatedOptionValues.Key: any AnySeparatedOption] = [:]
}

extension SeparatedOptionValues {
    struct Key: Hashable {
        private var type: [AnySeparatedOptionKey.Type]
        
        func hash(into hasher: inout Hasher) {
            fatalError("TODO")
        }
        
        static func == (lhs: SeparatedOptionValues.Key, rhs: SeparatedOptionValues.Key) -> Bool {
            fatalError("TODO")
        }
    }
}

protocol AnySeparatedOptionKey {
    // TODO
}

protocol AnySeparatedOption {
    // TODO
}
