// EB1EEB38755A34D46BFF2AE8785813E0

struct CustomViewCountCache {
    private var counts: UnsafeMutablePointer<CustomViewCountCache.Count>
    private var modifierOptions: CustomViewCountCache.ModifierOptions?
}

extension CustomViewCountCache {
    fileprivate struct ModifierOptions {
        private let options: _ViewListInputs.Options
        private let baseOptions: _GraphInputs.Options
        private var inputID: UniqueID
    }
    
    fileprivate struct Count {
        // TODO
    }
}
