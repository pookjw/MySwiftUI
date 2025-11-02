// 65609C35608651F66D749EB1BD9D2226

#warning("TODO")
internal import Spatial
internal import CoreGraphics
private import AttributeGraph

protocol RendererLeafView: ContentResponder, PrimitiveView, UnaryView {
    static var requiresMainThread: Bool {
        get
    }
    
    nonisolated func content() -> DisplayList.Content.Value
}

extension RendererLeafView {
    static nonisolated func makeLeafView(view: _GraphValue<Self>, inputs: _ViewInputs) -> _ViewOutputs {
        // x29 = sp + 0x1a0
        /*
         view = w27
         */
        // 0x30
        var outputs = _ViewOutputs()
        let copy_1 = inputs
        
        if unsafe copy_1.preferences.contains(DisplayList.Key.self) {
            // <+284>
            let identity = _DisplayList_Identity()
            copy_1.pushIdentity(identity)
            
            let leaf = LeafDisplayList(
                identity: identity,
                view: view.value,
                position: copy_1.animatedPosition(),
                size: copy_1.animatedCGSize(),
                containerPosition: copy_1.containerPosition,
                options: copy_1[DisplayList.Options.self],
                contentSeed: DisplayList.Seed()
            )
            
            let attribute = Attribute(leaf)
            unsafe outputs[DisplayList.Key.self] = attribute
        }
        
        // <+860>
        if copy_1.preferences.contains(ViewRespondersKey.self) {
            let filter = LeafResponderFilter(
                data: view.value,
                size: copy_1.animatedSize(),
                position: copy_1.animatedPosition(),
                transform: copy_1.transform
            )
            
            let attribute = Attribute(filter)
            outputs[ViewRespondersKey.self] = attribute
        }
        
        // <+1496>
        outputs.makeContentPathPreferenceWriter(
            inputs: copy_1,
            contentResponder: view.value
        )
        
        return outputs
    }
    
    func contains(points: UnsafeBufferPointer<Point3D>, size: CGSize) -> BitVector64 {
        fatalError("TODO")
    }
    
    static var requiresMainThread: Bool {
        fatalError("TODO")
    }
}

fileprivate struct LeafDisplayList<Content: RendererLeafView>: CustomStringConvertible, StatefulRule {
    private let identity: _DisplayList_Identity
    @Attribute private var view: Content
    @Attribute var position: CGPoint
    @Attribute var size: CGSize
    @Attribute private var containerPosition: CGPoint
    private let options: DisplayList.Options
    private var contentSeed: DisplayList.Seed
    
    init(
        identity: _DisplayList_Identity,
        view: Attribute<Content>,
        position: Attribute<CGPoint>,
        size: Attribute<CGSize>,
        containerPosition: Attribute<CGPoint>,
        options: DisplayList.Options,
        contentSeed: DisplayList.Seed
    ) {
        self.identity = identity
        self._view = view
        self._position = position
        self._size = size
        self._containerPosition = containerPosition
        self.options = options
        self.contentSeed = contentSeed
    }
    
    var description: String {
        fatalError("TODO")
    }
    
    typealias Value = DisplayList
    
    mutating func updateValue() {
        /*
         self = x24
         */
        let (view, flags) = self.$view.valueAndFlags(options: [])
        // x23
        let content = view.content()
        // x28
        let version = DisplayList.Version(forUpdate: ())
        
        if flags == .changed {
            self.contentSeed = DisplayList.Seed(version)
        }
        
        // <+244>
        let position = position
        let containerPosition = containerPosition
        let origin = CGPoint(x: position.x - containerPosition.x, y: position.y - containerPosition.y)
        let item = DisplayList.Item(
            .content(DisplayList.Content(content, seed: contentSeed)),
            frame: CGRect(origin: origin, size: size),
            identity: identity,
            version: version
        )
        item.canonicalize(options: options)
        
        self.value = DisplayList(item)
    }
}

struct LeafResponderFilter<T>: StatefulRule {
    @Attribute private var data: T
    @Attribute private var size: ViewSize
    @Attribute private var position: CGPoint
    @Attribute private var transform: ViewTransform
    private lazy var responder = LeafViewResponder<T>()
    
    fileprivate init(data: Attribute<T>, size: Attribute<ViewSize>, position: Attribute<CGPoint>, transform: Attribute<ViewTransform>) {
        self._data = data
        self._size = size
        self._position = position
        self._transform = transform
    }
    
    typealias Value = [ViewResponder]
    
    func updateValue() {
        fatalError("TODO")
    }
}

final class LeafViewResponder<T>: ViewResponder {
//    private var helper: ContentResponderHelper<T>
}

protocol LeafViewLayout {
    
}
