@available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
public struct SectionConfiguration: Identifiable {
    public struct ID: Hashable {
        public static func == (a: SectionConfiguration.ID, b: SectionConfiguration.ID) -> Bool {
            assertUnimplemented()
        }

        public func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }

        public var hashValue: Int {
            assertUnimplemented()
        }
    }

    public var id: SectionConfiguration.ID {
        assertUnimplemented()
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
extension SectionConfiguration: Sendable {}

@available(*, unavailable)
extension SectionConfiguration.ID: Sendable {}
