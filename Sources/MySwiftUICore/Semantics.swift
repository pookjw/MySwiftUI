#warning("TODO")
package import _DyldPrivate

package func isLinkedOnOrAfter(_ semantics: Semantics) -> Bool {
    if let sdk = Semantics.forced.sdk {
        return semantics.value <= sdk.value
    } else {
        return dyld_program_sdk_at_least(dyld_build_version_t(platform: .max, version: semantics.value))
    }
}

package struct Semantics: Hashable, Comparable, CustomStringConvertible {
    package static func <(lhs: Semantics, rhs: Semantics) -> Bool {
        return lhs.value < rhs.value
    }
    
    package static func <=(lhs: Semantics, rhs: Semantics) -> Bool {
        return lhs.value <= rhs.value
    }
    
    package static var firstRelease: Semantics { Semantics(value: SwiftUI_v1().version) }
    package static var latest: Semantics { Semantics(value: .max - 1) }
    package static var maximal: Semantics { Semantics(value: .max) }
    
    package static var v1: Semantics { Semantics(value: SwiftUI_v1().version) }
    package static var v1_3_1: Semantics { Semantics(value: SwiftUI_v1_3_1().version) }
    package static var v1_4: Semantics { Semantics(value: SwiftUI_v1_4().version) }
    package static var v2: Semantics { Semantics(value: SwiftUI_v2().version) }
    package static var v2_1: Semantics { Semantics(value: SwiftUI_v2_1().version) }
    package static var v2_3: Semantics { Semantics(value: SwiftUI_v2_3().version) }
    package static var v3: Semantics { Semantics(value: SwiftUI_v3().version) }
    package static var v3_2: Semantics { Semantics(value: SwiftUI_v3_2().version) }
    package static var v3_4: Semantics { Semantics(value: SwiftUI_v3_4().version) }
    package static var v4: Semantics { Semantics(value: SwiftUI_v4().version) }
    package static var v5: Semantics { Semantics(value: SwiftUI_v5().version) }
    package static var v5_2: Semantics { Semantics(value: SwiftUI_v5_2().version) }
    package static var v6: Semantics { Semantics(value: SwiftUI_v6().version) }
    package static var v6_1: Semantics { Semantics(value: SwiftUI_v6_1().version) }
    package static var v6_2: Semantics { Semantics(value: SwiftUI_v6_2().version) }
    package static var v6_4: Semantics { Semantics(value: SwiftUI_v6_4().version) }
    package static var v7: Semantics { Semantics(value: SwiftUI_v7().version) }
    package static var v7_1: Semantics { Semantics(value: SwiftUI_v7_1().version) }
    package static var v7_2: Semantics { Semantics(value: SwiftUI_v7_2().version) }
    package static var v7_4: Semantics { Semantics(value: SwiftUI_v7_4().version) }
    package static var v8: Semantics { Semantics(value: SwiftUI_v8().version) }
    
    @safe package static nonisolated(unsafe) var forced: Semantics.Forced = Semantics.Forced()
    
    fileprivate var value: UInt32
    
    package var prior: Semantics {
        return Semantics(value: value - 1)
    }
    
    package var description: String {
//        fatalError("TODO")
        return "(TODO)"
    }
    
    package func test<T>(as: WritableKeyPath<Semantics.Forced, Semantics?>, _ body: () throws -> T) rethrows -> T {
        fatalError("TODO")
    }
}

extension Semantics {
    package struct Forced {
        package var sdk: Semantics?
        package var deploymentTarget: Semantics?
        
        package init() {
            let firstRelease = Semantics.firstRelease
            let flag = dyld_program_sdk_at_least(dyld_build_version_t(platform: .max, version: firstRelease.value))
            if flag {
                sdk = nil
                deploymentTarget = nil
            } else {
                sdk = firstRelease
                deploymentTarget = firstRelease
            }
        }
    }
}

extension Semantics {
    package struct UnifiedLayout {
        // TODO
    }
}

extension Semantics {
    package struct DismissPopsInNavigationSplitViewRoots {
        // TODO
    }
}

package struct SemanticsIsLinkedOnOrAfter<T> {
    // TODO
}

package protocol SemanticProtocol {
    static var semantic: Semantics {
        get
    }
}

package struct Semantics_v2: SemanticProtocol {
    package static let semantic = Semantics(value: SwiftUI_v2().platform)
}

package struct Semantics_v2_1: SemanticProtocol {
    package static let semantic = Semantics(value: SwiftUI_v2_1().platform)
}

package struct Semantics_v2_3: SemanticProtocol {
    package static let semantic = Semantics(value: SwiftUI_v2_3().platform)
}

package struct Semantics_v3: SemanticProtocol {
    package static let semantic = Semantics(value: SwiftUI_v3().platform)
}

package struct Semantics_v4: SemanticProtocol {
    package static let semantic = Semantics(value: SwiftUI_v4().platform)
}

package struct Semantics_v4_4: SemanticProtocol {
    package static let semantic = Semantics(value: SwiftUI_v4_4().platform)
}

package struct Semantics_v5: SemanticProtocol {
    package static let semantic = Semantics(value: SwiftUI_v5().platform)
}

package struct Semantics_v5_2: SemanticProtocol {
    package static let semantic = Semantics(value: SwiftUI_v5_2().platform)
}

package struct Semantics_v6: SemanticProtocol {
    package static let semantic = Semantics(value: SwiftUI_v6().platform)
}

package struct Semantics_v6_1: SemanticProtocol {
    package static let semantic = Semantics(value: SwiftUI_v6_1().platform)
}

package struct Semantics_v6_4: SemanticProtocol {
    package static let semantic = Semantics(value: SwiftUI_v6_4().platform)
}

package struct Semantics_v7: SemanticProtocol {
    package static let semantic = Semantics(value: SwiftUI_v7().platform)
}

@_cdecl("SwiftUI_v1_os_versions")
package func SwiftUI_v1() -> dyld_build_version_t {
    return dyld_build_version_t(platform: .max, version: 0x07e30901)
}

@_cdecl("SwiftUI_autumn_2019_os_versions")
package func SwiftUI_Autumn_2019() -> dyld_build_version_t {
    return dyld_build_version_t(platform: .max, version: 0x07e30902)
}

@_cdecl("SwiftUI_late_fall_2019_os_versions")
package func SwiftUI_Late_Fall_2019() -> dyld_build_version_t {
    return dyld_build_version_t(platform: .max, version: 0x07e31015)
}

@_cdecl("SwiftUI_v1_3_1_os_versions")
package func SwiftUI_v1_3_1() -> dyld_build_version_t {
    return dyld_build_version_t(platform: .max, version: 0x07e31201)
}

@_cdecl("SwiftUI_v1_4_os_versions")
package func SwiftUI_v1_4() -> dyld_build_version_t {
    return dyld_build_version_t(platform: .max, version: 0x07e40301)
}

@_cdecl("SwiftUI_late_spring_2020_os_versions")
package func SwiftUI_Late_Spring_2020() -> dyld_build_version_t {
    return dyld_build_version_t(platform: .max, version: 0x07e40415)
}

@_cdecl("SwiftUI_summer_2020_os_versions")
package func SwiftUI_Summer_2020() -> dyld_build_version_t {
    return dyld_build_version_t(platform: .max, version: 0x07e40601)
}

@_cdecl("SwiftUI_v2_os_versions")
package func SwiftUI_v2() -> dyld_build_version_t {
    return dyld_build_version_t(platform: .max, version: 0x07e40901)
}

@_cdecl("SwiftUI_v2_1_os_versions")
package func SwiftUI_v2_1() -> dyld_build_version_t {
    return dyld_build_version_t(platform: .max, version: 0x07e41015)
}

@_cdecl("SwiftUI_v2_3_os_versions")
package func SwiftUI_v2_3() -> dyld_build_version_t {
    return dyld_build_version_t(platform: .max, version: 0x07e50301)
}

@_cdecl("SwiftUI_v3_0_os_versions")
package func SwiftUI_v3() -> dyld_build_version_t {
    return dyld_build_version_t(platform: .max, version: 0x07e50901)
}

@_cdecl("SwiftUI_v3_2_os_versions")
package func SwiftUI_v3_2() -> dyld_build_version_t {
    return dyld_build_version_t(platform: .max, version: 0x07e51201)
}

@_cdecl("SwiftUI_v3_4_os_versions")
package func SwiftUI_v3_4() -> dyld_build_version_t {
    return dyld_build_version_t(platform: .max, version: 0x07e60301)
}

@_cdecl("SwiftUI_v4_0_os_versions")
package func SwiftUI_v4() -> dyld_build_version_t {
    return dyld_build_version_t(platform: .max, version: 0x07e60901)
}

@_cdecl("SwiftUI_v4_4_os_versions")
package func SwiftUI_v4_4() -> dyld_build_version_t {
    return dyld_build_version_t(platform: .max, version: 0x07e62300)
}

@_cdecl("SwiftUI_v5_0_os_versions")
package func SwiftUI_v5() -> dyld_build_version_t {
    return dyld_build_version_t(platform: .max, version: 0x07e70901)
}

@_cdecl("SwiftUI_v5_2_os_versions")
package func SwiftUI_v5_2() -> dyld_build_version_t {
    return dyld_build_version_t(platform: .max, version: 0x07e70d01)
}

@_cdecl("SwiftUI_v6_0_os_versions")
package func SwiftUI_v6() -> dyld_build_version_t {
    return dyld_build_version_t(platform: .max, version: 0x07e80000)
}

@_cdecl("SwiftUI_v6_1_os_versions")
package func SwiftUI_v6_1() -> dyld_build_version_t {
    return dyld_build_version_t(platform: .max, version: 0x07e80100)
}

@_cdecl("SwiftUI_v6_2_os_versions")
package func SwiftUI_v6_2() -> dyld_build_version_t {
    return dyld_build_version_t(platform: .max, version: 0x07e80200)
}

@_cdecl("SwiftUI_v6_4_os_versions")
package func SwiftUI_v6_4() -> dyld_build_version_t {
    return dyld_build_version_t(platform: .max, version: 0x07e80400)
}

@_cdecl("SwiftUI_v7_0_os_versions")
package func SwiftUI_v7() -> dyld_build_version_t {
    return dyld_build_version_t(platform: .max, version: 0x07e90000)
}

@_cdecl("SwiftUI_v7_1_os_versions")
package func SwiftUI_v7_1() -> dyld_build_version_t {
    return dyld_build_version_t(platform: .max, version: 0x07e91000)
}

@_cdecl("SwiftUI_v7_2_os_versions")
package func SwiftUI_v7_2() -> dyld_build_version_t {
    return dyld_build_version_t(platform: .max, version: 0x07e92000)
}

@_cdecl("SwiftUI_v7_4_os_versions")
package func SwiftUI_v7_4() -> dyld_build_version_t {
    return dyld_build_version_t(platform: .max, version: 0x07e94000)
}

@_cdecl("SwiftUI_v8_os_versions")
package func SwiftUI_v8() -> dyld_build_version_t {
    return dyld_build_version_t(platform: .max, version: 0x07ea0000)
}

package protocol SemanticFeature: Feature {
    static var introduced: Semantics { get }
    static var requirement: SemanticRequirement { get }
}

extension SemanticFeature {
    package static var requirement: SemanticRequirement {
        return .linkedOnOrAfter
    }
    
    static var prior: Semantics {
        return introduced.prior
    }
    
    package static var isEnabled: Bool {
        return isLinkedOnOrAfter(prior)
    }
}

package struct _SemanticFeature<T: SemanticProtocol>: SemanticFeature {
    package static var introduced: Semantics {
        return T.semantic
    }
    
    @inlinable package init() {}
}

package enum SemanticRequirement {
    case linkedOnOrAfter
    case deployedOnOrAfter
}
