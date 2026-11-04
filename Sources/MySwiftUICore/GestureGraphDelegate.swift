package protocol GestureGraphDelegate: AnyObject {
    func enqueueAction(_ action: @MainActor @Sendable () -> Void)
}
