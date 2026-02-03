//
//  EnvironmentViewController.swift
//  MyPlayground
//
//  Created by Jinwoo Kim on 2/3/26.
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
        MyChildView()
            .environment(\.flag, model.flag)
    }
}

fileprivate struct MyChildView: View {
    @Environment(\.flag) private var flag
    
    var body: some View {
        if flag {
            Color.white
        } else {
            Color.black
        }
    }
}

extension EnvironmentValues {
    fileprivate var flag: Bool {
        get {
            return self[FlagKey.self]
        }
        set {
            self[FlagKey.self] = newValue
        }
    }
}

fileprivate struct FlagKey: EnvironmentKey {
    static var defaultValue: Bool {
        return false
    }
}

final class EnvironmentViewController: UIViewController {
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
