internal import QuartzCore

final class ViewGraphDisplayLink: NSObject {
    var link: CADisplayLink? = nil
    private weak var host: ViewGraphHost? = nil
    private(set) var nextUpdate: Time = .infinity
    private var currentUpdate: Time? = nil
    private var interval: Double = 0
    private var reasons: Set<UInt32> = []
    private var currentThread: ViewGraphDisplayLink.ThreadName = .main
    var nextThread: ViewGraphDisplayLink.ThreadName = .main
    
    init(host: ViewGraphHost) {
        super.init()
        self.host = host
    }
    
    func setNextUpdate(delay: Double, interval: Double, reasons: Set<UInt32>) {
        let d1: Time
        if delay >= 0.001 {
            d1 = (currentUpdate ?? Time.systemUptime) + delay
        } else {
            d1 = .zero
        }
        
        let d0 = nextUpdate
        if d1 < d0 {
            nextUpdate = d1
            if let link {
                link.isPaused = false
            }
        }
        
        setFrameInterval(interval, reasons: reasons)
    }
    
    func invalidate() {
        Update.ensure { 
            if let link, !link.isPaused {
                link.invalidate()
            }
        }
    }
    
    private func setFrameInterval(_: Double, reasons: Set<UInt32>) {
        fatalError("TODO")
    }
    
    @objc func displayLinkTimer(_ displayLink: CADisplayLink) {
        fatalError("TODO")
    }
    
    @objc static func asyncThreadWithArg(_: Any) {
        fatalError("TODO")
    }
}

extension ViewGraphDisplayLink {
    enum ThreadName {
        case main
        case async
    }
}
