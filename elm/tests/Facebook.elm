module Facebook exposing (..)

import Html exposing (Html, div, label, span, text)
import Html.Attributes exposing (attribute, id)


type Model
    = NeedAccessToken
    | WaitingForUserId
    | ReceivedUserId String


type Msg
    = SetAccessToken String
    | ReceiveUserId String


initialModel : Model
initialModel =
    NeedAccessToken


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SetAccessToken token ->
            ( WaitingForUserId, Cmd.none )

        ReceiveUserId userid ->
            ( ReceivedUserId userid, Cmd.none )


view : Model -> Html ()
view model =
    div []
        [ label
            [ attribute "for" "access_token"
            , Html.Attributes.disabled
                (case model of
                    WaitingForUserId ->
                        True

                    _ ->
                        False
                )
            ]
            [ text "Access Token" ]
        , case model of
            ReceivedUserId user_id ->
                span [ id "user_id" ] [ text user_id ]

            _ ->
                span [] []
        ]
