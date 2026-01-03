package import Spatial

extension Size3D {
    package func isEqual(to other: Size3D) -> Bool {
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
        
        let depthEquality: Bool
        if self.depth == other.depth {
            depthEquality = true
        } else if self.depth.isNaN && other.depth.isNaN {
            depthEquality = true
        } else if !self.depth.isFinite && !other.depth.isFinite {
            depthEquality = true
        } else {
            depthEquality = false
        }
        
        guard depthEquality else {
            return false
        }
        
        return true
    }
}
