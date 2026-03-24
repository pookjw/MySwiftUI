// 0CB5B3FF6C0FCB5BA54DB099807C7833
internal import Foundation
internal import MySwiftUICore

final class FileImportExportBridge: NSObject {
    weak var host: ViewRendererHost? = nil // 0x530
    private var presentationState = FileImportExportBridge.PresentationState(currentPresentation: nil, importSeed: .empty, exportSeed: .empty) // 0x538
    private var presentedPicker: PlatformFilePicker? = nil // 0x540
    private var lastEnvironment = EnvironmentValues() // x88
    
    override init() {
        super.init()
    }
    
    final func preferencesDidChange(_ preferences: PreferenceValues) {
        /*
         self -> x20 -> x19
         preferences -> x25
         */
        // x26
        guard let _ = presentationState.update(preferences: preferences) else {
            return
        }
        
        // <+344>
        assertUnimplemented()
    }
    
    // TODO
}

extension FileImportExportBridge {
    fileprivate struct PresentationState {
        private(set) var currentPresentation: FileImportExportBridge.Presentation?
        private(set) var importSeed: VersionSeed
        private(set) var exportSeed: VersionSeed
        
        func update(preferences: PreferenceValues) -> FileImportExportBridge.PresentationState.UpdateEffect? {
            /*
             self -> x20 -> x25
             preferences -> x0 -> x23
             */
            // <+800>
            // x20(sp, x29 - 0x70)
            let _: FileImportExportBridge.Presentation? = nil
            
            // x27
            let importValue = preferences[FileImportOperation.Key.self]
            // x21
            let incomingImportSeed = importValue.seed
            // x29 - 0xcc
            let matchesImport = importSeed.matches(incomingImportSeed)
            
            if !matchesImport {
                // <+964>
                assertUnimplemented()
            }
            
            // <+1192>
            // x27
            let exportValue = preferences[FileExportOperation.Key.self]
            // x21
            let incomingExportSeed = exportValue.seed
            // x24
            let matchesExport = exportSeed.matches(incomingExportSeed)
            
            if !matchesExport {
                // <+1300>
                assertUnimplemented()
                // <+1620>
            } else if matchesImport {
                // <+1300>
                return nil
            }
            
            // <+1620>
            assertUnimplemented()
        }
    }
    
    enum Presentation {
        case `import`(FileImportOperation)
        case export(FileExportOperation)
    }
}

extension FileImportExportBridge.PresentationState {
    enum UpdateEffect {
        case update(FileImportExportBridge.Presentation)
        case present(FileImportExportBridge.Presentation)
        case dismiss
    }
}

fileprivate protocol PlatformFilePicker: AnyObject {
    // TODO
}

struct FileImportOperation {
    // TODO
}

extension FileImportOperation {
    struct Key: HostPreferenceKey {
        static func reduce(value: inout FileImportOperation?, nextValue: () -> FileImportOperation?) {
            assertUnimplemented()
        }
        
        static var _isReadableByHost: Bool {
            assertUnimplemented()
        }
        
        static var _includesRemovedValues: Bool {
            assertUnimplemented()
        }
    }
}

struct FileExportOperation {
    // TODO
}

extension FileExportOperation {
    struct Key: HostPreferenceKey {
        static func reduce(value: inout FileExportOperation?, nextValue: () -> FileExportOperation?) {
            assertUnimplemented()
        }
        
        static var _isReadableByHost: Bool {
            assertUnimplemented()
        }
        
        static var _includesRemovedValues: Bool {
            assertUnimplemented()
        }
    }
}
