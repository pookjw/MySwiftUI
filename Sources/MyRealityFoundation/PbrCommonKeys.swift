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
    
    enum Textures : String, Hashable {
        case textureBrdf
        case textureClothBrdf
        case textureSpecMaxEss
        case texturePrefilteredDiffuse
        case texturePrefilteredSpecular
        case textureAreaLightMaps
        case textureBaseColor
        case textureAmbientOcclusion
        case textureEmissive
        case textureMetallic
        case textureRoughness
        case textureSpecular
        case textureNormal
        case textureOpacity
        case textureAnisotropyLevel
        case textureAnisotropyAngle
        case textureClearcoatRoughness
        case textureRMAS
        case textureClearcoat
        case textureSheenColor
        case textureBlueNoise
        case envProbeCubeArray
        case envProbeCube
        case envProbeTextureArray
        case texturePasstroughColor
        case ssoGBufferPosition
        case ssoGBufferNormal
        case ssoNoiseTexture
        case texturePlanarReflection
        case textureClearcoatNormal
    }
}
