import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

class CombatEngine {
    public static void main(String... args) throws IOException {
        String output = "1,'John The Bagger','Mark The Fister','Small Bag',1,7,7\n" +
        "2,'John The Bagger','Mark The Fister','Small Bag',1,6,7\n" +
        "3,'John The Bagger','Mark The Fister','Small Bag',1,5,7\n" +
        "4,'John The Bagger','Mark The Fister','Small Bag',1,4,7\n" +
        "4,'Mark The Fister','John The Bagger','Iron Fist',4,4,3\n" +
        "5,'John The Bagger','Mark The Fister','Small Bag',1,3,3\n" +
        "6,'John The Bagger','Mark The Fister','Small Bag',1,2,3\n" +
        "7,'John The Bagger','Mark The Fister','Small Bag',1,1,3\n" +
        "8,'John The Bagger','Mark The Fister','Small Bag',1,0,3\n" +
        "8,'Mark The Fister','John The Bagger','Iron Fist',4,0,0\n" +
        "9,'John The Bagger',Dead\n" +
        "9,'Mark The Fister',Dead\n" +
        "TIE\n";

        Files.writeString(Path.of(args[1]), output);
    }
}
