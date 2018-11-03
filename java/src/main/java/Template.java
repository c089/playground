import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Template {
    private final String template;
    private final Map<String, String> values = new HashMap<>();

    public Template(String s) {
        template = s;
    }

    public String evaluate() {
        TemplateParse p = new TemplateParse();
        List<Segment> segments = p.parseSegments(template);
        return concatenate(segments);
    }

    private String concatenate(List<Segment> segments) {
        StringBuilder result = new StringBuilder();
        for (Segment segment : segments) {
            result.append(segment.evaluate(values));
        }
        return result.toString();
    }

    public void set(String name, String value) {
        this.values.put(name, value);
    }
}
