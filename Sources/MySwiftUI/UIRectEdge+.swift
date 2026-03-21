internal import MySwiftUICore
internal import UIKit

extension UIRectEdge {
    init(_ edges: Edge.Set, layoutDirection: LayoutDirection) {
        /*
         edges -> x0 -> x21
         layoutDirection -> x1 -> x20
         */
        // w24
        let isRTL = layoutDirection == .rightToLeft
        
        if edges == .trailing {
            self = isRTL ? [.left] : [.right]
        } else if edges == .leading {
            self = isRTL ? [.right] : [.left]
        } else if edges == .top {
            self = [.top]
        } else if edges == .bottom {
            self = [.bottom]
        } else if edges == .vertical {
            self = [.top, .bottom]
        } else if edges == .horizontal {
            self = [.left, .right]
        } else if edges == .all {
            self = [.all]
        } else {
            var result: UIRectEdge = []
            
            for edge in Edge.allCases {
                if edges.contains(edge) {
                    var x8: UIRectEdge = (layoutDirection == .rightToLeft) ? [.left] : [.right]
                    x8 = (edge == .bottom) ? [.bottom] : x8
                    var x9: UIRectEdge = (layoutDirection == .rightToLeft) ? [.right] : [.left]
                    x9 = (edge == .top) ? [.top] : x9
                    
                    x8 = (edge == .bottom || edge == .trailing) ? x8 : x9
                    result.formUnion(x8)
                }
            }
            
            self = result
        }
    }
}
