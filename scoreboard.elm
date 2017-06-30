module Main exposing (..)

import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)


type Team
    = A
    | B


type SelectedTeam
    = Maybe Team


type Msg
    = SelectTeam Team
    | Increment
    | Decrement


type alias Model =
    { scoreA : Int
    , scoreB : Int
    , selectedTeam : Maybe Team
    }


main : Program Never Model Msg
main =
    Html.beginnerProgram { model = initialModel, view = view, update = update }

initialModel : Model
initialModel =
    { scoreA = 0, scoreB = 0, selectedTeam = Maybe.Nothing }

updateScore : Model -> Int -> Model
updateScore model valueToAdd =
    case model.selectedTeam of
        Just A ->
            { model | scoreA = model.scoreA + valueToAdd }

        Just B ->
            { model | scoreB = model.scoreB + valueToAdd }

        Maybe.Nothing ->
            model


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            updateScore model 1

        Decrement ->
            updateScore model -1

        SelectTeam team ->
            { model | selectedTeam = Maybe.Just team }


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Decrement ] [ text "-" ]
        , button [ onClick Increment ] [ text "+" ]
        , button [ onClick (SelectTeam A) ] [ text "A" ]
        , button [ onClick (SelectTeam B) ] [ text "B" ]
        , div [] [ text (toString model.scoreA ++ ":" ++ toString model.scoreB) ]
        ]
