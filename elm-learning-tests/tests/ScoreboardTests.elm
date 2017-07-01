module ScoreboardTests exposing (suite)

import Test exposing (Test, describe, test)
import Test.Html.Query as Query
import Test.Html.Selector exposing (text, tag, class)
import Scoreboard exposing (..)


expectScoreToBe expectedScore html =
    Query.fromHtml html
        |> Query.find [ class "score" ]
        |> Query.has [ text expectedScore ]


suite : Test
suite =
    describe "Scoreboard"
        [ test "initializes at 0:0" <|
            \_ ->
                expectScoreToBe "0:0" (view initialModel)
        , test "allows increasing the score for team A" <|
            \_ ->
                expectScoreToBe "1:0"
                    (view (update (IncrementScore) (update (SelectTeam A) initialModel)))
        , test "allows increasing the score for team B" <|
            \_ ->
                expectScoreToBe "0:1"
                    (view (update (IncrementScore) (update (SelectTeam B) initialModel)))
        ]
