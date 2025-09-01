internal import Testing
@testable private import MySwiftUI
private import UIKit

struct _UIHostingViewTests {
    @Test
    @MainActor
    func test_init() {
        let rootView = EmptyView()
        let hostingView = _UIHostingView(rootView: rootView)
    }
}
