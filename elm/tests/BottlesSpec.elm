module BottlesSpec exposing (..)

import Expect
import Test exposing (Test, describe, test)


verse _ =
    ""


suite : Test
suite =
    describe "Bottles"
        [ test "creates the first verse" <|
            \_ ->
                Expect.equal
                    ("99 bottles of beer on the wall, "
                        ++ "99 bottles of beer.\n"
                        ++ "Take one down and pass it around, "
                        ++ "98 bottles of beer on the wall.\n"
                    )
                    (verse 99)
        ]
