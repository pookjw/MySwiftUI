private import SwiftSyntax

enum Availability {
    case available(restrictions: Availability.Restrictions)
    case unavailable
}

extension Availability {
    struct Version {
        private var major: Int
        private var minors: [Int]
    }
    
    enum DeprecatedVersion {
        case specified(Availability.Version)
        case omitted
    }
    
    struct Restrictions {
        private var introduced: Availability.Version?
        private var obsoleted: Availability.Version?
        private var deprecated: Availability.DeprecatedVersion?
    }
    
    enum Value {
        case available(deprecated: Bool)
        case unavailable
    }
}

struct AvailabilitySet {
    private var platformAvailability: [AvailabilitySet.Platform : Availability]
    private var swiftRestrictions: Availability.Restrictions
    private var isGloballyUnavailable: Bool
    private var isGloballyDeprecated: Bool
}

extension AvailabilitySet {
    struct Platform : Hashable {
        private var name: String
    }
    
    struct Filter {
        private let rawValue: Int
    }
}

struct AvailabilityParseError {
    private var specList: AvailabilityArgumentListSyntax
    private var problem: AvailabilityParseError.Problem
}

extension AvailabilityParseError {
    enum Problem {
        case malformedList(message: String)
        case unsupportedEntry(Int, message: String)
    }
}
