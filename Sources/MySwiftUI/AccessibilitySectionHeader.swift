// 0D3243EDC3DD4D641848661DCC354D4B
internal import MySwiftUICore

struct AccessibilityCustomSectionHeaderStyling : ViewInputBoolFlag {
}

struct AccessibilitySectionHeaderModifier<T> {
}

extension AccessibilitySectionHeaderModifier {
    fileprivate struct ChildModifier {
        private var traits: AccessibilityTraitSet
    }
}
