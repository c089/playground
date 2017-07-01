module Scoreboard exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)


type alias Model =
    {}


type Msg
    = Init


initialModel : Model
initialModel =
    {}


update : Msg -> Model -> Model
update msg model =
    initialModel


view : Model -> Html Msg
view model =
    div []
        [ div [ class "score" ] [ text "0:0" ]
        ]
