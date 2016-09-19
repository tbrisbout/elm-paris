module Main exposing (..)

import Html exposing (Html, header, footer, h1, h2, h3, h4, div, p, a, br, text, li)
import Html.Attributes exposing (style, class)
import Html.App as App
import Meetups exposing (Meetup, Talk, nextMeetup, pastMeetups)


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


displayTalk : Talk -> Html Msg
displayTalk talk =
    div [ cardStyles ]
        [ h3 [ style [ "color" => talkTitle ] ] [ text talk.title ]
        , a [ class "speaker", style [ "color" => speakerLink ] ] [ text talk.speaker ]
        , br [] []
        , p [ style [ "text-align" => "left" ] ]
            [ text talk.description
            ]
        ]


nextMeetupView : Meetup -> Html Msg
nextMeetupView meetup =
    div []
        [ h3 []
            [ text (meetup.date ++ " - " ++ meetup.location)
            ]
        , li [] (List.map displayTalk meetup.lineUp)
        ]


previousMeetupsView : List Meetup -> Html Msg
previousMeetupsView meetups =
    div []
        (meetups
            |> List.map .lineUp
            |> List.concat
            |> List.reverse
            |> List.map displayTalk
            |> List.intersperse (br [] [])
        )


view : Model -> Html Msg
view model =
    div [ viewStyles ]
        [ header [ headerStyles ]
            [ h1 [ style [ "margin-top" => "0" ] ]
                [ text "Elm Paris"
                ]
            , h2 [] [ text "Next meetup line-up" ]
            , nextMeetupView model.nextMeetup
            ]
        , h2 [] [ text "Previous talks" ]
        , previousMeetupsView model.pastMeetups
        ]



-- Styles


(=>) : a -> b -> ( a, b )
(=>) =
    (,)



-- Colors


type alias Color =
    String


headerBg : Color
headerBg =
    "#3ca0b8"


talkTitle : Color
talkTitle =
    "#e33e57"


eventTitle : Color
eventTitle =
    "#7fd13b"


speakerLink : Color
speakerLink =
    "#4343ff"


viewStyles : Html.Attribute Msg
viewStyles =
    style
        [ "list-style-type" => "none"
        , "height" => "100%"
        , "margin" => "0"
        , "text-align" => "center"
        , "font-family" => "Montserrat, Arial"
        ]


headerStyles : Html.Attribute Msg
headerStyles =
    style
        [ "background-color" => headerBg
        , "color" => "white"
        , "padding" => "20px"
        ]


cardStyles : Html.Attribute Msg
cardStyles =
    style
        [ "background-color" => "white"
        , "color" => "#000000"
        , "width" => "50%"
        , "margin" => "0 auto 25px"
        , "padding" => "10px"
        , "box-shadow" => "0 35px 37px rgba(0, 0, 0, 0.1)"
        ]



-- MAIN


main : Program Never
main =
    App.beginnerProgram
        { model = initialModel
        , view = view
        , update = update
        }
