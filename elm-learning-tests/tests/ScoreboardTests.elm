module ScoreboardTests exposing (suite)

import Expect exposing (Expectation)
import Html exposing (Html)
import Test exposing (Test, describe, test)
import Test.Html.Query as Query
import Test.Html.Selector exposing (text, tag, class)
import List exposing (foldl)
import Scoreboard exposing (..)


suite : Test
suite =
    describe "Scoreboard"
        [ test "initializes at 0:0" <|
            \_ ->
                expectScoreToBe "0:0"
                    (afterReceiving [])
        , test "allows increasing the score for team A" <|
            \_ ->
                expectScoreToBe "1:0"
                    (afterReceiving [ SelectTeam A, IncrementScore ])
        , test "allows increasing the score for team B" <|
            \_ ->
                expectScoreToBe "0:1"
                    (afterReceiving [ SelectTeam B, IncrementScore ])
        ]


expectScoreToBe : String -> Html Msg -> Expectation
expectScoreToBe expectedScore html =
    Query.fromHtml html
        |> Query.find [ class "score" ]
        |> Query.has [ text expectedScore ]


afterReceiving : List Msg -> Html Msg
afterReceiving messages =
    view (foldl update initialModel messages)
