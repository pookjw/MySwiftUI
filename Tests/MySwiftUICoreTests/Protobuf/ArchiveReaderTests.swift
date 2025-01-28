import Testing
import Foundation
@testable @_private(sourceFile: "ArchiveReader.swift") import MySwiftUICore

struct ArchiveReaderTests {
    @Test(arguments: ["archived_view_0", "archived_view_1"]) func test_initBuffer(fileName: String) throws {
        for _ in 0..<100 {
            let url = try #require(Bundle.module.url(forResource: fileName, withExtension: nil))
            let data = try Data(contentsOf: url)
            let nsData = data as NSData
            let reader = try ArchiveReader(
                buffer: UnsafeBufferPointer(
                    start: nsData.bytes.assumingMemoryBound(to: UInt8.self),
                    count: nsData.length / MemoryLayout<UInt8>.size)
            )
            
            // TODO: subscript 검증
            
            #expect(reader.attachments.size == 0xa)
        }
    }
}
