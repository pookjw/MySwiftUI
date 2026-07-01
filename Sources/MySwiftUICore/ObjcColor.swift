package import Foundation

package final class ObjcColor : NSObject {
    let color: Color
    
    package init(_ color: Color) {
        self.color = color
        super.init()
    }
    
    package override func isEqual(_ object: Any?) -> Bool {
        guard let casted = object as? Self else {
            return false
        }
        
        if self === casted {
            return true
        }
        
        return self.color == casted.color
    }
    
    package override var hash: Int {
        var hasher = Hasher()
        self.color.hash(into: &hasher)
        return hasher.finalize()
    }
}
