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

/*
 expr -l objc -O -- [(Class)NSClassFromString(@"Helper") dumpWithAttribute:$w25 resolveValue:NO]
 expr -l objc -O -- [(Class)NSClassFromString(@"Helper") dumpWithObject:0x00000001070f4e00]
 */

@objc(Helper)
final class Helper : NSObject {
    @objc(dumpWithAttribute:resolveValue:)
    class func dump(attribute : AnyAttribute, resolveValue: Bool) {
        print(attribute.valueType)
        print(attribute._bodyType)
        
        if resolveValue {
            func project<T>(key: T.Type) {
                print(Attribute<T>(identifier: attribute).value)
            }
            
            _openExistential(attribute.valueType, do: project)
        }
    }
    
    @objc(dumpWithObject:)
    class func dump(object: AnyObject) {
        printFields(type(of: object), isClassType: true)
    }
}
