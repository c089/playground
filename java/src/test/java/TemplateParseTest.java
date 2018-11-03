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

    private void assertSegments(List<String> segments, String s) {
        assertEquals(1, segments.size(), "Number of segments");
        assertEquals(s, segments.get(0));
    }

    private List<String> parse(String s) {
        return new TemplateParse().parse(s);
    }

}