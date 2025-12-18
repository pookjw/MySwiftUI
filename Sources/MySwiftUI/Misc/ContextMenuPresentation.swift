internal import MySwiftUICore
private import MRUIKit
private import Spatial

struct ContextMenuPresentation {
    private(set) var isPresented: Binding<Bool>
    private var isPresentedValue: Bool
    private var location: Anchor<Point3D>
}

extension ContextMenuPresentation {
    struct Key: HostPreferenceKey {
        static let defaultValue: [ViewIdentity: ContextMenuPresentation] = [:]
        
        static func reduce(value: inout [ViewIdentity : ContextMenuPresentation], nextValue: () -> [ViewIdentity : ContextMenuPresentation]) {
            fatalError("TODO")
        }
    }
}
