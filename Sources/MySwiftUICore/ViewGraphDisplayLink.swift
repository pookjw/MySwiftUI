internal import QuartzCore
private import AttributeGraph
private import _QuartzCorePrivate

final class ViewGraphDisplayLink : NSObject {
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
    
    @objc fileprivate func displayLinkTimer(_ displayLink: CADisplayLink) {
        assertUnimplemented()
    }
    
    @objc static func asyncThreadWithArg(_: Any) {
        assertUnimplemented()
    }
}

extension ViewGraphDisplayLink {
    enum ThreadName {
        case main
        case async
    }
}
