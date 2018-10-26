import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertTrue;


public class TemplatePerformanceTest {
    @Test
    public void templateWith100WordsAnd20Variables() throws Exception {
        long expected = 200;
        long time = System.currentTimeMillis();
        Template template = new Template("Hello World, this is a longer template including some numbers: ${one}, ${two}, ${three} and then also ${twelve} and ${fifteen}.");
        template.set("one", "1");
        template.set("two", "2");
        template.set("three", "3");
        template.set("four", "4");
        template.set("five", "5");
        template.set("six", "6");
        template.set("seven", "7");
        template.set("eight", "8");
        template.set("nine", "9");
        template.set("ten", "10");
        template.set("eleven", "11");
        template.set("twelve", "12");
        template.set("thirteen", "13");
        template.set("fourteen", "14");
        template.set("fifteen", "15");
        template.evaluate();
        template.evaluate();
        template.evaluate();
        template.evaluate();
        template.evaluate();
        template.evaluate();
        time = System.currentTimeMillis() - time;
        assertTrue(time <= expected, "Rendering the template took " + time
                + "ms while the target was " + expected + "ms");
    }
}
