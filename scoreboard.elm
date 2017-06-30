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
    { selectedTeam : Maybe Team
    , scores : ( Int, Int )
    }


main : Program Never Model Msg
main =
    Html.beginnerProgram { model = initialModel, view = view, update = update }


initialModel : Model
initialModel =
    { scores = ( 0, 0 ), selectedTeam = Maybe.Nothing }


updateScore : Model -> (Int -> Int) -> Model
updateScore model calculateNewScore =
    let
        updateScore mapFn =
            { model | scores = mapFn calculateNewScore model.scores }
    in
        case model.selectedTeam of
            Just A ->
                updateScore Tuple.mapFirst

            Just B ->
                updateScore Tuple.mapSecond

            Maybe.Nothing ->
                model


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            updateScore model (\x -> x + 1)

        Decrement ->
            updateScore model (\x -> x - 1)

        SelectTeam team ->
            { model | selectedTeam = Maybe.Just team }


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Decrement ] [ text "-" ]
        , button [ onClick Increment ] [ text "+" ]
        , button [ onClick (SelectTeam A) ] [ text "A" ]
        , button [ onClick (SelectTeam B) ] [ text "B" ]
        , div [] [ text (toString (Tuple.first model.scores) ++ ":" ++ toString (Tuple.second model.scores)) ]
        ]
