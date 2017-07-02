module Wikidata exposing (..)

import Test exposing (Test, describe, test)
import Expect
import Json.Decode exposing (..)


type Rank
    = Preferred
    | Normal
    | Deprecated


type alias Claim =
    { id : String
    , rank : Rank
    }


toRank : String -> Result String Rank
toRank x =
    case x of
        "preferred" ->
            Ok Preferred

        x ->
            Err
                ("unknown rank: " ++ x)


fromResult : Result String a -> Decoder a
fromResult result =
    case result of
        Ok v ->
            succeed v

        Err e ->
            fail e


rank =
    string
        |> andThen
            (\x -> fromResult (toRank x))


claim : Decoder Claim
claim =
    (Json.Decode.map2 Claim
        (field "id" string)
        ((field "rank" rank))
    )


claims : Decoder (List ( String, List Claim ))
claims =
    (keyValuePairs
        (list
            claim
        )
    )


suite : Test
suite =
    describe "Using Wikidata"
        [ test "parsing the list of head of goverments" <|
            \_ ->
                let
                    entityId =
                        "Q64"

                    propertyId =
                        "P6"

                    claimId =
                        "Q1234"

                    expected =
                        Ok [ ( entityId, ([ ( propertyId, [ Claim claimId Preferred ] ) ]) ) ]

                    actual =
                        decodeString decoder json

                    json =
                        """{"entities": {"Q64": {"claims":{"P6":[{"id": "Q1234", "rank": "preferred", "mainsnak": {"datavalue": {"value":{"id":"Q123456"}}}}]}}}}"""

                    decoder =
                        (field "entities"
                            (keyValuePairs
                                (field "claims"
                                    claims
                                )
                            )
                        )
                in
                    Expect.equal expected actual
        ]
