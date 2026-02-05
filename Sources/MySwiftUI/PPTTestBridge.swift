internal import UIKit

class PPTTestBridge {
    weak var host: (UIView & ViewRendererHost)?
    private var shouldUpdateEnvironment: Bool
    private var testCase: PPTTestCase?
    
    init(host: (UIView & ViewRendererHost)?, shouldUpdateEnvironment: Bool, testCase: PPTTestCase?) {
        self.host = host
        self.shouldUpdateEnvironment = shouldUpdateEnvironment
        self.testCase = testCase
    }
    
    // TODO
}

struct PPTTestCase {
    // TODO
}
