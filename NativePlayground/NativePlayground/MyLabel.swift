//
//  MyLabel.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 4/10/26.
//

import UIKit
import SwiftUI

struct MyLabel : UIViewRepresentable {
    let text: String
    
    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .preferredFont(forTextStyle: .extraLargeTitle)
        label.textAlignment = .center
        return label
    }
    
    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.text = text
    }
}
