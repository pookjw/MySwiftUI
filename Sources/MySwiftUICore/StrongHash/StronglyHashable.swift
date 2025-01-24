import Foundation

package protocol StronglyHashable {
    func hash(into hasher: inout StrongHasher)
}

//extension ToggleState: StronglyHashable {
//
//}

extension Data: StronglyHashable {
    package func hash(into hasher: inout StrongHasher) {
        withUnsafeBytes { (pointer: UnsafeRawBufferPointer) in
            hasher.combineBytes(pointer.baseAddress.unsafelyUnwrapped, count: pointer.count)
        }
    }
}

extension Bool: StronglyHashable {
    package func hash(into hasher: inout StrongHasher) {
        hasher.combineBitPattern(self)
    }
}

extension Int: StronglyHashable {
    package func hash(into hasher: inout StrongHasher) {
        hasher.combineBitPattern(self)
    }
}

extension UInt: StronglyHashable {
    package func hash(into hasher: inout StrongHasher) {
        hasher.combineBitPattern(self)
    }
}

extension Int8: StronglyHashable {
    package func hash(into hasher: inout StrongHasher) {
        hasher.combineBitPattern(self)
    }
}

extension UInt8: StronglyHashable {
    package func hash(into hasher: inout StrongHasher) {
        hasher.combineBitPattern(self)
    }
}

extension Int16: StronglyHashable {
    package func hash(into hasher: inout StrongHasher) {
        hasher.combineBitPattern(self)
    }
}

extension UInt16: StronglyHashable {
    package func hash(into hasher: inout StrongHasher) {
        hasher.combineBitPattern(self)
    }
}

extension Int32: StronglyHashable {
    package func hash(into hasher: inout StrongHasher) {
        hasher.combineBitPattern(self)
    }
}

extension UInt32: StronglyHashable {
    package func hash(into hasher: inout StrongHasher) {
        hasher.combineBitPattern(self)
    }
}

extension Int64: StronglyHashable {
    package func hash(into hasher: inout StrongHasher) {
        hasher.combineBitPattern(self)
    }
}

extension UInt64: StronglyHashable {
    package func hash(into hasher: inout StrongHasher) {
        hasher.combineBitPattern(self)
    }
}

extension Float: StronglyHashable {
    package func hash(into hasher: inout StrongHasher) {
        hasher.combineBitPattern(self)
    }
}

extension Double: StronglyHashable {
    package func hash(into hasher: inout StrongHasher) {
        hasher.combineBitPattern(self)
    }
}

extension UUID: StronglyHashable {
    package func hash(into hasher: inout StrongHasher) {
        hasher.combineBitPattern(self)
    }
}

extension StrongHash: StronglyHashable {
    package func hash(into hasher: inout StrongHasher) {
        withUnsafeBytes(of: words) { pointer in
            hasher.combineBytes(pointer.baseAddress.unsafelyUnwrapped, count: pointer.count)
        }
    }
}

extension String: StronglyHashable {
    package func hash(into hasher: inout StrongHasher) {
        hasher.combineBitPattern(self)
    }
}
