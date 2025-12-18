
protocol PrimitiveView: View {
    
}

extension PrimitiveView {
    public var body: Never {
        bodyError()
    }
}
