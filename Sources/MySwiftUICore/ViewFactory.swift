protocol AnyViewFactory {
    var viewType: Any.Type {
        get
    }
    
    func encoding() -> (id: String, data: any (Decodable & Encodable))?
}

extension AnyViewFactory {
    func encoding() -> (id: String, data: any (Decodable & Encodable))? {
        fatalError("TODO")
    }
}

protocol PlatformViewFactory: AnyViewFactory {
    var features: DisplayList.Features {
        get
    }
}

extension PlatformViewFactory {
    var features: DisplayList.Features {
        fatalError("TODO")
    }
}

protocol PlatformLayerFactory: AnyViewFactory {
    
}

protocol _DisplayList_ViewFactory: AnyViewFactory {
    
}
