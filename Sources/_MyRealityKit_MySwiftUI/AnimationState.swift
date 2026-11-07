protocol AnimationState {
    func tick(_ entity: Entity, _ currentTime: Double)
    func isFinished() -> Bool
}
