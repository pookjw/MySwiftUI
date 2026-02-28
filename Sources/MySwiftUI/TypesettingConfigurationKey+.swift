internal import MySwiftUICore
internal import UIKit

extension TypesettingConfigurationKey {
    static func write(to traits: inout UIMutableTraits, value: TypesettingConfiguration) {
        /*
         traits -> x0 -> x29 - 0x58
         value -> x1 -> x20
         */
        // <+264>
        switch value.language.storage {
        case .explicit(let language, _):
            traits.typesettingLanguage = language
        case .automatic, .contentAware:
            traits.typesettingLanguage = nil
        default:
            fatalError()
        }
    }
}
