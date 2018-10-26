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

    public String evaluate() {
        String result = this.template;
        for (var entry : this.values.entrySet()) {
            String k = entry.getKey();
            String v = entry.getValue();
            result = result.replace("${"+k+"}", v);
        }
        return result;
    }

    public void set(String name, String value) {
        this.value = value;
        this.values.put(name, value);
    }
}
