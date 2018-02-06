module FacebookTests exposing (suite)

import Expect
import Facebook exposing (Msg(..), initialModel, update, view)
import Html exposing (Html)
import Html.Attributes as Attributes
import Test exposing (Test, describe, test)
import Test.Html.Query as Query
import Test.Html.Selector as Selector exposing (attribute, class, id, tag, text)


suite : Test
suite =
    describe "Facebook Graph API Playground"
        [ test "starts by asking for my access token" <|
            \() ->
                view initialModel
                    |> Query.fromHtml
                    |> Query.find [ tag "label", attribute "for" "access_token" ]
                    |> Query.has [ text "Access Token" ]
        , test "disables input when I set my access token" <|
            \_ ->
                view Facebook.WaitingForUserId
                    |> Query.fromHtml
                    |> Query.find [ tag "label", attribute "for" "access_token" ]
                    |> Query.find [ tag "input" ]
                    |> Query.has [ Selector.disabled True ]
        , test "shows the user id when it is retrieved" <|
            \() ->
                view (Tuple.first (update (ReceiveUserId (Ok "123")) initialModel))
                    |> Query.fromHtml
                    |> Query.find [ id "user_id" ]
                    |> Query.has [ text "123" ]
        , test "ask for token again when receiving user id fails" <|
            \() ->
                update (ReceiveUserId (Err "Request failed.")) initialModel
                    |> Tuple.first
                    |> Expect.equal Facebook.NeedAccessToken
        ]
