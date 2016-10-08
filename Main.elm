module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.App as App
import Markdown exposing (..)


-- model


type alias Model =
    { input : String }


initModel : Model
initModel =
    { input = "" }



--update


type Msg
    = Input String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Input newInput ->
            { input = newInput }



-- view


view : Model -> Html Msg
view model =
    div []
        [ textarea [ onInput Input, value model.input ] []
        , div []
            [ output model
            ]
        ]


output : Model -> Html Msg
output model =
    Markdown.toHtml [ class "output" ] model.input


main =
    App.beginnerProgram
        { model = initModel
        , update = update
        , view = view
        }
