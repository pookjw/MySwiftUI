internal import MySwiftUICore
internal import UIKit
private import _UIKitShims
private import _DesignLibraryShims

extension EnvironmentValues {
    static nonisolated(unsafe) let configuredForPlatform: EnvironmentValues = {
        var environmentValues = ViewGraphHost.defaultEnvironment
        environmentValues._configureForPlatform(traitCollection: nil)
        return environmentValues
    }()
    
    mutating func configureForPlatform(traitCollection: UITraitCollection?) {
//        /*
//         self = x19
//         traitCollection = x21
//         */
//        // x23
//        let plist = plist
//        // x22
//        let other = EnvironmentValues.configuredForPlatform
//        // x20
//        let otherPlist = other.plist
//        
//        if plist.isEmpty {
//            // <+140>
//            if otherPlist.isEmpty {
//                // <+200>
//                if let _traitCollection = traitCollection {
//                    // <+124>
//                    self.plist = PropertyList()
//                    // <+152>
//                    if self.plist.isEmpty {
//                        // <+176>
//                        self._configureForPlatform(traitCollection: traitCollection)
//                        return
//                    } else {
//                        // <+172>
//                        if let traitCollection {
//                            // <+176>
//                            self._configureForPlatform(traitCollection: traitCollection)
//                            return
//                        } else {
//                            // <+232>
//                            self.plist = other.plist
//                            return
//                        }
//                    }
//                }
//                return
//            } else {
//                // <+144>
//                if self.plist.isEmpty {
//                    // <+176>
//                    self._configureForPlatform(traitCollection: traitCollection)
//                    return
//                } else {
//                    // <+172>
//                    if let traitCollection {
//                        // <+176>
//                        self._configureForPlatform(traitCollection: traitCollection)
//                        return
//                    } else {
//                        // <+232>
//                        self.plist = other.plist
//                        return
//                    }
//                }
//            }
//        } else {
//            // <+92>
//            if self.plist.isEmpty {
//                // <+144>
//                if self.plist.isEmpty {
//                    // <+176>
//                    self._configureForPlatform(traitCollection: traitCollection)
//                    return
//                } else {
//                    // <+172>
//                    if let traitCollection {
//                        // <+176>
//                        self._configureForPlatform(traitCollection: traitCollection)
//                        return
//                    } else {
//                        // <+232>
//                        self.plist = other.plist
//                        return
//                    }
//                }
//            } else {
//                if plist.isIdentical(to: otherPlist) {
//                    if let _traitCollection = traitCollection {
//                        // <+144>
//                        if self.plist.isEmpty {
//                            // <+176>
//                            self._configureForPlatform(traitCollection: traitCollection)
//                            return
//                        } else {
//                            // <+172>
//                            if let traitCollection {
//                                // <+176>
//                                self._configureForPlatform(traitCollection: traitCollection)
//                                return
//                            } else {
//                                // <+232>
//                                self.plist = other.plist
//                                return
//                            }
//                        }
//                    } else {
//                        // <+212>
//                        return
//                    }
//                } else {
//                    // <+152>
//                    if self.plist.isEmpty {
//                        // <+176>
//                        self._configureForPlatform(traitCollection: traitCollection)
//                        return
//                    } else {
//                        // <+172>
//                        if let traitCollection {
//                            // <+176>
//                            self._configureForPlatform(traitCollection: traitCollection)
//                            return
//                        } else {
//                            // <+232>
//                            self.plist = other.plist
//                            return
//                        }
//                    }
//                }
//            }
//        }
        
        /*
         self = x19
         traitCollection = x21
         */
        // x23
        let plist = plist
        // x22
        let other = EnvironmentValues.configuredForPlatform
        // x20
        let otherPlist = other.plist
        
        if plist.isEmpty {
            // <+140>
            if otherPlist.isEmpty {
                // <+200>
                if let _traitCollection = traitCollection {
                    // <+124>
                    self.plist = PropertyList()
                }
            }
        } else {
            if plist.isIdentical(to: otherPlist) {
                if traitCollection == nil{
                    // <+212>
                    return
                }
            }
        }
        
        // <+152>
        if self.plist.isEmpty {
            // <+176>
            self._configureForPlatform(traitCollection: traitCollection)
            return
        } else {
            // <+172>
            if let traitCollection {
                // <+176>
                self._configureForPlatform(traitCollection: traitCollection)
                return
            } else {
                // <+232>
                self.plist = other.plist
                return
            }
        }
    }
    
    private mutating func _configureForPlatform(traitCollection: UITraitCollection?) {
        // traitCollection = x21
        // x25
        let mainScreen = MyUIScreen.main
        
        // x27
        let userInterfaceIdiom: UIUserInterfaceIdiom
        if let traitCollection {
            // <+324>
            userInterfaceIdiom = traitCollection.userInterfaceIdiom
        } else {
            // <+380>
            userInterfaceIdiom = UIDevice.current.userInterfaceIdiom
        }
        
        // <+380>
        if let viewGraphIdiom = userInterfaceIdiom.viewGraphIdiom {
            self.viewGraphIdiom = viewGraphIdiom
        }
        
        switch userInterfaceIdiom {
        case .unspecified:
            self.designIdiom = .universal
        case .phone:
            self.designIdiom = .phone
        case .pad:
            self.designIdiom = .pad
        case .tv:
            self.designIdiom = .tv
        case .carPlay:
            self.designIdiom = .carPlay
        case .mac:
            self.designIdiom = .mac
        case .vision:
            self.designIdiom = .spatial
        @unknown default:
            self.designIdiom = .universal
        }
        
        self.viewGraphAssetCatalogConfiguration = ViewGraphHost.AssetCatalogConfiguration(
            referenceBounds: mainScreen._referenceBounds,
            pointsPerInch: mainScreen._pointsPerInch,
            preferredArtworkSubtype: 0
        )
    }
}
