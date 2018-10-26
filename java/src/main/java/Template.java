import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.function.BiConsumer;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Template {
    private final String template;
    private String value;
    private final Map<String, String> values = new HashMap<>();

    public Template(String s) {
        template = s;
    }

    public String evaluate() throws MissingValueException {
        String result = replaceVariables();
        checkForMissingValues(result);
        return result;
    }

    private String replaceVariables() {
        String result = this.template;
        for (var entry : this.values.entrySet()) {
            result = result.replace("${" + entry.getKey() + "}", entry.getValue());
        }
        return result;
    }

    private void checkForMissingValues(String result) throws MissingValueException {
        Matcher m = Pattern.compile("\\$\\{.+\\}").matcher(result);
        if (m.find()) {
            throw new MissingValueException("No value for " + m.group());
        }
    }

    public void set(String name, String value) {
        this.value = value;
        this.values.put(name, value);
    }
}
