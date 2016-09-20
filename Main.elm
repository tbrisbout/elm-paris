module Main exposing (..)

import Html exposing (Html, node, header, footer, h1, h2, h3, h4, div, p, a, br, li)
import Html.Attributes exposing (style, class, href, attribute)
import Html.App as App
import Css exposing (..)
import FontAwesome.Web as Icon
import FontAwesome.Brand as Brand
import Meetups exposing (Meetup, Talk, nextMeetup, pastMeetups)
import Styles exposing (externalStylesheets, viewStyles, headerStyles, cardStyles, styles, talkTitle, speakerLink)


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
        [ h3 [ styles [ color talkTitle ] ] [ Html.text talk.title ]
        , a [ class "speaker", styles [ color speakerLink ] ] [ Brand.twitter, Html.text <| " " ++ talk.speaker ]
        , br [] []
        , p [ style [ ( "text-align", "left" ) ] ]
            [ Html.text talk.description
            ]
        , a [ href talk.link, Html.Attributes.target "_blank" ] [ Icon.desktop, Html.text " Slides" ]
        , br [] []
        ]


nextMeetupView : Meetup -> Html Msg
nextMeetupView meetup =
    div []
        [ h3 []
            [ Html.text (meetup.date ++ " - " ++ meetup.location)
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
