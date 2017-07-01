module Scoreboard exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class)


type alias Model =
    { scoreA : Int
    , scoreB : Int
    , selectedTeam : Maybe Team
    }


type Team
    = A
    | B


type Msg
    = SelectTeam Team
    | IncrementScore


initialModel : Model
initialModel =
    { scoreA = 0, scoreB = 0, selectedTeam = Nothing }


update : Msg -> Model -> Model
update msg model =
    case msg of
        IncrementScore ->
            case model.selectedTeam of
                Just A ->
                    { model | scoreA = model.scoreA + 1 }

                Just B ->
                    { model | scoreB = model.scoreB + 1 }

                Nothing ->
                    model

        SelectTeam t ->
            { model | selectedTeam = Just t }


view : Model -> Html Msg
view model =
    div []
        [ div [ class "score" ]
            [ text
                ((toString model.scoreA) ++ ":" ++ (toString model.scoreB))
            ]
        ]
