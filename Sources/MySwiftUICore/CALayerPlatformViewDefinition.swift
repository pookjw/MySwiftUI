#warning("TODO")

final class CALayerPlatformViewDefinition: PlatformViewDefinition {
    override class var system: PlatformViewDefinition.System {
        return PlatformViewDefinition.System(base: .caLayer)
    }
}
