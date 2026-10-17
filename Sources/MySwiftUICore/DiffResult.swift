internal import Foundation

struct DiffResult : Equatable, Hashable {
    var removes: IndexSet {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }

    var moves: [Move] {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }

    var inserts: IndexSet {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }

    var isEmpty: Bool {
        get {
            assertUnimplemented()
        }
    }

    var hashValue: Int {
        get {
            assertUnimplemented()
        }
    }

    struct Move: Equatable, Hashable {
        var remove: Int {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
            _modify {
                assertUnimplemented()
            }
        }

        var insert: Int {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
            _modify {
                assertUnimplemented()
            }
        }

        var hashValue: Int {
            get {
                assertUnimplemented()
            }
        }

        init(remove: Int, insert: Int) {
            assertUnimplemented()
        }

        static func == (lhs: Move, rhs: Move) -> Bool {
            assertUnimplemented()
        }

        func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
    }

    init(removes: IndexSet = [], moves: [Move] = [], inserts: IndexSet = []) {
        assertUnimplemented()
    }

    static func == (lhs: DiffResult, rhs: DiffResult) -> Bool {
        assertUnimplemented()
    }

    func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }

    static func translateMovesToArraySemantics(sortedRemovals: [Int], moves: [Move], sortedInsertions: [Int]) -> [Move] {
        assertUnimplemented()
    }

    func movesTranslatedToArraySemantics() -> [Move] {
        assertUnimplemented()
    }
}
