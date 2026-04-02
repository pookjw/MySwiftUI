package import CoreGraphics

extension CGSize {
    package func isEqual(to other: CGSize) -> Bool {
        let widthEquality: Bool
        if self.width == other.width {
            widthEquality = true
        } else if self.width.isNaN && other.width.isNaN {
            widthEquality = true
        } else if !self.width.isFinite && !other.width.isFinite {
            widthEquality = true
        } else {
            widthEquality = false
        }
        
        guard widthEquality else {
            return false
        }
        
        let heightEquality: Bool
        if self.height == other.height {
            heightEquality = true
        } else if self.height.isNaN && other.height.isNaN {
            heightEquality = true
        } else if !self.height.isFinite && !other.height.isFinite {
            heightEquality = true
        } else {
            heightEquality = false
        }
        
        guard heightEquality else {
            return false
        }
        
        return true
    }
}
