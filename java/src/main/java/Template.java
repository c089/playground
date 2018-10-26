public class Template {
    private final String template;
    private String value;

    public Template(String s) {
        template = s;
    }

    public String evaluate() {
        return this.template.replace("${name}", this.value);
    }

    public void set(String name, String value) {
        this.value = value;
    }
}
