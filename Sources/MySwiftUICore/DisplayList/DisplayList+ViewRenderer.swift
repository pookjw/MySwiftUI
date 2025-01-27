import QuartzCore

extension DisplayList {
    package final class ViewRenderer {
        package init(platform: ViewUpdater.Platform) {
            fatalError("TODO")
        }
    }
}

extension DisplayList {
    package final class ViewUpdater {
        
    }
}

extension DisplayList.ViewUpdater {
    package struct ViewInfo {
        
    }
}

extension DisplayList.ViewUpdater {
    package struct Model {
        
    }
}

extension DisplayList.ViewUpdater {
    package struct AsyncLayer {
        
    }
}

extension DisplayList.ViewUpdater.Model {
    package struct State {
        
    }
}

extension DisplayList.ViewUpdater {
    package struct Platform {
        private let rawValue: UInt
        
        package init(definition: PlatformViewDefinition.Type) {
            let system = definition.system
            rawValue = UInt(system.base.rawValue) | UInt(bitPattern: ObjectIdentifier(definition))
        }
        
        package func viewLayer(_ object: AnyObject) -> CALayer {
            fatalError("TODO")
        }
        
        package func setShadow(_ style: ResolvedShadowStyle?, layer: CALayer) {
            fatalError("TODO")
        }
        
        package func updateItemView(
            _ viewInfo: inout DisplayList.ViewUpdater.ViewInfo,
            index: DisplayList.Index,
            item: DisplayList.Item,
            state: UnsafePointer<DisplayList.ViewUpdater.Model.State>
        ) {
            fatalError("TODO")
        }
        
        package func updateItemViewAsync(
            layer: inout DisplayList.ViewUpdater.AsyncLayer,
            index: DisplayList.Index,
            oldItem: DisplayList.Item,
            oldState: UnsafePointer<DisplayList.ViewUpdater.Model.State>,
            newItem: DisplayList.Item,
            newState: UnsafePointer<DisplayList.ViewUpdater.Model.State>
        ) -> Bool {
            fatalError("TODO")
        }
        
        private func _makeItemView(
            item: DisplayList.Item,
            state: UnsafePointer<DisplayList.ViewUpdater.Model.State>
        ) -> DisplayList.ViewUpdater.ViewInfo {
            fatalError("TODO")
        }
    }
}

extension DisplayList {
    package struct Index: Equatable {
        let identity: _DisplayList_Identity
        let serial: UInt32
        let archiveIdentity: _DisplayList_Identity
        let archiveSerial: UInt32
        var id: ID {
            ID(
                identity: identity,
                serial: serial,
                archiveIdentity: archiveIdentity,
                archiveSerial: archiveSerial
            )
        }
        fileprivate let restored: RestoreOptions
        
        package init() {
            identity = _DisplayList_Identity(decodedValue: 0)
            serial = 0
            archiveIdentity = _DisplayList_Identity(decodedValue: 0)
            archiveSerial = 0
            restored = RestoreOptions(rawValue: 0)
        }
    }
}

extension DisplayList.Index {
    fileprivate struct RestoreOptions: OptionSet, Equatable {
        package let rawValue: UInt8
        
        package init(rawValue: UInt8) {
            self.rawValue = rawValue
        }
    }
}

extension DisplayList.Index {
    package struct ID: Hashable {
        let identity: _DisplayList_Identity
        let serial: UInt32
        let archiveIdentity: _DisplayList_Identity
        let archiveSerial: UInt32
    }
}
