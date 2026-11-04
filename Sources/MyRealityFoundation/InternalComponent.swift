protocol InternalComponent : RegisterableComponent {
    associatedtype Registration : InternalComponentRegistryEntry
    
    static var registration: Self.Registration? { get set }
}

protocol InternalComponentRegistryEntry {
}
