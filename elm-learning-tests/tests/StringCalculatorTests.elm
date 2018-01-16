module Main exposing (..)

import Expect
import Test exposing (Test, describe, test)


suite : Test
suite =
    describe "StringCalculator"
        [ test "returns 0 for empty string" <|
            \_ -> Expect.equal 0 (add "")
        ]
