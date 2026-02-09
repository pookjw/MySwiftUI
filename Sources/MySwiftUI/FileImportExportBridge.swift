// 0CB5B3FF6C0FCB5BA54DB099807C7833
internal import Foundation
internal import MySwiftUICore

final class FileImportExportBridge: NSObject {
    weak var host: ViewRendererHost? = nil // 0x530
    private var presentationState = FileImportExportBridge.PresentationState(currentPresentation: nil, importSeed: .empty, exportSeed: .empty) // 0x538
    private var presentedPicker: PlatformFilePicker? = nil // 0x540
    private var lastEnvironment = EnvironmentValues()
    
    override init() {
        super.init()
    }
    
    final func preferencesDidChange(_ preferences: PreferenceValues) {
        fatalError("TODO")
    }
    
    // TODO
}

extension FileImportExportBridge {
    fileprivate struct PresentationState {
        private(set) var currentPresentation: FileImportExportBridge.Presentation?
        private(set) var importSeed: VersionSeed
        private(set) var exportSeed: VersionSeed
    }
    
    enum Presentation {
        case `import`(FileImportOperation)
        case export(FileExportOperation)
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
        static var defaultValue: Never {
            fatalError("TODO")
        }
        
        static func reduce(value: inout Never, nextValue: () -> Never) {
            fatalError("TODO")
        }
        
        static var _isReadableByHost: Bool {
            fatalError("TODO")
        }
        
        static var _includesRemovedValues: Bool {
            fatalError("TODO")
        }
    }
}

struct FileExportOperation {
    // TODO
}

extension FileExportOperation {
    struct Key: HostPreferenceKey {
        static var defaultValue: Never {
            fatalError("TODO")
        }
        
        static func reduce(value: inout Never, nextValue: () -> Never) {
            fatalError("TODO")
        }
        
        static var _isReadableByHost: Bool {
            fatalError("TODO")
        }
        
        static var _includesRemovedValues: Bool {
            fatalError("TODO")
        }
    }
}
