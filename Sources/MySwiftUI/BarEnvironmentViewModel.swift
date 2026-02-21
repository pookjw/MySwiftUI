internal import MySwiftUICore
internal import Combine

class BarEnvironmentViewModel: ObservableObject {
    @Published private(set) var visibility: Visibility // 0x10
    @Published private(set) var colorScheme: ColorScheme? // 0x20
    
    init() {
        _visibility = Published(initialValue: .automatic)
        _colorScheme = Published(initialValue: nil)
    }
    
    // TODO
}
