#warning("TODO")

internal import CoreGraphics

package struct DisplayList {
    package var items: [Item]
    package var features: Features
    package var properties: Properties
}

extension DisplayList {
    package struct Item {
        var frame: CGRect
        var version: DisplayList.Version
        var value: Item.Value
        var identity: _DisplayList_Identity
    }
}

extension DisplayList.Item {
    package enum Value {
        
    }
}

extension DisplayList {
    package struct Features {
        
    }
}

extension DisplayList {
    package struct Properties {
        
    }
}

extension DisplayList {
    package struct Version {
        var value: Int
        
        package init() {
            fatalError()
        }
    }
}

package struct _DisplayList_Identity {
    var value: UInt32
}
