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

    func `as`<A: Equatable>(type: A.Type) -> A? {
        assertUnimplemented()
    }
}

fileprivate class AnyEquatableBox {
    var hash: StrongHash? {
        assertUnimplemented()
    }

    func `as`<A: Equatable>(type: A.Type) -> A? {
        assertUnimplemented()
    }

    func isEqual(to other: AnyEquatableBox) -> Bool {
        assertUnimplemented()
    }
}

fileprivate class _AnyEquatableBox<A: Equatable>: AnyEquatableBox {
    let value: A

    init(_ value: A) {
        self.value = value
    }

    override var hash: StrongHash? {
        assertUnimplemented()
    }

    override func `as`<B: Equatable>(type: B.Type) -> B? {
        assertUnimplemented()
    }

    override func isEqual(to other: AnyEquatableBox) -> Bool {
        assertUnimplemented()
    }
}
