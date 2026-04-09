internal import MySwiftUICore

struct PresentedImmersiveSpaceContent<Content: ImmersiveSpaceContent>: View {
    @safe private nonisolated(unsafe) let rootContent: PresentedImmersiveSpaceContent<Content>.ContentEvaluationBehavior
    
    nonisolated init(rootContent: PresentedImmersiveSpaceContent<Content>.ContentEvaluationBehavior) {
        self.rootContent = rootContent
    }
    
    var body: some View {
        rootContent
            .makeContent
            ._determineView()
    }
}

extension PresentedImmersiveSpaceContent {
    enum ContentEvaluationBehavior {
        case eager(Content)
        case lazy(() -> Content)
        
        var makeContent: Content {
            switch self {
            case .eager(let content):
                return content
            case .lazy(let content):
                return content()
            }
        }
    }
}
