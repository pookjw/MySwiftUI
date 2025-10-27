// 6C8682BE0755616E63B02969BA08C92E

#warning("TODO")

extension _GraphInputs {
    func pushStableType(_ type: Any.Type) {
        guard options.contains(.needsStableDisplayListIDs) else {
            return
        }
        pushScope(id: makeStableTypeData(type))
    }
    
    fileprivate func pushScope<T: StronglyHashable>(id: T) {
        fatalError("TODO")
    }
}
