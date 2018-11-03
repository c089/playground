import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class TemplateParseTest {
    @Test
    public void emptyTemplateRendersAsEmptyString() throws Exception {
        TemplateParse parse = new TemplateParse();
        List<String> segments = parse.parse("");
        assertEquals(1, segments.size(), "Number of segments");
        assertEquals("", segments.get(0));
    }
}