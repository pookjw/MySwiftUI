// 6C8682BE0755616E63B02969BA08C92E

extension _GraphInputs {
    @inline(__always)
    func pushStableIndex(_ index: Int) {
        guard needsStableDisplayListIDs else {
            return
        }
        
        pushScope(id: index)
    }
    
    @inline(__always)
    func pushStableType(_ type: Any.Type) {
        guard needsStableDisplayListIDs else {
            return
        }
        
        pushScope(id: makeStableTypeData(type))
    }
    
    func pushStableID<T: Hashable>(_ id: T) {
        guard needsStableDisplayListIDs else {
            return
        }
        
        fatalError("TODO")
    }
    
    @inline(__always)
    fileprivate func pushScope<T: StronglyHashable>(id: T) {
        fatalError("TODO")
    }
}
