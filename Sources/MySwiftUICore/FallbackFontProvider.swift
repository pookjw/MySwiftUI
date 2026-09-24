protocol FallbackFontProvider {
    static func makeFont(in environment: EnvironmentValues) -> Font
}

struct DefaultFallbackFontProvider : FallbackFontProvider {
    static func makeFont(in environment: EnvironmentValues) -> Font {
        return Font.body
    }
}
