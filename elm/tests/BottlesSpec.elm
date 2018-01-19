module BottlesSpec exposing (..)

import Expect
import Test exposing (Test, describe, test)


verses a b =
    ""


verse verse_number =
    let
        bottles =
            toString verse_number
    in
    case verse_number of
        2 ->
            "2 bottles of beer on the wall, "
                ++ "2 bottles of beer.\n"
                ++ "Take one down and pass it around, "
                ++ "1 bottle of beer on the wall.\n"

        1 ->
            "1 bottle of beer on the wall, "
                ++ "1 bottle of beer.\n"
                ++ "Take it down and pass it around, "
                ++ "no more bottles of beer on the wall.\n"

        0 ->
            "No more bottles of beer on the wall, "
                ++ "no more bottles of beer.\n"
                ++ "Go to the store and buy some more, "
                ++ "99 bottles of beer on the wall.\n"

        _ ->
            bottles
                ++ " bottles of beer on the wall, "
                ++ bottles
                ++ " bottles of beer.\n"
                ++ "Take one down and pass it around, "
                ++ toString (verse_number - 1)
                ++ " bottles of beer on the wall.\n"


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
        , test "verse 2" <|
            \_ ->
                Expect.equal
                    ("2 bottles of beer on the wall, "
                        ++ "2 bottles of beer.\n"
                        ++ "Take one down and pass it around, "
                        ++ "1 bottle of beer on the wall.\n"
                    )
                    (verse 2)
        , test "verse 1" <|
            \_ ->
                Expect.equal
                    ("1 bottle of beer on the wall, "
                        ++ "1 bottle of beer.\n"
                        ++ "Take it down and pass it around, "
                        ++ "no more bottles of beer on the wall.\n"
                    )
                    (verse 1)
        , test "the last verse" <|
            \_ ->
                Expect.equal
                    ("No more bottles of beer on the wall, "
                        ++ "no more bottles of beer.\n"
                        ++ "Go to the store and buy some more, "
                        ++ "99 bottles of beer on the wall.\n"
                    )
                    (verse 0)
        , test "a few verses" <|
            \_ ->
                Expect.equal
                    ("99 bottles of beer on the wall, "
                        ++ "99 bottles of beer.\n"
                        ++ "Take one down and pass it around, "
                        ++ "98 bottles of beer on the wall.\n"
                        ++ "\n"
                        ++ "98 bottles of beer on the wall, "
                        ++ "98 bottles of beer.\n"
                        ++ "Take one down and pass it around, "
                        ++ "97 bottles of beer on the wall.\n"
                    )
                    (verses 99 98)
        ]
