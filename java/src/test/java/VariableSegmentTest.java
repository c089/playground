import org.junit.jupiter.api.Test;

import java.util.HashMap;
import java.util.Map;

import static org.junit.jupiter.api.Assertions.*;

class VariableSegmentTest {
    @Test
    public void variableEvaluatesToItsValue() throws Exception {
        Map<String, String> variables = new HashMap<String, String>();
        String name = "myvar";
        String value = "myvalue";
        variables.put(name, value);
        assertEquals(value, new Variable(name).evaluate(variables));
    }

    @Test
    public void missingVariableRaisesException() throws Exception {
        String name = "myvar";
        try {
            new Variable(name).evaluate(new HashMap<String, String>());
            fail("Missing variable value should raise an exception");
        } catch (MissingValueException expected) {
        }
    }

}