// 49A76CA1B5E4F66260081F1C9EDD4305
package import QuartzCore
private import AttributeGraph
private import _QuartzCorePrivate

final class ViewGraphDisplayLink : NSObject {
    fileprivate static nonisolated(unsafe) var asyncRunloop: RunLoop?
    @safe fileprivate static nonisolated(unsafe) var asyncPending = false
    fileprivate static nonisolated(unsafe) var asyncThread: Thread?
    
    var link: CADisplayLink? = nil // 0x8
    private weak var host: ViewGraphHost? = nil // 0x10
    private(set) var nextUpdate: Time = .infinity // 0x18
    private var currentUpdate: Time? = nil // 0x20
    private var interval: Double = 0 // 0x30
    private var reasons: Set<UInt32> = [] // 0x38
    private var currentThread: ViewGraphDisplayLink.ThreadName = .main // 0x40
    var nextThread: ViewGraphDisplayLink.ThreadName = .main // 0x41
    
    init(host: ViewGraphHost) {
        super.init()
        self.host = host
    }
    
    func setNextUpdate(delay: Double, interval: Double, reasons: Set<UInt32>) {
        var d0 = delay
        var d1 = interval
        let d8 = d1
        d1 = 0
        let d2 = 0.001
        
        if d0 < d2 {
            // <+112>
        } else {
            // <+52>
            if let currentUpdate {
                d1 = currentUpdate.seconds
            } else {
                // <+76>
                d1 = Time.systemUptime.seconds
            }
            
            // <+108>
            d1 = d0 + d1
        }
        
        // <+112>
        d0 = nextUpdate.seconds
        if !(d1 < d0) {
            // <+172>
        }  else {
            self.nextUpdate = Time(seconds: d1)
            if let link {
                link.isPaused = false
            } else {
                // <+172>
            }
        }
        
        d0 = d8
        setFrameInterval(d0, reasons: reasons)
    }
    
    func invalidate() {
        Update.ensure { 
            if let link, !link.isPaused {
                link.invalidate()
            }
        }
    }
    
    fileprivate func setFrameInterval(_ interval: Double, reasons: Set<UInt32>) {
        /*
         self -> x20
         reasons -> x0 -> x19
         */
        let d0 = interval
        let d1 = self.interval
        
        if d1 != d0 {
            // <+40>
            self.interval = d0
            
            let range: CAFrameRateRange
            if d0 != 0 {
                // <+72>
                var s0 = Float(d0)
                var s1: Float = 1
                s0 = s1 / s0
                s0 = roundf(s0)
                s1 = 40
                
                if s0 <= s1 {
                    // <+140>
                    s1 = 60
                    range = CAFrameRateRange(minimum: s0, maximum: s1, preferred: nil)
                    // <+156>
                } else {
                    // <+104>
                    s1 = 80
                    
                    if s0 < s1 {
                        range = CAFrameRateRange.default
                    } else {
                        s1 = s0
                        s0 = 80
                        range = CAFrameRateRange(minimum: s0, maximum: s1, preferred: nil)
                    }
                }
            } else {
                // <+52>
                range = CAFrameRateRange.default
                // <+156>
            }
            
            if let link {
                link.preferredFrameRateRange = range
            }
        } else {
            // <+176>
        }
        
        // <+176>
        guard !(self.reasons == reasons) else {
            return
        }
        
        // <+204>
        self.reasons = reasons
        
        let count = reasons.count
        withUnsafeTuple(of: TupleType(UInt32.self), count: count) { tuple in
            /*
             $s7SwiftUI20ViewGraphDisplayLinkC16setFrameInterval33_49A76CA1B5E4F66260081F1C9EDD4305LL_7reasonsySd_Shys6UInt32VGtFySo20AGUnsafeMutableTupleaXEfU_TA
             tuple -> x0/x1
             reasons -> x2
             self -> x3
             count -> x4
             */
            let address = tuple.address(as: UInt32.self)
            
            for (i, reason) in reasons.enumerated() {
                address
                    .advanced(by: i)
                    .initialize(to: reason)
            }
            
            if let link {
                link.setHighFrameRateReasons(address, count: count)
            }
        }
    }
    
    @objc fileprivate func displayLinkTimer(_ link: CADisplayLink) {
        /*
         self -> x20
         link -> x0 -> x21
         */
        guard let host else {
            link.invalidate()
            return
        }
        
        // <+72>
        // host -> x26
        Update.locked {
            if (self.currentThread != self.nextThread) || (self.link == nil) {
                // <+412>
            } else {
                // <+156>
                var d0 = link.timestamp
                let d8 = d0
                d0 = link.targetTimestamp
                var d1 = self.nextUpdate.seconds
                var d2: Double = -1.0 / 240.0
                d2 = d1 + d2
                
                if !(d2 < d8) {
                    // <+328>
                } else {
                    // <+212>
                    self.currentUpdate = Time(seconds: d8)
                    self.nextUpdate = .infinity
                    
                    host.displayLinkTimer(
                        timestamp: Time(seconds: d8),
                        targetTimestamp: Time(seconds: d0),
                        isAsyncThread: self.currentThread == .async
                    )
                    
                    self.currentUpdate = nil
                    d1 = self.nextUpdate.seconds
                    // <+328>
                }
                
                // <+328>
                d0 = .infinity
                if d1 != d0 || self.nextThread == .main {
                    // <+412>
                } else {
                    // <+352>
                    self.nextThread = .main
                    self.nextUpdate = Time(seconds: d8)
                    // <+412>
                }
            }
            
            // <+412>
            if (self.currentThread != self.nextThread), let link = self.link {
                // <+436>
                var flag = true // true -> <+912> / false -> <+1336>
                if self.nextThread != .async {
                    // <+908>
                    // <+912>
                } else {
                    // <+456>
                    ViewGraphDisplayLink.asyncPending = true
                    
                    mLoop: while ViewGraphDisplayLink.asyncRunloop == nil {
                        // <+840>
                        while ViewGraphDisplayLink.asyncThread != nil {
                            // <+812>
                            Update.wait()
                            ViewGraphDisplayLink.asyncPending = true
                            
                            if ViewGraphDisplayLink.asyncRunloop != nil {
                                // <+912>
                                flag = true
                                break mLoop
                            }
                        }
                        
                        // <+848>
                        let thread = Thread(target: ViewGraphDisplayLink.self, selector: #selector(ViewGraphDisplayLink.asyncThread(arg:)), object: nil)
                        thread.qualityOfService = .userInteractive
                        thread.name = "com.apple.SwiftUI.AsyncRenderer"
                        let result = thread._startAndReturnError()
                        if result {
                            unsafe ViewGraphDisplayLink.asyncThread = thread
                            // <+812>
                            Update.wait()
                            ViewGraphDisplayLink.asyncPending = true
                            
                            if ViewGraphDisplayLink.asyncRunloop != nil {
                                // <+912>
                                flag = true
                                break mLoop
                            }
                            
                            // <+840>
                        } else {
                            // <+984>
                            self.nextThread = .main
                            
                            switch self.currentThread {
                            case .main:
                                // <+928>
                                // <+1336>
                                flag = true
                                break mLoop
                            case .async:
                                // <+1012>
                                let main = RunLoop.main
                                // <+1048>
                                link.remove(from: .current, forMode: .common)
                                
                                let newLink = CADisplayLink(
                                    display: link.display,
                                    target: self,
                                    selector: #selector(ViewGraphDisplayLink.displayLinkTimer(_:))
                                )!
                                
                                newLink.add(to: main, forMode: .common)
                                self.link = newLink
                                
                                let interval = self.interval
                                let reasons = self.reasons
                                self.interval = 0
                                self.reasons = []
                                self.setFrameInterval(interval, reasons: reasons)
                                self.currentThread = .main
                                // <+1336>
                            }
                            
                            // <+1336>
                            flag = true
                            break mLoop
                        }
                    }
                }
                
                if flag == true {
                    // <+912>
                    if self.nextThread != self.currentThread {
                        // <+940>
                        let isAsync = (self.nextThread == .async)
                        let loop = isAsync ? ViewGraphDisplayLink.asyncRunloop! : .main
                        // <+1048>
                        link.remove(from: .current, forMode: .common)
                        
                        let newLink = CADisplayLink(
                            display: link.display,
                            target: self,
                            selector: #selector(ViewGraphDisplayLink.displayLinkTimer(_:))
                        )!
                        
                        newLink.add(to: loop, forMode: .common)
                        self.link = newLink
                        
                        let interval = self.interval
                        let reasons = self.reasons
                        self.interval = 0
                        self.reasons = []
                        self.setFrameInterval(interval, reasons: reasons)
                        self.currentThread = isAsync ? .async : .main
                        // <+1336>
                    } else {
                        // <+1336>
                    }
                } else {
                    // <+1336>
                }
            } else {
                // <+1336>
            }
            
            // <+1336>
            if self.link == nil {
                // <+1408>
                link.invalidate()
                // <+1416>
            } else {
                let d0 = self.nextUpdate.seconds
                if d0 != .infinity || self.nextThread != self.currentThread {
                    // <+1416>
                } else {
                    // <+1392>
                    link.isPaused = true
                    // <+1416>
                }
            }
            
            // <+1416>
        }
    }
    
    @objc(asyncThreadWithArg:) fileprivate static func asyncThread(arg: Any) {
        assertUnimplemented()
    }
}

extension ViewGraphDisplayLink {
    enum ThreadName {
        case main
        case async
    }
}

extension ViewGraphHost {
    nonisolated package func startDisplayLink(delay: Double, makeCADisplayLink: (Any, Selector) -> CADisplayLink?) {
        let displayLink: ViewGraphDisplayLink
        if let _displayLink = self.displayLink {
            displayLink = _displayLink
        } else {
            let _displayLink = ViewGraphDisplayLink(host: self)
            if let caDisplayLink = makeCADisplayLink(_displayLink, #selector(ViewGraphDisplayLink.displayLinkTimer(_:))) {
                _displayLink.link = caDisplayLink
                caDisplayLink.add(to: .main, forMode: .common)
                self.displayLink = _displayLink
            }
            
            if let _displayLink = self.displayLink {
                displayLink = _displayLink
            } else {
                startUpdateTimer(delay: delay)
                return
            }
        }
        
        displayLink
            .setNextUpdate(
                delay: delay,
                interval: self.viewGraph.nextUpdate.views.interval,
                reasons: self.viewGraph.nextUpdate.views.reasons
            )
        
        clearUpdateTimer()
    }
    
    func displayLinkTimer(timestamp: Time, targetTimestamp: Time, isAsyncThread: Bool) {
        /*
         self -> x20 -> x22
         isAsyncThread -> w2 -> w25
         */
        var d8 = timestamp.seconds
        let d9 = targetTimestamp.seconds
        
        guard
            let updateDelegate, // x19
            let renderDelegate // x21
        else {
            return
        }
        
        self.clearUpdateTimer()
        var d0 = renderDelegate.renderIntervalForDisplayLink(timestamp: Time(seconds: d8))
        d8 = d0
        
        if !isAsyncThread {
            // <+300>
            d0 = d8
            updateDelegate.render(interval: d0, updateDisplayList: true, targetTimestamp: Time(seconds: d9))
            
            // x20
            guard let displayLink else {
                return
            }
            
            // <+344>
            d0 = displayLink.nextUpdate.seconds
            
            guard d0.isFinite else {
                return
            }
            
            // <+376>
            // x23
            let viewGraph = self.viewGraph
            assertUnimplemented()
        } else {
            // <+192>
            d0 = d8
            // sp + 0x18
            let renderTime = updateDelegate.renderAsync(interval: d0, targetTimestamp: Time(seconds: d9))
            // <+228>
            assertUnimplemented()
            // <+560>
        }
        assertUnimplemented()
    }
}
