struct PairwisePreferenceCombinerVisitor {
    let outputs: [PreferencesOutputs] // 정확하지 않음
    var result: PreferencesOutputs
    
    // TODO
}

struct MultiPreferenceCombinerVisitor: PreferenceKeyVisitor {
    let outputs: [PreferencesOutputs]
    var result: PreferencesOutputs
    
    init(outputs: [PreferencesOutputs], result: PreferencesOutputs) {
        self.outputs = outputs
        self.result = result
    }
    
    mutating func visit<Key>(key: Key.Type) where Key : PreferenceKey {
        fatalError("TODO")
    }
}
