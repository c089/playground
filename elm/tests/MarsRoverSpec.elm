module MarsRoverSpec exposing (..)

import Expect
import Test exposing (Test, describe, test)


type alias Rover =
    { x : Int
    , y : Int
    , direction : Direction
    }


type Direction
    = North
    | East
    | South
    | West


type Command
    = Forward
    | TurnRight
    | TurnLeft


update : Command -> Rover -> Rover
update command rover =
    case command of
        Forward ->
            case rover.direction of
                North ->
                    { rover | y = rover.y + 1 }

                South ->
                    { rover | y = rover.y - 1 }

                West ->
                    { rover | x = rover.x - 1 }

                East ->
                    { rover | x = rover.x + 1 }

        TurnRight ->
            let
                newDirection =
                    case rover.direction of
                        North ->
                            East

                        East ->
                            South

                        South ->
                            West

                        West ->
                            North
            in
            { rover | direction = newDirection }

        TurnLeft ->
            let
                newDirection =
                    case rover.direction of
                        North ->
                            West

                        East ->
                            North

                        South ->
                            East

                        West ->
                            South
            in
            { rover | direction = newDirection }


parseChar : Char -> Result String Command
parseChar char =
    case char of
        'f' ->
            Ok Forward

        'r' ->
            Ok TurnRight

        'l' ->
            Ok TurnLeft

        _ ->
            Err ("Unknown command '" ++ String.fromChar char ++ "'")


mapAllOrFirstError : (a -> Result e b) -> List a -> Result e (List b)
mapAllOrFirstError f =
    List.foldl
        (\a ->
            Result.andThen (\acc -> Result.map (\c -> c :: acc) (f a))
        )
        (Ok [])


toCommands : List Char -> Result String (List Command)
toCommands chars =
    mapAllOrFirstError parseChar chars


drive : Rover -> List Char -> Result String Rover
drive rover chars =
    toCommands chars |> (Result.map <| List.foldl update rover)


suite : Test
suite =
    describe "Mars Rover"
        [ test "stays at its starting location without commands" <|
            \_ ->
                Expect.equal (Ok (Rover 10 10 North)) (drive (Rover 10 10 North) [])
        , test "when facing north can drive forward" <|
            \_ ->
                Expect.equal (Ok (Rover 10 11 North)) (drive (Rover 10 10 North) [ 'f' ])
        , test "when facing north can drive forward twice" <|
            \_ ->
                Expect.equal (Ok (Rover 10 12 North)) (drive (Rover 10 10 North) [ 'f', 'f' ])
        , test "when facing north can drive forward three times" <|
            \_ ->
                Expect.equal (Ok (Rover 10 13 North)) (drive (Rover 10 10 North) [ 'f', 'f', 'f' ])
        , test "when facing north can turn right to face east" <|
            \_ ->
                Expect.equal (Ok (Rover 10 10 East)) (drive (Rover 10 10 North) [ 'r' ])
        , test "when facing north can turn left to face west" <|
            \_ ->
                Expect.equal (Ok (Rover 10 10 West)) (drive (Rover 10 10 North) [ 'l' ])
        , test "when facing east can turn right to face south" <|
            \_ ->
                Expect.equal (Ok (Rover 10 10 South)) (drive (Rover 10 10 East) [ 'r' ])
        , test "when facing south can turn right to face west" <|
            \_ ->
                Expect.equal (Ok (Rover 10 10 West)) (drive (Rover 10 10 South) [ 'r' ])
        , test "when facing west can turn right to face north" <|
            \_ ->
                Expect.equal (Ok (Rover 10 10 North)) (drive (Rover 10 10 West) [ 'r' ])
        , test "when facing east can drive forward" <|
            \_ ->
                Expect.equal (Ok (Rover 11 10 East)) (drive (Rover 10 10 East) [ 'f' ])
        , test "when facing east can drive forward many times" <|
            \_ ->
                Expect.equal (Ok (Rover 14 10 East)) (drive (Rover 10 10 East) [ 'f', 'f', 'f', 'f' ])
        , test "when facing south can drive forward" <|
            \_ ->
                Expect.equal (Ok (Rover 10 9 South)) (drive (Rover 10 10 South) [ 'f' ])
        , test "when facing south can drive forward many times" <|
            \_ ->
                Expect.equal (Ok (Rover 10 6 South)) (drive (Rover 10 10 South) [ 'f', 'f', 'f', 'f' ])
        , test "when facing west can drive forward" <|
            \_ ->
                Expect.equal (Ok (Rover 9 10 West)) (drive (Rover 10 10 West) [ 'f' ])
        , test "when facing west can drive forward many times" <|
            \_ ->
                Expect.equal (Ok (Rover 6 10 West)) (drive (Rover 10 10 West) [ 'f', 'f', 'f', 'f' ])
        , test "can turn in a circle clockwise" <|
            \_ ->
                Expect.equal (Ok (Rover 10 10 North)) (drive (Rover 10 10 North) [ 'r', 'r', 'r', 'r' ])
        , test "can turn in a circle counter-clockwise" <|
            \_ ->
                Expect.equal (Ok (Rover 10 10 North)) (drive (Rover 10 10 North) [ 'l', 'l', 'l', 'l' ])
        , test "can drive north, then turn, then drive east" <|
            \_ ->
                Expect.equal (Ok (Rover 11 11 East)) (drive (Rover 10 10 North) [ 'f', 'r', 'f' ])
        , test "can drive in a circle clockwis" <|
            \_ ->
                Expect.equal (Ok (Rover 10 10 West)) (drive (Rover 10 10 North) [ 'f', 'r', 'f', 'r', 'f', 'r', 'f' ])
        , test "refuses unknown commands" <|
            \_ ->
                Expect.equal (Err "Unknown command 'a'") (drive (Rover 10 10 North) [ 'a' ])
        ]
