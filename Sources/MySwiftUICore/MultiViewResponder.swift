public import Spatial

@_spi(Internal) open class MultiViewResponder : ViewResponder {
    private var _children: [ViewResponder] = []
    
    open override var children: [ViewResponder] {
        get {
            return self._children
        }
        set {
            /*
             self -> x20 -> x19
             newValue -> x0 -> x20
             */
            var x21 = self._children.count
            let x26 = newValue.count
            var x22 = 0
            
            if x26 != 0 {
                var x25 = 0
                let sp0x20 = x26
                var sp0x38 = -x21
                var sp0x14 = false
                var sp0x28: Int
                
                first: while true {
                    sp0x28 = (x26 &+ x22) &- x25
                    let x27 = newValue[x25]
                    assert(x25 != Int.max)
                    x25 &+= 1
                    
                    if
                        let parent = x27.parent,
                        parent === self
                    {
                        assert(!(x21 < x22))
                        
                        if x22 == x21 {
                            // <+508>
                        } else {
                            var x26 = 0
                            let x23 = sp0x38 &+ x22
                            
                            while true {
                                let x20 = x22 &+ x26
                                assert(!(x20 >= x21))
                                
                                if self._children[x20] === x27 {
                                    // <+472>
                                    if x26 != 0 {
                                        // <+888>
                                        self._children.swapAt(x22, x22 &+ x26)
                                        x22 &+= 1
                                        
                                        if x25 != sp0x20 {
                                            // <+140>
                                            sp0x14 = true
                                            continue first
                                        } else {
                                            // <+1072>
                                            if x22 < x21 {
                                                // <+1116>
                                                assert(!(x21 < x22))
                                                // <+1124>
                                                break first
                                            } else {
                                                // <+1320>
                                                self.childrenDidChange()
                                                return
                                            }
                                        }
                                    } else {
                                        // <+476>
                                        x22 &+= 1
                                        
                                        if x22 != sp0x28 {
                                            // <+176>
                                            continue first
                                        } else {
                                            // <+1092>
                                            x22 = sp0x28
                                            
                                            if sp0x28 >= x21 {
                                                // <+1148>
                                                if sp0x14 {
                                                    // <+1320>
                                                    self.childrenDidChange()
                                                    // <+1336>
                                                } else {
                                                    // <+1336>
                                                }
                                                
                                                return
                                            } else {
                                                // <+1116>
                                                assert(!(x21 < x22))
                                                break first
                                            }
                                        }
                                    }
                                } else {
                                    x26 &+= 1
                                    
                                    if x23 != -x26 {
                                        // <+332>
                                        continue
                                    } else {
                                        // <+512>
                                        break
                                    }
                                }
                            }
                        }
                        
                        // <+512>
                    } else {
                        // <+512>
                    }
                    
                    // <+512>
                    x27.parent = self
                    self._children.append(x27)
                    
                    if x22 >= x21 {
                        // <+844>
                    } else {
                        // <+628>
                        let x28 = self._children[x22]
                        let x26 = self._children[x21]
                        
                        self._children[x22] = x26
                        self._children[x21] = x28
                        
                        // <+844>
                    }
                    
                    // <+844>
                    x21 &+= 1
                    x22 &+= 1
                    sp0x38 &-= 1
                    
                    if x25 != x26 {
                        sp0x14 = true
                        continue first
                    } else {
                        // <+1072>
                        if x22 < x21 {
                            // <+1116>
                            assert(!(x21 < x22))
                            break first
                        } else {
                            // <+1320>
                            self.childrenDidChange()
                            return
                        }
                    }
                }
            } else {
                // <+1248>
                if x21 <= 0 {
                    return
                }
                
                x22 = 0
            }
            
            if x22 == x21 {
                // <+1276>
            } else {
                assert(!(x22 >= x21))
                var x23 = x22
                
                while true {
                    // <+1412>
                    let x24 = self._children[x23]
                    
                    if
                        let parent = x24.parent,
                        parent === self
                    {
                        // <+1536>
                        x24.parent = nil
                        // <+1392>
                    } else {
                        // <+1392>
                    }
                    
                    // <+1392>
                    x23 &+= 1
                    
                    if x21 == x23 {
                        // <+1276>
                        break
                    } else {
                        // <+1412>
                    }
                }
            }
            
            // <+1276>
            self._children.replaceSubrange(x22..<x21, with: [])
            self.childrenDidChange()
        }
    }
    
    var cache = ViewResponder.ContainsPointsCache()
    var observers = ContentPathObservers()

    open override var features: ViewResponder.Features {
        assertUnimplemented()
    }

    open func childrenDidChange() {
        assertUnimplemented()
    }

    open override func resetGesture() {
        assertUnimplemented()
    }

    open override func addContentPath(to path: inout Path, kind: ContentShapeKinds, in space: CoordinateSpace, observer: (any ContentPathObserver)?) {
        assertUnimplemented()
    }
    
    @inline(__always)
    package override init() {
        super.init()
    }
    
    
    package override init(host: (any ViewGraphDelegate)?) {
        assertUnimplemented()
    }
    
    open override func bindEvent(_ type: any EventType) -> ResponderNode? {
        assertUnimplemented()
    }
    
    open override func visit(applying: (ResponderNode) -> ResponderVisitorResult) -> ResponderVisitorResult {
        let result = applying(self)
        guard result == .next else {
            return result
        }
        
        for child in children {
            let result = child.visit(applying: applying)
            guard result != .cancel else {
                return result
            }
        }
        
        return .next
    }
    
    open override func hitTestPolicy(options: ViewResponder.ContainsPointsOptions) -> ViewResponder.HitTestPolicy {
        if (self.serverResponderID != nil) && !options.contains(.crossingServerIDBoundary) {
            return .exclude
        }
        
        if HitTestPassThroughFeature.isEnabled {
            return .passthrough
        } else {
            return .include
        }
    }
    
    open override func containsGlobalPoints(_ points: [Point3D], cacheKey: UInt32?, options: ViewResponder.ContainsPointsOptions) -> ViewResponder.ContainsPointsResult {
        /*
         self -> x20 -> x21
         points -> x0 -> x22
         cackeKey -> x1 -> x24
         options -> x2 -> x27 -> sp + 0x18
         return pointer -> x8 -> x19
         */
        let policy = self.hitTestPolicy(options: options)
        
        guard policy != .exclude else {
            return ViewResponder.ContainsPointsResult(mask: BitVector64(), priority: 0, children: self.children)
        }
        
        return cache.fetch(key: cacheKey) {
            let children = self.children
            var mask = BitVector64()
            var priority: Double = 0
            
            for child in children {
                let policy = child.hitTestPolicy(options: options)
                
                guard policy != .exclude else {
                    continue
                }
                
                let result = child.containsGlobalPoints(points, cacheKey: cacheKey, options: options)
                mask = result.mask.union(mask)
                priority = (priority <= result.priority) ? result.priority : priority
            }
            
            return ContainsPointsResult(
                mask: mask,
                priority: priority,
                children: self.children
            )
        }
    }
}
