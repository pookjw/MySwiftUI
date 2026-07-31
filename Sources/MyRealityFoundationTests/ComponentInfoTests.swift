private import _RealityFoundationPrivate
@testable @_spi(Internal) private import MyRealityFoundation
internal import Testing
private import RealityKit

struct ComponentInfoTests {
    @Test func test_init() {
        let reComponentClass = unsafe OpaquePointer(bitPattern: 0x1234)!
        let original = unsafe _RealityFoundationPrivate::ComponentInfo(
            bundleIdentifier: "Test",
            type: NativeComponent.self,
            reComponentClass: reComponentClass,
            access: .api,
            availability: _RealityFoundationPrivate::ComponentInfo.Availability(
                introduced: [.macOS("10.15"), .visionOS("1.0")],
                deprecated: [.macOS("26.0")],
                obsoleted: nil
            )
        )
        let impl = unsafe MyRealityFoundation::ComponentInfo(
            bundleIdentifier: "Test",
            type: ImplComponent.self,
            reComponentClass: reComponentClass,
            access: .api,
            availability: MyRealityFoundation::ComponentInfo.Availability(
                introduced: [.macOS("10.15"), .visionOS("1.0")],
                deprecated: [.macOS("26.0")],
                obsoleted: nil
            )
        )
        
        #expect(compare(original, impl))
        #expect(ObjectIdentifier(original.type) == ObjectIdentifier(NativeComponent.self))
        #expect(ObjectIdentifier(impl.type) == ObjectIdentifier(ImplComponent.self))
        #expect(original.reComponentType == nil)
        #expect(impl.reComponentType == nil)
        let originalReComponentClassMatches = unsafe (original.reComponentClass == reComponentClass)
        let implReComponentClassMatches = unsafe (impl.reComponentClass == reComponentClass)
        #expect(originalReComponentClassMatches)
        #expect(implReComponentClassMatches)
    }
    
    @Test func test_description() {
        let original = unsafe _RealityFoundationPrivate::ComponentInfo(
            bundleIdentifier: "Test",
            type: NativeComponent.self,
            reComponentClass: nil,
            access: .api,
            availability: _RealityFoundationPrivate::ComponentInfo.Availability(
                introduced: [.macOS("10.15")],
                deprecated: [.macOS("26.0")],
                obsoleted: [.macOS("27.0")]
            )
        )
        let impl = unsafe MyRealityFoundation::ComponentInfo(
            bundleIdentifier: "Test",
            type: ImplComponent.self,
            reComponentClass: nil,
            access: .api,
            availability: MyRealityFoundation::ComponentInfo.Availability(
                introduced: [.macOS("10.15")],
                deprecated: [.macOS("26.0")],
                obsoleted: [.macOS("27.0")]
            )
        )
        
        #expect(
            original.description ==
            "ComponentInfo(type: NativeComponent, access: api, introduced: [macos 10.15.0], deprecated: [macos 26.0.0], obsoleted: [macos 27.0.0])"
        )
        #expect(
            impl.description ==
            "ComponentInfo(type: ImplComponent, access: api, introduced: [macos 10.15.0], deprecated: [macos 26.0.0], obsoleted: [macos 27.0.0])"
        )
    }
}

extension ComponentInfoTests {
    struct AvailabilityTests {
        @Test func test_init() {
            let original = _RealityFoundationPrivate::ComponentInfo.Availability(
                introduced: [.macOS("10.15"), .iOS("13.0"), .visionOS("1.0")],
                deprecated: [.macOS("26.0"), .iOS("26.0")],
                obsoleted: [.macOS("27.0")]
            )
            let impl = MyRealityFoundation::ComponentInfo.Availability(
                introduced: [.macOS("10.15"), .iOS("13.0"), .visionOS("1.0")],
                deprecated: [.macOS("26.0"), .iOS("26.0")],
                obsoleted: [.macOS("27.0")]
            )
            
            #expect(compare(original, impl))
        }
        
        @Test func test_description() {
            let originals = [
                _RealityFoundationPrivate::ComponentInfo.Availability(
                    introduced: [],
                    deprecated: nil,
                    obsoleted: nil
                ),
                _RealityFoundationPrivate::ComponentInfo.Availability(
                    introduced: [.macOS("10.15")],
                    deprecated: [],
                    obsoleted: nil
                ),
                _RealityFoundationPrivate::ComponentInfo.Availability(
                    introduced: [.macOS("10.15"), .visionOS("1.0")],
                    deprecated: [.macOS("26.0")],
                    obsoleted: [.macOS("27.0")]
                )
            ]
            let impls = [
                MyRealityFoundation::ComponentInfo.Availability(
                    introduced: [],
                    deprecated: nil,
                    obsoleted: nil
                ),
                MyRealityFoundation::ComponentInfo.Availability(
                    introduced: [.macOS("10.15")],
                    deprecated: [],
                    obsoleted: nil
                ),
                MyRealityFoundation::ComponentInfo.Availability(
                    introduced: [.macOS("10.15"), .visionOS("1.0")],
                    deprecated: [.macOS("26.0")],
                    obsoleted: [.macOS("27.0")]
                )
            ]
            
            #expect(originals.count == impls.count)
            for (original, impl) in zip(originals, impls) {
                #expect(original.description == impl.description)
            }
        }
    }
}

extension ComponentInfoTests {
    struct PlatformTests {
        @Test func test_staticPlatforms() {
            let originals: [_RealityFoundationPrivate::ComponentInfo.Platform] = [
                .macOS,
                .macCatalyst,
                .iOS,
                .xrOS,
                .tvOS
            ]
            let impls: [MyRealityFoundation::ComponentInfo.Platform] = [
                .macOS,
                .macCatalyst,
                .iOS,
                .xrOS,
                .tvOS
            ]
            
            #expect(originals.count == impls.count)
            for (original, impl) in zip(originals, impls) {
                #expect(compare(original, impl))
            }
        }
        
        @Test func test_Equatable() {
            let originals: [_RealityFoundationPrivate::ComponentInfo.Platform] = [
                .macOS,
                .macCatalyst,
                .iOS,
                .xrOS,
                .tvOS
            ]
            let impls: [MyRealityFoundation::ComponentInfo.Platform] = [
                .macOS,
                .macCatalyst,
                .iOS,
                .xrOS,
                .tvOS
            ]
            
            for i in originals.indices {
                for j in originals.indices {
                    #expect((originals[i] == originals[j]) == (impls[i] == impls[j]))
                }
            }
        }
        
        @Test func test_description() {
            #expect(
                _RealityFoundationPrivate::ComponentInfo.Platform.macOS.description ==
                MyRealityFoundation::ComponentInfo.Platform.macOS.description
            )
            #expect(
                _RealityFoundationPrivate::ComponentInfo.Platform.macCatalyst.description ==
                MyRealityFoundation::ComponentInfo.Platform.macCatalyst.description
            )
            #expect(
                _RealityFoundationPrivate::ComponentInfo.Platform.iOS.description ==
                MyRealityFoundation::ComponentInfo.Platform.iOS.description
            )
            #expect(
                _RealityFoundationPrivate::ComponentInfo.Platform.xrOS.description ==
                MyRealityFoundation::ComponentInfo.Platform.xrOS.description
            )
            #expect(
                _RealityFoundationPrivate::ComponentInfo.Platform.tvOS.description ==
                MyRealityFoundation::ComponentInfo.Platform.tvOS.description
            )
        }
    }
}

extension ComponentInfoTests {
    struct SupportedPlatformTests {
        @Test func test_staticFactories() {
            let originals: [_RealityFoundationPrivate::ComponentInfo.SupportedPlatform] = [
                .macOS("10.15"),
                .macCatalyst("13.0"),
                .iOS("13.0"),
                .visionOS("1.0"),
                .tvOS("26.0")
            ]
            let impls: [MyRealityFoundation::ComponentInfo.SupportedPlatform] = [
                .macOS("10.15"),
                .macCatalyst("13.0"),
                .iOS("13.0"),
                .visionOS("1.0"),
                .tvOS("26.0")
            ]
            
            #expect(originals.count == impls.count)
            for (original, impl) in zip(originals, impls) {
                #expect(compare(original, impl))
            }
        }
        
        @Test func test_init() {
            let original = _RealityFoundationPrivate::ComponentInfo.SupportedPlatform(
                platform: .xrOS,
                version: "2.1.3"
            )
            let impl = MyRealityFoundation::ComponentInfo.SupportedPlatform(
                platform: .xrOS,
                version: "2.1.3"
            )
            
            #expect(compare(original, impl))
        }
        
        @Test func test_Equatable() {
            let originals: [_RealityFoundationPrivate::ComponentInfo.SupportedPlatform] = [
                .macOS("10.15"),
                .macOS("26.0"),
                .iOS("26.0"),
                .visionOS("1.0")
            ]
            let impls: [MyRealityFoundation::ComponentInfo.SupportedPlatform] = [
                .macOS("10.15"),
                .macOS("26.0"),
                .iOS("26.0"),
                .visionOS("1.0")
            ]
            
            for i in originals.indices {
                for j in originals.indices {
                    #expect((originals[i] == originals[j]) == (impls[i] == impls[j]))
                }
            }
        }
        
        @Test func test_description() {
            let original = _RealityFoundationPrivate::ComponentInfo.SupportedPlatform.visionOS("2.1.3")
            let impl = MyRealityFoundation::ComponentInfo.SupportedPlatform.visionOS("2.1.3")
            
            #expect(original.description == impl.description)
        }
    }
}

extension ComponentInfoTests {
    struct PlatformVersionTests {
        @Test func test_init() {
            let values = ["0", "1.2", "3.4.5", "10.15", "26.0.1"]
            
            for value in values {
                let original = _RealityFoundationPrivate::ComponentInfo.PlatformVersion(value)
                let impl = MyRealityFoundation::ComponentInfo.PlatformVersion(value)
                
                #expect(compare(original, impl))
            }
        }
        
        @Test func test_stringLiteral() {
            let original: _RealityFoundationPrivate::ComponentInfo.PlatformVersion = "1.2.3"
            let impl: MyRealityFoundation::ComponentInfo.PlatformVersion = "1.2.3"
            
            #expect(compare(original, impl))
        }
        
        @Test func test_versionString() {
            let values = ["1", "1.2", "1.2.0", "1.2.3"]
            
            for value in values {
                let original = _RealityFoundationPrivate::ComponentInfo.PlatformVersion(value)
                let impl = MyRealityFoundation::ComponentInfo.PlatformVersion(value)
                
                #expect(original.versionString == impl.versionString)
            }
        }
        
        @Test func test_Comparable() {
            let values = ["0.0.0", "1.0.0", "1.0.1", "1.1.0", "2.0.0"]
            let originals = values.map { value in
                _RealityFoundationPrivate::ComponentInfo.PlatformVersion(value)
            }
            let impls = values.map { value in
                MyRealityFoundation::ComponentInfo.PlatformVersion(value)
            }
            
            for i in originals.indices {
                for j in originals.indices {
                    let originalLessThan = originals[i] < originals[j]
                    let implLessThan = impls[i] < impls[j]
                    #expect(originalLessThan == implLessThan)
                    
                    let originalEqual = originals[i] == originals[j]
                    let implEqual = impls[i] == impls[j]
                    #expect(originalEqual == implEqual)
                }
            }
        }
        
        @Test func test_unknown() {
            #expect(compare(
                _RealityFoundationPrivate::ComponentInfo.PlatformVersion.unknown,
                MyRealityFoundation::ComponentInfo.PlatformVersion.unknown
            ))
        }
        
        @Test func test_description() {
            let original = _RealityFoundationPrivate::ComponentInfo.PlatformVersion("1.2.3")
            let impl = MyRealityFoundation::ComponentInfo.PlatformVersion("1.2.3")
            
            #expect(original.description == impl.description)
        }
    }
}

extension ComponentInfoTests {
    struct VersionTests {
        @Test func test_init() {
            let original = _RealityFoundationPrivate::ComponentInfo.Version(1, 2, 3)
            let impl = MyRealityFoundation::ComponentInfo.Version(1, 2, 3)
            
            #expect(compare(original, impl))
        }
        
        @Test func test_Comparable() {
            let values = [
                (0, 0, 0),
                (1, 0, 0),
                (1, 0, 1),
                (1, 1, 0),
                (2, 0, 0)
            ]
            let originals = values.map {
                _RealityFoundationPrivate::ComponentInfo.Version($0.0, $0.1, $0.2)
            }
            let impls = values.map {
                MyRealityFoundation::ComponentInfo.Version($0.0, $0.1, $0.2)
            }
            
            for i in originals.indices {
                for j in originals.indices {
                    #expect((originals[i] < originals[j]) == (impls[i] < impls[j]))
                    #expect((originals[i] == originals[j]) == (impls[i] == impls[j]))
                }
            }
        }
        
        @Test func test_description() {
            let original = _RealityFoundationPrivate::ComponentInfo.Version(1, 2, 3)
            let impl = MyRealityFoundation::ComponentInfo.Version(1, 2, 3)
            
            #expect(original.description == impl.description)
        }
    }
}

fileprivate struct NativeComponent : RealityKit::Component {
}

fileprivate struct ImplComponent : MyRealityFoundation::Component {
}

fileprivate func compare(
    _ original: _RealityFoundationPrivate::ComponentInfo,
    _ impl: MyRealityFoundation::ComponentInfo
) -> Bool {
    let reComponentClassesMatch = unsafe (original.reComponentClass == impl.reComponentClass)
    
    return (original.bundleIdentifier == impl.bundleIdentifier) &&
    reComponentClassesMatch &&
    (original.reComponentType == nil) &&
    (impl.reComponentType == nil) &&
    compare(original.access, impl.access) &&
    compare(original.availability, impl.availability)
}

fileprivate func compare(
    _ original: _RealityFoundationPrivate::ComponentInfo.Access,
    _ impl: MyRealityFoundation::ComponentInfo.Access
) -> Bool {
    switch (original, impl) {
    case (.`internal`, .`internal`):
        return true
    case (.spi, .spi):
        return true
    case (.api, .api):
        return true
    default:
        return false
    }
}

fileprivate func compare(
    _ original: _RealityFoundationPrivate::ComponentInfo.Availability,
    _ impl: MyRealityFoundation::ComponentInfo.Availability
) -> Bool {
    return compare(original.introduced, impl.introduced) &&
    compare(original.deprecated, impl.deprecated) &&
    compare(original.obsoleted, impl.obsoleted) &&
    (original.description == impl.description)
}

fileprivate func compare(
    _ original: [_RealityFoundationPrivate::ComponentInfo.SupportedPlatform],
    _ impl: [MyRealityFoundation::ComponentInfo.SupportedPlatform]
) -> Bool {
    return (original.count == impl.count) && zip(original, impl).allSatisfy { original, impl in
        compare(original, impl)
    }
}

fileprivate func compare(
    _ original: [_RealityFoundationPrivate::ComponentInfo.SupportedPlatform]?,
    _ impl: [MyRealityFoundation::ComponentInfo.SupportedPlatform]?
) -> Bool {
    switch (original, impl) {
    case let (.some(original), .some(impl)):
        return compare(original, impl)
    case (.none, .none):
        return true
    default:
        return false
    }
}

fileprivate func compare(
    _ original: _RealityFoundationPrivate::ComponentInfo.Platform,
    _ impl: MyRealityFoundation::ComponentInfo.Platform
) -> Bool {
    return (original.name == impl.name) &&
    compare(original.oldestSupportedVersion, impl.oldestSupportedVersion) &&
    (original.description == impl.description)
}

fileprivate func compare(
    _ original: _RealityFoundationPrivate::ComponentInfo.SupportedPlatform,
    _ impl: MyRealityFoundation::ComponentInfo.SupportedPlatform
) -> Bool {
    return compare(original.platform, impl.platform) &&
    compare(original.version, impl.version) &&
    (original.description == impl.description)
}

fileprivate func compare(
    _ original: _RealityFoundationPrivate::ComponentInfo.PlatformVersion,
    _ impl: MyRealityFoundation::ComponentInfo.PlatformVersion
) -> Bool {
    return (original.versionString == impl.versionString) &&
    (original.major == impl.major) &&
    (original.minor == impl.minor) &&
    (original.patch == impl.patch) &&
    (original.description == impl.description)
}

fileprivate func compare(
    _ original: _RealityFoundationPrivate::ComponentInfo.Version,
    _ impl: MyRealityFoundation::ComponentInfo.Version
) -> Bool {
    return (original.major == impl.major) &&
    (original.minor == impl.minor) &&
    (original.patch == impl.patch) &&
    (original.description == impl.description)
}
