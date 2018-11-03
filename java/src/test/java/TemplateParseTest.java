import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class TemplateParseTest {
    @Test
    public void emptyTemplateRendersAsEmptyString() throws Exception {
        List<String> segments = parse("");
        assertSegments(segments, "");
    }


    @Test
    public void templateWithOnlyPlainText() throws Exception {
        List<String> segments = parse("plain text only");
        assertSegments(segments, "plain text only");
    }

    @Test
    public void parsingMultipleVariables() throws Exception {
        List<String> segments = parse("${a}:${b}:${c}");
        assertSegments(segments, "${a}", ":", "${b}", ":", "${c}");
    }

    @Test
    @Disabled("book goes back to refactoring")
    public void parsingTemplateIntoSegmentObjects() throws Exception {
        TemplateParse p = new TemplateParse();
        List<Segment> segments = p.parseSegments("a ${b} c ${d}");
        assertSegments(segments,
                new PlainText("a "), new Variable("b"),
                new PlainText(" c "), new Variable("d"));
    }

    private void assertSegments(List<? extends Object> segments, Object... expected) {
        assertEquals(expected.length, segments.size(), "Number of segments doesn't match.");
        assertEquals(List.of(expected), segments);
    }

    private List<String> parse(String s) {
        return new TemplateParse().parse(s);
    }

}