module Main exposing (..)

import Html exposing (Html, node, header, footer, h1, h2, h3, h4, div, p, a, br, li)
import Html.Attributes exposing (style, class, href, attribute)
import Html.App as App
import Css exposing (..)
import FontAwesome.Web as Icon
import FontAwesome.Brand as Brand
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



-- Styles


styles : List Css.Mixin -> Html.Attribute Msg
styles =
    Css.asPairs >> style


headerBg : Color
headerBg =
    hex "#3ca0b8"


headerColor : Color
headerColor =
    hex "#ffffff"


talkTitle : Color
talkTitle =
    hex "#e33e57"


eventTitle : Color
eventTitle =
    hex "#7fd13b"


speakerLink : Color
speakerLink =
    hex "#4343ff"


viewStyles : Html.Attribute Msg
viewStyles =
    styles
        [ height (pc 100)
        , margin (px 0)
        , textAlign center
        , fontFamilies [ "Montserrat", "Arial" ]
        , backgroundColor (hex "#ffggff")
        ]


headerStyles : Html.Attribute Msg
headerStyles =
    styles
        [ backgroundColor headerBg
        , color headerColor
        , padding (px 20)
        ]


cardStyles : Html.Attribute Msg
cardStyles =
    ( "box-shadow", "0 35px 37px rgba(0, 0, 0, 0.1)" )
        :: ([ backgroundColor (hex "#ffffff")
            , color (hex "#000000")
            , width (pc 50)
            , margin3 (px 0) auto (px 25)
            , padding (px 10)
            ]
                |> Css.asPairs
           )
        |> style



-- Hack for external stylesheet in reactor


loadStylesheet : String -> Html Msg
loadStylesheet url =
    let
        tag =
            "link"

        attrs =
            [ attribute "rel" "stylesheet"
            , attribute "property" "stylesheet"
            , attribute "href" url
            ]

        children =
            []
    in
        node tag attrs children


fontAwesome : Html Msg
fontAwesome =
    loadStylesheet "https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css"


bootstrap : Html Msg
bootstrap =
    loadStylesheet "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"


externalStylesheets : List (Html Msg)
externalStylesheets =
    [ fontAwesome, bootstrap ]



-- MAIN


main : Program Never
main =
    App.beginnerProgram
        { model = initialModel
        , view = view
        , update = update
        }
