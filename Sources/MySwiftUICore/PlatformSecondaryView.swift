// E693D410183A3D86D2FC1A666C8142E5
private import AttributeGraph
private import CoreGraphics

func makePlatformSecondaryView(
    primaryInputs: _ViewInputs,
    primaryOutputs: _ViewOutputs,
    secondaryInputs: _ViewInputs,
    flipOrder: Bool,
    body: (_Graph, _ViewInputs) -> _ViewOutputs
) -> _ViewOutputs {
    // <+880>
    var x190x98: Attribute<ViewDepthGeometry>? = nil
    
    let outputs = _ViewOutputs.makeDepthTransform(
        inputs: secondaryInputs,
        geometry: {
            // $s7SwiftUI25makePlatformSecondaryView13primaryInputs0G7Outputs09secondaryH09flipOrder4bodyAA01_fI0VAA01_fH0V_AiKSbAiA6_GraphV_AKtctF09AttributeN00O0VyAA0F13DepthGeometryVGyXEfU_TA.19
            /*
             primaryInputs -> x0 -> x21
             primaryOutputs -> x1/x2
             flipOrder -> w3 -> w20
             x190x98 -> x4 -> x19
             */
            let query = SecondaryLayerDepthGeometryQuery(
                primaryPosition: primaryInputs.position,
                primarySize: primaryInputs.size,
                primaryDepth: primaryInputs.transform.depth,
                primaryLayoutComputer: OptionalAttribute(primaryOutputs.layoutComputer),
                secondaryLayoutComputer: OptionalAttribute(),
                flipOrder: flipOrder
            )
            
            let attribute = Attribute(query)
            x190x98 = attribute
            return attribute
        },
        body: { inputs in
            // $s7SwiftUI27ViewModifierContentProvider33_2BA0A33A15B7F322F46AFB9D0D1A262DLLPAAE012providerMakeC4List4view6inputsAA01_cS7OutputsVAA11_GraphValueVyxG_AA01_cS6InputsVtFZAA01_cV0VAA01_cY0VcfU_TA.110
            return body(_Graph(), inputs)
        }
    )
    
    if let x190x98 {
        // <+1196>
        x190x98.mutateBody(as: SecondaryLayerDepthGeometryQuery.self, invalidating: true) { transform in
            transform.$secondaryLayoutComputer = outputs.layoutComputer
        }
        
        // <+1316>
    } else {
        // <+1316>
    }
    
    return outputs
}

fileprivate struct SecondaryLayerDepthGeometryQuery : AsyncAttribute, Rule {
    @Attribute private(set) var primaryPosition: CGPoint
    @Attribute private(set) var primarySize: ViewSize
    @Attribute private(set) var primaryDepth: ViewDepth
    @OptionalAttribute var primaryLayoutComputer: LayoutComputer?
    @OptionalAttribute var secondaryLayoutComputer: LayoutComputer?
    private(set) var flipOrder: Bool
    
    var value: ViewDepthGeometry {
        assertUnimplemented()
    }
}
