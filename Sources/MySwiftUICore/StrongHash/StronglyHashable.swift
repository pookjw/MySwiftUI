import Foundation

package protocol StronglyHashable {
    func hash(into hasher: inout StrongHasher)
}

extension Data: StronglyHashable {
    package func hash(into hasher: inout StrongHasher) {
        withUnsafeBytes { (pointer: UnsafeRawBufferPointer) in
            hasher.combineBytes(pointer.baseAddress.unsafelyUnwrapped, count: pointer.count)
        }
    }
}

extension Bool: StronglyHashable {
    package func hash(into hasher: inout StrongHasher) {
        fatalError()
    }
}

extension Int: StronglyHashable {
    package func hash(into hasher: inout StrongHasher) {
        fatalError()
    }
}

extension UInt: StronglyHashable {
    package func hash(into hasher: inout StrongHasher) {
        fatalError()
    }
}

extension Int8: StronglyHashable {
    package func hash(into hasher: inout StrongHasher) {
        fatalError()
    }
}

extension UInt8: StronglyHashable {
    package func hash(into hasher: inout StrongHasher) {
        fatalError()
    }
}

extension Int16: StronglyHashable {
    package func hash(into hasher: inout StrongHasher) {
        fatalError()
    }
}

extension UInt16: StronglyHashable {
    package func hash(into hasher: inout StrongHasher) {
        fatalError()
    }
}

extension Int32: StronglyHashable {
    package func hash(into hasher: inout StrongHasher) {
        fatalError()
    }
}

extension UInt32: StronglyHashable {
    package func hash(into hasher: inout StrongHasher) {
        fatalError()
    }
}

extension Int64: StronglyHashable {
    package func hash(into hasher: inout StrongHasher) {
        fatalError()
    }
}

extension UInt64: StronglyHashable {
    package func hash(into hasher: inout StrongHasher) {
        fatalError()
    }
}

extension Float: StronglyHashable {
    package func hash(into hasher: inout StrongHasher) {
        fatalError()
    }
}

extension Double: StronglyHashable {
    package func hash(into hasher: inout StrongHasher) {
        fatalError()
    }
}

extension UUID: StronglyHashable {
    package func hash(into hasher: inout StrongHasher) {
        fatalError()
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
        fatalError()
    }
}



