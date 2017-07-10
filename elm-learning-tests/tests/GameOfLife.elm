module GameOfLife exposing (..)

import Test exposing (Test, describe, test)
import Expect


tick : GameOfLife -> GameOfLife
tick _ =
    (GameOfLife
        [ [ Dead, Dead, Dead ]
        , [ Dead, Dead, Dead ]
        , [ Dead, Dead, Dead ]
        ]
    )


type Cell
    = Dead
    | Alive


type alias GameOfLife =
    { cells : List (List Cell)
    }


type alias ParseError =
    { message : String
    }


parseGame : List String -> Result ParseError GameOfLife
parseGame lines =
    let
        parseCell : Char -> Result ParseError Cell
        parseCell char =
            case char of
                'X' ->
                    (Ok Alive)

                ' ' ->
                    Ok Dead

                c ->
                    Err (ParseError ("Unknown character " ++ (String.fromChar c)))

        parseLine : String -> Result ParseError (List Cell)
        parseLine s =
            combine (List.map parseCell (String.toList s))

        -- from Result.Extra
        combine : List (Result x a) -> Result x (List a)
        combine =
            List.foldr (Result.map2 (::)) (Ok [])
    in
        lines
            |> List.map parseLine
            |> combine
            |> Result.map GameOfLife


suite : Test
suite =
    describe "Game of life"
        [ test "alive cell without neighbours dies" <|
            \_ ->
                let
                    before =
                        parseGame
                            [ "   "
                            , " X "
                            , "   "
                            ]

                    expected =
                        parseGame
                            [ "   "
                            , "   "
                            , "   "
                            ]

                    actual =
                        Result.map tick before
                in
                    Expect.equal actual expected
        ]
