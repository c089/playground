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

    private void assertSegments(List<String> segments, Object... expected) {
        assertEquals(expected.length, segments.size(), "Number of segments doesn't match.");
        assertEquals(List.of(expected), segments);
    }

    private List<String> parse(String s) {
        return new TemplateParse().parse(s);
    }

}