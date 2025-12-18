public import CoreGraphics

extension CGRect {
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package mutating func roundCoordinatesToNearestOrUp(toMultipleOf m: CGFloat) {
        self = self.standardized
        var max = origin + size
        origin.roundToNearestOrUp(toMultipleOf: m)
        max.roundToNearestOrUp(toMultipleOf: m)
        size.width = max.x - x
        size.height = max.y - y
        
        
        size.round(toMultipleOf: m)
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package func roundedCoordinatesToNearestOrUp(toMultipleOf m: CGFloat) -> CGRect {
        var r = self
        r.roundCoordinatesToNearestOrUp(toMultipleOf: m)
        return r
    }
}

extension CGRect {
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package var x: CGFloat {
        get { return origin.x }
        set { origin.x = newValue }
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package var y: CGFloat {
        get { return origin.y }
        set { origin.y = newValue }
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package var center: CGPoint {
        get { return CGPoint(x: x + width / 2, y: y + height / 2) }
        set { x = newValue.x - width / 2; y = newValue.y - height / 2 }
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package init(size: CGSize) {
        self.init(x: 0, y: 0, width: size.width, height: size.height)
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package init(center: CGPoint, size: CGSize) {
        self.init(x: center.x - size.width * 0.5,
                  y: center.y - size.height * 0.5,
                  width: size.width, height: size.height)
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package var isFinite: Swift.Bool {
        get {
            return x.isFinite && y.isFinite && width.isFinite && height.isFinite
        }
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package func flushNullToZero() -> CGRect {
        return isNull ? .zero : self
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package func offset(by offset: CGSize) -> CGRect {
        return offsetBy(dx: offset.width, dy: offset.height)
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package func scaledBy(x: CGFloat = 1, y: CGFloat = 1) -> CGRect {
        if isNull || isInfinite {
            return self
        }
        return CGRect(x: self.x * x, y: self.y * y, width: width * x, height: height * y)
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package func scaled(by scale: CGFloat) -> CGRect {
        return self.scaledBy(x: scale, y: scale)
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package func hasIntersection(_ rect: CGRect) -> Swift.Bool {
        return !intersection(rect).isEmpty
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package var maxXY: CGPoint {
        get { return CGPoint(x: maxX, y: maxY) }
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package var minXY: CGPoint {
        get { return CGPoint(x: minX, y: minY) }
    }
}
extension CGRect {
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package init(position: CGPoint, size: CGSize, anchor: UnitPoint) {
        self.init(x: position.x - size.width * anchor.x,
                  y: position.y - size.height * anchor.y,
                  width: size.width, height: size.height)
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package subscript(axis: Axis) -> Swift.ClosedRange<CGFloat> {
        get {
            guard !isNull else { return 0 ... 0 }
            let x0 = origin[axis], x1 = x0 + size[axis]
            
            var lower = min(x0, x1), upper = max(x0, x1)
            
            
            if !(lower <= upper) {
                (lower, upper) = (0, 0)
            }
            return unsafe ClosedRange(uncheckedBounds: (lower: lower, upper: upper))
        }
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package subscript(edge: Edge) -> CGFloat {
        get {
            switch edge {
            case .leading: return minX
            case .trailing: return maxX
            case .top: return minY
            case .bottom: return maxY
            }
        }
    }
    
    @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
    @inlinable package mutating func finalizeLayoutDirection(_ layoutDirection: LayoutDirection, parentSize: CGSize) {
        guard layoutDirection == .rightToLeft else { return }
        origin.x = parentSize.width - maxX
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension CGRect : Animatable {
    @_implements(MySwiftUICore.Animatable, AnimatableData)
    public typealias MSUI_AnimatableData = AnimatablePair<CGPoint.MSUI_AnimatableData, CGSize.MSUI_AnimatableData>
    
    public var animatableData: CGRect.MSUI_AnimatableData {
        @inlinable get {
            return .init(origin.animatableData, size.animatableData)
        }
        @inlinable set {
            (origin.animatableData, size.animatableData)
            = (newValue.first, newValue.second)
        }
    }
}

extension CGRect {
    package func inset(by insets: EdgeInsets) -> CGRect {
        /*
         self.origin.x = d11
         self.origin.y = d8
         self.size.width = d9
         self.size.height = d10
         
         insets.top = d14
         insets.leading = d15
         insets.bottom = d12
         insets.trailing = d13
         */
        guard !isNull else {
            return self
        }
        
        var result = standardized
        result.origin.x += insets.leading
        result.origin.y += insets.top
        result.size.width -= (insets.leading + insets.trailing)
        result.size.height -= (insets.top + insets.bottom)
        
        if result.width < 0 || result.height < 0 {
            result = .null
        }
        
        return result
    }
}
