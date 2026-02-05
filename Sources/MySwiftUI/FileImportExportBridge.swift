// 0CB5B3FF6C0FCB5BA54DB099807C7833
internal import Foundation
internal import MySwiftUICore
private import MySwiftUICore

final class FileImportExportBridge: NSObject {
    private weak var host: ViewRendererHost? = nil // 0x530
    private var presentationState = FileImportExportBridge.PresentationState(currentPresentation: nil, importSeed: .empty, exportSeed: .empty) // 0x538
    private var presentedPicker: PlatformFilePicker? = nil // 0x540
    private var lastEnvironment = EnvironmentValues()
    
    override init() {
        super.init()
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
//        case `import`(FileImportOperation)
//        case export(FileExportOperation)
    }
}

fileprivate protocol PlatformFilePicker: AnyObject {
    // TODO
}
