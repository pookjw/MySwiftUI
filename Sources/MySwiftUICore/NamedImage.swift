internal import Foundation

enum NamedImage {
    struct BitmapKey {
        // TODO
    }
    
    enum Key {
        case bitmap(NamedImage.BitmapKey)
        case uuid(UUID)
    }
}
