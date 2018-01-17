module StringCalculatorTests exposing (..)

import Expect
import Test exposing (Test, describe, test)


add numbers =
    if numbers == "" then
        0
    else
        1


suite : Test
suite =
    describe "StringCalculator"
        [ test "returns 0 for empty string" <|
            \_ -> Expect.equal 0 (add "")
        , test "returns 1 for single number 1" <|
            \_ -> Expect.equal 1 (add "1")
        ]
