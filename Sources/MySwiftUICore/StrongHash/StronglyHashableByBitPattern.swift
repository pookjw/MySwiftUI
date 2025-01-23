import Foundation

package protocol StronglyHashableByBitPattern: StronglyHashable {}

extension Bool: StronglyHashableByBitPattern {}
extension Int: StronglyHashableByBitPattern {}
extension UInt: StronglyHashableByBitPattern {}
extension Int8: StronglyHashableByBitPattern {}
extension UInt8: StronglyHashableByBitPattern {}
extension Int16: StronglyHashableByBitPattern {}
extension UInt16: StronglyHashableByBitPattern {}
extension Int32: StronglyHashableByBitPattern {}
extension UInt32: StronglyHashableByBitPattern {}
extension Int64: StronglyHashableByBitPattern {}
extension UInt64: StronglyHashableByBitPattern {}
extension Float: StronglyHashableByBitPattern {}
extension Double: StronglyHashableByBitPattern {}
extension UUID: StronglyHashableByBitPattern {}
extension String: StronglyHashableByBitPattern {}
extension StrongHash: StronglyHashableByBitPattern {}
