public import UIKit
private import MySwiftUI
private import Spatial

fileprivate struct MyView : View {
    var body: some View {
        Color.blue
            .frame(
                minSize: Size3D(width: 100, height: 200, depth: 300),
                idealSize: Size3D(width: 400, height: 500, depth: 600),
                maxSize: Size3D(width: 700, height: 800, depth: 900),
                alignment: Alignment3D.center
            )
    }
}

public final class MinMax3DFrameViewController : UIViewController {
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let hostingController = UIHostingController(rootView: MyView())
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.frame = view.bounds
        hostingController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        hostingController.didMove(toParent: self)
    }
}
