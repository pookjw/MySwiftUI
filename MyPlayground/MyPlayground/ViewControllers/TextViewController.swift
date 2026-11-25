//
//  TextViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 11/20/26.
//

import UIKit
import MySwiftUI

fileprivate struct MyView: View {
    private var attributedString: AttributedString {
        var value = AttributedString("AttributedString: bold, colored, and linked text")
        value.foregroundColor = .orange

        if let boldRange = value.range(of: "bold") {
            value[boldRange].font = .system(size: 20, weight: .bold, design: .rounded)
        }
        if let coloredRange = value.range(of: "colored") {
            value[coloredRange].foregroundColor = .purple
            value[coloredRange].underlineStyle = .single
        }
        if let linkedRange = value.range(of: "linked") {
            value[linkedRange].link = URL(string: "https://www.swift.org")
            value[linkedRange].foregroundColor = .blue
        }

        return value
    }

    var body: some View {
        VStack(alignment: .center, spacing: 12) {
            Text("Text")
            
            Text("Large Title")
                .font(.largeTitle)
                .foregroundStyle(.orange)
                .fontWidth(.expanded)
                .fontDesign(.rounded)
                .fontWeight(.bold)
            
            Text("System Font")
                .font(.system(size: 24, weight: .semibold, design: .serif))
                .foregroundStyle(.blue)
                .italic()
                .underline(color: .cyan)
            
            Text("Custom Font")
                .font(.custom("AvenirNext-DemiBold", size: 22, relativeTo: .title2))
                .foregroundStyle(.pink)
                .tracking(1.5)
                .strikethrough(color: .purple)
            
            Text("Title")
                .font(.title)
                .foregroundStyle(.green)
                .fontWidth(.condensed)
                .fontDesign(.monospaced)
            
            Text("Title 2")
                .font(.title2)
                .foregroundStyle(.mint)
                .fontWeight(.light)
                .kerning(2)
            
            Text("Title 3")
                .font(.title3)
                .foregroundStyle(.teal)
                .italic()
                .underline()
            
            Text("Headline")
                .font(.headline)
                .foregroundStyle(.indigo)
                .fontWeight(.heavy)
                .tracking(0.8)
            
            Text("Subheadline")
                .font(.subheadline)
                .foregroundStyle(.cyan)
                .fontWidth(.expanded)
                .strikethrough()
            
            Text("Body")
                .font(.body)
                .foregroundStyle(.orange)
                .fontDesign(.rounded)
                .underline(color: .yellow)
            
            Text("Callout")
                .font(.callout)
                .foregroundStyle(.purple)
                .fontWeight(.medium)
                .italic()
            
            Text("Footnote")
                .font(.footnote)
                .foregroundStyle(.pink)
                .fontWidth(.condensed)
                .tracking(1)
            
            Text("Caption")
                .font(.caption)
                .foregroundStyle(.blue)
                .fontDesign(.serif)
                .strikethrough(color: .red)
            
            Text("Caption 2")
                .font(.caption2)
                .foregroundStyle(.green)
                .fontWeight(.black)
                .kerning(1.2)
            
            Text("Custom Font Name: AvenirNext-DemiBold")
                .font(.custom("AvenirNext-DemiBold", size: 18))
                .foregroundStyle(.mint)
                .fontWidth(.expanded)
                .underline(color: .orange)

            Text(attributedString)
                .font(.body)
                .padding(.vertical, 8)
        }
    }
}

final class TextViewController: UIViewController {
    @ViewLoading private var hostingController: UIHostingController<MyView>

    override func viewDidLoad() {
        super.viewDidLoad()

        let hostingController = UIHostingController(rootView: MyView())
        self.hostingController = hostingController
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.frame = view.bounds
        hostingController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        hostingController.didMove(toParent: self)
    }
}
