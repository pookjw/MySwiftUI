package import CoreGraphics

package struct OptionalEdgeInsets : Hashable, Sendable {
    static var none: OptionalEdgeInsets {
        return OptionalEdgeInsets(top: nil, leading: nil, bottom: nil, trailing: nil)
    }
    
    static var zero: OptionalEdgeInsets {
        return OptionalEdgeInsets(0, edges: .all)
    }
    
    var top: CGFloat?
    var leading: CGFloat?
    var bottom: CGFloat?
    var trailing: CGFloat?
    
    init(_ value: CGFloat?, edges: Edge.Set) {
        self.top = edges.contains(.top) ? value : nil
        self.leading = edges.contains(.leading) ? value : nil
        self.bottom = edges.contains(.bottom) ? value : nil
        self.trailing = edges.contains(.trailing) ? value : nil
    }
    
    init(top: CGFloat?, leading: CGFloat?, bottom: CGFloat?, trailing: CGFloat?) {
        self.top = top
        self.leading = leading
        self.bottom = bottom
        self.trailing = trailing
    }
    
    init(_ insets: EdgeInsets, edges: Edge.Set) {
        if edges.contains(.top) {
            self.top = insets.top
        } else {
            self.top = nil
        }
        
        if edges.contains(.leading) {
            self.leading = insets.leading
        } else {
            self.leading = nil
        }
        
        if edges.contains(.trailing) {
            self.trailing = insets.trailing
        } else {
            self.trailing = nil
        }
        
        if edges.contains(.bottom) {
            self.bottom = insets.bottom
        } else {
            self.bottom = nil
        }
    }
    
    init(_ insets: EdgeInsets?) {
        if let insets {
            self.top = insets.top
            self.leading = insets.leading
            self.trailing = insets.trailing
            self.bottom = insets.bottom
        } else {
            self.top = nil
            self.leading = nil
            self.trailing = nil
            self.bottom = nil
        }
    }
    
    package init() {
        self = .none
    }
    
    subscript(edge: Edge) -> CGFloat? {
        get {
            switch edge {
            case .top:
                return self.top
            case .leading:
                return self.leading
            case .bottom:
                return self.bottom
            case .trailing:
                return self.trailing
            }
        }
        set {
            switch edge {
            case .top:
                self.top = newValue
            case .leading:
                self.leading = newValue
            case .bottom:
                self.bottom = newValue
            case .trailing:
                self.trailing = newValue
            }
        }
    }
    
    func `in`(axes: Axis.Set) -> OptionalEdgeInsets {
        var insets = OptionalEdgeInsets(top: nil, leading: nil, bottom: nil, trailing: nil)
        
        if axes.contains(.vertical) {
            insets.top = self.top
            insets.bottom = self.bottom
        }
        
        if axes.contains(.horizontal) {
            insets.leading = self.leading
            insets.trailing = self.trailing
        }
        
        return insets
    }
    
    func `in`(edges: Edge.Set) -> OptionalEdgeInsets {
        var insets = OptionalEdgeInsets.none
        
        if edges.contains(.top) {
            insets.top = self.top
        }
        
        if edges.contains(.leading) {
            insets.leading = self.leading
        }
        
        if edges.contains(.trailing) {
            insets.trailing = self.trailing
        }
        
        if edges.contains(.bottom) {
            insets.bottom = self.bottom
        }
        
        return insets
    }
    
    func `in`(axes: Axis.Set) -> EdgeInsets {
        var insets = EdgeInsets.zero
        
        if axes.contains(.vertical) {
            insets.top = self.top ?? 0
            insets.bottom = self.bottom ?? 0
        }
        
        if axes.contains(.horizontal) {
            insets.leading = self.leading ?? 0
            insets.trailing = self.trailing ?? 0
        }
        
        return insets
    }
    
    func `in`(edges: Edge.Set) -> EdgeInsets {
        var insets = EdgeInsets.zero
        
        if edges.contains(.top) {
            insets.top = self.top ?? 0
        }
        
        if edges.contains(.leading) {
            insets.leading = self.leading ?? 0
        }
        
        if edges.contains(.trailing) {
            insets.trailing = self.trailing ?? 0
        }
        
        if edges.contains(.bottom) {
            insets.bottom = self.bottom ?? 0
        }
        
        return insets
    }
    
    mutating func add(_ value: CGFloat, on edge: Edge) {
        switch edge {
        case .top:
            if let top {
                self.top = top + value
            } else {
                self.top = value
            }
        case .leading:
            if let leading {
                self.leading = leading + value
            } else {
                self.leading = value
            }
        case .bottom:
            if let bottom {
                self.bottom = bottom + value
            } else {
                self.bottom = value
            }
        case .trailing:
            if let trailing {
                self.trailing = trailing + value
            } else {
                self.trailing = value
            }
        }
    }
}
