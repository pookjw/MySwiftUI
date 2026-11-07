// EFAEDE41CB8C85EF3A6A18DC05438A3C
private import CoreGraphics
internal import QuartzCore
private import RenderBox

extension DisplayList {
    package final class GraphicsRenderer {
        private var oldCache: DisplayList.GraphicsRenderer.Cache // 0x10
        private var newCache: DisplayList.GraphicsRenderer.Cache // 0x20
        private var index: DisplayList.Index // 0x30
        private var time: Time // 0x48
        private var nextTime: Time // 0x50
        var stableIDs: _DisplayList_StableIdentityMap? // 0x58
        private var inTransitionGroup: Bool // 0x60
        private var stateHashes: [StrongHash] // 0x68
        var platformViewMode: DisplayList.GraphicsRenderer.PlatformViewMode // 0x70
        private var placeholderUserInfo: [CodingUserInfoKey: Any]? // 0x78
        private var rbEncoderSet: RBEncoderSet? // 0x80
        
        init(platformViewMode: DisplayList.GraphicsRenderer.PlatformViewMode) {
            self.oldCache = DisplayList.GraphicsRenderer.Cache(callbacks: [:], animators: [:])
            self.newCache = DisplayList.GraphicsRenderer.Cache(callbacks: [:], animators: [:])
            self.index = DisplayList.Index()
            self.time = Time.zero
            self.nextTime = Time.infinity
            self.stableIDs = nil
            self.inTransitionGroup = false
            self.stateHashes = []
            self.placeholderUserInfo = nil
            self.rbEncoderSet = nil
            self.platformViewMode = platformViewMode
            self.index.enter(identity: _DisplayList_Identity())
        }
        
        func render(at time: Time, do body: () -> ()) {
            assertUnimplemented()
        }
        
        func render(list: DisplayList, in context: inout GraphicsContext) {
            let identifier = context.storage.state.identifier
            
            let identifierNamespace2 = unsafe UUID(
                uuid: unsafeBitCast(context.storage.state.identifierNamespace2, to: uuid_t.self)
            )
            
            for item in list.items {
                // <+112>
                // item -> sp + 0x70
                let oldIndex = self.index.enter(identity: item.identity)
                
                if item.identity == .none {
                    // <+404>
                } else {
                    // <+172>
                    if let stableIDs, let existing = stableIDs[item.identity] {
                        // <+220>
                        let rbHash = RBHash(
                            v0: existing.hash.words.0,
                            v1: existing.hash.words.1,
                            v2: existing.hash.words.2,
                            v3: existing.hash.words.3
                        )
                        
                        let rbUUID = RBUUID.fromHash(rbHash, version: 5)
                        context.setIdentifier(existing.serial, in: rbUUID)
                    } else {
                        // <+328>
                        context.identifier = item.identity.value
                    }
                }
                
                self.render(item: item, in: &context)
                self.index.leave(index: oldIndex)
            }
            
            context.setIdentifier(identifier, in: identifierNamespace2)
        }
        
        func render(item: DisplayList.Item, in context: inout GraphicsContext) {
            /*
             self -> x20 -> x22
             item -> x0 -> x20
             context -> x1 -> x24
             */
            // <+164>
            // x19 + 0x390 (sp + 0x3d0)
            let copy_1 = item
            
            switch copy_1.value {
            case .content(let content):
                // <+228>
                switch content.value {
                case .backdrop(let backdropEffect):
                    // <+256>
                    assertUnimplemented()
                case .color(let colorView):
                    // <+3736>
                    assertUnimplemented()
                case .chameleonColor(let chameleonColor):
                    // <+3844>
                    assertUnimplemented()
                case .image(let graphicsImage):
                    // <+3308>
                    assertUnimplemented()
                case .shape(let path, let paint, let fillStyle):
                    // <+4160>
                    assertUnimplemented()
                case .sdfShape(let sDFShape):
                    // <+4328>
                    assertUnimplemented()
                case .sdfMask(let displayList, let sDFLayer):
                    // <+4064>
                    assertUnimplemented()
                case .shadow(let path, let resolvedShadowStyle):
                    // <+4528>
                    assertUnimplemented()
                case .platformView(let platformViewFactory):
                    // <+3588>
                    assertUnimplemented()
                case .platformLayer(let platformLayerFactory):
                    // <+4456>
                    assertUnimplemented()
                case .text(let styledTextContentView, let cGSize):
                    // <+3096>
                    assertUnimplemented()
                case .flattened(let displayList, let cGPoint, let rasterizationOptions):
                    // <+3508>
                    assertUnimplemented()
                case .drawing(let rBDisplayListContents, let cGPoint, let rasterizationOptions):
                    // <+4248>
                    assertUnimplemented()
                case .view(let _DisplayList_ViewFactory):
                    // <+2860>
                    assertUnimplemented()
                case .placeholder(let id):
                    // <+12440>
                    return
                }
            case .effect(let effect, let list):
                // <+628>
                assertUnimplemented()
            case .states(let states):
                // <+488>
                assertUnimplemented()
            case .empty:
                // <+12448>
                return
            }
        }
        
        func renderDisplayList(_ list: DisplayList, at time: Time, in context: inout GraphicsContext) {
            let index = self.index
            self.time = time
            self.nextTime = .infinity
            
            self.render(list: list, in: &context)
            
            self.oldCache.callbacks = [:]
            let newCache = self.newCache
            self.newCache = DisplayList.GraphicsRenderer.Cache(callbacks: [:], animators: [:])
            self.oldCache = newCache
            self.index = index
        }
        
        func drawImplicitLayer(in context: inout GraphicsContext, content: (inout GraphicsContext) -> ()) {
            assertUnimplemented()
        }
        
        func drawPlatformLayer(_ layer: CALayer, in context: GraphicsContext, size: CGSize, update: Bool) {
            assertUnimplemented()
        }
        
        func renderPlatformView(_ view: Any?, in context: GraphicsContext, size: CGSize, viewType: Any.Type) {
            assertUnimplemented()
        }
    }
}
extension DisplayList.GraphicsRenderer {
    enum PlatformViewMode {
        case rendered(update: Bool) // 0/1
        case ignored // 2
        case unsupported // 3
    }
    
    fileprivate struct Cache {
        var callbacks: [DisplayList.GraphicsRenderer.Cache.CallbackKey: any RBDisplayListContents]
        private(set) var animators: [DisplayList.GraphicsRenderer.Cache.AnimatorKey: any _DisplayList_AnyEffectAnimator]
    }
}

extension DisplayList.GraphicsRenderer.Cache {
    fileprivate struct AnimatorKey : Hashable {
        private var index: DisplayList.Index.ID
        
        static func == (lhs: DisplayList.GraphicsRenderer.Cache.AnimatorKey, rhs: DisplayList.GraphicsRenderer.Cache.AnimatorKey) -> Bool {
            assertUnimplemented()
        }
        
        func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
    }
    
    fileprivate struct CallbackKey : Hashable {
        private var index: DisplayList.Index.ID
        private var seed: DisplayList.Seed
        private var scale: CGFloat
        
        static func == (lhs: DisplayList.GraphicsRenderer.Cache.CallbackKey, rhs: DisplayList.GraphicsRenderer.Cache.CallbackKey) -> Bool {
            assertUnimplemented()
        }
        
        func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
    }
}
