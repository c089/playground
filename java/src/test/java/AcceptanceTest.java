/*
 * This Java source file was generated by the Gradle 'init' task.
 */

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class AcceptanceTest {
    @Test
    public void testOneVariable() {
        Template template = new Template("Hello, ${name}");
        template.set("name", "Reader");
        assertEquals("Hello, Reader", template.evaluate());
    }

    @Test
    void testDifferentValue() {
        Template template = new Template("Hello, ${name}");
        template.set("name", "Krys");
        assertEquals("Hello, Krys", template.evaluate());
    }

    @Test
    void testDifferentTemplate() {
        Template template = new Template("¡Hola, ${name}!");
        template.set("name", "Krys");
        assertEquals("¡Hola, Krys!", template.evaluate());
    }

    @Test
    void testMultipleVariables() {
        Template template = new Template("${one}, ${two}, ${three}");
        template.set("one", "1");
        template.set("two", "2");
        template.set("three", "3");
        assertEquals("1, 2, 3", template.evaluate());
    }
}
