struct DebugReplaceableViewInfo {
    private(set) var countAsZero: Bool
    private(set) var countedAsZero: UnsafeMutablePointer<Bool>?
}
