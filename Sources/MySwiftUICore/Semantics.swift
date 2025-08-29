#warning("TODO")
package import _DyldPrivate

package func isLinkedOnOrAfter(_ semantics: Semantics) -> Bool {
    if let sdk = Semantics.forced.sdk {
        return semantics.value <= sdk.value
    } else {
        return dyld_program_sdk_at_least(dyld_build_version_t(platform: semantics.value, version: 0xffffffff))
    }
}

package struct Semantics: Hashable, Comparable, CustomStringConvertible {
    package static func <(lhs: Semantics, rhs: Semantics) -> Bool {
        return lhs.value < rhs.value
    }
    
    package static func <=(lhs: Semantics, rhs: Semantics) -> Bool {
        return lhs.value <= rhs.value
    }
    
    package static var firstRelease: Semantics { Semantics(value: MySwiftUI_V1().platform) }
    package static var latest: Semantics { Semantics(value: .max - 1) }
    package static var maximal: Semantics { Semantics(value: .max) }
    
    package static var v1: Semantics { Semantics(value: MySwiftUI_V1().platform) }
    package static var v1_3_1: Semantics { Semantics(value: MySwiftUI_V1_3_1().platform) }
    package static var v1_4: Semantics { Semantics(value: MySwiftUI_V1_4().platform) }
    package static var v2: Semantics { Semantics(value: MySwiftUI_V2().platform) }
    package static var v2_1: Semantics { Semantics(value: MySwiftUI_V2_1().platform) }
    package static var v2_3: Semantics { Semantics(value: MySwiftUI_V2_3().platform) }
    package static var v3: Semantics { Semantics(value: MySwiftUI_V3().platform) }
    package static var v3_2: Semantics { Semantics(value: MySwiftUI_V3_2().platform) }
    package static var v3_4: Semantics { Semantics(value: MySwiftUI_V3_4().platform) }
    package static var v4: Semantics { Semantics(value: MySwiftUI_V4().platform) }
    package static var v5: Semantics { Semantics(value: MySwiftUI_V5().platform) }
    package static var v5_2: Semantics { Semantics(value: MySwiftUI_V5_2().platform) }
    package static var v6: Semantics { Semantics(value: MySwiftUI_V6().platform) }
    package static var v6_1: Semantics { Semantics(value: MySwiftUI_V6_1().platform) }
    package static var v6_2: Semantics { Semantics(value: MySwiftUI_V6_2().platform) }
    package static var v6_4: Semantics { Semantics(value: MySwiftUI_V6_4().platform) }
    package static var v7: Semantics { Semantics(value: MySwiftUI_V7().platform) }
    
    package static nonisolated(unsafe) var forced: Semantics.Forced = Semantics.Forced()
    
    fileprivate var value: UInt32
    
    package var prior: Semantics {
        return Semantics(value: value - 1)
    }
    
    package var description: String {
        fatalError("TODO")
    }
}

extension Semantics {
    package struct Forced {
        package var sdk: Semantics?
        package var deploymentTarget: Semantics?
        
        package init() {
//            fatalError("TODO")
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
    package static let semantic = Semantics(value: MySwiftUI_V2().platform)
}

package struct Semantics_v2_1: SemanticProtocol {
    package static let semantic = Semantics(value: MySwiftUI_V2_1().platform)
}

package struct Semantics_v2_3: SemanticProtocol {
    package static let semantic = Semantics(value: MySwiftUI_V2_3().platform)
}

package struct Semantics_v3: SemanticProtocol {
    package static let semantic = Semantics(value: MySwiftUI_V3().platform)
}

package struct Semantics_v4: SemanticProtocol {
    package static let semantic = Semantics(value: MySwiftUI_V4().platform)
}

package struct Semantics_v4_4: SemanticProtocol {
    package static let semantic = Semantics(value: MySwiftUI_V4_4().platform)
}

package struct Semantics_v5: SemanticProtocol {
    package static let semantic = Semantics(value: MySwiftUI_V5().platform)
}

package struct Semantics_v5_2: SemanticProtocol {
    package static let semantic = Semantics(value: MySwiftUI_V5_2().platform)
}

package struct Semantics_v6: SemanticProtocol {
    package static let semantic = Semantics(value: MySwiftUI_V6().platform)
}

package struct Semantics_v6_1: SemanticProtocol {
    package static let semantic = Semantics(value: MySwiftUI_V6_1().platform)
}

package struct Semantics_v6_4: SemanticProtocol {
    package static let semantic = Semantics(value: MySwiftUI_V6_4().platform)
}

package struct Semantics_v7: SemanticProtocol {
    package static let semantic = Semantics(value: MySwiftUI_V7().platform)
}

@_cdecl("mySwiftUI_v1_os_versions")
package func MySwiftUI_V1() -> dyld_build_version_t {
    return dyld_build_version_t(platform: 0x07e30901, version: 0xffffffff)
}

@_cdecl("mySwiftUI_autumn_2019_os_versions")
package func MySwiftUI_Autumn_2019() -> dyld_build_version_t {
    return dyld_build_version_t(platform: 0x07e30902, version: 0xffffffff)
}

@_cdecl("mySwiftUI_late_fall_2019_os_versions")
package func MySwiftUI_Late_Fall_2019() -> dyld_build_version_t {
    return dyld_build_version_t(platform: 0x07e31015, version: 0xffffffff)
}

@_cdecl("mySwiftUI_v1_3_1_os_versions")
package func MySwiftUI_V1_3_1() -> dyld_build_version_t {
    return dyld_build_version_t(platform: 0x07e31201, version: 0xffffffff)
}

@_cdecl("mySwiftUI_v1_4_os_versions")
package func MySwiftUI_V1_4() -> dyld_build_version_t {
    return dyld_build_version_t(platform: 0x07e40301, version: 0xffffffff)
}

@_cdecl("mySwiftUI_late_spring_2020_os_versions")
package func MySwiftUI_Late_Spring_2020() -> dyld_build_version_t {
    return dyld_build_version_t(platform: 0x07e40415, version: 0xffffffff)
}

@_cdecl("mySwiftUI_summer_2020_os_versions")
package func MySwiftUI_Summer_2020() -> dyld_build_version_t {
    return dyld_build_version_t(platform: 0x07e40601, version: 0xffffffff)
}

@_cdecl("mySwiftUI_v2_os_versions")
package func MySwiftUI_V2() -> dyld_build_version_t {
    return dyld_build_version_t(platform: 0x07e40901, version: 0xffffffff)
}

@_cdecl("mySwiftUI_v2_1_os_versions")
package func MySwiftUI_V2_1() -> dyld_build_version_t {
    return dyld_build_version_t(platform: 0x07e41015, version: 0xffffffff)
}

@_cdecl("mySwiftUI_v2_3_os_versions")
package func MySwiftUI_V2_3() -> dyld_build_version_t {
    return dyld_build_version_t(platform: 0x07e50301, version: 0xffffffff)
}

@_cdecl("mySwiftUI_v3_0_os_versions")
package func MySwiftUI_V3() -> dyld_build_version_t {
    return dyld_build_version_t(platform: 0x07e50901, version: 0xffffffff)
}

@_cdecl("mySwiftUI_v3_2_os_versions")
package func MySwiftUI_V3_2() -> dyld_build_version_t {
    return dyld_build_version_t(platform: 0x07e51201, version: 0xffffffff)
}

@_cdecl("mySwiftUI_v3_4_os_versions")
package func MySwiftUI_V3_4() -> dyld_build_version_t {
    return dyld_build_version_t(platform: 0x07e60301, version: 0xffffffff)
}

@_cdecl("mySwiftUI_v4_0_os_versions")
package func MySwiftUI_V4() -> dyld_build_version_t {
    return dyld_build_version_t(platform: 0x07e60901, version: 0xffffffff)
}

@_cdecl("mySwiftUI_v4_4_os_versions")
package func MySwiftUI_V4_4() -> dyld_build_version_t {
    return dyld_build_version_t(platform: 0x07e62300, version: 0xffffffff)
}

@_cdecl("mySwiftUI_v5_0_os_versions")
package func MySwiftUI_V5() -> dyld_build_version_t {
    return dyld_build_version_t(platform: 0x07e70901, version: 0xffffffff)
}

@_cdecl("mySwiftUI_v5_2_os_versions")
package func MySwiftUI_V5_2() -> dyld_build_version_t {
    return dyld_build_version_t(platform: 0x07e70d01, version: 0xffffffff)
}

@_cdecl("mySwiftUI_v6_0_os_versions")
package func MySwiftUI_V6() -> dyld_build_version_t {
    return dyld_build_version_t(platform: 0x07e80000, version: 0xffffffff)
}

@_cdecl("mySwiftUI_v6_1_os_versions")
package func MySwiftUI_V6_1() -> dyld_build_version_t {
    return dyld_build_version_t(platform: 0x07e80100, version: 0xffffffff)
}

@_cdecl("mySwiftUI_v6_2_os_versions")
package func MySwiftUI_V6_2() -> dyld_build_version_t {
    return dyld_build_version_t(platform: 0x07e80200, version: 0xffffffff)
}

@_cdecl("mySwiftUI_v6_4_os_versions")
package func MySwiftUI_V6_4() -> dyld_build_version_t {
    return dyld_build_version_t(platform: 0x07e80400, version: 0xffffffff)
}

@_cdecl("mySwiftUI_v7_0_os_versions")
package func MySwiftUI_V7() -> dyld_build_version_t {
    return dyld_build_version_t(platform: 0x07e90000, version: 0xffffffff)
}

