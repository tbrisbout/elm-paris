module Main exposing (..)

import Html exposing (..)
import Html.App as App
import Meetups exposing (Meetup, Talk, nextMeetup, pastMeetups)
import Styles exposing (..)
import Card exposing (displayCard)


-- MODEL


type alias Model =
    { nextMeetup : Maybe Meetup
    , pastMeetups : List Meetup
    }


initialModel : Model
initialModel =
    { nextMeetup = nextMeetup
    , pastMeetups = pastMeetups
    }



-- UPDATE


type Msg
    = NoOp


update : Msg -> Model -> Model
update msg model =
    case msg of
        NoOp ->
            model



-- VIEW


nextMeetupView : Maybe Meetup -> Html Msg
nextMeetupView meetup =
    case meetup of
        Just meetup ->
            div []
                [ h2 [ titleStyle ] [ text <| "nextMeetup = (\"" ++ meetup.date ++ "\", \"" ++ meetup.location ++ "\")" ]
                , ul [ listStyles ]
                    (List.map displayCard meetup.lineUp)
                ]

        Nothing ->
            div [] []


previousMeetupsView : List Meetup -> Html Msg
previousMeetupsView meetups =
    ul [ listStyles ]
        (meetups
            |> List.reverse
            |> List.map .lineUp
            |> List.concat
            |> List.map displayCard
            |> List.intersperse (br [] [])
        )


view : Model -> Html Msg
view model =
    div [ viewStyles ] <|
        externalStylesheets
            ++ [ header [ headerStyles ]
                    [ h1 [ titleStyle ] [ text "Elm Paris Meetup" ]
                    , nextMeetupView model.nextMeetup
                    ]
               , h2 [] [ text "Previous talks" ]
               , previousMeetupsView model.pastMeetups
               ]



-- MAIN


main : Program Never
main =
    App.beginnerProgram
        { model = initialModel
        , view = view
        , update = update
        }
