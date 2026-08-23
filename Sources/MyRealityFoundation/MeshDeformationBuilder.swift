// 859163D2032FC330C59344BA402C17AC

@safe final class MeshDeformationBuilder {
    private var asset: OpaquePointer
    private var definition: [_Proto_MeshDeformation_v1.Stack]
    
    func makeDefinition() throws -> [_Proto_MeshDeformation_v1.Stack] {
        return try unsafe self.build(self.asset)
    }
    
    init(_ asset: OpaquePointer) throws {
        unsafe self.asset = asset
        self.definition = []
    }
    
    fileprivate func addModelInstanceTargetPart(_: Int, _: _Proto_MeshScope_v1) {
        assertUnimplemented()
    }
    
    fileprivate func build(_: OpaquePointer) throws -> [_Proto_MeshDeformation_v1.Stack] {
        assertUnimplemented()
    }
}
