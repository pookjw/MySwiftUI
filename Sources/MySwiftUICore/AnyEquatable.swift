// 5FED8E8437E1C5DEB2554486604823AB

struct AnyEquatable: Equatable {
    var hash: StrongHash? {
        get {
            assertUnimplemented()
        }
    }

    init<A: Equatable>(_ value: A) {
        assertUnimplemented()
    }

    init(hash: StrongHash) {
        assertUnimplemented()
    }

    static func == (lhs: AnyEquatable, rhs: AnyEquatable) -> Bool {
        assertUnimplemented()
    }

    func `as`<A: Equatable>(_ type: A.Type) -> A? {
        assertUnimplemented()
    }
}
