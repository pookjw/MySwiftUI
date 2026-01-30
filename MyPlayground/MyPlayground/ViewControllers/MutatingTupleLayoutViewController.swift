import UIKit
#if USE_ORIGINAL_SWIFTUI
import SwiftUI
#else
import MySwiftUI
#endif
import Observation

@MainActor
@Observable
fileprivate final class Model {
    var count = 1
}

fileprivate struct MyView: View {
    let model: Model
    
    var body: some View {
        MyLayout(model: model) {
            if model.count >= 1 {
                Color.black
            }
            
            if model.count >= 2 {
                Color.white
            }
            
            if model.count >= 3 {
                Color.black
            }
            
            if model.count >= 4 {
                Color.white
            }
            
            if model.count >= 5 {
                Color.black
            }
        }
    }
}

fileprivate struct MyLayout: Layout {
    let model: Model
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        return CGSize(width: proposal.width!, height: proposal.height!)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: MySwiftUICore.ProposedViewSize, subviews: Subviews, cache: inout ()) {
        MainActor.assumeIsolated {
            let width = bounds.width / CGFloat(subviews.count)
            
            for (index, subview) in subviews.enumerated() {
                subview.place(
                    at: CGPoint(
                        x: bounds.minX + width * CGFloat(index),
                        y: bounds.minY + (model.count & 2 == 0 ? bounds.height * 0.5 : 0)
                    ),
                    anchor: .topLeading,
                    proposal: ProposedViewSize(
                        width: width,
                        height: bounds.height * 0.5
                    )
                )
            }
        }
    }
}

final class MutatingTupleLayoutViewController: UIViewController {
    private let model = Model()
    
    override func loadView() {
        let rootView = MyView(model: model)
        view = _UIHostingView(rootView: rootView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let stepper = UIStepper()
        stepper.minimumValue = 0
        stepper.maximumValue = 5
        stepper.stepValue = 1
        stepper.value = Double(model.count)
        stepper.isContinuous = false
        stepper.autorepeat = false
        stepper.addTarget(self, action: #selector(stepperValueChanged(_:)), for: .valueChanged)
        
        let barButtonItem = UIBarButtonItem(customView: stepper)
        navigationItem.rightBarButtonItem = barButtonItem
    }
    
    @objc private func stepperValueChanged(_ sender: UIStepper) {
        model.count = Int(sender.value)
    }
}
