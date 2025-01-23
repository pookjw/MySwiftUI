package struct DisplayList {
    package init() {}
}

extension DisplayList {
    package struct Item {
        package enum Value {
            case content(DisplayList.Content)
            case effect(DisplayList.Effect, DisplayList)
//            case states([(StrongHash, DisplayList)])
            case empty
        }
    }
}

extension DisplayList {
    package struct Content {}
}

extension DisplayList {
    package struct Effect {}
}


