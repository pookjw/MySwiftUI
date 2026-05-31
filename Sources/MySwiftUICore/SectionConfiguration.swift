@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public struct SectionConfiguration : Identifiable {
    let item: SectionAccumulator.Item
    
    public struct ID : Hashable {
        fileprivate let base: AnyHashable
    }

    public var id: SectionConfiguration.ID {
        return SectionConfiguration.ID(
            base: AnyHashable(self.item.id)
        )
    }

    public var containerValues: ContainerValues {
        assertUnimplemented()
    }

    public var header: SubviewsCollection {
        if
            !(self.item.headerCount < 1),
            let sectionList = self.item.sectionList
        {
            // <+44>
            return SubviewsCollection(
                list: sectionList.header.list,
                contentSubgraph: self.item.contentSubgraph!,
                transform: self.item.transform
            )
        } else {
            // <+192>
            return SubviewsCollection(
                list: EmptyViewList(),
                contentSubgraph: self.item.contentSubgraph!,
                transform: _ViewList_SublistTransform()
            )
        }
    }

    public var footer: SubviewsCollection {
        if
            !(self.item.footerCount < 1),
            let sectionList = self.item.sectionList
        {
            // <+44>
            return SubviewsCollection(
                list: sectionList.footer.list,
                contentSubgraph: self.item.contentSubgraph!,
                transform: self.item.transform
            )
        } else {
            // <+196>
            return SubviewsCollection(
                list: EmptyViewList(),
                contentSubgraph: self.item.contentSubgraph!,
                transform: _ViewList_SublistTransform()
            )
        }
    }

    public var content: SubviewsCollection {
        if let sectionList = self.item.sectionList {
            // <+36>
            return SubviewsCollection(
                list: sectionList.content.list,
                contentSubgraph: self.item.contentSubgraph!,
                transform: self.item.transform
            )
        } else {
            // <+196>
            return SubviewsCollection(
                list: ViewListSublistSlice(
                    base: self.item.list,
                    bounds: self.item.start..<(self.item.start + self.item.ids.count)
                ),
                contentSubgraph: self.item.contentSubgraph!,
                transform: self.item.transform
            )
        }
    }
}

@available(*, unavailable)
extension SectionConfiguration : Sendable {}

@available(*, unavailable)
extension SectionConfiguration.ID : Sendable {}
