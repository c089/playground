module ScoreboardTests exposing (suite)

import Expect
import Test exposing (Test, describe, test)
import Test.Html.Query as Query
import Test.Html.Selector exposing (text, tag, class)
import Scoreboard exposing (initialModel, update, view, Model, Msg)


suite : Test
suite =
    describe "Scoreboard"
        [ test "initializes at 0:0" <|
            \_ ->
                view initialModel
                    |> Query.fromHtml
                    |> Query.find [ class "score" ]
                    |> Query.has [ text "0:0" ]
        ]
