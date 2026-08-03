# MySwiftUI

SwiftUI & RealityKit Disassembly

## Requirements

- Xcode 26
    - If you use Xcode 27, use the [`Xcode27SDKCompataibility`](https://github.com/pookjw/MySwiftUI/blob/c7d534f836a58df0f3e30fa257bd59b9936ef953/Package.swift#L39) trait.

- visionOS 26.5

## Implemented APIs

### SwiftUI

- Views
  - [`View`](https://developer.apple.com/documentation/swiftui/view)
  - [`EmptyView`](https://developer.apple.com/documentation/swiftui/emptyview)
  - [`AnyView`](https://developer.apple.com/documentation/swiftui/anyview)
  - [`Color`](https://developer.apple.com/documentation/swiftui/color)
  - [`Color.red`](https://developer.apple.com/documentation/swiftui/color/red)
  - [`Color.orange`](https://developer.apple.com/documentation/swiftui/color/orange)
  - [`Color.yellow`](https://developer.apple.com/documentation/swiftui/color/yellow)
  - [`Color.green`](https://developer.apple.com/documentation/swiftui/color/green)
  - [`Color.mint`](https://developer.apple.com/documentation/swiftui/color/mint)
  - [`Color.teal`](https://developer.apple.com/documentation/swiftui/color/teal)
  - [`Color.cyan`](https://developer.apple.com/documentation/swiftui/color/cyan)
  - [`Color.blue`](https://developer.apple.com/documentation/swiftui/color/blue)
  - [`Color.indigo`](https://developer.apple.com/documentation/swiftui/color/indigo)
  - [`Color.purple`](https://developer.apple.com/documentation/swiftui/color/purple)
  - [`Color.pink`](https://developer.apple.com/documentation/swiftui/color/pink)
  - [`Color.brown`](https://developer.apple.com/documentation/swiftui/color/brown)
  - [`Color.white`](https://developer.apple.com/documentation/swiftui/color/white)
  - [`Color.gray`](https://developer.apple.com/documentation/swiftui/color/gray)
  - [`Color.black`](https://developer.apple.com/documentation/swiftui/color/black)
  - [`Color.clear`](https://developer.apple.com/documentation/swiftui/color/clear)
  - [`Color.primary`](https://developer.apple.com/documentation/swiftui/color/primary)
  - [`Color.secondary`](https://developer.apple.com/documentation/swiftui/color/secondary)
  - [`Color.init(cgColor:)`](<https://developer.apple.com/documentation/swiftui/color/init%28cgcolor%3A%29>)
  - [`Color.init(uiColor:)`](<https://developer.apple.com/documentation/swiftui/color/init%28uicolor%3A%29>)
  - [`Color.resolve(in:)`](<https://developer.apple.com/documentation/swiftui/color/resolve%28in%3A%29>)
  - [`Group`](https://developer.apple.com/documentation/swiftui/group)
  - [`HStack`](https://developer.apple.com/documentation/swiftui/hstack)
  - [`VStack`](https://developer.apple.com/documentation/swiftui/vstack)
  - [`ZStack`](https://developer.apple.com/documentation/swiftui/zstack)
  - [`GeometryReader`](https://developer.apple.com/documentation/swiftui/geometryreader)
  - [`GeometryReader3D`](https://developer.apple.com/documentation/swiftui/geometryreader3d)
  - [`ViewBuilder`](https://developer.apple.com/documentation/swiftui/viewbuilder)
  - [`TupleView`](https://developer.apple.com/documentation/swiftui/tupleview)

- Layouts
  - [`AnyLayout`](https://developer.apple.com/documentation/swiftui/anylayout)
  - [`HStackLayout`](https://developer.apple.com/documentation/swiftui/hstacklayout)
  - [`VStackLayout`](https://developer.apple.com/documentation/swiftui/vstacklayout)
  - [`Layout`](https://developer.apple.com/documentation/swiftui/layout)
  - [`ProposedViewSize`](https://developer.apple.com/documentation/swiftui/proposedviewsize)
  - [`Alignment`](https://developer.apple.com/documentation/swiftui/alignment)
  - [`HorizontalAlignment`](https://developer.apple.com/documentation/swiftui/horizontalalignment)
  - [`VerticalAlignment`](https://developer.apple.com/documentation/swiftui/verticalalignment)

- State and environment
  - [`State`](https://developer.apple.com/documentation/swiftui/state)
  - [`Binding`](https://developer.apple.com/documentation/swiftui/binding)
  - [`Binding.init(get:set:)`](<https://developer.apple.com/documentation/swiftui/binding/init%28get%3Aset%3A%29>)
  - [`Binding.constant(_:)`](<https://developer.apple.com/documentation/swiftui/binding/constant%28_%3A%29>)
  - [`StateObject`](https://developer.apple.com/documentation/swiftui/stateobject)
  - [`ObservedObject`](https://developer.apple.com/documentation/swiftui/observedobject)
  - [`AppStorage`](https://developer.apple.com/documentation/swiftui/appstorage)
  - [`Environment`](https://developer.apple.com/documentation/swiftui/environment)
  - [`EnvironmentObject`](https://developer.apple.com/documentation/swiftui/environmentobject)
  - [`Bindable`](https://developer.apple.com/documentation/swiftui/bindable)
  - [`Observable`](https://developer.apple.com/documentation/observation/observable)

- Collections and sections
  - [`ForEach`](https://developer.apple.com/documentation/swiftui/foreach)
    - [`init(_ data: Data, content:)`](<https://developer.apple.com/documentation/swiftui/foreach/init%28_%3Acontent%3A%29>)
    - [`init(_ data: Data, id: KeyPath<Data.Element, ID>, content:)`](<https://developer.apple.com/documentation/swiftui/foreach/init%28_%3Aid%3Acontent%3A%29>)
    - [`init(_ data: Binding<C>, content:)`](https://developer.apple.com/documentation/swiftui/foreach)
    - [`init(_ data: Binding<C>, id: KeyPath<C.Element, ID>, content:)`](https://developer.apple.com/documentation/swiftui/foreach)
    - [`init(_ data: Range<Int>, content:)`](<https://developer.apple.com/documentation/swiftui/foreach/init%28_%3Acontent%3A%29>)
    - [`init(subviews: V, content:)`](<https://developer.apple.com/documentation/swiftui/foreach/init%28subviews%3Acontent%3A%29>)
    - [`init(sections: V, content:)`](<https://developer.apple.com/documentation/swiftui/foreach/init%28sections%3Acontent%3A%29>)
  - [`Section`](https://developer.apple.com/documentation/swiftui/section)
    - [`init(content:header:footer:)`](<https://developer.apple.com/documentation/swiftui/section/init%28content%3Aheader%3Afooter%3A%29>)
    - [`init(content:footer:)`](<https://developer.apple.com/documentation/swiftui/section/init%28content%3Afooter%3A%29>)
    - [`init(content:header:)`](<https://developer.apple.com/documentation/swiftui/section/init%28content%3Aheader%3A%29>)
    - [`init(_ titleResource: LocalizedStringResource, content:)`](<https://developer.apple.com/documentation/swiftui/section/init%28_%3Acontent%3A%29>)
    - [`init(_ titleResource: LocalizedStringResource, isExpanded: Binding<Bool>, content:)`](<https://developer.apple.com/documentation/swiftui/section/init%28_%3Aisexpanded%3Acontent%3A%29>)
    - [`init(header:footer:content:)`](<https://developer.apple.com/documentation/swiftui/section/init%28header%3Afooter%3Acontent%3A%29>)
  - [`SectionConfiguration`](https://developer.apple.com/documentation/swiftui/sectionconfiguration)
  - [`SectionConfiguration.id`](https://developer.apple.com/documentation/swiftui/sectionconfiguration/id)
  - [`SectionConfiguration.header`](https://developer.apple.com/documentation/swiftui/sectionconfiguration/header)
  - [`SectionConfiguration.content`](https://developer.apple.com/documentation/swiftui/sectionconfiguration/content)
  - [`SectionConfiguration.footer`](https://developer.apple.com/documentation/swiftui/sectionconfiguration/footer)
  - [`SubviewsCollection`](https://developer.apple.com/documentation/swiftui/subviewscollection)

- View modifiers and actions
  - [`View.frame(width:height:alignment:)`](<https://developer.apple.com/documentation/swiftui/view/frame%28width%3Aheight%3Aalignment%3A%29>)
  - [`View.frame(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)`](<https://developer.apple.com/documentation/swiftui/view/frame%28minwidth%3Aidealwidth%3Amaxwidth%3Aminheight%3Aidealheight%3Amaxheight%3Aalignment%3A%29>)
  - [`View.offset(x:y:)`](<https://developer.apple.com/documentation/swiftui/view/offset%28x%3Ay%3A%29>)
  - [`View.offset(z:)`](<https://developer.apple.com/documentation/swiftui/view/offset%28z%3A%29>)
  - [`View.animation(_:value:)`](<https://developer.apple.com/documentation/swiftui/view/animation%28_%3Avalue%3A%29>)
  - [`View.transaction(_:)`](<https://developer.apple.com/documentation/swiftui/view/transaction%28_%3A%29>)
  - [`withAnimation(_:)`](<https://developer.apple.com/documentation/swiftui/withanimation%28_%3A%29>)
  - [`View.task(name:priority:file:line:_:)`](https://developer.apple.com/documentation/swiftui/view/task%28name%3Apriority%3Afile%3Aline%3A_%3A%29)
  - [`View.task(id:name:priority:file:line:_:)`](https://developer.apple.com/documentation/swiftui/view/task%28id%3Aname%3Apriority%3Afile%3Aline%3A_%3A%29)
  - [`View.onAppear(perform:)`](<https://developer.apple.com/documentation/swiftui/view/onappear%28perform%3A%29>)
  - [`View.onDisappear(perform:)`](<https://developer.apple.com/documentation/swiftui/view/ondisappear%28perform%3A%29>)
  - [`View.onChange(of:initial:_:)`](<https://developer.apple.com/documentation/swiftui/view/onchange%28of%3Ainitial%3A_%3A%29>)
  - [`View.environment(_:_:)`](https://developer.apple.com/documentation/swiftui/view/environment%28_%3A_%3A%29)
  - [`View.environmentObject(_:)`](https://developer.apple.com/documentation/swiftui/view/environmentobject%28_%3A%29)
  - [`View.preference(key:value:)`](https://developer.apple.com/documentation/swiftui/view/preference%28key%3Avalue%3A%29)
  - [`View.onPreferenceChange(_:perform:)`](https://developer.apple.com/documentation/swiftui/view/onpreferencechange%28_%3Aperform%3A%29)
  - [`View.transformPreference(_:transform:)`](https://developer.apple.com/documentation/swiftui/view/transformpreference%28_%3A_%3A%29)
  - [`View.containerValue(_:_:)`](https://developer.apple.com/documentation/swiftui/view/containervalue%28_%3A_%3A%29)
  - [`UIViewRepresentable`](https://developer.apple.com/documentation/swiftui/uiviewrepresentable)
  - [`UIViewControllerRepresentable`](https://developer.apple.com/documentation/swiftui/uiviewcontrollerrepresentable)
  - [`withAnimation(_:completionCriteria:_:completion:)`](https://developer.apple.com/documentation/swiftui/withanimation%28_%3Acompletioncriteria%3A_%3Acompletion%3A%29)
  - [`AnimationCompletionCriteria`](https://developer.apple.com/documentation/swiftui/animationcompletioncriteria)
  - [`AnimationCompletionCriteria.logicallyComplete`](https://developer.apple.com/documentation/swiftui/animationcompletioncriteria/logicallycomplete)
  - [`AnimationCompletionCriteria.removed`](https://developer.apple.com/documentation/swiftui/animationcompletioncriteria/removed)

- Presentation and system actions
  - [`OpenWindowAction`](https://developer.apple.com/documentation/swiftui/openwindowaction)
  - [`OpenWindowAction.callAsFunction(id:)`](https://developer.apple.com/documentation/swiftui/openwindowaction/callasfunction%28id%3A%29)
  - [`OpenImmersiveSpaceAction`](https://developer.apple.com/documentation/swiftui/openimmersivespaceaction)
  - [`OpenImmersiveSpaceAction.callAsFunction(id:)`](https://developer.apple.com/documentation/swiftui/openimmersivespaceaction/callasfunction%28id%3A%29)
  - [`OpenURLAction`](https://developer.apple.com/documentation/swiftui/openurlaction)
  - [`OpenURLAction.init(handler:)`](https://developer.apple.com/documentation/swiftui/openurlaction/init%28handler%3A%29)
  - [`OpenURLAction.callAsFunction(_:)`](https://developer.apple.com/documentation/swiftui/openurlaction/callasfunction%28_%3A%29)
  - [`OpenURLAction.callAsFunction(_:prefersInApp:)`](https://developer.apple.com/documentation/swiftui/openurlaction/callasfunction%28_%3Aprefersinapp%3A%29)
  - [`OpenURLAction.callAsFunction(_:completion:)`](https://developer.apple.com/documentation/swiftui/openurlaction/callasfunction%28_%3Acompletion%3A%29)
  - [`OpenURLAction.Result.handled`](https://developer.apple.com/documentation/swiftui/openurlaction/result/handled)
  - [`OpenURLAction.Result.discarded`](https://developer.apple.com/documentation/swiftui/openurlaction/result/discarded)
  - [`OpenURLAction.Result.systemAction`](https://developer.apple.com/documentation/swiftui/openurlaction/result/systemaction)

- Additional implemented SwiftUI APIs
  - [`Animation`](https://developer.apple.com/documentation/swiftui/animation)
  - [`Transaction`](https://developer.apple.com/documentation/swiftui/transaction)
  - [`ColorScheme`](https://developer.apple.com/documentation/swiftui/colorscheme)
  - [`ColorSchemeContrast`](https://developer.apple.com/documentation/swiftui/colorschemecontrast)
  - [`DynamicTypeSize`](https://developer.apple.com/documentation/swiftui/dynamictypesize)
  - [`ContainerValues`](https://developer.apple.com/documentation/swiftui/containervalues)
  - [`ContainerValueKey`](https://developer.apple.com/documentation/swiftui/containervalues/containervaluekey)

### RealityKit

WIP
