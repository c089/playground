/*
 * This Java source file was generated by the Gradle 'init' task.
 */

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

public class AcceptanceTest {
    @Test
    public void testOneVariable() throws MissingValueException {
        Template template = new Template("Hello, ${name}");
        template.set("name", "Reader");
        assertEquals("Hello, Reader", template.evaluate());
    }

    @Test
    void testDifferentValue() throws MissingValueException {
        Template template = new Template("Hello, ${name}");
        template.set("name", "Krys");
        assertEquals("Hello, Krys", template.evaluate());
    }

    @Test
    void testDifferentTemplate() throws MissingValueException {
        Template template = new Template("¡Hola, ${name}!");
        template.set("name", "Krys");
        assertEquals("¡Hola, Krys!", template.evaluate());
    }

    @Test
    void testMultipleVariables() throws MissingValueException {
        Template template = new Template("${one}, ${two}, ${three}");
        template.set("one", "1");
        template.set("two", "2");
        template.set("three", "3");
        assertEquals("1, 2, 3", template.evaluate());
    }

    @Test
    public void unknownVariablesAreIgnored() throws MissingValueException {
        Template template = new Template("Hello, ${name}");
        template.set("name", "Reader");
        template.set("doesnotexist", "Hi");
        assertEquals("Hello, Reader", template.evaluate());
    }

    @Test
    void shouldThrowMissingValueExceptionForMissingValue() {
        assertThrows(MissingValueException.class, () -> {
            new Template("${name}").evaluate();
        });
    }
}
