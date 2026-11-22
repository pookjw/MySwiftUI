// 7F70C8A76EE0356881289646072938C0

extension EnvironmentValues {
    @inline(always) // 원래 없음
    var textRendererAddsDrawingGroup: Bool {
        get {
            return self[EnvironmentValues.TextRendererAddsDrawingGroupKey.self]
        }
        set {
            self[EnvironmentValues.TextRendererAddsDrawingGroupKey.self] = newValue
        }
    }
    
    fileprivate struct TextRendererAddsDrawingGroupKey : EnvironmentKey {
        static var defaultValue: Bool {
            return true
        }
    }
}
