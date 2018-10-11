import org.junit.jupiter.api.Test;

import java.io.IOException;
import java.net.URISyntaxException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class SystemTest {

    public static final String INPUT_FILE_NAME = "acceptance.input.txt";
    public static final String EXPECTED_FILE_NAME = "acceptance.expected.txt";

    @Test
    public void testGivenTheAcceptanceTestInputItGeneratesTheExpectedOutput() throws Exception {
        Path inputPath = pathTo(INPUT_FILE_NAME);

        Path outputPath = whenIRunTheCombatEngine(inputPath);

        assertEquals(contentsOf(expectedPath()), contentsOf(outputPath));
    }

    private Path whenIRunTheCombatEngine(Path inputPath) throws IOException {
        Path outputPath = createTemporaryRpgResultFile();
        CombatEngine.main(inputPath.toAbsolutePath().toString(), outputPath.toAbsolutePath().toString());
        return outputPath;
    }

    private Path createTemporaryRpgResultFile() throws IOException {
        return Files.createTempFile("result", "rpg");
    }

    private String contentsOf(Path inputPath) throws IOException {
        return Files.readString(inputPath);
    }

    private Path expectedPath() throws URISyntaxException {
        return pathTo(EXPECTED_FILE_NAME);
    }

    private Path pathTo(String s) throws URISyntaxException {
        return Paths.get(getClass().getClassLoader().getResource(s).toURI());
    }

}
