struct ImmersiveSpaceActivationBehavior : Equatable {
    private var storage: ImmersiveSpaceActivationBehavior.Storage
    
    static var automatic: ImmersiveSpaceActivationBehavior {
        return ImmersiveSpaceActivationBehavior(storage: .automatic)
    }
    
    static var replacing: ImmersiveSpaceActivationBehavior {
        return ImmersiveSpaceActivationBehavior(storage: .replacing)
    }
}

extension ImmersiveSpaceActivationBehavior {
    enum Storage : Hashable {
        case automatic
        case replacing
    }
}
