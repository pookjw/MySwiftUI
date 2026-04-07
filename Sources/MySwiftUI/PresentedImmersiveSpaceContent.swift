internal import MySwiftUICore

struct PresentedImmersiveSpaceContent<Content: ImmersiveSpaceContent>: View {
    @safe private nonisolated(unsafe) let rootContent: PresentedImmersiveSpaceContent<Content>.ContentEvaluationBehavior
    
    nonisolated init(rootContent: PresentedImmersiveSpaceContent<Content>.ContentEvaluationBehavior) {
        self.rootContent = rootContent
    }
    
    var body: some View {
        assertUnimplemented()
    }
}

extension PresentedImmersiveSpaceContent {
    enum ContentEvaluationBehavior {
        case eager(Content)
        case lazy(() -> Content)
    }
}
