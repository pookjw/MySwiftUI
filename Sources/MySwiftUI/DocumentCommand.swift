// 0F42DDF44729C152DA9EC9F6F4D00118
internal import MySwiftUICore

extension EnvironmentValues {
    @inline(always) // 원래 없음
    var documentCommands: PlatformItemList {
        get {
            return self[EnvironmentValues.DocumentCommandsKey.self]
        }
        set {
            self[EnvironmentValues.DocumentCommandsKey.self] = newValue
        }
    }
    
    fileprivate struct DocumentCommandsKey : EnvironmentKey {
        @safe nonisolated(unsafe) static let defaultValue = PlatformItemList(items: [])
    }
}
