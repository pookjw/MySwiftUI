internal import os.log

enum AnimationLogger {
    static let logger: os.Logger = { assertUnimplemented() }()
}
