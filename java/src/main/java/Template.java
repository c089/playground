import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Template {
    private final String template;
    private final Map<String, String> values = new HashMap<>();

    public Template(String s) {
        template = s;
    }

    public String evaluate() throws MissingValueException {
        TemplateParse parser = new TemplateParse();
        List<String> segments = parser.parse(template);
        return concatenate(segments);
    }

    private String concatenate(List<String> segments) throws MissingValueException {
        StringBuilder result = new StringBuilder();
        for (String segment : segments) {
            append(segment, result);
        }
        return result.toString();
    }

    private void append(String segment, StringBuilder result) throws MissingValueException {
        if (isVariable(segment)) {
            String var = segment.substring(2, segment.length() - 1);
            if (!values.containsKey(var)) {
                throw new MissingValueException("No value for " + segment);
            }
            result.append(values.get(var));
        } else {
            result.append(segment);
        }
    }

    private boolean isVariable(String segment) {
        return segment.startsWith("${") && segment.endsWith("}");
    }

    public void set(String name, String value) {
        this.values.put(name, value);
    }
}
