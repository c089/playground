module HTTPAndJSONTests exposing (suite)

import Test exposing (Test, describe, test)
import Expect
import Json.Decode exposing (decodeString, int, string, list, field, map2)


type alias Point =
    { x : Int, y : Int }


suite : Test
suite =
    describe "decoding JSON"
        [ test "uses a decoder to return a result of parsed JSON" <|
            \_ -> Expect.equal (Ok 1) (decodeString int "1")
        , test "returns an Err if the value can't be parsed by the decoder" <|
            \_ -> Expect.err (decodeString int "\"1\"")
        , test "can use field decoder to access object properties" <|
            \_ -> Expect.equal (Ok 1) (decodeString (field "x" int) """{"x": 1}""")
        , test "ignores extra properties" <|
            \_ -> Expect.equal (Ok 1) (decodeString (field "x" int) """{"x": 1, "y": 2}""")
        , test "can use combined decoders" <|
            \_ -> Expect.equal (Ok [ 1, 2 ]) (decodeString (list int) "[1,2]")
        , test "can use mapN to map to custom types" <|
            \_ ->
                let
                    decoder =
                        map2 Point (field "x" int) (field "y" int)

                    json =
                        """{"x": 1, "y": 2}"""
                in
                    Expect.equal (Ok (Point 1 2)) (decodeString decoder json)
        ]
