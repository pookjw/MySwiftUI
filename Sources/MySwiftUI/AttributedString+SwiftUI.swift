public import Foundation
public import CoreTransferable
public import MySwiftUICore

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
extension AttributedTextFormatting {
    public struct Transferable : CoreTransferable.Transferable, Sendable {
        public init(text: AttributedString, in environment: EnvironmentValues) { assertUnimplemented() }
        public static var transferRepresentation: some TransferRepresentation {
            ProxyRepresentation(exporting: { (_: Self) -> String in assertUnimplemented() })
        }
    }
}

extension AttributedString {
    @available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
    public init(transferable: AttributedTextFormatting.Transferable, in environment: EnvironmentValues) throws {
        assertUnimplemented()
    }
}

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
public struct AttributedTextSelection {}

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
extension AttributedString {
    public mutating func transform<E>(updating selection: inout AttributedTextSelection, body: (inout AttributedString) throws(E) -> Void) throws(E) where E : Error {
        assertUnimplemented()
    }
}

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
extension AttributedString {
    public subscript(selection: AttributedTextSelection) -> DiscontiguousAttributedSubstring {
        assertUnimplemented()
    }
}

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
extension AttributedString {
    public mutating func transformAttributes<E>(in selection: inout AttributedTextSelection, body: (inout AttributeContainer) throws(E) -> Void) throws(E) where E : Error {
        assertUnimplemented()
    }
}

@available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, visionOS 26.0, *)
extension AttributedString {
    public mutating func replaceSelection(_ selection: inout AttributedTextSelection, withCharacters newContent: some Collection<Character>) {
        assertUnimplemented()
    }

    public mutating func replaceSelection(_ selection: inout AttributedTextSelection, with newContent: some AttributedStringProtocol) {
        assertUnimplemented()
    }
}
