// EFEB959AF5F46945FA966D8F01E07A61

struct NotificationAction : EntityAction {
    var name: String
    var customArguments: [String : String]
    
    init(name: String, customArguments: [String : String]) {
        self.name = name
        self.customArguments = customArguments
    }
    
    var isReversible: Bool {
        assertUnimplemented()
    }
    
    var isAdditive: Bool {
        assertUnimplemented()
    }
    
    var animatedValueType: (any AnimatableData.Type)? {
        assertUnimplemented()
    }
}

extension NotificationAction : Codable {
    fileprivate enum CodingKeys : CodingKey {
        case name
        case customArguments
    }
}
