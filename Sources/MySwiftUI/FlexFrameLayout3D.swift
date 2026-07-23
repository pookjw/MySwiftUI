package import CoreGraphics
package import MySwiftUICore
private import os.log
package import Spatial

extension View {
    package func frame(
        minWidth: CGFloat?,
        idealWidth: CGFloat?,
        maxWidth: CGFloat?,
        minHeight: CGFloat?,
        idealHeight: CGFloat?,
        maxHeight: CGFloat?,
        minDepth: CGFloat?,
        idealDepth: CGFloat?,
        maxDepth: CGFloat?,
        alignment: Alignment3D
    ) -> some View {
        return self.modifier(
            _FlexFrameLayout3D(
                minWidth: minWidth,
                idealWidth: idealWidth,
                maxWidth: maxWidth,
                minHeight: minHeight,
                idealHeight: idealHeight,
                maxHeight: maxHeight,
                minDepth: minDepth,
                idealDepth: idealDepth,
                maxDepth: maxDepth,
                alignment: alignment
            )
        )
    }
    
    package func frame(
        minSize: Size3D?,
        idealSize: Size3D?,
        maxSize: Size3D?,
        alignment: Alignment3D
    ) -> some View {
        let minWidth: CGFloat?
        if let _minWidth = minSize?.width {
            minWidth = CGFloat(_minWidth)
        } else {
            minWidth = nil
        }
        
        let idealWidth: CGFloat?
        if let _idealWidth = idealSize?.width {
            idealWidth = CGFloat(_idealWidth)
        } else {
            idealWidth = nil
        }
        
        let maxWidth: CGFloat?
        if let _maxWidth = maxSize?.width {
            maxWidth = CGFloat(_maxWidth)
        } else {
            maxWidth = nil
        }
        
        let minHeight: CGFloat?
        if let _minHeight = minSize?.height {
            minHeight = CGFloat(_minHeight)
        } else {
            minHeight = nil
        }
        
        let idealHeight: CGFloat?
        if let _idealHeight = idealSize?.height {
            idealHeight = CGFloat(_idealHeight)
        } else {
            idealHeight = nil
        }
        
        let maxHeight: CGFloat?
        if let _maxHeight = maxSize?.height {
            maxHeight = CGFloat(_maxHeight)
        } else {
            maxHeight = nil
        }
        
        let minDepth: CGFloat?
        if let _minDepth = minSize?.depth {
            minDepth = CGFloat(_minDepth)
        } else {
            minDepth = nil
        }
        
        let idealDepth: CGFloat?
        if let _idealDepth = idealSize?.depth {
            idealDepth = CGFloat(_idealDepth)
        } else {
            idealDepth = nil
        }
        
        let maxDepth: CGFloat?
        if let _maxDepth = maxSize?.depth {
            maxDepth = CGFloat(_maxDepth)
        } else {
            maxDepth = nil
        }
        
        return self.frame(
            minWidth: minWidth,
            idealWidth: idealWidth,
            maxWidth: maxWidth,
            minHeight: minHeight,
            idealHeight: idealHeight,
            maxHeight: maxHeight,
            minDepth: minDepth,
            idealDepth: idealDepth,
            maxDepth: maxDepth,
            alignment: alignment
        )
    }
}

struct _FlexFrameLayout3D : ViewModifier {
    private let minWidth: CGFloat? // 0x0
    private let idealWidth: CGFloat? // 0x10
    private let maxWidth: CGFloat? // 0x20
    private let minHeight: CGFloat? // 0x30
    private let idealHeight: CGFloat? // 0x40
    private let maxHeight: CGFloat? // 0x50
    private let minDepth: CGFloat? // 0x60
    private let idealDepth: CGFloat? // 0x70
    private let maxDepth: CGFloat? // 0x80
    private let alignment: Alignment3D // 0x34 (field)
    
    init(
        minWidth: CGFloat?,
        idealWidth: CGFloat?,
        maxWidth: CGFloat?,
        minHeight: CGFloat?,
        idealHeight: CGFloat?,
        maxHeight: CGFloat?,
        minDepth: CGFloat?,
        idealDepth: CGFloat?,
        maxDepth: CGFloat?,
        alignment: Alignment3D
    ) {
        /*
         minWidth -> x0/w1
         idealWidth -> x2/w3
         maxWidth -> x4/w5
         minHeight -> x6/w7
         idealHeight -> x16/w17
         maxHeight -> x14/w15
         minDepth -> x12/w13
         idealDepth -> x10/w11
         maxDepth -> x8/w9
         alignment -> x20
         return pointer -> x8 -> x19
         */
        // <+72>
        if let minWidth {
            if minWidth <= 0 {
                self.minWidth = 0
            } else {
                self.minWidth = minWidth
            }
        } else {
            self.minWidth = nil
        }
        
        // <+112>
        if let idealWidth {
            var d1 = idealWidth
            let d2 = self.minWidth ?? 0
            d1 = (d2 >= d1) ? d2 : d1
            self.idealWidth = d1
        } else {
            self.idealWidth = nil
        }
        
        // <+168>
        if let maxWidth {
            var d2 = self.idealWidth ?? 0
            d2 = (d2 >= maxWidth) ? d2 : maxWidth
            self.maxWidth = d2
        } else {
            self.maxWidth = nil
        }
        
        // <+216>
        if let minHeight {
            if minHeight <= 0 {
                self.minHeight = 0
            } else {
                self.minHeight = minHeight
            }
        } else {
            self.minHeight = nil
        }
        
        // <+256>
        if let idealHeight {
            var d0 = idealHeight
            let d1 = self.minHeight ?? 0
            d0 = (d1 >= d0) ? d1 : d0
            self.idealHeight = d0
        } else {
            self.idealHeight = nil
        }
        
        // <+320>
        if let maxHeight {
            var d2 = self.idealHeight ?? 0
            d2 = (d2 >= maxHeight) ? d2 : maxHeight
            self.maxHeight = d2
        } else {
            self.maxHeight = nil
        }
        
        // <+372>
        if let minDepth {
            if minDepth <= 0 {
                self.minDepth = 0
            } else {
                self.minDepth = minDepth
            }
        } else {
            self.minDepth = nil
        }
        
        // <+412>
        if let idealDepth {
            let d2 = self.minDepth ?? 0
            let d1 = (d2 >= idealDepth) ? d2 : idealDepth
            self.idealDepth = d1
        } else {
            self.idealDepth = nil
        }
        
        // <+472>
        if let maxDepth {
            var d0 = self.idealDepth ?? 0
            d0 = (d0 >= maxDepth) ? d0 : maxDepth
            self.maxDepth = d0
        } else {
            self.maxDepth = nil
        }
        
        self.alignment = alignment
    }
    
    func body(content: Content) -> some View {
        content
            .frame(
                minDepth: self.minDepth,
                idealDepth: self.idealDepth,
                maxDepth: self.maxDepth,
                alignment: self.alignment.depth
            )
            .frame(
                minWidth: self.minWidth,
                idealWidth: self.idealWidth,
                maxWidth: self.maxWidth,
                minHeight: self.minHeight,
                idealHeight: self.idealHeight,
                maxHeight: self.maxHeight,
                alignment: Alignment(self.alignment)
            )
    }
}
