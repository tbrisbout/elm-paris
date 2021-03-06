module Card exposing (displayCard)

import Meetups exposing (Talk)
import Html exposing (..)
import Html.Attributes exposing (src, style, href, class, target)
import Css exposing (flex, color, padding, px, pc, textAlign, left, fontSize, marginRight, marginTop)
import FontAwesome.Web as Icon
import FontAwesome.Brand as Brand
import Speakers exposing (Speaker, Profile(Twitter, LinkedIn))
import Styles exposing (..)
import String


displayCard : Talk -> Html a
displayCard talk =
    li [ cardStyles ]
        [ displaySpeakers talk.speakers
        , displayTalkInfo talk
        ]


displaySpeakers : List Speaker -> Html a
displaySpeakers speakers =
    let
        layout =
            styles [ flex (pc 25) ]
    in
        div [ layout ] (List.map displaySpeaker speakers)


displaySpeaker : Speaker -> Html a
displaySpeaker { fullName, profileUrl } =
    let
        attributes =
            [ class "speaker"
            , target "_blank"
            , styles [ color speakerLink, fontSize (px 20) ]
            ]

        twitterUrl handle =
            "https://twitter.com/" ++ handle

        dummyAvatar =
            img [ src "https://avatars0.githubusercontent.com/u/4359353?v=3&s=200", avatarStyle ] []

        displayAvatar stuff =
            case stuff of
                Twitter handle ->
                    img [ src (twitterUrl handle ++ "/profile_image?size=bigger"), avatarStyle ] []

                _ ->
                    dummyAvatar

        displayLink profile =
            case profile of
                Twitter handle ->
                    a ((handle |> twitterUrl |> href) :: attributes) [ Brand.twitter ]

                LinkedIn url ->
                    a (href url :: attributes) [ Brand.linkedin ]
    in
        case profileUrl of
            Just profile ->
                div [ styles [ marginTop (px 10) ] ]
                    [ displayAvatar profile
                    , br [] []
                    , text fullName
                    , br [] []
                    , displayLink profile
                    , br [] []
                    ]

            Nothing ->
                div []
                    [ dummyAvatar
                    , br [] []
                    , text fullName
                    , br [] []
                    ]


displayTalkInfo : Talk -> Html a
displayTalkInfo { title, description, slidesUrl, videoUrl } =
    div
        [ styles
            [ padding (px 10)
            , flex (pc 75)
            ]
        ]
        [ h3 [ styles [ color talkTitle ] ] [ text title ]
        , br [] []
        , p [ styles [ textAlign left ] ]
            (description
                |> String.lines
                |> List.map text
                |> List.intersperse (br [] [])
            )
        , displaySlides slidesUrl
        , displayVideo videoUrl
        , br [] []
        ]


displaySlides : Maybe String -> Html a
displaySlides slidesUrl =
    case slidesUrl of
        Just link ->
            a [ styles [ marginRight (px 10) ], href link, target "_blank" ] [ Icon.desktop, text " Slides" ]

        Nothing ->
            span [] []


displayVideo : Maybe String -> Html a
displayVideo videoUrl =
    case videoUrl of
        Just link ->
            a [ href link, target "_blank" ] [ Icon.video_camera, text " Video" ]

        Nothing ->
            span [] []
