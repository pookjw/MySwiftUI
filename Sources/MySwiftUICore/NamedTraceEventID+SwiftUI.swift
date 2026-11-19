internal import AttributeGraph

extension NamedTraceEventID {
    @safe static nonisolated(unsafe) let update = unsafe NamedTraceEventID.register("update", "layout")
    @safe static nonisolated(unsafe) let sizeThatFits = unsafe NamedTraceEventID.register("size_that_fits", "layout")
    @safe static nonisolated(unsafe) let lengthThatFits = unsafe NamedTraceEventID.register("length_that_fits", "layout")
    @safe static nonisolated(unsafe) let childGeometries = unsafe NamedTraceEventID.register("child_geometries", "layout")
    @safe static nonisolated(unsafe) let contentDescription = unsafe NamedTraceEventID.register("content_description", "layout")
    @safe static nonisolated(unsafe) let explicitAlignment = unsafe NamedTraceEventID.register("explicit_alignment", "layout")
    @safe static nonisolated(unsafe) let alignmentType = unsafe NamedTraceEventID.register("alignment_type", "layout")
}
