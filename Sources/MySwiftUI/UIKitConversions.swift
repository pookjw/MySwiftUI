// BF747AB022DCE7FC5B6AD0F035BC8E0D
internal import UIKit
private import MySwiftUICore
private import _UIKitPrivate
private import _MySwiftUIShims

extension BarAppearanceBridge {
    @inline(__always)
    func updateNavigationBar(preferences: PreferenceValues) {
        updateNavigationBar(updating: NavigationBarUpdateFlags(), preferences: preferences)
    }
    
    @inline(__always)
    fileprivate func updateNavigationBar(updating: NavigationBarUpdateFlags, preferences: PreferenceValues) {
        self.withUpdate { updateContext in
            // $s7SwiftUI19BarAppearanceBridgeC016updateNavigationC033_BF747AB022DCE7FC5B6AD0F035BC8E0DLL8updating11preferencesyAA0gC11UpdateFlagsV_AA16PreferenceValuesVtFyAC0S7ContextVXEfU_
            /*
             updateContext -> x0 -> x19 + 0x118
             self -> x1 -> x22
             preferences -> x2 -> x19 + 0x110
             */
            // <+720>
            // x21
            let allowed = self.allowedBars.contains(.navigationBar)
            guard allowed || self.platformStorage.uiShouldUpdateNavigationTitle else {
                return
            }
            
            // <+820>
            // inlined
            self.updateNavigationStyle(preferences)
            self.updateBackAction(preferences)
            self.updateSidebarToggle(preferences)
            
            // <+1024>
            // x19 + 0x88
            let targetController = updateContext.targetController
            
            // x19 + 0x120
            var titleStroage = preferences[NavigationTitleKey.self].value ?? self.lastNavigationTitleStorage ?? NavigationTitleStorage()
            
            // <+1260>
            // self -> x22 -> x23
            titleStroage.reduce(onto: self.lastToolbarInputContent?.titleStorage)
            
            // x19 + 0xb0
            let subtitleStroage = preferences[NavigationSubtitleKey.self].value?.title ?? self.lastNavigationSubtitle
            
            // <+1424>
            // self -> x23 -> x19 + 0x100
            // x19 + 0xd8
            let barBackButtonHidden = preferences[NavigationBarBackButtonHiddenKey.self].value
            
            // <+1508>
            // targetController -> x25
            // x19 + 0x14
            let hasOrWillHaveBackItem = targetController.hasOrWillHaveBackItem(overrides: updateContext.overrides)
            
            // <+1532>
            // inlined
            // x19 + 0x10
            let contained = self.containedInExpandedSplitViewColumn(columns: )
            
            // <+1600>
            // x19 + 0x60
            let titleMode = titleStroage.titleMode
            // self -> x19 + 0x100 -> x24
            // x23 (x19 + 0x108)
            let copy_1 = self.lastEnvironment
            // x19 + 0xe0
            let uiContainingNavController = uiContainingNavController
            uiContainingNavController?.navigationItem.hidesBackButton = barBackButtonHidden
            
            // <+1752>
            // targetController -> x24
            // x25, x21
            let resolvedTitleString: String?
            if titleStroage.title != nil {
                // <+1776>
                fatalError("TODO")
                // <+1972>
            } else {
                // <+1964>
                resolvedTitleString = nil
            }
            
            // <+1972>
            // w20
            var copy_2 = titleMode
            // x25 -> x19 + 0x68
            // uiContainingNavController -> x23
            
            let flag_1: Bool // true -> <+2072> / false -> <+2152>
            if (titleMode == nil), let uiContainingNavController {
                // <+2000>
                // uiContainingNavController -> x26
                let managesWindowToolbar = uiContainingNavController.managesWindowToolbar()
                if managesWindowToolbar {
                    // <+2020>
                    // x29 - 0xb0
                    let windowToolbarConfiguration = copy_1.windowToolbarConfiguration
                    copy_2 = windowToolbarConfiguration.titleMode
                    // <+2072>
                    flag_1 = true
                } else {
                    // <+2152>
                    flag_1 = false
                }
            } else {
                flag_1 = true
            }
            
            var flag_2: UInt8 // 0 -> <+2180> / 1 -> <+2236> / 2 -> <+2508>
            // w20
            var largeTitleDisplayMode: UINavigationItem.LargeTitleDisplayMode?
            if flag_1 {
                // <+2072>
                switch copy_2?.role {
                case .automatic:
                    // <+2480>
                    largeTitleDisplayMode = .automatic
                    // <+2508>
                    flag_2 = 2
                case .large:
                    // <+2504>
                    largeTitleDisplayMode = .always
                    // <+2508>
                    flag_2 = 2
                case .inlineLarge:
                    // <+2092>
                    largeTitleDisplayMode = .inline
                    // <+2508>
                    flag_2 = 2
                case .inline:
                    // <+2228>
                    largeTitleDisplayMode = .never
                    // <+2508>
                    flag_2 = 2
                case .settings:
                    // <+2480>
                    largeTitleDisplayMode = .automatic
                    // <+2508>
                    flag_2 = 2
                case nil:
                    // <+2116>
                    if uiContainingNavController == nil {
                        // <+2236>
                        flag_2 = 1
                    } else {
                        // uiContainingNavController -> x26
                        // <+2180>
                        flag_2 = 0
                    }
                }
            } else {
                // <+2152>
                // <+2180>
                flag_2 = 0
            }
            
            if flag_2 == 0 {
                /*
                 resolvedString -> x25/x21 -> (x19 + 0x60) / x25
                 */
                // <+2180>
                // x26
                let uiContainingNavController = uiContainingNavController!
                if type(of: uiContainingNavController)._isFromMySwiftUI() {
                    // <+2244>
                    flag_2 = 1
                } else {
                    // <+2588>
                    largeTitleDisplayMode = nil
                }
            }
            
            if flag_2 == 1 {
                // <+2236>
                if _SemanticFeature<Semantics_v4>.isEnabled {
                    // <+2300>
                    // w20
                    let hasLargeContent: Bool
                    if resolvedTitleString != nil {
                        hasLargeContent = true
                    } else {
                        hasLargeContent = targetController.navigationItem.hasLargeContent
                    }
                    
                    // <+2364>
                    // w26
                    let isSolariumEnabled = Solarium.isEnabled(for: _GraphInputs.defaultInterfaceIdiom)
                    fatalError("TODO")
                } else {
                    // <+2496>
                    largeTitleDisplayMode = .always
                    // <+2508>
                }
            }
            
            // <+2508>
            if let largeTitleDisplayMode {
                targetController.navigationItem.largeTitleDisplayMode = largeTitleDisplayMode
            }
            
            // <+2584>
            let isFromSwiftUI: Bool
            if let uiContainingNavController, type(of: uiContainingNavController)._isFromMySwiftUI() {
                isFromSwiftUI = true
            } else {
                isFromSwiftUI = false
            }
            
            // <+2616>
            targetController.updateTitle(resolvedTitleString, isFromSwiftUI: isFromSwiftUI)
            
            // <+2644>
            // copy_1 -> x26
            // x20, x21
            let resolvedSubtitleString: String?
            if let subtitleStroage {
                // <+2656>
                fatalError("TODO")
                // <+2800>
            } else {
                // <+2796>
                resolvedSubtitleString = nil
            }
            
            // <+2800>
            targetController.updateSubtitle(resolvedSubtitleString, isFromSwiftUI: isFromSwiftUI)
            
            // <+2836>
            if copy_1.accessibilityEnabled {
                // <+2844>
                fatalError("TODO")
            }
            
            // <+3312>
            // self.platformStorage -> x23
            if isLinkedOnOrAfter(.v2) && !targetController.navigationItem.leftItemsSupplementBackButton {
                targetController.navigationItem.leftItemsSupplementBackButton = true
            }
            
            // <+3460>
            // x21
            let hasNavigationBarContent = targetController.hasNavigationBarContent(updateContext: updateContext)
            // w8
            let uiHasNavigationContent: Bool
            if let _uiHasNavigationContent = platformStorage.uiHasNavigationContent {
                uiHasNavigationContent = _uiHasNavigationContent
            } else {
                // <+3488>
                uiHasNavigationContent = !_SemanticFeature<Semantics_v4>.isEnabled
            }
            
            // <+3544>
            if uiHasNavigationContent != hasNavigationBarContent {
                // <+3560>
                self.invalidate(bar: .navigationBar)
            }
            
            // <+3592>
            // x22
            let hasBottomBarContent = targetController.hasBottomBarContent
            if hasBottomBarContent != platformStorage.uiHasBottomBarContent && hasBottomBarContent {
                // <+3656>
                self.invalidate(bar: .bottomBar)
            }
            
            // <+3712>
            self.platformStorage.uiHasBottomBarContent = hasBottomBarContent
            self.platformStorage.uiHasNavigationContent = hasNavigationBarContent
        }
    }
    
    @inline(__always)
    fileprivate func updateNavigationStyle(_ preferences: PreferenceValues) {
        self.withUpdate { updateContext in
            // $s7SwiftUI19BarAppearanceBridgeC21updateNavigationStyle33_BF747AB022DCE7FC5B6AD0F035BC8E0DLLyyAA16PreferenceValuesVFyAC13UpdateContextVXEfU_
            /*
             updateContext -> x0 -> x19
             preferences -> x1 -> x24
             self -> x2 -> x23
             */
            guard _SemanticFeature<Semantics_v4>.isEnabled else {
                return
            }
            
            // <+232>
            // x29 - 0x68
            let role1 = preferences[ToolbarRoleKey.self].value
            // x29 - 0x69
            let role2 = self.lastEnvironment.toolbarRole
            
            if let role = role1 ?? role2 {
                let style: UINavigationItem.ItemStyle
                switch role.role {
                case .navigationStack:
                    style = .navigator
                case .browser:
                    style = .browser
                case .editor:
                    style = .editor
                }
                updateContext.targetController.navigationItem.style = style
            }
        }
    }
    
    @inline(__always)
    fileprivate func updateBackAction(_ preferences: PreferenceValues) {
        self.withUpdate { updateContext in
            // $s7SwiftUI19BarAppearanceBridgeC16updateBackAction33_BF747AB022DCE7FC5B6AD0F035BC8E0DLLyyAA16PreferenceValuesVFyAC13UpdateContextVXEfU_
            /*
             updateContext -> x0 -> x23
             preferences -> x1 -> x29 - 0x98
             self -> x2 -> x29 - 0x90
             */
            // <+364>
            // x29 - 0x88
            let navigationItem = updateContext.targetController.navigationItem
            
            guard navigationItem.backAction == nil else {
                return
            }
            
            // <+444>
            if
                let backAction = navigationItem.backAction,
                !type(of: backAction)._isFromMySwiftUI()
            {
                return
            }
            
            // <+504>
            // w19
            let backButtonHidden = preferences[NavigationBarBackButtonHiddenKey.self].value
            
            let backAction: UIAction?
            if
                (navigationItem.style != .editor) ||
                    (updateContext.targetController.presentingViewController == nil) ||
                    backButtonHidden ||
                    navigationItem.hidesBackButton
            {
                // <+632>
                // x20
                let lastToolbarInputContent = self.lastToolbarInputContent
                
                if let lastToolbarInputContent {
                    // <+756>
                    fatalError("TODO")
                } else {
                    // <+732>
                    // <+892>
                    backAction = nil
                }
            } else {
                // <+940>
                fatalError("TODO")
            }
            
            // <+1156>
            navigationItem.backAction = backAction
        }
    }
    
    @inline(__always)
    fileprivate func updateSidebarToggle(_ preferences: PreferenceValues) {
        self.withUpdate { updateContext in
            // $s7SwiftUI19BarAppearanceBridgeC19updateSidebarToggle33_BF747AB022DCE7FC5B6AD0F035BC8E0DLLyyAA16PreferenceValuesVFyAC13UpdateContextVXEfU_
            /*
             updateContext -> x0 -> x24
             preferences -> x1 -> x25
             self -> x2 -> x20
             */
            // <+124>
            guard self.platformStorage.uiShouldUpdateNavigationController else {
                return
            }
            
            // x23
            var viewController: UIViewController?
            // x29 - 0xb0 (x23)
            if let updateContext = self.updateContext {
                // <+204>
                // x19 + 0x60 (x28)
                let overrides = updateContext.overrides
                viewController = overrides.navigation
            } else {
                // <+256>
                // <+280>
            }
            
            if viewController == nil {
                // <+280>
                // x29 - 0xb0
                let copy_1 = self.updateContext
                guard let copy_1 else {
                    return
                }
                
                // <+300>
                viewController = copy_1.containingController
            }
            
            guard let viewController else {
                return
            }
            
            // <+324>
            // x29 - 0xb0 (x28)
            let copy_1 = updateContext.overrides
            // x24
            let split = copy_1.split ?? viewController.splitViewController
            guard let split else {
                return
            }
            
            // <+388>
            fatalError("TODO")
        }
    }
    
    @inline(__always)
    fileprivate func containedInExpandedSplitViewColumn(columns: NavigationSplitColumn...) -> Bool {
        return withUpdate { updateContext in
            // $s7SwiftUI19BarAppearanceBridgeC34containedInExpandedSplitViewColumn33_BF747AB022DCE7FC5B6AD0F035BC8E0DLL7columnsSbAA010NavigationiK0Od_tFSbAC13UpdateContextVXEfU_
            /*
             columns -> x1 -> x20
             */
            guard let hostingController = updateContext.targetController as? NavigationStackHostingController<AnyView> else {
                return false
            }
            
            fatalError("TODO")
        }
    }
    
    fileprivate var uiContainingNavController: UINavigationController? {
        guard platformStorage.uiShouldUpdateNavigationController else {
            return nil
        }
        
        // sp + 0x58 (x19)
        if let updateContext = self.updateContext {
            // sp + 0x8 (x22)
            let overrides = updateContext.overrides
            if let navigation = overrides.navigation {
                return navigation
            }
        }
        
        // <+180>
        // sp + 0x58
        let updateContext = self.updateContext
        return updateContext?.containingController
    }
    
    @inline(__always)
    func updateBarConfiguration(role: ToolbarPlacement.Role) -> Bool {
        switch role {
        case .accessoryBar(_), .windowToolbarItems, .windowToolbar, .keyboardBar:
            // <+1404>
            // <+672>
            return false
        case .navigationBar:
            // <+1424>~<+1540>, <+1688>~<+1896>
            guard let navigationController = uiContainingNavController else {
                return false
            }
            
            let result1 = updateNavigationAppearances(navigationController: navigationController)
            let result2 = updateNavigationVisibilities(navigationController: navigationController)
            
            return result1 && result2
        case .bottomBar:
            // <+1336>
            return updateBottomBarConfiguration()
        case .tabBar:
            // <+1544>
            fatalError("TODO")
        case .bottomOrnament:
            // <+1388>
            fatalError("TODO")
        }
    }
    
    fileprivate func updateNavigationAppearances(navigationController: UINavigationController) -> Bool {
        /*
         self -> x20 -> x21
         navigationController -> x0 -> x20
         */
        // <+416>
        if let casted = navigationController as? UIKitNavigationController {
            // <+432>
            fatalError("TODO")
        }
        
        // <+2188>
        withUpdate { updateContext in
            // $s7SwiftUI19BarAppearanceBridgeC27updateNavigationAppearances33_BF747AB022DCE7FC5B6AD0F035BC8E0DLL20navigationControllerSbSo012UINavigationS0C_tFyAC13UpdateContextVXEfU_
            /*
             self -> x1 -> x19
             updateContext -> x0 -> x21
             */
            // <+1168>
            // x20
            let barConfigurations = self.barConfigurations
            // x29 - 0xb0
            var navigationBarRole = ToolbarPlacement.Role.navigationBar
            // x22
            guard let configuration = barConfigurations[navigationBarRole] else {
                return
            }
            // x22
            let copy_1 = configuration
            // x29 - 0x148
            let copy_2 = copy_1
            // x29 - 0x118
            let navigationItem = updateContext.targetController.navigationItem
            // x20
            let foregroundStyle = copy_2.foregroundStyle
            // self.lastEnvironment -> x21
            // x23
            let copy_3 = self.lastEnvironment
            // foregroundStyle -> x29 - 0x208
            // x29 - 0xb0
            let toolbarForegroundStyle = copy_3.toolbarForegroundStyle
            _ = consume copy_3
            // x29 - 0xb0
            navigationBarRole = .navigationBar
            
            // <+1488>
            if foregroundStyle?.storage != toolbarForegroundStyle[navigationBarRole]?.storage {
                // <+1732>
                self.pendingUpdates.formUnion(.unknown0)
            }
            
            // <+1752>
            // x29 - 0x100
            let titleMode = (self.lastNavigationTitleStorage?.title == nil) ? ToolbarTitleDisplayMode.inline : self.lastNavigationTitleStorage?.titleMode
            // x29 - 0x138
            let copy_4 = self.lastEnvironment
            
            // x21 -> (index of array)
            let array: [UInt8] = [0, 1, 2, 3]
            for i in array {
                // i -> w22
                // <+1964>
                let appearance: UINavigationBarAppearance?
                if i == 0 {
                    appearance = navigationItem.standardAppearance
                } else if i == 1 {
                    appearance = navigationItem.scrollEdgeAppearance
                } else if i == 2 {
                    appearance = navigationItem.compactAppearance
                } else {
                    appearance = navigationItem.compactScrollEdgeAppearance
                }
                
                // <+2016>
                if let appearance, !type(of: appearance)._isFromMySwiftUI() {
                    continue
                }
                
                navigationItem._resetBackgroundOpacity()
                
                let flag: Bool // true -> <+3312> / false -> <+3280>
                // <+2072>
                // copy_2 -> x29 - 0x148 -> x23
                // i -> x29 - 0xfc
                if copy_2.foregroundStyle != nil {
                    // <+3312>
                    flag = true
                } else {
                    // <+2092>
                    // ToolbarAppearanceConfiguration.colorScheme (offset) -> x20-> x29 - 0xf8
                    // x29 - 0x178 및 x20 + x24(0x1)에 Optional<ColorScheme>(nil)을 할당하는게 있으나 활용하지 않는 것 같고, nil 분기가 있지만 의미 없기에 생략
                    // x29 - 0x198
                    let oldColorScheme = copy_2.colorScheme
                    
                    if let oldColorScheme {
                        // <+2348>
                        // <+2428>
                        // <+3312>
                        flag = true
                    } else {
                        // <+2260>
                        // <+2704>
                        if (foregroundStyle != nil) || (copy_2.backgroundVisibility != .automatic) || (copy_2.backgroundOpacity != nil) {
                            // <+3312>
                            flag = true
                        } else {
                            // <+2748>
                            // x29 - 0x228에 nil 할당하는데 무시해도 됨
                            // x29 - 0x230 (x19)
                            let copy_3 = copy_2.colorScheme
                            if copy_3 != nil {
                                // <+2976>
                                // <+2428>
                                // <+3312>
                                flag = true
                            } else {
                                // <+2924>
                                if titleMode == .inline {
                                    // <+3280>
                                    flag = false
                                } else {
                                    // <+3312>
                                    flag = true
                                }
                            }
                        }
                    }
                }
                
                if flag {
                    // <+3312>
                    // copy_2 -> x23
                    fatalError("TODO")
                } else {
                    // <+3280>
                    // i -> w20
                    
                    let appearance: UINavigationBarAppearance?
                    if i == 0 {
                        appearance = navigationItem.standardAppearance
                    } else if i == 1 {
                        appearance = navigationItem.scrollEdgeAppearance
                    } else if i == 2 {
                        appearance = navigationItem.compactAppearance
                    } else {
                        appearance = navigationItem.compactScrollEdgeAppearance
                    }
                    
                    guard let appearance else {
                        continue
                    }
                    
                    // <+7444>
                    if i == 0 {
                        navigationItem.standardAppearance = nil
                    } else if i == 1 {
                        navigationItem.scrollEdgeAppearance = nil
                    } else if i == 2 {
                        navigationItem.compactAppearance = nil
                    } else {
                        navigationItem.compactScrollEdgeAppearance = nil
                    }
                    
                    continue
                }
            }
            
            // <+7512>
        }
        
        return true
    }
    
    @inline(__always)
    fileprivate func updateNavigationVisibilities(navigationController: UINavigationController) -> Bool {
        return withUpdate { updateContext in
            // $s7SwiftUI19BarAppearanceBridgeC28updateNavigationVisibilities33_BF747AB022DCE7FC5B6AD0F035BC8E0DLL20navigationControllerSbSo012UINavigationS0C_tFSbAC13UpdateContextVXEfU_
            /*
             updateContext -> x0 -> x20 -> x29 - 0xd8
             navigationController -> x1 -> x28
             self -> x2 -> x29 - 0xc8
             */
            // <+292>
            // x29 - 0xa8
            let targetController = updateContext.targetController
            // x29 - 0xb0
            let topViewController = navigationController.topViewController
            if navigationController.view.window != nil {
                // <+372>
                // targetController -> x27
                let w22 = (topViewController != nil) && (topViewController === targetController)
                // navigationController -> x29 - 0xb8
                // x21
                let viewControllers = navigationController.viewControllers
                let w20 = viewControllers.contains(targetController)
                // x28
                let appearState1 = targetController._appearState()
                let appearState2 = targetController._appearState()
                
                if !w22 {
                    // <+684>
                    if w20 {
                        return true
                    } else {
                        // <+688>
                        // appearState2 -> x21
                        if let navigationController2 = targetController.navigationController {
                            // <+712>
                            // navigationController2 -> x20 -> x22
                            // navigationController -> x29 - 0xb8 -> x27
                            guard navigationController2 != navigationController else {
                                return true
                            }
                            
                            // <+1268>
                        } else {
                            // <+1268>
                        }
                        
                        // <+1268>
                        if (appearState1 != .appearing) && (appearState2 == .appeared) {
                            return false
                        }
                        
                        // <+520>
                    }
                }
                
                // <+520>
                // x29 - 0xe0
                let isFromSwiftUI = type(of: navigationController)._isFromMySwiftUI()
                // x20
                // x19
                let barConfigurations = self.barConfigurations
                // w20 -> 1
                // <+868>
                // x19
                let oldConfiguration = barConfigurations[.navigationBar]
                // x24
                let newConfiguration = oldConfiguration ?? ToolbarAppearanceConfiguration()
                // <+1104>
                // x19
                let hasNavigationBarContent = targetController.hasNavigationBarContent(updateContext: updateContext)
                
                let flag: Bool // true -> <+1124> / false -> <+1328>
                if isFromSwiftUI {
                    // <+1124>
                    flag = true
                } else {
                    // <+1236>
                    if isLinkedOnOrAfter(.v4) {
                        // <+1248>
                        if newConfiguration.visibility == .automatic {
                            // <+1328>
                            flag = false
                        } else {
                            // <+1124>
                            flag = true
                        }
                    } else {
                        // <+1300>
                        navigationController.setNavigationBarHidden(false, animated: newConfiguration.animation != nil)
                        // <+1328>
                        flag = false
                    }
                }
                
                if flag {
                    // <+1124>
                    let w25 = newConfiguration.backgroundVisibility
                    let w0 = _SemanticFeature<Semantics_v4>.isEnabled
                    let w8 = newConfiguration.visibility
                    let w10 = w25 != .visible
                    let w11 = isFromSwiftUI && !hasNavigationBarContent && w0 && w10
                    let w2 = (w8 == .automatic) ? w10 : ((w8 == .visible) ? false : true)
                    // <+1304>
                    navigationController.setNavigationBarHidden(w2, animated: newConfiguration.animation != nil)
                }
                
                // <+1328>
                fatalError("TODO")
            } else {
                // <+1284>
                return false
            }
        }
    }
    
    fileprivate func updateBottomBarConfiguration() -> Bool {
        fatalError("TODO")
    }
}

struct NavigationBarUpdateFlags {
    // TODO
}

extension UINavigationController {
    func managesWindowToolbar() -> Bool {
        // self -> x20 -> x21
        // x19
        guard let window = view.window else {
            return false
        }
        
        let converted = view.convert(view.bounds, to: window)
        var d0 = converted.origin.x
        var d1 = converted.origin.y
        var d2 = converted.size.width
        var d3 = converted.size.height
        
        var d8 = d0
        var d11 = d1
        var d10 = d2
        var d9 = d3
        
        // x20
        if let splitViewController {
            let column = splitViewController.column(forViewController: self)
            if column == .supplementary {
                // <+256>
                // splitViewController -> x20 -> x22
                let converted = splitViewController.view.convert(splitViewController.view.bounds, to: window)
                
                d0 = converted.origin.x
                d1 = converted.origin.y
                d2 = converted.size.width
                d3 = converted.size.height
                
                d8 = d0
                d11 = d1
                d10 = d2
                d9 = d3
            } else {
                // <+400>
            }
        } else {
            // <+404>
        }
        
        let w0: Bool
        if _SemanticFeature<Semantics_v5>.isEnabled {
            // <+436>
            let d12 = window.bounds.size.height
            d0 = converted.height
            d0 = fabs(d12 - d0)
            d10 = 0.1
            let w20 = (d0 < d10)
            
            let bounds = window.bounds
            d0 = bounds.origin.x
            d1 = bounds.origin.y
            d2 = bounds.size.width
            d3 = bounds.size.height
            
            d9 = d0
            d0 = fabs(d8 - d9)
            w0 = (d0 >= d10) ? false : w20
            // <+608>
        } else {
            // <+536>
            let bounds = window.bounds
            d0 = bounds.origin.x
            d1 = bounds.origin.y
            d2 = bounds.size.width
            d3 = bounds.size.height
            
            d11 = d2
            d8 = d3
            d0 = fabs(d11 - d10)
            d1 = 0.1
            
            if d0 > d1 {
                w0 = false
            } else {
                d0 = fabs(d8 - d9)
                d1 = 0.1
                w0 = d0 < d1
            }
        }
        
        // <+608>
        return w0
    }
}

extension UISplitViewController {
    func column(forViewController viewController: UIViewController) -> UISplitViewController.Column? {
        fatalError("TODO")
    }
}

extension UINavigationItem {
    fileprivate var hasContent: Bool {
        // self -> x20 -> x19
        // w24
        let hasLeftContent: Bool
        if let leftBarButtonItems, !leftBarButtonItems.isEmpty {
            hasLeftContent = true
        } else {
            // <+132>
            hasLeftContent = !leadingItemGroups.isEmpty
        }
        
        // <+228>
        // w25
        let hasRightContent: Bool
        if let rightBarButtonItems, !rightBarButtonItems.isEmpty {
            hasRightContent = true
        } else {
            // <+332>
            hasRightContent = !trailingItemGroups.isEmpty
        }
        
        // <+428>
        // x21
        let bottomPalette = _bottomPalette
        // <+456>
        // x22
        let searchController = searchController
        
        // <+484>
        // w23
        let hasCenterContent: Bool
        if _SemanticFeature<Semantics_v4>.isEnabled {
            hasCenterContent = !centerItemGroups.isEmpty
        } else {
            hasCenterContent = false
        }
        
        // <+644>
        var w21 = bottomPalette != nil
        var w0 = hasLargeContent
        var w8 = w0 || hasLeftContent
        w8 = w21 || w8
        
        if w8 {
            return true
        } else {
            return (searchController == nil) ? hasCenterContent : true
        }
    }
    
    fileprivate var hasLargeContent: Bool {
        if let title {
            return !title.isEmpty
        }
        
        return titleView != nil
    }
}

extension UIViewController {
    @discardableResult fileprivate func updateTitle(_ title: String?, isFromSwiftUI: Bool) -> Bool {
        /*
         self -> x20 -> x21
         title -> x0/x1 -> x20/x19
         isFromSwiftUI -> x2 -> x22
         */
        guard self.navigationItem.title != title else {
            return false
        }
        
        self.navigationItem.title = title
        return true
    }
    
    fileprivate func updateSubtitle(_ subtitle: String?, isFromSwiftUI: Bool) {
        /*
         self -> x20 -> x21
         subtitle -> x0/x1 -> x20/x19
         isFromSwiftUI -> x2 -> x22
         */
        guard self.navigationItem.msui_subtitle != subtitle else {
            return
        }
        
        self.navigationItem.msui_subtitle = subtitle
    }
    
    fileprivate func hasNavigationBarContent(updateContext: BarAppearanceBridge.UpdateContext) -> Bool {
        /*
         self -> x20 -> x21
         updateContext -> x0 -> x23
         */
        guard _SemanticFeature<Semantics_v4>.isEnabled else {
            return true
        }
        
        // <+96>
        // x19
        let hasOrWillHaveBackItem = self.hasOrWillHaveBackItem(overrides: updateContext.overrides)
        // x22
        let hidesBackButton = self.navigationItem.hidesBackButton
        // sp + 0x8 (x20)
        let copy_1 = updateContext.overrides
        // x23
        let split = copy_1.split ?? self.splitViewController
        // x24
        let hasContent = self.navigationItem.hasContent
        
        if split != nil {
            // <+240>
            fatalError("TODO")
        }
        
        // <+396>
        // x20
        if let tabBarController {
            if hasContent {
                return true
            } else {
                // <+484>
                // x21
                let combinedWithNavigationBar = tabBarController.combinedWithNavigationBar
                if combinedWithNavigationBar {
                    return true
                } else {
                    return hasOrWillHaveBackItem && !hidesBackButton
                }
            }
        } else {
            // <+504>
            return hasOrWillHaveBackItem && !hidesBackButton
        }
    }
    
    fileprivate var hasBottomBarContent: Bool {
        guard let toolbarItems else {
            return false
        }
        
        return !toolbarItems.isEmpty
    }
}

extension UITabBarController {
    fileprivate var combinedWithNavigationBar: Bool {
        fatalError("TODO")
    }
}
