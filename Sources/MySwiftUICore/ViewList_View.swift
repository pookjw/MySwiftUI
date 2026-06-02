// 9B09D1820E97ECBB666F7560EA2A2D2C
internal import AttributeGraph

package struct _ViewList_View : View {
    @safe fileprivate private(set) nonisolated(unsafe) var elements: _ViewList_SubgraphElements // 0x0
    @safe private nonisolated(unsafe) var releaseElements: _ViewList_SubgraphRelease? // 0x30
    @safe nonisolated(unsafe) var id: _ViewList_ID // 0x38
    @safe fileprivate private(set) nonisolated(unsafe) var index: Int // 0x48
    @safe private nonisolated(unsafe) var count: Int // 0x50
    @safe fileprivate private(set) nonisolated(unsafe) var contentSubgraph: Subgraph? // 0x58
    
    var viewID: AnyHashable {
        /*
         self -> x20
         return pointer -> x19 -> x8
         */
        // w23
        var implicitID = self.id.implicitID
        // true -> <+124> / false -> <+284>
        let flag: Bool
        // x21
        var id: AnyHashable2!
        
        if let firstID = self.id.explicitIDs.first {
            id = firstID.id
            
            if firstID.isUnary {
                // <+80>
                if self.count == 1 {
                    // <+124>
                    flag = true
                } else {
                    // <+92>
                    implicitID = -1
                    // <+284>
                    flag = false
                }
            } else {
                // <+108>
                if (self.count != 1) || !(implicitID < 0) {
                    // <+284>
                    flag = false
                } else {
                    // <+124>
                    flag = true
                }
            }
        } else {
            // <+100>
            // <+108>
            if (self.count != 1) || !(implicitID < 0) {
                // <+284>
                flag = false
            } else {
                // <+124>
                flag = true
            }
        }
        
        if flag {
            // <+124>
            return id!.anyHashable
        } else {
            // <+284>
            return AnyHashable(
                _ViewList_ID.Canonical(
                    _index: Int32(self.index),
                    implicitID: implicitID,
                    explicitID: id
                )
            )
        }
    }
    
    @inline(always) // 원래 없음
    nonisolated init(elements: _ViewList_SubgraphElements, releaseElements: _ViewList_SubgraphRelease?, id: _ViewList_ID, index: Int, count: Int, contentSubgraph: Subgraph?) {
        self.elements = elements
        self.releaseElements = releaseElements
        self.id = id
        self.index = index
        self.count = count
        self.contentSubgraph = contentSubgraph
    }
    
    nonisolated init(elements: _ViewList_SubgraphElements, id: _ViewList_ID, index: Int, count: Int, contentSubgraph: Subgraph) {
        assertUnimplemented()
    }
    
    var elementID: _ViewList_ID {
        assertUnimplemented()
    }
    
    var reuseIdentifier: Int {
        assertUnimplemented()
    }
    
    var subviewID: _ViewList_ID {
        assertUnimplemented()
    }
    
    package nonisolated static func _makeView(view: _GraphValue<_ViewList_View>, inputs: _ViewInputs) -> _ViewOutputs {
        let prefOutputs = inputs.preferences.makeIndirectOutputs()
        
        let layoutComputer: OptionalAttribute<LayoutComputer>
        if inputs.base.options.contains(.viewRequestsLayoutComputer) {
            // <+188>
            layoutComputer = OptionalAttribute(
                Attribute(
                    identifier: ViewGraph.current.$defaultLayoutComputer.identifier.createIndirectAttribute2(16)
                )
            )
        } else {
            layoutComputer = OptionalAttribute()
        }
        
        let outputs = _ViewOutputs(preferences: prefOutputs, layoutComputer: layoutComputer)
        
        // <+260>
        let info = PlaceholderInfo(
            placeholder: view.value,
            inputs: inputs,
            outputs: outputs,
            parentSubgraph: .current!,
            lastSubgraph: nil,
            lastRelease: nil,
            secondaryRelease: nil,
            lastElements: nil,
            lastMap: nil,
            contentObserver: nil,
            lastPhase: nil
        )
        
        let infoAttribute = Attribute(info)
        prefOutputs.setIndirectDependency(infoAttribute.identifier)
        
        if let attribute = layoutComputer.attribute {
            attribute.identifier.indirectDependency = infoAttribute.identifier
        }
        
        return outputs
    }
    
    package nonisolated static func _makeViewList(view: _GraphValue<_ViewList_View>, inputs: _ViewListInputs) -> _ViewListOutputs {
        assertUnimplemented()
    }
}

extension _ViewList_View : PrimitiveView, UnaryView {}

fileprivate struct PlaceholderInfo : StatefulRule, ObservedAttribute {
    @Attribute private(set) var placeholder: _ViewList_View // 0x0
    let inputs: _ViewInputs // 0x8
    let outputs: _ViewOutputs // 0x60
    let parentSubgraph: Subgraph // 0x70
    private(set) var lastSubgraph: Subgraph? // 0x78
    private(set) var lastRelease: _ViewList_SubgraphRelease? // 0x80
    private(set) var secondaryRelease: _ViewList_SubgraphRelease? // 0x88
    private(set) var lastElements: _ViewList_Elements? // 0x90
    private(set) var lastMap: IndirectAttributeMap? // 0xb8
    private(set) var contentObserver: (Subgraph, Int)? // 0xc0, 0xc8
    private(set) var lastPhase: Attribute<_GraphInputs.Phase>? // 0xd0
    
    mutating func updateValue() {
        // self -> x20
        let seed: UInt32
        if let ptr = AGGraphGetOutputValue(TypeID(Value.self)) {
            // x21
            let index = ptr
                .advanced(by: MemoryLayout<PlaceholderInfo.Value>.offset(of: \.index)!)
                .assumingMemoryBound(to: Int.self)
                .pointee
            
            if index != self.placeholder.index {
                // <+360>
            } else {
                // <+96>
                // w23, w22, x21
                let id = self.value.id
                let placeholder = self.placeholder
                
                if id != placeholder.id {
                    // <+352>
                    // <+360>
                } else {
                    // <+172>
                    // <+540>
                    return
                }
            }
            
            // <+360>
            // sp + 0x8
            var value = self.value
            // sp + 0x28
            let placeholder = self.placeholder
            let reused = self.reuseItem(info: &value, placeholder: placeholder)
            
            if reused {
                // <+472>
                self.value = value
                return
            } else {
                // <+588>
                seed = self.value.seed &+ 1
            }
        } else {
            seed = 0
        }
        
        // <+224>
        if self.lastSubgraph != nil {
            self.eraseItem()
        }
        
        // sp + 0x28
        let placeholder = self.placeholder
        // sp + 0x8
        let value = self.makeItem(placeholder: placeholder, seed: seed)
        self.value = value
    }
    
    func reuseItem(info: inout PlaceholderInfo.Value, placeholder: _ViewList_View) -> Bool {
        assertUnimplemented()
    }
    
    func eraseItem() {
        assertUnimplemented()
    }
    
    mutating func makeItem(placeholder: _ViewList_View, seed: UInt32) -> PlaceholderInfo.Value {
        /*
         placeholder -> x0 -> x23
         seed -> x1 -> x22
         */
        guard
            let contentSubgraph = placeholder.contentSubgraph, // x24
            contentSubgraph.isValid
        else {
            return PlaceholderInfo.Value(
                id: _ViewList_ID(),
                seed: seed,
                index: .min
            )
        }
        
        // x27
        let parentSubgraph = self.parentSubgraph
        // x21
        let graph = parentSubgraph.graph
        // contentSubgraph -> x25
        // x26
        let newSubgraph = Subgraph(graph: graph)
        parentSubgraph.addChild(newSubgraph)
        
        let flag = self.inputs[ViewListShouldParentToPlaceholderSubgraph.self]
        if parentSubgraph !== contentSubgraph && flag {
            contentSubgraph.addChild2(newSubgraph, options: 1)
        }
        
        // <+164>
        newSubgraph.apply {
            /*
             newSubgraph -> x0 -> x20
             placeholder -> x1 -> x22
             self -> x2 -> x19
             */
            // x21
            let indirectMap: IndirectAttributeMap?
            if GraphReuseOptions.current.contains(.lazyLayouts) {
                indirectMap = IndirectAttributeMap(subgraph: newSubgraph)
            } else {
                indirectMap = nil
            }
            
            // <+164>
            let body: (_ViewInputs, (_ViewInputs) -> _ViewOutputs) -> _ViewOutputs? = { [self] inputs, transform in
                // $s7SwiftUI15PlaceholderInfo33_9B09D1820E97ECBB666F7560EA2A2D2CLLV8makeItem11placeholder4seedAD5ValueVAA010_ViewList_R0V_s6UInt32VtFyyXEfU_AA01_R7OutputsVSgAA01_R6InputsV_AoRctXEfU_TA
                /*
                 inputs -> x0 -> x20
                 transform -> x1/x2 -> x22/x23
                 self -> x3 -> x24
                 */
                // x29 - 0xb0
                let copy_1 = inputs
                let viewPhase = PlaceholderViewPhase(
                    phase1: copy_1.base.phase,
                    phase2: self.inputs.base.phase,
                    resetDelta: 0
                )
                // x24 + 0xd0
                let viewPhaseAttribute: Attribute<_GraphInputs.Phase>? = Attribute(viewPhase)
                // sp + 0x170
                var copy_2 = inputs
                // sp + 0x100
                let _ = copy_1
                copy_2.base[ViewListShouldParentToPlaceholderSubgraph.self] = true
                
                // <+260>
                copy_2.copyCaches()
                copy_2.base.merge(self.inputs.base, ignoringPhase: true)
                copy_2.base.mergedInputs.insert(viewPhaseAttribute!.identifier)
                
                return transform(copy_2)
            }
            
            // x22, x25
            let outputs = withoutActuallyEscaping(body) { escapingClosure in
                if placeholder.elements.subgraphs.isValid {
                    return placeholder.elements.base.makeOneElement(at: placeholder.index, inputs: self.inputs, indirectMap: indirectMap, body: body)
                } else {
                    return nil
                }
            }
            
            // <+568>
            if let outputs {
                self.outputs.preferences.attachIndirectOutputs(to: outputs.preferences)
                if
                    let attribute_1 = self.outputs.layoutComputer,
                    let attribute_2 = outputs.layoutComputer,
                    attribute_1 != attribute_2
                {
                    attribute_1.identifier.indirectAttribute = attribute_2.identifier
                }
            }
            
            // <+716>
            self.lastMap = indirectMap
        }
        
        self.lastSubgraph = newSubgraph
        
        // <+252>
        // self -> x20 -> x27
        self.lastRelease = placeholder.elements.subgraphs.retain()
        
        // <+280>
        if contentSubgraph.graph === newSubgraph.graph {
            // <+552>
            // <+560>
        } else {
            // <+404>
            let current = AnyAttribute.current!
            let parentSubgraph = self.parentSubgraph
            
            Subgraph.addObserver(contentSubgraph) { 
                // $s7SwiftUI15PlaceholderInfo33_9B09D1820E97ECBB666F7560EA2A2D2CLLV8makeItem11placeholder4seedAD5ValueVAA010_ViewList_R0V_s6UInt32VtFyycfU0_TA
                /*
                 parentSubgraph -> x0
                 current -> w1 -> w19
                 */
                guard parentSubgraph.isValid else {
                    return
                }
                
                let pointer = current.info.body.assumingMemoryBound(to: PlaceholderInfo.self)
                pointer.pointee.contentObserver = nil
                pointer.pointee.outputs.detachIndirectOutputs()
                
                if let lastSubgraph = pointer.pointee.lastSubgraph {
                    lastSubgraph.willInvalidate(isInserted: true)
                    lastSubgraph.invalidate()
                    pointer.pointee.lastSubgraph = nil
                }
                
                // <+112>
                if let contentObserver = pointer.pointee.contentObserver {
                    contentObserver.0.removeObserver(contentObserver.1)
                    pointer.pointee.contentObserver = nil
                }
                
                // <+140>
                pointer.pointee.lastRelease = nil
                pointer.pointee.secondaryRelease = nil
                pointer.pointee.lastElements = nil
                pointer.pointee.lastMap = nil
                pointer.pointee.lastPhase = nil
            }
            
            // <+560>
        }
        
        // <+560>
        return PlaceholderInfo.Value(
            id: placeholder.id,
            seed: seed,
            index: placeholder.index
        )
    }
    
    mutating func destroy() {
        assertUnimplemented()
    }
}

extension PlaceholderInfo {
    struct Value {
        fileprivate private(set) var id: _ViewList_ID
        fileprivate private(set) var seed: UInt32
        fileprivate private(set) var index: Int
    }
}

struct ViewListShouldParentToPlaceholderSubgraph : ViewInputBoolFlag {
    init() {}
    
    static var defaultValue: Bool {
        return true
    }
}

fileprivate struct PlaceholderViewPhase : Rule, AsyncAttribute {
    @Attribute private(set) var phase1: _GraphInputs.Phase
    @Attribute private(set) var phase2: _GraphInputs.Phase
    private(set) var resetDelta: UInt32
    
    var value: _GraphInputs.Phase {
        assertUnimplemented()
    }
}

extension _VariadicView_Children : View, MultiView, PrimitiveView {
    nonisolated public static func _makeViewList(view: _GraphValue<_VariadicView.Children>, inputs: _ViewListInputs) -> _ViewListOutputs {
        let child = _VariadicView_Children.Child(children: view.value)
        let value = _GraphValue(child)
        return ForEach<_VariadicView_Children, AnyHashable, _VariadicView_Children.Element>._makeViewList(view: value, inputs: inputs)
    }
    
    nonisolated public static func _viewListCount(inputs: _ViewListCountInputs) -> Int? {
        assertUnimplemented()
    }
    
    public typealias Body = Never
}

extension _VariadicView_Children {
    fileprivate struct Child : Rule, AsyncAttribute {
        @Attribute private(set) var children: _VariadicView_Children
        
        var value: ForEach<_VariadicView_Children, AnyHashable, _VariadicView_Children.Element> {
            // return pointer -> x8 -> x19
            
            var content = ForEach(
                children,
                idGenerator: .keyPath(\.id),
                content: { element -> _VariadicView_Children.Element in
                    // $s7SwiftUI22_VariadicView_ChildrenV5Child33_9B09D1820E97ECBB666F7560EA2A2D2CLLV5valueAA7ForEachVyACs11AnyHashableVAC7ElementVGvgA2McfU_
                    return element
                }
            )
            
            if isLinkedOnOrAfter(.v6) {
                content.obsoleteContentID = 0
            } else {
                content.obsoleteContentID = AGMakeUniqueID()
            }
            
            return content
        }
    }
}
