module Card exposing (displayCard)

import Meetups exposing (Talk)
import Html exposing (..)
import Html.Attributes exposing (src, style, href, class, target)
import Css exposing (flex, color, padding, px, pc, textAlign, left, fontSize, marginRight)
import FontAwesome.Web as Icon
import FontAwesome.Brand as Brand
import Speakers exposing (Speaker, Profile(Twitter, LinkedIn))
import Styles exposing (..)


displayCard : Talk -> Html a
displayCard talk =
    li [ cardStyles ]
        [ displaySpeaker talk.speaker
        , displayTalkInfo talk
        ]


displaySpeaker : Speaker -> Html a
displaySpeaker { fullName, profileUrl } =
    let
        layout =
            styles [ flex (pc 25) ]

        attributes =
            [ class "speaker"
            , target "_blank"
            , styles [ color speakerLink, fontSize (px 20) ]
            ]

        twitterUrl handle =
            "https://twitter.com/" ++ handle

        dummyAvatar =
            img [ src "/images/elm-lang.png", avatarStyle ] []

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
                span [ layout ]
                    [ displayAvatar profile
                    , br [] []
                    , text fullName
                    , br [] []
                    , displayLink profile
                    ]

            Nothing ->
                span [ layout ]
                    [ dummyAvatar
                    , br [] []
                    , text fullName
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
            [ text description
            ]
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
