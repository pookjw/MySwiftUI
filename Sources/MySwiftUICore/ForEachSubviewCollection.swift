@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public struct ForEachSubviewCollection<Content> : RandomAccessCollection where Content : View {
    var substituteView: AnyView
    
    nonisolated init<T: View>(elementOf subviews: T, content: @escaping (Subview) -> Content) {
        let groupContent = GroupElementsOfContent<T, ForEach<SubviewsCollection, Subview.ID, Content>>(subviews: subviews) { collection in
            // $s7SwiftUI24ForEachSubviewCollectionV9elementOf7contentACyxGqd___xAA0E0VctcAA4ViewRd__lufcAA0cD0VyAA08SubviewsF0VAH2IDVxGAMcfU_TA
            return ForEach(collection) { data in
                content(data)
            }
        }
        
        self.substituteView = AnyView(groupContent)
    }
    
    public var startIndex: Int {
        preconditionFailure()
    }

    public var endIndex: Int {
        preconditionFailure()
    }

    public subscript(index: Int) -> Subview {
        preconditionFailure()
    }

    @available(iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, macOS 15.0, *)
    public typealias Element = Subview
    @available(iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, macOS 15.0, *)
    public typealias Index = Int
    @available(iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, macOS 15.0, *)
    public typealias Indices = Range<Int>
    @available(iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, macOS 15.0, *)
    public typealias Iterator = IndexingIterator<ForEachSubviewCollection<Content>>
    @available(iOS 18.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, macOS 15.0, *)
    public typealias SubSequence = Slice<ForEachSubviewCollection<Content>>
}

@available(*, unavailable)
extension ForEachSubviewCollection : Sendable {}
