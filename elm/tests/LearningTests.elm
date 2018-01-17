module LearningTests exposing (..)

import Expect exposing (Expectation)
import Test exposing (..)
import Tuple exposing (mapFirst, mapSecond)


suite : Test
suite =
    let
        addOne =
            (\x -> x + 1)

        inputTuple =
            ( 0, 0 )
    in
        describe "Tuple"
            [ test "can map first value" <|
                \_ -> Expect.equal ( 1, 0 ) (mapFirst addOne inputTuple)
            , test "can map second value" <|
                \_ -> Expect.equal ( 0, 1 ) (mapSecond addOne inputTuple)
            ]
