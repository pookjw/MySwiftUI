// F748B30B59970FC73194935C526E3031
private import Foundation
internal import AttributeGraph
package import QuartzCore
internal import CoreGraphics

@_spi(Internal) public final class ViewGraphHost {
    @safe nonisolated(unsafe) package static var isDefaultEnvironmentConfigured: Bool = false
    nonisolated(unsafe) fileprivate static var _defaultEnvironment: EnvironmentValues = EnvironmentValues(PropertyList())
    nonisolated(unsafe) package static var defaultEnvironment: EnvironmentValues {
        get {
            return unsafe _defaultEnvironment
        }
        set {
            unsafe _defaultEnvironment = newValue
            isDefaultEnvironmentConfigured = true
        }
    }
    
    package weak var updateDelegate: ViewGraphRootValueUpdater? = nil // 0x10
    package weak var renderDelegate: ViewGraphRenderDelegate? = nil // 0x20
    package weak var delegate: ViewGraphHostDelegate? = nil // 0x30
    private var idiom: ViewGraphHost.Idiom? = nil // 0x40
    package var initialInheritedEnvironment: EnvironmentValues? = nil // 0x48
    package let viewGraph: ViewGraph // 0x58
    package let renderer: DisplayList.ViewRenderer // 0x60
    package var currentTimestamp: Time = .zero // 0x68
    package var valuesNeedingUpdate: ViewGraphRootValues = .all // 0x70
    package var renderingPhase: ViewRenderingPhase = .none // 0x72
    package var externalUpdateCount: Int = 0 // 0x78
    private var parentPhase: _GraphInputs.Phase? = nil // 0x80
    var displayLink: ViewGraphDisplayLink? = nil // 0x88
    private var nextTimerTime: Time? = nil // 0x90
    private var updateTimer: Timer? = nil // 0xa0
    
    package init<T : View>(
        rootViewType: T.Type,
        outputs: ViewGraph.Outputs,
        viewDefinition: PlatformViewDefinition.Type
    ) {
        self.viewGraph = ViewGraph(rootViewType: rootViewType, requestedOutputs: outputs)
        self.renderer = DisplayList.ViewRenderer(platform: DisplayList.ViewUpdater.Platform(definition: viewDefinition))
    }
    
    convenience init<T : View>(
       rootViewType: T.Type,
       viewDefinition: PlatformViewDefinition.Type
    ) {
        self.init(
            rootViewType: rootViewType,
            outputs: .defaults,
            viewDefinition: viewDefinition
        )
    }
    
    package nonisolated func `as`<T>(_ type: T.Type) -> T? {
        if let result = _specialize(self as (any ViewGraphOwner), for: T.self) {
            return result
        } else if let result = _specialize(renderer, for: T.self) {
            return result
        } else if let renderDelegate, let result = _specialize(renderDelegate, for: T.self) {
            return result
        } else if let result = _specialize(viewGraph as (any ViewGraphRenderHost), for: T.self) {
            return result
        } else if let result = _specialize(self as (any RootTransformProvider), for: T.self) {
            return result
        } else {
            return nil
        }
    }
    
    package var accessibilityEnabled: Bool {
        get {
            return viewGraph.accessibilityEnabled
        }
        set {
            viewGraph.accessibilityEnabled = newValue
        }
    }
    
    package func setUp() {
        let viewGraph = viewGraph
        viewGraph.append(feature: ViewGraphHost.GraphFeature(host: self))
        viewGraph.append(feature: HitTestBindingFeature())
        updateDelegate?.initializeViewGraph()
        setupInitialInheritedEnvironment()
    }
    
    private func setupInitialInheritedEnvironment() {
        guard let current = unsafe RepresentableContextValues.current else {
            return
        }
        
        initialInheritedEnvironment = current.environment
    }
    
    package func clearDisplayLink() {
        Update.locked {
            if let displayLink {
                displayLink.nextThread = .main
            }
        }
        if let displayLink {
            displayLink.invalidate()
        }
        displayLink = nil
    }
    
    package func clearUpdateTimer() {
        guard Thread.isMainThread else {
            return
        }
        
        if let updateTimer {
            updateTimer.invalidate()
        }
        updateTimer = nil
        nextTimerTime = nil
    }
    
    package func cancelAsyncRendering() {
        Update.ensure {
            if let displayLink {
                displayLink.nextThread = .main
            }
        }
    }
    
    package func updateRemovedState(isUnattached: Bool, isHiddenForReuse: Bool) {
        Update.lock()
        Update.begin()
        
        let removedState: GraphHost.RemovedState
        if isHiddenForReuse {
            removedState = isUnattached ? [.unattached, .hiddenForReuse] : .hiddenForReuse
        } else {
            removedState = isUnattached ? .unattached : []
        }
        
        let viewGraph = viewGraph
        viewGraph.removedState = removedState
        
        Update.end()
        Update.unlock()
    }
    
    package var mayDeferUpdate: Bool {
        guard viewGraph.mayDeferUpdate else {
            return false
        }
        
        guard let displayLink else {
            return false
        }
        
        let nextUpdate = displayLink.nextUpdate
        return nextUpdate < .infinity || nextUpdate > .infinity
    }
    
    package func startUpdateTimer(delay: Double) {
        assertUnimplemented()
    }
    
    package func nextRenderInterval(interval: () -> Double) -> Double {
        if let displayLink {
            let nextUpdate = displayLink.nextUpdate
            if nextUpdate < .infinity || nextUpdate > .infinity {
                return 0
            }
        }
        
        return interval()
    }
    
    package func setEnvironment(_ environment: EnvironmentValues, wrapper: ViewGraphHostEnvironmentWrapper) {
        /*
         self = x19
         wrapper = x22
         environment = x21 + x24
         */
         // x20
        let viewGraph = self.viewGraph
        viewGraph.data.environment = EnvironmentValues(environment)
        
        let newParentPhase = wrapper.phase.base
        viewGraph.updateGraphPhase(oldParentPhase: parentPhase, newParentPhase: newParentPhase)
        parentPhase = newParentPhase
        
        viewGraph.updatePreferenceBridge(environment: environment) { [weak updateDelegate] in
            updateDelegate?.updateEnvironment()
        }
    }
    
    package func invalidateTransform() -> Bool {
        // x21
        let viewGraph = viewGraph
        // w20
        let rootTransform = viewGraph.$rootTransform
        // w19
        let valueState = rootTransform.valueState
        
        if !valueState.contains(.unknown0) {
            rootTransform.invalidateValue()
            if let delegate = viewGraph.delegate {
                delegate.graphDidChange()
            }
            
            return true
        } else {
            return false
        }
    }
    
    package func setProposedSize(_ size: CGSize) {
        viewGraph.setSize(ViewSize(size, proposal: _ProposedSize(size)))
    }
    
    func setSafeAreaInsets(_ edgeInsets: EdgeInsets?, keyboardHeight: CGFloat?) -> Bool {
        return setSafeAreaInsets(edgeInsets, keyboardHeight: keyboardHeight, cornerInsets: nil)
    }
    
    package func setSafeAreaInsets(_ edgeInsets: EdgeInsets?, keyboardHeight: CGFloat?, cornerInsets: RectangleCornerInsets?) -> Bool {
        // x29 = sp + 0x140
        /*
         edgeInsets (Pointer) = x24
         keyboardHeight = x21
         keyboardHeight (case) = x22
         cornerInsets (Pointer) = x23
         */
        
        var edgeInsets = edgeInsets ?? .zero
        let pixelLength = viewGraph.environment.pixelLength
        // sp + 0x70
        edgeInsets.round(toMultipleOf: pixelLength)
        // sp + 0x68
        var containerElement = SafeAreaInsets.Element(
            regions: .container,
            insets: edgeInsets
        )
        
        // sp + 0x10 / w25
        let cornerInsets = cornerInsets
        
        // d13, d12, d8, d10
        var keyboardElement = SafeAreaInsets.Element(regions: .keyboard, insets: EdgeInsets())
        if let keyboardHeight {
            let bottom = keyboardHeight - edgeInsets.bottom
            if bottom < 0 {
                containerElement.insets.bottom = -bottom
                keyboardElement.regions = [.container, .keyboard]
                keyboardElement.insets.bottom = keyboardHeight
            } else {
                keyboardElement.insets.bottom = bottom
            }
        }
        
        // <+396>
        var elements: [SafeAreaInsets.Element] = []
        
        if !containerElement.insets.isEmpty {
            if let cornerInsets {
                containerElement.cornerInsets = AbsoluteRectangleCornerInsets(cornerInsets)
            }
            elements.append(containerElement)
        }
        
        if !keyboardElement.insets.isEmpty {
            elements.append(keyboardElement)
        }
        
        return viewGraph.setSafeAreaInsets(elements)
    }
    
    package func setContainerSize(_ size: CGSize) {
        let viewGraph = viewGraph
        guard let containerSize = viewGraph.$containerSize else {
            return
        }
        
        let changed = containerSize.setValue(ViewSize(size, proposal: _ProposedSize(size)))
        
        guard changed else {
            return
        }
        
        if let delegate = viewGraph.delegate {
            delegate.graphDidChange()
        }
    }
    
    func setRootView<T : View>(_ rootView: T) {
        self.viewGraph.setRootView(rootView)
    }
    
    package var environment: EnvironmentValues {
        return viewGraph.environment
    }
}

extension ViewGraphHost {
    package struct Idiom : Hashable {
        static var phone: Idiom { return Idiom(.phone) }
        static var pad: Idiom { return Idiom(.pad) }
        static var tv: Idiom { return Idiom(.tv) }
        static var watch: Idiom { return Idiom(.watch) }
        static var carPlay: Idiom { return Idiom(.carPlay) }
        static var mac: Idiom { return Idiom(.mac) }
        static var macCatalyst: Idiom { return Idiom(.macCatalyst) }
        static var vision: Idiom { return Idiom(.vision) }
        
        var base: InterfaceIdiom
        
        package init(_ idiom: InterfaceIdiom) {
            self.base = idiom
        }
    }
    
    public struct Phase {
        // TODO
        var base = _GraphInputs.Phase()
    }
    
    public struct LayoutInvalidator {
        private(set) weak var viewGraph: ViewGraph?
        private(set) var layoutComputer: WeakAttribute<LayoutComputer>
        
        package func invalidate() {
            assertUnimplemented()
        }
    }
}

extension _GraphInputs {
    package var viewGraphHostIdiom: ViewGraphHost.Idiom? {
        get {
            guard let idiom = self[InterfaceIdiomInput.self] else {
                return nil
            }
            return ViewGraphHost.Idiom(idiom.interfaceIdiom)
        }
        set {
            if let newValue {
                self[InterfaceIdiomInput.self] = AnyInterfaceIdiom(idiom: newValue.base)
            } else {
                self[InterfaceIdiomInput.self] = nil
            }
        }
        _modify {
            assertUnimplemented()
        }
    }
}

extension ViewGraphHost {
    struct GraphFeature : ViewGraphFeature {
        private weak var host: ViewGraphHost?
        
        init(host: ViewGraphHost) {
            self.host = host
        }
        
        func modifyViewInputs(inputs: inout _ViewInputs, graph: ViewGraph) {
            if let host {
                let definition = host.renderer.platform.definition
                if definition.system == .uiView {
                    inputs.base.platformSystem = .uiKit
                }
            }
            
            if let delegate = host?.delegate {
                delegate.updateGraphInputs(&inputs.base)
            }
        }
    }
}

extension ViewGraphHost {
    package struct AssetCatalogConfiguration : Equatable {
        package var referenceBounds: CGRect
        package var pointsPerInch: CGFloat
        package var preferredArtworkSubtype: Int
        
        package init(referenceBounds: CGRect, pointsPerInch: CGFloat, preferredArtworkSubtype: Int) {
            self.referenceBounds = referenceBounds
            self.pointsPerInch = pointsPerInch
            self.preferredArtworkSubtype = preferredArtworkSubtype
        }
    }
}

extension ViewGraphHost : ViewGraphOwner {}

extension ViewGraphHost : RootTransformProvider {
    func rootTransform() -> ViewTransform {
        var transform = ViewTransform()
        
        if
            let updateDelegate,
            let adjuster = updateDelegate.as((any RootTransformAdjuster).self)
        {
            adjuster.updateRootTransform(&transform)
        }
        
        transform.appendCoordinateSpace(id: .viewGraphHost)
        
        return transform
    }
}
