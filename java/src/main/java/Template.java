public class Template {
    private String value;

    public Template(String s) {
        
    }

    public String evaluate() {
        return "Hello, " + this.value;
    }

    public void set(String name, String value) {
        this.value = value;
    }
}
