public import UIKit
private import MySwiftUI

fileprivate struct MyPredicate : ViewInputPredicate {
    static func evaluate(inputs: _GraphInputs) -> Bool {
        return true
    }
}

fileprivate struct MyView : View {
    var body: some View {
        Color.black
            .staticIf(
                MyPredicate(),
                then: { _ in
                    Color.black
                },
                else: { _ in
                    Color.white
                }
            )
    }
}

public final class StaticIfViewController : UIViewController {
    public override func loadView() {
        self.view = _UIHostingView(rootView: MyView())
    }
}
