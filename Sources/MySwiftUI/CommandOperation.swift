// 7CAAF8CB17093C835B3EA3980BA79FD8
internal import Foundation
private import MySwiftUICore
#if SwiftUICompataibility
private import ObjectiveC.runtime
#endif

struct CommandOperation {
    private var mutation: CommandOperation.Mutation
    private var placement: CommandGroupPlacement
    private var resolver: (CommandOperation, inout _ResolvedCommands) -> ()?
}

extension CommandOperation {
    enum Mutation {
        case append
        case prepend
        case replace
        case topLevel
        case initialize
    }
}

public struct CommandGroupPlacement: Sendable {
    public static let appInfo = CommandGroupPlacement(Text(verbatim: "App Info"))
    public static let appSettings = CommandGroupPlacement(Text(verbatim: "App Settings"))
    public static let systemServices = CommandGroupPlacement(Text(verbatim: "System Services"))
    public static let appVisibility = CommandGroupPlacement(Text(verbatim: "App Visibility"))
    public static let appTermination = CommandGroupPlacement(Text(verbatim: "App Termination"))
    public static let newItem = CommandGroupPlacement(Text(verbatim: "New Item"))
    public static let saveItem = CommandGroupPlacement(Text(verbatim: "Save Item"))
    public static let importExport = CommandGroupPlacement(Text(verbatim: "Import/Export Item"))
    public static let printItem = CommandGroupPlacement(Text(verbatim: "Print Item"))
    public static let undoRedo = CommandGroupPlacement(Text(verbatim: "Undo/Redo"))
    public static let pasteboard = CommandGroupPlacement(Text(verbatim: "Pasteboard"))
    public static let textEditing = CommandGroupPlacement(Text(verbatim: "Text Editing"))
    public static let textFormatting = CommandGroupPlacement(Text(verbatim: "Text Formatting"))
    public static let toolbar = CommandGroupPlacement(Text(verbatim: "Toolbar"))
    public static let sidebar = CommandGroupPlacement(Text(verbatim: "Sidebar"))
    public static let windowSize = CommandGroupPlacement(Text(verbatim: "Window Size"))
    
    static let windowList: CommandGroupPlacement = {
        assertUnimplemented()
    }()
    
    static let singleWindowList: CommandGroupPlacement = {
        assertUnimplemented()
    }()
    
    static let windowArrangement = CommandGroupPlacement(Text(verbatim: "Window Arrangement"))
    static let help = CommandGroupPlacement(Text(verbatim: "Help"))
    
    static let appShortcuts: CommandGroupPlacement = {
        assertUnimplemented()
    }()
    
    static let openItem = CommandGroupPlacement(Text(verbatim: "Open Item"))
    
    private let name: Text
    let id: UUID
    
    @inline(__always)
    fileprivate init(_ name: Text) {
        name.assertUnstyled(#function)
        self.name = name
        self.id = UUID()
    }
    
    // TODO
}

public struct _ResolvedCommands {
    @_transparent fileprivate static var bundle: Bundle {
        let bundleClass: AnyClass
#if SwiftUICompataibility
        bundleClass = objc_lookUpClass("_TtC7SwiftUIP33_7CAAF8CB17093C835B3EA3980BA79FD812SwiftUIClass")!
#else
        bundleClass = SwiftUIClass.self
#endif
        return Bundle(for: bundleClass)
    }
    
    // $s7SwiftUI17_ResolvedCommandsV8fileItem_WZ
    @safe static nonisolated(unsafe) let fileItem = Text("File", tableName: "MainMenu", bundle: bundle, comment: "Title of top level File main menu")
    
    // $s7SwiftUI17_ResolvedCommandsV8editItem_WZ
    @safe static nonisolated(unsafe) let editItem = Text("Edit", tableName: "MainMenu", bundle: bundle, comment: "Title of top level Edit main menu")
    
    // $s7SwiftUI17_ResolvedCommandsV10formatItem_WZ
    @safe static nonisolated(unsafe) let formatItem = Text("Format", tableName: "MainMenu", bundle: bundle, comment: "Title of top level Format main menu")
    
    // $s7SwiftUI17_ResolvedCommandsV8viewItem_WZ
    @safe static nonisolated(unsafe) let viewItem = Text("View", tableName: "MainMenu", bundle: bundle, comment: "Title of top level View main menu")
    
    // $s7SwiftUI17_ResolvedCommandsV10windowItem_WZ
    @safe static nonisolated(unsafe) let windowItem = Text("Window", tableName: "MainMenu", bundle: bundle, comment: "Title of top level Window main menu")
    
    // $s7SwiftUI17_ResolvedCommandsV8helpItem_WZ
    @safe static nonisolated(unsafe) let helpItem = Text("Help", tableName: "MainMenu", bundle: bundle, comment: "Title of top level Help main menu")
    
    var topLevelCommands: [HashableCommandGroupPlacementWrapper] = []
    var storage: [HashableCommandGroupPlacementWrapper: CommandAccumulator] = [:]
    var flags: Set<CommandFlag> = []
    
    func mainMenuItems(env: EnvironmentValues) -> [MainMenuItem] {
        /*
         self -> x20
         env -> x0 -> x29 - 0x110
         */
        // <+692>
        let templates_1: [MainMenuItem.Template] = [
            MainMenuItem.Template(
                name: currentAppName(),
                id: .app,
                options: [],
                expectedPlacements: {
                    // $s7SwiftUI17_ResolvedCommandsV13mainMenuItems3envSayAA04MainF4ItemVGAA17EnvironmentValuesV_tFSayAA21CommandGroupPlacementVGyXEfU_
                    let appInfo = CommandGroupPlacement.appInfo
                    let appSettings = CommandGroupPlacement.appSettings
                    let systemServices = CommandGroupPlacement.systemServices
                    let appVisibility = CommandGroupPlacement.appVisibility
                    let appTermination = CommandGroupPlacement.appTermination
                    
                    // <+456>
                    var placements: [CommandGroupPlacement] = [appInfo]
                    placements.append(contentsOf: [appSettings])
                    placements.append(contentsOf: [systemServices])
                    placements.append(contentsOf: [appVisibility])
                    placements.append(contentsOf: [appTermination])
                    
                    return placements
                }()
            ),
            
            // <+944>
            MainMenuItem.Template(
                name: _ResolvedCommands.fileItem.resolveString(in: env, idiom: nil),
                id: .file,
                options: [],
                expectedPlacements: {
                    // $s7SwiftUI17_ResolvedCommandsV13mainMenuItems3envSayAA04MainF4ItemVGAA17EnvironmentValuesV_tFSayAA21CommandGroupPlacementVGyXEfU0_
                    let newItem = CommandGroupPlacement.newItem
                    
                    var openItem: [CommandGroupPlacement]?
                    if _SemanticFeature<Semantics_v7>.isEnabled {
                        openItem = [CommandGroupPlacement.openItem]
                    }
                    
                    let saveItem = CommandGroupPlacement.saveItem
                    let importExport = CommandGroupPlacement.importExport
                    let printItem = CommandGroupPlacement.printItem
                    
                    var placements: [CommandGroupPlacement] = [newItem]
                    if let openItem {
                        placements.append(contentsOf: openItem)
                    }
                    placements.append(contentsOf: [saveItem])
                    placements.append(contentsOf: [importExport])
                    placements.append(contentsOf: [printItem])
                    
                    return placements
                }()
            ),
            
            // <+1300>
            MainMenuItem.Template(
                name: _ResolvedCommands.editItem.resolveString(in: env, idiom: nil),
                id: .edit,
                options: [],
                expectedPlacements: {
                    // $s7SwiftUI17_ResolvedCommandsV13mainMenuItems3envSayAA04MainF4ItemVGAA17EnvironmentValuesV_tFSayAA21CommandGroupPlacementVGyXEfU1_
                    let undoRedo = CommandGroupPlacement.undoRedo
                    let pasteboard = CommandGroupPlacement.pasteboard
                    let textEditing = CommandGroupPlacement.textEditing
                    
                    var placements: [CommandGroupPlacement] = [undoRedo]
                    placements.append(contentsOf: [pasteboard])
                    placements.append(contentsOf: [textEditing])
                    
                    return placements
                }()
            ),
            
            // <+1616>
            MainMenuItem.Template(
                name: _ResolvedCommands.formatItem.resolveString(in: env, idiom: nil),
                id: .format,
                options: [],
                expectedPlacements: [.textFormatting]
            ),
            
            // <+2116>
            MainMenuItem.Template(
                name: _ResolvedCommands.viewItem.resolveString(in: env, idiom: nil),
                id: .view,
                options: [.unknown0],
                expectedPlacements: {
                    // $s7SwiftUI17_ResolvedCommandsV13mainMenuItems3envSayAA04MainF4ItemVGAA17EnvironmentValuesV_tFSayAA21CommandGroupPlacementVGyXEfU3_
                    let toolbar = CommandGroupPlacement.toolbar
                    let sidebar = CommandGroupPlacement.sidebar
                    
                    var placements: [CommandGroupPlacement] = [toolbar]
                    placements.append(contentsOf: [sidebar])
                    
                    return placements
                }()
            )
        ]
        
        // <+2436>
        let templates_2: [MainMenuItem.Template] = []
        if !topLevelCommands.isEmpty {
            assertUnimplemented()
        }
        
        // <+3080>
        let templates_3: [MainMenuItem.Template] = [
            MainMenuItem.Template(
                name: _ResolvedCommands.windowItem.resolveString(in: env, idiom: nil),
                id: .window,
                options: [],
                expectedPlacements: {
                    // $s7SwiftUI17_ResolvedCommandsV13mainMenuItems3envSayAA04MainF4ItemVGAA17EnvironmentValuesV_tFSayAA21CommandGroupPlacementVGyXEfU5_
                    let windowSize = CommandGroupPlacement.windowSize
                    let windowArrangement = CommandGroupPlacement.windowArrangement
                    
                    var placements: [CommandGroupPlacement] = [windowSize]
                    placements.append(contentsOf: [windowArrangement])
                    
                    return placements
                }()
            ),
            
            MainMenuItem.Template(
                name: _ResolvedCommands.helpItem.resolveString(in: env, idiom: nil),
                id: .help,
                options: [],
                expectedPlacements: [.help]
            )
        ]
        
        // <+3880>
        let templates_4: [MainMenuItem.Template] = templates_1 + templates_2 + templates_3
        
        // <+4108>
        var items: [MainMenuItem] = []
        
        for template in templates_4 {
            var results: [CommandAccumulator.Result] = []
            for placement in template.expectedPlacements {
                if let accumulator = storage[HashableCommandGroupPlacementWrapper(placement: placement)] {
                    results.append(accumulator.result)
                }
            }
            
            // <+4732>
            guard !results.isEmpty || template.options.contains(.unknown0) else {
                continue
            }
            
            let item = MainMenuItem(
                name: template.name,
                id: template.id,
                groups: results
            )
            
            items.append(item)
        }
        
        // <+5236>
        return items
    }
}

extension _ResolvedCommands: Sendable {}

struct HashableCommandGroupPlacementWrapper: Hashable {
    fileprivate private(set) var placement: CommandGroupPlacement
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(placement.id)
    }
    
    static func == (lhs: HashableCommandGroupPlacementWrapper, rhs: HashableCommandGroupPlacementWrapper) -> Bool {
        return lhs.placement.id == rhs.placement.id
    }
}

struct CommandAccumulator {
    fileprivate private(set) var result: CommandAccumulator.Result
    private var updatedPlacements: Set<HashableCommandGroupPlacementWrapper>
}

extension CommandAccumulator {
    struct Result {
        private var viewContent: AnyView
    }
}

extension MainMenuItem {
    fileprivate struct Template {
        let name: String
        let id: MainMenuItem.Identifier
        let options: MainMenuItem.Template.Options
        let expectedPlacements: [CommandGroupPlacement]
    }
}

extension MainMenuItem.Template {
    fileprivate struct Options: OptionSet {
        static var unknown0: MainMenuItem.Template.Options {
            return MainMenuItem.Template.Options(rawValue: 1 << 0)
        }
        
        let rawValue: Int
    }
}

#if !SwiftUICompataibility
fileprivate final class SwiftUIClass: NSObject {}
#endif
