//
//  MyLabel.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 4/10/26.
//

import UIKit
import MySwiftUI

struct MyLabel : UIViewRepresentable {
    let text: String
    
    func makeUIView(context: Context) -> UILabel {
        let label = UILabel()
        label.text = text
#if swift(>=6.4)
        label.font = .preferredFont(forTextStyle: .init(rawValue: "UICTFontTextStyleExtraLargeTitle"))
#else
        label.font = .preferredFont(forTextStyle: .extraLargeTitle)
#endif
        label.textAlignment = .center
        return label
    }
    
    func updateUIView(_ uiView: UILabel, context: Context) {
        uiView.text = text
    }
}
