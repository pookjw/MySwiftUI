//
//  CustomLayoutViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 1/22/26.
//

import UIKit
#if USE_ORIGINAL_SWIFTUI
import SwiftUI
#else
import MySwiftUI
#endif

private struct MyView: View {
    var body: some View {
        MyLayout {
            Color.white
        }
    }
}

private struct MyLayout: Layout {
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        return CGSize(width: proposal.width!, height: proposal.height!)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        for subview in subviews {
            subview.place(
                at: CGPoint(
                    x: bounds.origin.x + 60,
                    y: bounds.origin.y + 90
                ),
                anchor: .topLeading,
                proposal: ProposedViewSize(
                    width: bounds.size.width * 0.5,
                    height: bounds.size.height * 0.5
                )
            )
        }
    }
}

final class CustomLayoutViewController: UIViewController {
    override func loadView() {
        view = _UIHostingView(rootView: MyView())
    }
}
