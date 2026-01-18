protocol AnyViewFactory {
    var viewType: Any.Type {
        get
    }
    
    func encoding() -> (id: String, data: any (Decodable & Encodable))?
}

protocol PlatformViewFactory: AnyViewFactory {
    var features: DisplayList.Features {
        get
    }
}

protocol PlatformLayerFactory: AnyViewFactory {
    
}

protocol _DisplayList_ViewFactory: AnyViewFactory {
    
}
