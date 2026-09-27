// 97831D0710BF7139ADD0DDFEC9AF9AE6

final class OscillationDetector<T> {
    private var buffer: [T?] // 0x10
    private var nextIndex: Int = 0 // 0x18
    private var predicate: (T, T?) -> Bool // 0x20
    private var retentionCount: Int // 0x30
    private var evictionQueue: [(seed: Int, removeIndex: Int)] = [] // 0x38
    private var seed: Int = .min // 0x40
    private var isDecayEnqueued: Bool = false // 0x48
    
    init(type: T.Type, size: Int, retentionCount: Int, predicate: @escaping (T, T?) -> Bool) {
        self.buffer = Array(repeating: nil, count: size)
        self.predicate = predicate
        self.retentionCount = retentionCount
    }
    
    @inline(__always) // 원래 없음
    func evaluate(with value: T) -> Bool {
        for other in self.buffer {
            guard !self.predicate(value, other) else {
                return true
            }
        }
        
        return false
    }
    
    func insert(_ value: T) {
        assertUnimplemented()
    }
    
    fileprivate func enqueueDecay(at index: Int) {
        assertUnimplemented()
    }
    
    fileprivate func decay() {
        assertUnimplemented()
    }
}
