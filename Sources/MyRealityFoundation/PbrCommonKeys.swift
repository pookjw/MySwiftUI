struct PbrCommonKeys {
    enum Constants : String, Hashable {
        case baseColorTint
        case subsurface
        case metallicScale
        case specularScale
        case roughnessScale
        case emissiveColor
        case emissiveScale
        case detailBaseColorIntensity
        case detailNormalIntensity
        case detailMetallicIntensity
        case detailRoughnessIntensity
        case detailSpecularIntensity
        case lightmapIntensityLV
        case uvTransform
        case uvOffset
        case uvTransform1
        case uvOffset1
        case clearcoatScale
        case clearcoatRoughnessScale
        case opacityThreshold
        case partDebugColor
        case sheenColor
        case ssoSamplingRadius
        case ssoSamplingBias
        case anisotropyLevelScale
        case anisotropyAngleScale
        case filterCount
        case meshScale
        case opacityScale
    }
}
