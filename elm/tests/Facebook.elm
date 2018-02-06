module Facebook exposing (..)

import Html exposing (Html, div, input, label, span, text)
import Html.Attributes exposing (attribute, id)


type Model
    = NeedAccessToken
    | WaitingForUserId
    | ReceivedUserId String


type Msg
    = SetAccessToken String
    | ReceiveUserId (Result String String)


initialModel =
    NeedAccessToken


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SetAccessToken token ->
            ( WaitingForUserId, Cmd.none )

        ReceiveUserId (Ok userid) ->
            ( ReceivedUserId userid, Cmd.none )

        ReceiveUserId (Result.Err _) ->
            ( model, Cmd.none )


view : Model -> Html Msg
view model =
    div []
        [ label
            [ attribute "for" "access_token"
            ]
            [ text "Access Token"
            , input
                [ Html.Attributes.disabled
                    (case model of
                        WaitingForUserId ->
                            True

                        _ ->
                            False
                    )
                ]
                []
            ]
        , case model of
            ReceivedUserId user_id ->
                span [ id "user_id" ] [ text user_id ]

            _ ->
                span [] []
        ]


main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = \_ -> Sub.none
        }
