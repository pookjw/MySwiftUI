internal import Testing
@testable private import MySwiftUICore
private import Foundation

struct AngleTests {
    @Test
    func test_init() async throws {
        let angle = Angle()
        #expect(angle.radians == 0)
        #expect(angle.degrees == 0)
    }
    
    @Test
    func test_initWithRadian() async throws {
        let angle = Angle(radians: .pi)
        #expect(angle.radians == .pi)
        #expect(angle.degrees == 180)
    }
    
    @Test
    func test_initWithDegrees() async throws {
        let angle = Angle(degrees: 90)
        #expect(angle.radians == (.pi * 0.5))
        #expect(angle.degrees == 90)
    }
    
    @Test
    func test_degrees() async throws {
        var angle = Angle(radians: 0)
        angle.degrees = 180
        #expect(angle.radians == .pi)
        #expect(angle.degrees == 180)
    }
    
    @Test
    func test_staticInitializers() async throws {
        let angle_1 = Angle.radians(.pi / 3.0)
        let angle_2 = Angle.degrees(60)
        #expect(angle_1.radians == angle_2.radians)
    }
    
    @Test
    func test_comparable() async throws {
        let angle_1 = Angle(degrees: 0)
        let angle_2 = Angle(degrees: 90)
        let angle_3 = Angle(degrees: 90)
        
        #expect(angle_1 < angle_2)
        #expect(angle_2 <= angle_3)
        #expect(angle_1 != angle_2)
        #expect(angle_2 == angle_3)
        
        #expect(angle_1.hashValue != angle_2.hashValue)
        #expect(angle_2.hashValue == angle_3.hashValue)
    }
    
    @Test
    func testCodable() async throws {
        let original = Angle(radians: .pi * 0.25)
        let encoded = try JSONEncoder().encode(original)
        let decoded = try JSONDecoder().decode(Angle.self, from: encoded)
        #expect(decoded.radians == (.pi * 0.25))
    }
}
