module Main exposing (..)

import Html exposing (Html, node, header, footer, h1, h2, h3, h4, div, span, p, a, img, br, li)
import Html.Attributes exposing (style, class, href, attribute, src)
import Html.App as App
import Css exposing (color, marginTop, px)
import FontAwesome.Web as Icon
import FontAwesome.Brand as Brand
import Meetups exposing (Meetup, Talk, nextMeetup, pastMeetups)
import Speakers exposing (Speaker)
import Styles exposing (externalStylesheets, viewStyles, headerStyles, cardStyles, avatarStyle, styles, talkTitle, speakerLink)


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
        , displaySpeaker talk.speaker
        , br [] []
        , p [ style [ ( "text-align", "left" ) ] ]
            [ Html.text talk.description
            ]
        , a [ href talk.link, Html.Attributes.target "_blank" ] [ Icon.desktop, Html.text " Slides" ]
        , br [] []
        ]


displaySpeaker : Speaker -> Html Msg
displaySpeaker { fullName, twitter } =
    let
        attributes =
            [ class "speaker", styles [ color speakerLink ] ]

        twitterUrl handle =
            "https://twitter.com/" ++ handle

        twitterPic handle =
            twitterUrl handle ++ "/profile_image?size=bigger"
    in
        case twitter of
            Just handle ->
                a ((handle |> twitterUrl |> href) :: attributes)
                    [ img [ src (twitterPic handle), avatarStyle ] []
                    , Html.text <| fullName ++ " ( "
                    , Brand.twitter
                    , Html.text <| " " ++ handle ++ " )"
                    ]

            Nothing ->
                span attributes [ Html.text fullName ]


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
