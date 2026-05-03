// 390609F81ACEBEAF00AD8179BD31E870
private import Dispatch

extension Transaction {
    fileprivate static let pendingListeners = AtomicBox(wrappedValue: Transaction.PendingListeners(pending: [], next: nil))
    
    fileprivate static func dispatchPending() {
        // sp + 0x8
        let listeners = Transaction.pendingListeners.access { listeners in
            // $s7SwiftUI11TransactionVAAE15dispatchPending33_390609F81ACEBEAF00AD8179BD31E870LLyyFZSayAcAE0E9ListenersAELLV12WeakListenerVGAGzXEfU_
            /*
             listeners -> x0 -> x23
             */
            // <+428>
            // x20
            guard let next = listeners.next else {
                let result = listeners.pending
                listeners.pending = []
                return result
            }
            
            // <+520>
            // next -> x20 -> x28
            listeners.next = nil
            
            // x29 - 0x90
            let pending = listeners.pending
            // x29 - 0x98
            let count = pending.count
            // x22
            var array: [Transaction.PendingListeners.WeakListener] = []
            
            for listener in pending {
                // <+712>
                guard listener.time > next else {
                    continue
                }
                
                array.append(listener)
            }
            
            // <+972>
            listeners.pending = array
            
            if !array.isEmpty {
                listeners.next = array.last!.time
                
                DispatchQueue.main.asyncAfter(deadline: listeners.next!) {
                    // $s7SwiftUI11TransactionVAAE15dispatchPending33_390609F81ACEBEAF00AD8179BD31E870LLyyFZSayAcAE0E9ListenersAELLV12WeakListenerVGAGzXEfU_yyYbcfu_TA
                    Transaction.dispatchPending()
                }
                
                // <+1512>
                if !pending.isEmpty {
                    // x27
                    var array: [Transaction.PendingListeners.WeakListener] = []
                    
                    for listener in pending {
                        // <+1596>
                        guard !(listener.time > next) else {
                            continue
                        }
                        
                        array.append(listener)
                    }
                    
                    return array
                } else {
                    return []
                }
            } else {
                // <+1828>
                return pending
            }
        }
        
        // <+100>
        if !listeners.isEmpty {
            Update.locked { 
                // $s7SwiftUI11TransactionVAAE15dispatchPending33_390609F81ACEBEAF00AD8179BD31E870LLyyFZyyXEfU0_
                // listeners -> x0 -> x20
                for listener in listeners {
                    if let l = listener.listener {
                        l.finalizeTransaction()
                    }
                }
            }
        }
    }
    
    var animationListener: AnimationListener? {
        get {
            return self[AnimationListenerKey.self]
        }
        set {
            self[AnimationListenerKey.self] = newValue
        }
    }
    
    fileprivate(set) var animationLogicalListener: AnimationListener? {
        get {
            return self[AnimationLogicalListenerKey.self]
        }
        set {
            self[AnimationLogicalListenerKey.self] = newValue
        }
    }
    
    fileprivate struct AnimationListenerKey : TransactionKey {
        static var defaultValue: AnimationListener? {
            return nil
        }
        
        static func _valuesEqual(_ lhs: AnimationListener?, _ rhs: AnimationListener?) -> Bool {
            assertUnimplemented()
        }
    }
    
    fileprivate struct AnimationLogicalListenerKey : TransactionKey {
        static var defaultValue: AnimationListener? {
            return nil
        }
        
        static func _valuesEqual(_ lhs: AnimationListener?, _ rhs: AnimationListener?) -> Bool {
            assertUnimplemented()
        }
    }
    
    package func addAnimationListener(allFinished: () -> Void) {
        assertUnimplemented()
    }
    
    mutating func addAnimationCompletion(criteria: AnimationCompletionCriteria, _ completion: @escaping () -> Void) {
        /*
         self -> x20
         completion -> x1/x2 -> x22/x21
         */
        if criteria == .logicallyComplete {
            // <+180>
            let listener = AllFinishedListener(
                allFinished: { _ in
                    // $s7SwiftUI11TransactionV22addAnimationCompletion8criteria_yAA0eF8CriteriaV_yyctFyycfU_TA
                    Update.enqueueAction(reason: .animationLogicallyCompleted, completion)
                },
                count: 0,
                maxCount: 0,
                dispatched: false
            )
            
            self.addAnimationLogicalListener(listener)
        } else {
            // <+36>
            let listener = AllFinishedListener(
                allFinished: { _ in
                    // $s7SwiftUI11TransactionV22addAnimationCompletion8criteria_yAA0eF8CriteriaV_yyctFyycfU0_TA
                    Update.enqueueAction(reason: .animationRemoved, completion)
                },
                count: 0,
                maxCount: 0,
                dispatched: false
            )
            
            self.addAnimationListener(listener)
        }
    } 
    
    var effectiveAnimation: Animation? {
        if let animation = self.animation {
            return animation
        }
        
        if tracksVelocity {
            return Animation.velocityTracking
        }
        
        return nil
    }
    
    mutating func addAnimationListener(_ listener: AnimationListener) {
        /*
         listener -> x0 -> x22
         */
        Transaction.pendingListeners.access { listeners in
            // $s7SwiftUI11TransactionVAAE18addPendingListener33_390609F81ACEBEAF00AD8179BD31E870LLyyAA09AnimationF0CFZyAcAE0E9ListenersAELLVzXEfU_
            /*
             listeners -> x0 -> x28
             listener -> x1 -> x29 - 0x90
             */
            // <+468>
            // x23
            let time_1 = DispatchTime.now()
            let d0: Double = 0.01
            // x22
            let time_2 = time_1 + d0
            _ = consume time_1
            
            let weakListener = Transaction.PendingListeners.WeakListener(
                listener: listener,
                time: time_2
            )
            listeners.pending.append(weakListener)
            
            // <+660>
            guard listeners.next == nil else {
                return
            }
            
            // <+1036>
            listeners.next = weakListener.time
            DispatchQueue.main.asyncAfter(deadline: weakListener.time) {
                // $s7SwiftUI11TransactionVAAE18addPendingListener33_390609F81ACEBEAF00AD8179BD31E870LLyyAA09AnimationF0CFZyAcAE0E9ListenersAELLVzXEfU_yyYbcfu_TA
                Transaction.dispatchPending()
            }
        }
        
        // <+120>
        // merged
        if let first = self.animationLogicalListener {
            // <+144>
            self.animationListener = ListenerPair(first: first, second: listener)
        } else {
            // <+252>
            self.animationListener = listener
        }
    }
    
    mutating func addAnimationLogicalListener(_ listener: AnimationListener) {
        /*
         listener -> x0 -> x22
         */
        Transaction.pendingListeners.access { listeners in
            // $s7SwiftUI11TransactionVAAE18addPendingListener33_390609F81ACEBEAF00AD8179BD31E870LLyyAA09AnimationF0CFZyAcAE0E9ListenersAELLVzXEfU_
            /*
             listeners -> x0 -> x28
             listener -> x1 -> x29 - 0x90
             */
            // <+468>
            // x23
            let time_1 = DispatchTime.now()
            let d0: Double = 0.01
            // x22
            let time_2 = time_1 + d0
            _ = consume time_1
            
            let weakListener = Transaction.PendingListeners.WeakListener(
                listener: listener,
                time: time_2
            )
            listeners.pending.append(weakListener)
            
            // <+660>
            guard listeners.next == nil else {
                return
            }
            
            // <+1036>
            listeners.next = weakListener.time
            DispatchQueue.main.asyncAfter(deadline: weakListener.time) {
                // $s7SwiftUI11TransactionVAAE18addPendingListener33_390609F81ACEBEAF00AD8179BD31E870LLyyAA09AnimationF0CFZyAcAE0E9ListenersAELLVzXEfU_yyYbcfu_TA
                Transaction.dispatchPending()
            }
        }
        
        // <+120>
        // merged
        if let first = self.animationLogicalListener {
            // <+144>
            self.animationLogicalListener = ListenerPair(first: first, second: listener)
        } else {
            // <+252>
            self.animationLogicalListener = listener
        }
    }
}

class AnimationListener {
    init() {}
    
    func animationWasAdded() {}
    func animationWasRemoved() {}
    func finalizeTransaction() {}
}

fileprivate final class AllFinishedListener : AnimationListener {
    private let allFinished: (Transaction.AnimationCompletionInfo) -> () // 0x10
    private var count: Int // 0x20
    private var maxCount: Int // 0x28
    private var dispatched: Bool // 0x30
    
    override func finalizeTransaction() {
        if self.count != 0 || self.dispatched {
            return
        }
        
        self.dispatched = true
        let info = Transaction.AnimationCompletionInfo(completedCount: self.maxCount)
        self.allFinished(info)
    }
    
    override func animationWasAdded() {
        self.count += 1
        self.maxCount += 1
    }
    
    override func animationWasRemoved() {
        var count = self.count
        count -= 1
        self.count = count
        
        if count != 0 || self.dispatched {
            return
        }
        
        self.dispatched = true
        let info = Transaction.AnimationCompletionInfo(completedCount: self.maxCount)
        self.allFinished(info)
    }
    
    init(
        allFinished: @escaping (Transaction.AnimationCompletionInfo) -> Void,
        count: Int,
        maxCount: Int,
        dispatched: Bool
    ) {
        self.allFinished = allFinished
        self.count = count
        self.maxCount = maxCount
        self.dispatched = dispatched
        super.init()
    }
}

fileprivate final class ListenerPair : AnimationListener {
    private let first: AnimationListener
    private let second: AnimationListener
    
    override func animationWasAdded() {
        assertUnimplemented()
    }
    
    override func animationWasRemoved() {
        assertUnimplemented()
    }
    
    init(first: AnimationListener, second: AnimationListener) {
        self.first = first
        self.second = second
        super.init()
    }
}

extension Transaction {
    struct AnimationCompletionInfo {
        fileprivate private(set) var completedCount: Int
    }
    
    fileprivate struct PendingListeners {
        var pending: [Transaction.PendingListeners.WeakListener]
        var next: DispatchTime?
    }
}

extension Transaction.PendingListeners {
    struct WeakListener {
        private(set) weak var listener: AnimationListener?
        private(set) var time: DispatchTime
    }
}
