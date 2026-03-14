// 5C36F4A49E2E2562B910FE6399D2C51E
internal import UIKit
private import MySwiftUICore

final class InputAccessoryGenerator {
    var barItems: [UIBarButtonItem] = [] {
        didSet {
            updateHostIfNeeded()
        }
    } // 0x10
    
    private var root: InputAccessoryGenerator.RootUIView? = nil // 0x18
    private var host: InputAccessoryHost<InputAccessoryBar>? = nil // 0x20
    
    init() {
    }
    
    fileprivate func updateHostIfNeeded() {
        // <+84>
        guard let root else {
            return
        }
        
        fatalError("TODO")
    }
    
    // TODO
}

extension InputAccessoryGenerator {
    fileprivate final class RootUIView: UIView {
        var host: InputAccessoryHost<InputAccessoryBar>?
    }
}

fileprivate final class InputAccessoryHost<T: View>: _UIHostingView<T> {
    // TODO
}

fileprivate struct InputAccessoryBar: View {
    private var barItems: [UIBarButtonItem]
    
    var body: some View {
        fatalError("TODO")
    }
}
