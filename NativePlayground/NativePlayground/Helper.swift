//
//  Helper.swift
//  NativePlayground
//
//  Created by Jinwoo Kim on 3/11/26.
//

import Foundation
import ObjectiveC.runtime
import ObjectiveC.message
import _SwiftPrivate
import AttributeGraph

// (lldb) expr -l swift -O -- unsafeBitCast(0x0000000107ed6058, to: Any.Type.self)
// (lldb) expr -l objc -O -- [(Class)NSClassFromString(@"Helper") dumpWithAttribute:$w25 resolveValue:YES]
@objc(Helper)
final class Helper: NSObject {
    @objc(dumpWithObject:)
    class func dump(object: AnyObject) {
        _forEachField(of: type(of: object), options: [.classType]) { name, offset, type, kind in
            print(String(format: "%s (%@) (0x%lx)", name, _typeName(type, qualified: true), offset))
            return true
        }
    }
    
    @objc(dumpWithAttribute:resolveValue:)
    class func dump(attribute: AnyAttribute, resolveValue: Bool) {
        print(attribute.valueType)
        print(attribute._bodyType)
        
        if resolveValue {
            func project<T>(key: T.Type) {
                print(Attribute<T>(identifier: attribute).value)
            }
            
            _openExistential(attribute.valueType, do: project)
        }
    }
}
