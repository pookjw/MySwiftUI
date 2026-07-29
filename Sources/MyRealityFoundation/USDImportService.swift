internal import Foundation

protocol USDImportService {
    init()
    func canLoad(named: String, in bundle: Bundle) -> Bool
    func canLoad(contentsOf url: URL) -> Bool
    func load(with options: [String : Any]) throws -> MyRealityFoundation::Entity
    func loadAsync(with options: [String : Any]) throws
}
