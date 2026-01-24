//
//  Conditiona2lViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 1/24/26.
//

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
    var flag = false
}

fileprivate struct MyView: View {
    let model: Model
    
    var body: some View {
        MyLayout(model: model) {
            if model.flag {
                Color.white
            } else {
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
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        MainActor.assumeIsolated {
            for subview in subviews {
                subview.place(
                    at: CGPoint(
                        x: bounds.origin.x + (model.flag ? 60 : 90),
                        y: bounds.origin.y + (model.flag ? 60 : 90)
                    ),
                    anchor: .topLeading,
                    proposal: ProposedViewSize(
                        width: bounds.size.width * (model.flag ? 0.5 : 0.3),
                        height: bounds.size.height * (model.flag ? 0.3 : 0.5)
                    )
                )
            }
        }
    }
}

final class Conditiona2lViewController: UIViewController {
    @ViewLoading private var toggleBarButtonItem: UIBarButtonItem
    private let model = Model()
    private var task: Task<Void, Never>?
    
    deinit {
        task?.cancel()
    }
    
    override func loadView() {
        let rootView = MyView(model: model)
        view = _UIHostingView(rootView: rootView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let toggleBarButtonItem = UIBarButtonItem(title: "Toggle", image: UIImage(systemName: model.flag ? "ant.fill" : "ant"), target: self, action: #selector(toggleBarButtonItemDidTrigger(_:)))
        self.toggleBarButtonItem = toggleBarButtonItem
        navigationItem.rightBarButtonItem = toggleBarButtonItem
        
        task?.cancel()
        task = Task { [model] in
            do {
                while true {
                    try await Task.sleep(for: .seconds(1))
                    model.flag.toggle()
                }
            } catch {}
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        toggleBarButtonItem.image = UIImage(systemName: model.flag ? "ant.fill" : "ant")
    }
    
    @objc private func toggleBarButtonItemDidTrigger(_ sender: UIBarButtonItem) {
        model.flag.toggle()
    }
}
