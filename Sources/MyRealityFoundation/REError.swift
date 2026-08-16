internal import Foundation

enum REError : Error {
    case invalidIdentifier(__REAssetIdentifier)
    case invalidURL(URL)
    case internalError(String)
}
