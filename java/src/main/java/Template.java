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

    private void append(String segment, StringBuilder result) throws MissingValueException {
        if (isVariable(segment)) {
            evaluateVariable(segment, result);
        } else {
            result.append(segment);
        }
    }

    private void evaluateVariable(String segment, StringBuilder result) throws MissingValueException {
        String var = segment.substring(2, segment.length() - 1);
        if (!values.containsKey(var)) {
            throw new MissingValueException("No value for " + segment);
        }
        result.append(values.get(var));
    }

    public static boolean isVariable(String segment) {
        return segment.startsWith("${") && segment.endsWith("}");
    }

    public void set(String name, String value) {
        this.values.put(name, value);
    }
}
