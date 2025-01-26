package enum ContentOffsetAdjustmentReason: UInt32, Hashable {
    case translation
    case positionTranslation
    case alignment
    case reset
    
    package static var maxValue: UInt32 { 5 }
    
    package func shouldAdjust(isScrolling: Bool, isTransitioning: Bool) -> Bool {
        switch self {
        case .translation:
            return !isTransitioning
        case .positionTranslation:
            return !isTransitioning
        case .alignment:
            return !isScrolling
        case .reset:
            return true
        }
        
//        let w0 = isScrolling
//        let w1 = isTransitioning
//        
//        let w9 = true
//        let w10 = !w1
//        var w8 = !w0
//        
//        w8 = (rawValue == 2) ? w8 : w9
//        w8 = (rawValue < 2) ? w10 : w8
//        
//        return w8
    }
}
