module StringCalculatorTests exposing (..)

import Expect
import Test exposing (Test, describe, test)


add _ =
    0


suite : Test
suite =
    describe "StringCalculator"
        [ test "returns 0 for empty string" <|
            \_ -> Expect.equal 0 (add "")
        ]
