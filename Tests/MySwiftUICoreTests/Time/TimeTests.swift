import Testing
import QuartzCore
import CoreFoundation
@testable import MySwiftUICore

struct TimeTests {
    @Test func test_init() {
        let time = Time()
        #expect(time.secounds == 0)
    }
    
    @Test func test_initSeconds() {
        let seconds = CFTimeInterval(300_000.111)
        let time = Time(seconds: seconds)
        #expect(time.secounds == seconds)
    }
    
    @Test func test_systemUptime() {
        let systemUptime = CACurrentMediaTime()
        let time = Time.systemUptime
        #expect(systemUptime < time.secounds)
    }
    
    @Test func test_comparable() {
        let time_1 = Time(seconds: 100_000.111)
        let time_2 = Time(seconds: 200_000.222)
        #expect(time_1 < time_2)
    }
    
    @Test func test_equatable() {
        let time_1 = Time(seconds: 100_000.111)
        let time_2 = Time(seconds: 100_000.111)
        #expect(time_1 == time_2)
    }
    
    @Test func test_equatable2() {
        let time_1 = Time(seconds: 100_000.111)
        let time_2 = Time(seconds: 200_000.222)
        #expect(time_1 != time_2)
    }
    
    @Test func test_addition() {
        let time_1 = Time(seconds: 100_000.111)
        let time_2 = Time(seconds: 100_000.111)
        let result = time_1 + time_2
        #expect(result.secounds == 200_000.222)
    }
    
    @Test func test_substraction() {
        let time_1 = Time(seconds: 200_000.222)
        let time_2 = Time(seconds: 100_000.111)
        let result = time_1 - time_2
        #expect(result.secounds == 100_000.111)
    }
    
    @Test func test_prefixNegation() {
        let time = Time(seconds: 123.456)
        let negativeTime = -time
        #expect(negativeTime.secounds == -123.456)
    }
    
    @Test func test_multiplication() {
        let time_1 = Time(seconds: 100.0)
        let time_2 = Time(seconds: 2.0)
        let result = time_1 * time_2
        #expect(result.secounds == 200.0)
    }
    
    @Test func test_division() {
        let time_1 = Time(seconds: 200.0)
        let time_2 = Time(seconds: 2.0)
        let result = time_1 / time_2
        #expect(result.secounds == 100.0)
    }
    
    @Test func test_subtractionAssignment() {
        var time_1 = Time(seconds: 500.0)
        let time_2 = Time(seconds: 100.0)
        
        time_1 -= time_2
        #expect(time_1.secounds == 400.0)
    }
    
    @Test func test_multiplicationAssignment() {
        var time_1 = Time(seconds: 50.0)
        let time_2 = Time(seconds: 2.0)
        
        time_1 *= time_2
        #expect(time_1.secounds == 100.0)
    }
    
    @Test func test_divisionAssignment() {
        var time_1 = Time(seconds: 100.0)
        let time_2 = Time(seconds: 5.0)
        
        time_1 /= time_2
        #expect(time_1.secounds == 20.0)
    }
    
    @Test func test_zero() {
        #expect(Time.zero.secounds == 0)
    }
    
    @Test func test_infinity() {
        #expect(Time.infinity.secounds == .infinity)
    }
}
