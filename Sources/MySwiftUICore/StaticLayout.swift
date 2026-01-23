// A7DFBD5AC47BCDAAE5525781FBD33CF6 | CA243A05CF611D3DFDB2A050BB76974B
private import AttributeGraph

extension Layout {
    static func makeStaticView(root: _GraphValue<Self>, inputs: _ViewInputs, properties: LayoutProperties, list: any _ViewList_Elements) -> _ViewOutputs {
        // properties은 안 쓰는듯
        /*
         root -> w19
         inputs -> x21
         list -> x27
         */
        // sp + 0x48 (중간에 생략된 값이 있어 offset이 밀려 있음)
        let copy_1 = inputs
        // inputs.phase (pointer) -> x24
        // sp + 0x88
        let phase = inputs.base.phase
        // sp + 0x8c
        let transaction = inputs.base.transaction
        // w25
        let isDefaultEmptyLayout = properties.isDefaultEmptyLayout
        // w22
        let isIdentityUnaryLayout = properties.isIdentityUnaryLayout
        let count = list.count
        
        if count == 1 && isIdentityUnaryLayout {
            // <+288>
            fatalError("TODO")
        } else if (count == 1 && !isIdentityUnaryLayout) || (count != 0 || !isDefaultEmptyLayout) {
            let sp0x0c = copy_1.base.options.intersection([.viewRequestsLayoutComputer, .viewNeedsGeometry])
            if !sp0x0c.isEmpty {
                // <+616>
                // sp + 0xc0
                let layoutComputerRule = StaticLayoutComputer(layout: root.value, environment: copy_1.environment, childAttributes: [])
                // sp + 0x120
                var layoutComputerAttribute = Attribute(layoutComputerRule)
                
                let layoutDepthStashingEnabled = copy_1[EnableLayoutDepthStashing.self]
                // w19
                let transform = copy_1.transform
                
                if layoutDepthStashingEnabled {
                    // <+888>
                    layoutComputerAttribute = Attribute(DepthStashingLayoutComputer(layoutComputer: layoutComputerAttribute, depth: transform[keyPath: \.depth]))
                }
                
                // <+968>
                // x20
                let childGeometriesAttribute = Attribute(LayoutChildGeometries(parentSize: copy_1.size, parentPosition: copy_1.position, layoutComputer: layoutComputerAttribute))
                
                // sp + 0xc0
                let layoutChildDepthsAttribute = Attribute(
                    LayoutChildDepths<Self>(
                        parentSize: copy_1.size,
                        parentDepth: transform[keyPath: \.depth],
                        childGeometries: childGeometriesAttribute,
                        layoutComputer: layoutComputerAttribute
                    )
                )
                
                // <+1296>
                fatalError("TODO")
                // <+1356>
            } else {
                // <+1328>
                fatalError("TODO")
                // <+1356>
            }
            
            // <+1356>
            list.makeElements(from: &<#T##Int#>, inputs: <#T##_ViewInputs#>, indirectMap: <#T##IndirectAttributeMap?#>, body: <#T##(_ViewInputs, @escaping (_ViewInputs) -> _ViewOutputs) -> (_ViewOutputs?, Bool)#>)
            fatalError("TODO")
        } else {
            return _ViewOutputs()
        }
    }
}

fileprivate struct StaticLayoutComputer<L: Layout>: StatefulRule, AsyncAttribute, CustomStringConvertible {
    @Attribute private(set) var layout: L
    @Attribute private(set) var environment: EnvironmentValues
    private(set) var childAttributes: [LayoutProxyAttributes]
    
    var description: String {
        fatalError("TODO")
    }
    
    typealias Value = LayoutComputer
    
    func updateValue() {
        fatalError("TODO")
    }
}
