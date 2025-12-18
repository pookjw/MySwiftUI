
protocol AnyViewFactory {
    
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
