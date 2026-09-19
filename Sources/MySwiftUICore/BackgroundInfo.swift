// C7D4771CFE453D905E7BCD5A907D32EB

package struct BackgroundInfo : Equatable {
    package var layer: Int
    package var groupCount: Int
    
    package init(layer: Int, groupCount: Int) {
        self.layer = layer
        self.groupCount = groupCount
    }
}

extension EnvironmentValues {
    package var backgroundInfo: BackgroundInfo {
        get {
            return self[BackgroundInfoKey.self]
        }
        set {
            self[BackgroundInfoKey.self] = newValue
        }
    }
    
    package var backgroundLevel: Int {
        get {
            return self.backgroundInfo.layer
        }
        set {
            self.backgroundInfo.layer = newValue
        }
    }
}

fileprivate struct BackgroundInfoKey : EnvironmentKey {
    static var defaultValue: BackgroundInfo {
        return BackgroundInfo(layer: 0, groupCount: 0)
    }
}
