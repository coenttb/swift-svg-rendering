import Dictionary_Ordered
import SVG_Rendering_Test_Support
import Testing

extension SVG.Context {
    @Suite struct Test {
        @Suite struct Unit {

            @Test
            func `default configuration has no indentation`() {
                let context = SVG.Context()
                #expect(context.configuration.indentation.isEmpty)
                #expect(context.configuration.newline.isEmpty)
            }

            @Test
            func `pretty configuration has indentation and newline`() {
                let context = SVG.Context(.pretty)
                #expect(!context.configuration.indentation.isEmpty)
                #expect(!context.configuration.newline.isEmpty)
            }

            @Test
            func `indented increases indentation level`() {
                let context = SVG.Context(.pretty)
                let indented = context.indented()
                #expect(indented.currentIndentation.count > context.currentIndentation.count)
            }

            @Test
            func `outdented decreases indentation level`() {
                let context = SVG.Context(.pretty)
                let indented = context.indented()
                let outdented = indented.outdented()
                #expect(outdented.currentIndentation.count == context.currentIndentation.count)
            }

            @Test
            func `attributes start empty`() {
                let context = SVG.Context()
                #expect(context.attributes.isEmpty)
            }
        }

        @Suite struct EdgeCase {

            @Test
            func `outdented at root level does not underflow`() {
                let context = SVG.Context(.pretty)
                let outdented = context.outdented()
                #expect(outdented.currentIndentation.isEmpty)
            }

            @Test
            func `custom configuration preserves settings`() {
                let config = SVG.Context.Configuration(
                    indentation: "\t",
                    newline: "\r\n"
                )
                let context = SVG.Context(config)
                #expect(context.configuration.indentation == Array("\t".utf8))
                #expect(context.configuration.newline == Array("\r\n".utf8))
            }
        }
    }
}
