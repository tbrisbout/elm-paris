module Main exposing (..)

import Html exposing (Html, node, header, footer, h1, h2, h3, h4, div, span, p, a, img, br, ul)
import Html.App as App
import Css exposing (color, marginTop, paddingLeft, px)
import Meetups exposing (Meetup, Talk, nextMeetup, pastMeetups)
import Styles exposing (externalStylesheets, viewStyles, headerStyles, cardStyles, avatarStyle, styles, talkTitle, speakerLink)
import Card exposing (displayCard)


-- MODEL


type alias Model =
    { nextMeetup : Meetup
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


nextMeetupView : Meetup -> Html Msg
nextMeetupView meetup =
    div []
        [ h3 []
            [ Html.text (meetup.date ++ " - " ++ meetup.location)
            ]
        , ul [ styles [ paddingLeft (px 0) ] ]
            (List.map displayCard meetup.lineUp)
        ]


previousMeetupsView : List Meetup -> Html Msg
previousMeetupsView meetups =
    ul [ styles [ paddingLeft (px 0) ] ]
        (meetups
            |> List.map .lineUp
            |> List.concat
            |> List.reverse
            |> List.map displayCard
            |> List.intersperse (br [] [])
        )


view : Model -> Html Msg
view model =
    div [ viewStyles ]
        <| externalStylesheets
        ++ [ header [ headerStyles ]
                [ h1 [ styles [ marginTop (px 0) ] ]
                    [ Html.text "Elm Paris"
                    ]
                , h2 [] [ Html.text "Next meetup line-up" ]
                , nextMeetupView model.nextMeetup
                ]
           , h2 [] [ Html.text "Previous talks" ]
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
