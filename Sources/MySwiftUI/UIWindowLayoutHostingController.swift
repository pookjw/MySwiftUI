// 1D3224F5185670D36FFEB48E24E43C4F
internal import MySwiftUICore
internal import UIKit

final class UIWindowLayoutHostingController<Content : View>: UIHostingController<Content> {
    override init(_hostingView: _UIHostingView<Content>) {
        assertUnimplemented()
    }
    
    @MainActor public dynamic required init?(coder: NSCoder) {
        assertUnimplemented()
    }
    
    func setLayout(_ layout: AnyWindowLayout) {
        assertUnimplemented()
    }
    
    func viewDidChangeWindowLayoutComputer(computer: WindowLayoutComputer) {
        assertUnimplemented()
    }
    
    fileprivate func updateWindowScenePlacement(with placement: WindowPlacement) {
        assertUnimplemented()
    }
    
    // TODO
}
