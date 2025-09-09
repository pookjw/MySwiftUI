internal import Testing
@testable private import MySwiftUI
@testable private import MySwiftUICore
private import UIKit

struct _UIHostingViewTests {
    @Test
    @MainActor
    func test_initWithRootView() {
        let rootView = EmptyView()
        let hostingView = _UIHostingView(rootView: rootView)
    }
}
