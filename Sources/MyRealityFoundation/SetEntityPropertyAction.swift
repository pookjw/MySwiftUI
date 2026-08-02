struct SetEntityPropertyAction<Value> : EntityAction, Codable {
    var targetEntity: ActionEntityResolution
    var key: String
    var value: Value?

    init(targetEntity: ActionEntityResolution, key: String, value: Value?) {
        self.targetEntity = targetEntity
        self.key = key
        self.value = value
    }

    var animatedValueType: (any AnimatableData.Type)? {
        assertUnimplemented()
    }

    func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }

    init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }

    fileprivate enum CodingKeys : CodingKey {
        // TODO
    }
}
