import Render

extension RangeReplaceableCollection<UInt8> {

    @inlinable
    public init<View: SVG.View>(
        _ view: View,
        configuration: SVG.Context.Configuration? = nil
    ) {
        var buffer = Self()
        var context = SVG.Context(configuration ?? .default)
        View._render(view, into: &buffer, context: &context)
        self = buffer
    }
}

extension RangeReplaceableCollection<UInt8> {

    @inlinable
    public init<View: SVG.View>(
        _ view: View,
        configuration: SVG.Context.Configuration? = nil
    ) async {
        await Task.yield()
        var buffer = Self()
        var context = SVG.Context(configuration ?? .default)
        View._render(view, into: &buffer, context: &context)
        self = buffer
    }
}
