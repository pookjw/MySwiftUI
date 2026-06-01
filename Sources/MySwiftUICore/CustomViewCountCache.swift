// EB1EEB38755A34D46BFF2AE8785813E0

struct CustomViewCountCache {
    fileprivate var counts: UnsafeMutablePointer<CustomViewCountCache.Count> // 0x0
    fileprivate private(set) var modifierOptions: CustomViewCountCache.ModifierOptions? // 0x8
}

extension CustomViewCountCache {
    fileprivate struct ModifierOptions {
        private let options: _ViewListInputs.Options // 0x0
        private let baseOptions: _GraphInputs.Options // 0x8
        private var inputID: UniqueID // 0x10
    }
    
    fileprivate struct Count {
        let type: any Any.Type // 0x0
        let count: Int?? // 0x8
        let next: UnsafeMutablePointer<CustomViewCountCache.Count>? // 0x18
    }
}

extension _ViewListCountInputs {
    func withUniqueBody<T>(type: T.Type, body: (_ViewListCountInputs) -> Int?) -> Int? {
        /*
         type -> x0
         body -> x1/x2 -> x19/x21
         */
        // x29 - 0x80
        let copy_1 = self
        // sp + 0x70
        var copy_2 = self
        // sp + 0x50
        var counts: CustomViewCountCache.Count
        if var customViewCache = copy_2.customViewCache {
            // <+100>
            var next: UnsafeMutablePointer<CustomViewCountCache.Count>? = customViewCache.counts
            
            while let _next = next {
                if _next.pointee.type == type {
                    return nil
                }
                
                next = _next.pointee.next
            }
            
            // <+124>
            counts = CustomViewCountCache.Count(
                type: type,
                count: nil,
                next: customViewCache.counts
            )
        } else {
            // <+152>
            counts = CustomViewCountCache.Count(
                type: type,
                count: nil,
                next: self.customViewCache?.counts
            )
        }
        
        return withUnsafeMutablePointer(to: &counts) { counts in
            if var customViewCache {
                customViewCache.counts = counts
                copy_2.customViewCache = customViewCache
            } else {
                copy_2.customViewCache = CustomViewCountCache(
                    counts: counts,
                    modifierOptions: nil
                )
            }
            
            // <+188>
            // sp
            let _ = copy_1
            return body(copy_2)
        }
    }
}
