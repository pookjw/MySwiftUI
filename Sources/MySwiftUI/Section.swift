public import MySwiftUICore
public import Foundation

public struct Section<Parent, Content, Footer> {
    @safe private nonisolated(unsafe) var header: Parent
    @safe private nonisolated(unsafe) var content: Content
    @safe private nonisolated(unsafe) var footer: Footer
    private var isExpanded: Binding<Bool>? = nil
    
    init(header: Parent, footer: Footer, content: Content) {
        self.header = header
        self.footer = footer
        self.content = content
    }
}

extension Section : Sendable {
}

extension Section : View where Parent : View, Content : View, Footer : View {
    public typealias Body = Never
    
    @available(iOS 14.0, macOS 11.0, tvOS 14.0, watchOS 7.0, *)
    nonisolated public static func _viewListCount(inputs: _ViewListCountInputs) -> Int? {
        // $s7SwiftUI7SectionVA2A4ViewRzAaDR_AaDR0_rlE14_viewListCount6inputsSiSgAA01_dfG6InputsV_tFZ
        assertUnimplemented()
    }
}

extension Section : PrimitiveView where Parent : View, Content : View, Footer : View {
}

extension Section : PubliclyPrimitiveView where Parent : View, Content : View, Footer : View {
    var internalBody: some View {
        // $s7SwiftUI7SectionVA2A4ViewRzAaDR_AaDR0_rlE12internalBodyQrvg
        ResolvedSectionStyle(
            configuration: SectionStyleConfiguration(
                isExpanded: self.isExpanded
            )
        )
        .viewAlias(SectionStyleConfiguration.Header.self) { 
            // $s7SwiftUI19NavigationSplitViewV4bodyQrvgxyXEfU_TA
            assertUnimplemented()
        }
        .viewAlias(SectionStyleConfiguration.Footer.self) { 
            // $s7SwiftUI7SectionVA2A4ViewRzAaDR_AaDR0_rlE12internalBodyQrvgq0_yXEfU0_TA
            assertUnimplemented()
        }
        .viewAlias(SectionStyleConfiguration.RawContent.self) { 
            // $s7SwiftUI7SectionVA2A4ViewRzAaDR_AaDR0_rlE12internalBodyQrvgq_yXEfU1_TA
            assertUnimplemented()
        }
    }
}

extension Section where Parent : View, Content : View, Footer : View {
    @_alwaysEmitIntoClient public init(@ViewBuilder content: () -> Content, @ViewBuilder header: () -> Parent, @ViewBuilder footer: () -> Footer) {
        self.init(header: header(), footer: footer(), content: content)
    }
}

extension Section where Parent == EmptyView, Content : View, Footer : View {
    @_alwaysEmitIntoClient public init(@ViewBuilder content: () -> Content, @ViewBuilder footer: () -> Footer) {
        self.init(footer: footer(), content: content)
    }
}

extension Section where Parent : View, Content : View, Footer == EmptyView {
    @_alwaysEmitIntoClient public init(@ViewBuilder content: () -> Content, @ViewBuilder header: () -> Parent) {
        self.init(header: header(), content: content)
    }
}

extension Section where Parent == EmptyView, Content : View, Footer == EmptyView {
    public init(@ViewBuilder content: () -> Content) {
        assertUnimplemented()
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension Section where Parent == Text, Content : View, Footer == EmptyView {
    public init(_ titleKey: LocalizedStringKey, @ViewBuilder content: () -> Content) {
        assertUnimplemented()
    }
    
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    @_disfavoredOverload @_alwaysEmitIntoClient public init(_ titleResource: LocalizedStringResource, @ViewBuilder content: () -> Content) {
        self.init(
            content: content,
            header: { Text(titleResource) }
        )
    }
    
    @_disfavoredOverload public init<S>(_ title: S, @ViewBuilder content: () -> Content) where S : StringProtocol {
        assertUnimplemented()
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension Section where Parent == Text, Content : View, Footer == EmptyView {
    public init(_ titleKey: LocalizedStringKey, isExpanded: Binding<Bool>, @ViewBuilder content: () -> Content) {
        assertUnimplemented()
    }
    
    
    @_disfavoredOverload @_alwaysEmitIntoClient public init(_ titleResource: LocalizedStringResource, isExpanded: Binding<Bool>, @ViewBuilder content: () -> Content) {
        self.init(isExpanded: isExpanded, content: content) {
            Text(titleResource)
        }
    }
    
    @_disfavoredOverload public init<S>(_ title: S, isExpanded: Binding<Bool>, @ViewBuilder content: () -> Content) where S : StringProtocol {
        assertUnimplemented()
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
extension Section where Parent : View, Content : View, Footer == EmptyView {
    public init(isExpanded: Binding<Bool>, @ViewBuilder content: () -> Content, @ViewBuilder header: () -> Parent) {
        assertUnimplemented()
    }
}

extension Section where Parent : View, Content : View, Footer : View {
    @available(iOS, deprecated: 100000.0, renamed: "Section(content:header:footer:)")
    @available(macOS, deprecated: 100000.0, renamed: "Section(content:header:footer:)")
    @available(tvOS, deprecated: 100000.0, renamed: "Section(content:header:footer:)")
    @available(watchOS, deprecated: 100000.0, renamed: "Section(content:header:footer:)")
    @available(visionOS, deprecated: 100000.0, renamed: "Section(content:header:footer:)")
    public init(header: Parent, footer: Footer, @ViewBuilder content: () -> Content) {
        self.init(header: header, footer: footer, content: content())
    }
}

extension Section where Parent == EmptyView, Content : View, Footer : View {
    @available(iOS, deprecated: 100000.0, renamed: "Section(content:footer:)")
    @available(macOS, deprecated: 100000.0, renamed: "Section(content:footer:)")
    @available(tvOS, deprecated: 100000.0, renamed: "Section(content:footer:)")
    @available(watchOS, deprecated: 100000.0, renamed: "Section(content:footer:)")
    @available(visionOS, deprecated: 100000.0, renamed: "Section(content:footer:)")
    public init(footer: Footer, @ViewBuilder content: () -> Content) {
        assertUnimplemented()
    }
}

extension Section where Parent : View, Content : View, Footer == EmptyView {
    @available(iOS, deprecated: 100000.0, renamed: "Section(content:header:)")
    @available(macOS, deprecated: 100000.0, renamed: "Section(content:header:)")
    @available(tvOS, deprecated: 100000.0, renamed: "Section(content:header:)")
    @available(watchOS, deprecated: 100000.0, renamed: "Section(content:header:)")
    @available(visionOS, deprecated: 100000.0, renamed: "Section(content:header:)")
    public init(header: Parent, @ViewBuilder content: () -> Content) {
        assertUnimplemented()
    }
}

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
extension Section {
    @usableFromInline
    internal static func create(isExpanded: Binding<Bool>? = nil, content: Content, header: Parent, footer: Footer) -> Section<Parent, Content, Footer> {
        assertUnimplemented()
    }
}

struct ResolvedSectionStyle : StyleableView {
    static var defaultStyleModifier: SectionStyleModifier<DefaultSectionStyle> {
        assertUnimplemented()
    }
    
    private(set) var configuration: SectionStyleConfiguration
    
    init(configuration: SectionStyleConfiguration) {
        self.configuration = configuration
    }
    
    var body: some View {
        Section(
            header: configuration.header,
            footer: configuration.footer,
            content: configuration.rawContent
        )
        .viewAlias(SectionStyleConfiguration.Header.self) {
            AccessibilitySectionHeaderModifier<SectionStyleConfiguration.Header>()
                .body(content: configuration.header)
        }
        .viewAlias(SectionStyleConfiguration.RawContent.self) {
            configuration
                .rawContent
                ._trait(SectionActionsTraitKey.self, configuration.actions)
        }
    }
}

struct SectionActionsTraitKey : _ViewTraitKey {
    static var defaultValue: SectionStyleConfiguration.Actions {
        assertUnimplemented()
    }
}

struct SectionStyleModifier<Style : SectionStyle> : StyleModifier {
    var style: Style
    
    init(style: Style) {
        assertUnimplemented()
    }
    
    func styleBody(configuration: SectionStyleConfiguration) -> some View {
        style
            .makeBody(configuration: configuration)
            ._trait(IsExpandedTraitKey.self, configuration.isExpanded)
    }
}

protocol SectionStyle {
    associatedtype Body : View
    func makeBody(configuration: SectionStyleConfiguration) -> Self.Body
}

struct DefaultSectionStyle : SectionStyle {
    func makeBody(configuration: SectionStyleConfiguration) -> some View {
        Section(
            header: configuration.header,
            footer: configuration.footer,
            content: configuration.rawContent
        )
        .modifier(
            SectionStyleModifier(style: SidebarSectionStyle())
                .requiring(SidebarListStyleContext())
        )
        .modifier(
            SectionStyleModifier(style: MenuSectionStyle())
                .requiring(.menu)
        )
        .modifier(
            SectionStyleModifier(style: InlineActionsSectionStyle())
                .requiring(AnyListStyleContext())
        )
    }
}
