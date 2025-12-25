// E7640EF181CF36289C575A729C00E55B
internal import CoreGraphics
private import AttributeGraph

struct ContentPathObservers {
    fileprivate var observers: [Observer]
    
    @inlinable
    init() {
        observers = []
    }
    
    mutating func add(observer: any ContentPathObserver) {
        for existing in observers {
            if existing.value === observer {
                return
            }
        }
        
        observers.append(ContentPathObservers.Observer(value: observer))
    }
}

extension ContentPathObservers {
    fileprivate struct Observer {
        weak var value: (any ContentPathObserver)?
    }
}

struct ContentPathChanges: OptionSet {
    static var data: ContentPathChanges { return ContentPathChanges(rawValue: 1 << 0) }
    static var size: ContentPathChanges { return ContentPathChanges(rawValue: 1 << 1) }
    static var transform: ContentPathChanges { return ContentPathChanges(rawValue: 1 << 2) }
    
    let rawValue: UInt8
    
    init(rawValue: UInt8) {
        self.rawValue = rawValue
    }
}

protocol ContentPathObserver: AnyObject {
    func respondersDidChange(for: ViewResponder)
    func contentPathDidChange(for: ViewResponder, changes: ContentPathChanges, transform: (old: ViewTransform, new: ViewTransform), finished: inout Bool)
}

protocol TrivialContentPathObserver: ContentPathObserver {
    func contentPathDidChange(for: ViewResponder)
}

extension TrivialContentPathObserver {
    func respondersDidChange(for: ViewResponder) {
        fatalError("TODO")
    }
    
    func contentPathDidChange(for: ViewResponder, changes: ContentPathChanges, transform: (old: ViewTransform, new: ViewTransform), finished: inout Bool) {
        fatalError("TODO")
    }
}

fileprivate final class PathObserver: TrivialContentPathObserver {
    @Attribute private var invalidationSignal: Void
    private weak var graphHost: GraphHost?
    
    init() {
        fatalError("TODO")
    }
    
    func contentPathDidChange(for: ViewResponder) {
        // $s7SwiftUI12PathObserver33_E7640EF181CF36289C575A729C00E55BLLCAA014TrivialContentcD0A2aEP07contentC9DidChange3foryAA13ViewResponderC_tFTW
        fatalError("TODO")
    }
}

struct ContentResponderHelper<T: ContentResponder> {
    var size = CGSize.zero
    var data: T? = nil
    var transform = ViewTransform()
    private var observers = ContentPathObservers()
    private var cache = ViewResponder.ContainsPointsCache()
    
    init() {}
    
    mutating func update(
        data: (value: T, changed: Bool), // x0, w1
        size: (value: ViewSize, changed: Bool), // x2, w3
        position: (value: CGPoint, changed: Bool), // d0, d1, w4
        transform: (value: ViewTransform, changed: Bool), // x5, w6
        parent: ViewResponder // x7
    ) {
        /*
         x19 = sp + 0x30
         x29 = sp + 0x3f0
         
         data.value -> x25
         data.changed -> x22
         size.value -> x23
         size.changed -> sp + 0x30 + 0x34
         position.value -> d9/d8
         position.changed -> sp + 0x30 + 0x24
         transform.value -> x28
         transform.changed -> sp + 0x30 + 0x30
         parent -> sp + 0x30 + 0x78
         */
        // x21, #0x30 -> T.size
        // x27 / sp + 0x80
        _ = data
        /*
         size.value -> x19
         transform.value -> sp + 0x2e0
         x25 -> self + transform(offset)
         */
        // sp + 0x320
        let transform_1 = self.transform
        
        // self -> sp + 0xa0 (x19 + 0x70 / x29 - 0x350)
        // <+364>
        // sp + 0x260
        var transform_2: ViewTransform
        var w28: ContentPathChanges // OptionSet 같음
        if transform.changed || position.changed {
            // <+400>
            transform_2 = self.transform
            // sp + 0xb0
            _ = transform_1
            self.transform = transform.value
            self.transform.pendingTranslation = CGSize(
                width: position.value.x - transform.value.pendingTranslation.width - transform.value.pendingTranslation.width,
                height: position.value.y - transform.value.pendingTranslation.height - transform.value.pendingTranslation.height
            )
            self.transform.positionAdjustment = CGSize(position.value)
            w28 = .transform
        } else {
            // <+380>
            transform_2 = transform_1
            w28 = []
        }
        
        // <+508>
        if size.changed {
            // <+520>
            self.size = size.value.value
            w28.formUnion(.size)
        }
        
        // <+536>
        let flag: Bool // true = <+640> / false <+732>
        if data.changed {
            // <+540>
            // <+640>
            flag = true
        } else {
            // <+552>
            if self.data != nil {
                if w28.isEmpty {
                    return
                } else {
                    // <+732>
                    flag = false
                }
            } else {
                // <+640>
                flag = true
            }
        }
        
        if flag {
            // <+640>
            self.data = data.value
            w28.formUnion(.data)
        }
        
        // <+732>
        var newObservers: [ContentPathObservers.Observer] = []
        for existing in observers.observers {
            var finished = true
            existing.value?.contentPathDidChange(for: parent, changes: w28, transform: (old: transform_2, new: transform.value), finished: &finished)
            if !finished {
                newObservers.append(existing)
                observers.observers = newObservers
            }
        }
    }
}
