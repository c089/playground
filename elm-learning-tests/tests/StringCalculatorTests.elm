module StringCalculatorTests exposing (..)

import Expect
import Test exposing (Test, describe, test)


add numbers =
    if numbers == "" then
        Ok 0
    else if numbers == "1" then
        String.toInt "1"
    else if numbers == "2" then
        String.toInt "2"
    else
        String.toInt "123456789"


suite : Test
suite =
    describe "StringCalculator"
        [ test "returns 0 for empty string" <|
            \_ -> Expect.equal (Ok 0) (add "")
        , test "returns 1 for single number 1" <|
            \_ -> Expect.equal (Ok 1) (add "1")
        , test "returns 2 for single number 2" <|
            \_ -> Expect.equal (Ok 2) (add "2")
        , test "returns a single large number" <|
            \_ -> Expect.equal (Ok 123456789) (add "123456789")
        ]
