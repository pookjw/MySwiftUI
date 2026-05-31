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
        assertUnimplemented()
    }

    public var footer: SubviewsCollection {
        assertUnimplemented()
    }

    public var content: SubviewsCollection {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension SectionConfiguration : Sendable {}

@available(*, unavailable)
extension SectionConfiguration.ID : Sendable {}
