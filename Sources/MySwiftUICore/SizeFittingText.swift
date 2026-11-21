// 22A2F77020526CCA53FF38DE37184183
internal import AttributeGraph
internal import Foundation

struct SizeFittingTextFilter : AsyncAttribute, StatefulRule {
    @Attribute private var size: ViewSize
    @Attribute private var text: Text
    @Attribute private var environment: EnvironmentValues
    private let isArchived: Bool
    let cache: SizeFittingTextCache<ResolvedTextHelper, StickyTextSizeFittingLogic>
    
    init(
        size: Attribute<ViewSize>,
        text: Attribute<Text>,
        environment: Attribute<EnvironmentValues>,
        time: Attribute<Time>,
        referenceDate: WeakAttribute<Date?>,
        includeDefaultAttributes: Bool,
        allowsKeyColors: Bool,
        archiveOptions: ArchivedViewInput.Value,
        features: Text.ResolvedProperties.Features,
        attachmentsAsAuxiliaryMetadata: Bool,
        idiom: AnyInterfaceIdiom
    ) {
        assertUnimplemented()
    }
    
    typealias Value = ResolvedStyledText
    
    func updateValue() {
        assertUnimplemented()
    }
}

class SizeFittingTextCache<T, U> {
    // TODO
}

struct StickyTextSizeFittingLogic {
    // TODO
}

struct SizeFittingTextLayoutComputer : AsyncAttribute, StatefulRule {
    @Attribute private(set) var text: Text
    @Attribute private(set) var environment: EnvironmentValues
    @WeakAttribute var renderer: TextRendererBoxBase?
    let cache: SizeFittingTextCache<ResolvedTextHelper, StickyTextSizeFittingLogic>
    
    typealias Value = LayoutComputer
    
    func updateValue() {
        assertUnimplemented()
    }
}
