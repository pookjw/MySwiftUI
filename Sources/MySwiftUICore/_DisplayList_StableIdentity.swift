// 6C8682BE0755616E63B02969BA08C92E


extension _GraphInputs {
    @inline(__always)
    func pushStableType(_ type: Any.Type) {
        guard needsStableDisplayListIDs else {
            return
        }
        pushScope(id: makeStableTypeData(type))
    }
    
    @inline(__always)
    fileprivate func pushScope<T: StronglyHashable>(id: T) {
        fatalError("TODO")
    }
}
