public import UIKit
private import MySwiftUI

fileprivate struct MyView : View {
    var body: some View {
        VStack {
            GeometryReader { proxy in
                HStack {
                    Color.red
                        .frame(
                            minWidth: nil,
                            idealWidth: proxy.size.width * 0.3,
                            maxWidth: proxy.size.width * 0.5,
                            minHeight: nil,
                            idealHeight: nil,
                            maxHeight: nil,
                            minDepth: 50,
                            idealDepth: 100,
                            maxDepth: 200,
                            alignment: .center
                        )
                    
                    Color.blue
                        .frame(
                            minWidth: proxy.size.width * 0.7,
                            idealWidth: nil,
                            maxWidth: proxy.size.width * 0.8,
                            minHeight: nil,
                            idealHeight: nil,
                            maxHeight: nil,
                            minDepth: 100,
                            idealDepth: 150,
                            maxDepth: 250,
                            alignment: .center
                        )
                }
            }
            GeometryReader { proxy in
                VStack {
                    Color.green
                        .frame(
                            minWidth: nil,
                            idealWidth: nil,
                            maxWidth: nil,
                            minHeight: nil,
                            idealHeight: proxy.size.height * 0.3,
                            maxHeight: proxy.size.height * 0.5,
                            minDepth: 50,
                            idealDepth: 100,
                            maxDepth: 200,
                            alignment: .center
                        )
                    
                    Color.orange
                        .frame(
                            minWidth: nil,
                            idealWidth: nil,
                            maxWidth: nil,
                            minHeight: proxy.size.height * 0.7,
                            idealHeight: nil,
                            maxHeight: proxy.size.height * 0.8,
                            minDepth: 100,
                            idealDepth: 150,
                            maxDepth: 250,
                            alignment: .center
                        )
                }
            }
        }
    }
}

public final class FlexFrameLayout3DViewController : UIViewController {
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
