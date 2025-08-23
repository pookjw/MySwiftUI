#warning("TODO")

package struct Time {
    package static var zero: Time { Time(seconds: 0) }
    package static var infinity: Time { Time(seconds: .greatestFiniteMagnitude) }
    
    var seconds: Double
}
