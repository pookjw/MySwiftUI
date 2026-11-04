internal import Foundation

struct ResolvedMulticolorStyle {
    var environment: EnvironmentValues {
        get {
            assertUnimplemented()
        }
    }
    
    var bundle: Bundle? {
        get {
            assertUnimplemented()
        }
    }
    
    var accentColor: Color.ResolvedHDR {
        get {
            assertUnimplemented()
        }
    }
    
    var colorScheme: ColorScheme {
        get {
            assertUnimplemented()
        }
    }
    
    var colorSchemeContrast: ColorSchemeContrast {
        get {
            assertUnimplemented()
        }
    }
    
    var displayGamut: DisplayGamut {
        get {
            assertUnimplemented()
        }
    }
    
    init(in: EnvironmentValues, bundle: Bundle?) {
        assertUnimplemented()
    }
    
    func resolveHDR(name: String) -> Color.ResolvedHDR? {
        assertUnimplemented()
    }
    
    func resolveHDR(name: String?, proposed: Color.ResolvedHDR) -> Color.ResolvedHDR? {
        assertUnimplemented()
    }
}
