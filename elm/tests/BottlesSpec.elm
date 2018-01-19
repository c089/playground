module BottlesSpec exposing (..)

import Expect
import Test exposing (Test, describe, test)


verse verse_number =
    let
        bottles =
            toString verse_number
    in
    case verse_number of
        99 ->
            bottles
                ++ " bottles of beer on the wall, "
                ++ "99 bottles of beer.\n"
                ++ "Take one down and pass it around, "
                ++ "98 bottles of beer on the wall.\n"

        3 ->
            bottles
                ++ " bottles of beer on the wall, "
                ++ "3 bottles of beer.\n"
                ++ "Take one down and pass it around, "
                ++ "2 bottles of beer on the wall.\n"

        _ ->
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
        , test "another verse" <|
            \_ ->
                Expect.equal
                    ("3 bottles of beer on the wall, "
                        ++ "3 bottles of beer.\n"
                        ++ "Take one down and pass it around, "
                        ++ "2 bottles of beer on the wall.\n"
                    )
                    (verse 3)
        ]
