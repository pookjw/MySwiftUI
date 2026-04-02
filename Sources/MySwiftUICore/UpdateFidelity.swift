package struct _UpdateFidelity: Hashable {
    package static var unspecified: _UpdateFidelity { return _UpdateFidelity(rawValue: .max) }
    package static var never: _UpdateFidelity { return _UpdateFidelity(rawValue: 0) }
    package static var minutes: _UpdateFidelity { return _UpdateFidelity(rawValue: 1) }
    package static var seconds: _UpdateFidelity { return _UpdateFidelity(rawValue: 2) }
    package static var milliseconds: _UpdateFidelity { return _UpdateFidelity(rawValue: 2) }
    
    package var rawValue: Int
}
