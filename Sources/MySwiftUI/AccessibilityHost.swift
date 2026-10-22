
protocol AccessibilityHost : AnyObject {
    func accessibilityDidChange(nodes: () -> [AccessibilityNode])
}
