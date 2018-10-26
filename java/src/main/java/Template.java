import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.function.BiConsumer;

public class Template {
    private final String template;
    private String value;
    private final Map<String, String> values = new HashMap<>();

    public Template(String s) {
        template = s;
    }

    public String evaluate() throws MissingValueException {
        String result = this.template;
        for (var entry : this.values.entrySet()) {
            result = result.replace("${" + entry.getKey() + "}", entry.getValue());
        }
        checkForMissingValues(result);
        return result;
    }

    private void checkForMissingValues(String result) throws MissingValueException {
        if (result.matches(".*\\$\\{.+\\}.*")) {
            throw new MissingValueException();
        }
    }

    public void set(String name, String value) {
        this.value = value;
        this.values.put(name, value);
    }
}
