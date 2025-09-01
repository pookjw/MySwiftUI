internal import Testing
@testable private import MySwiftUICore

struct SemanticsTests {
    @Test
    @MainActor
    func test_defaultForced() {
        let forced = Semantics.forced
        #expect(forced.sdk == nil)
        #expect(forced.deploymentTarget == nil)
    }
    
    @Test
    @MainActor
    func test_isLinkedOnOrAfter() {
        let original = Semantics.forced
        defer {
            Semantics.forced = original
        }
        
        Semantics.forced.sdk = .firstRelease
        #expect(isLinkedOnOrAfter(.firstRelease))
        #expect(!isLinkedOnOrAfter(.v2))
    }
    
    @Test
    func test_compare() {
        #expect(Semantics.v1 < Semantics.v2)
        #expect(Semantics.v2 <= Semantics.v2)
        #expect(Semantics.v2 <= Semantics.v3)
        #expect(Semantics.v5 == Semantics.v5)
    }
}
