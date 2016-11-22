module Meetups exposing (Meetup, Talk, nextMeetup, pastMeetups)

import Speakers exposing (..)


type alias Talk =
    { speakers : List Speaker
    , title : String
    , description : String
    , slidesUrl : Maybe String
    , videoUrl : Maybe String
    }


type alias Meetup =
    { date : String
    , location : String
    , lineUp : List Talk
    }


nextMeetup : Meetup
nextMeetup =
    meetup5


pastMeetups : List Meetup
pastMeetups =
    [ meetup1, meetup2, meetup3, meetup4 ]


meetup1 : Meetup
meetup1 =
    { date = "2016-03-24"
    , location = "Meetic"
    , lineUp =
        [ { speakers = [ tbrisbout ]
          , title = "Elm Language and Tooling overview"
          , description = "Ce talk est une introduction au langage, avec un tour d'horizon de la syntaxe, des outils et de la communauté."
          , slidesUrl = Just "http://slides.com/thomasbrisbout/elm-intro/fullscreen"
          , videoUrl = Nothing
          }
        , { speakers = [ jumichot ]
          , title = "Elm Livecoding"
          , description = "Après la théorie, place à la pratique. L'idée est d'explorer et de comprendre l'architecture Elm avec un cas d'usage sur un live-coding d'une nouvelle application"
          , slidesUrl = Just "http://slides.com/jumichot/elm-signals/fullscreen"
          , videoUrl = Nothing
          }
        , { speakers = [ klebrun ]
          , title = "Real World Elm"
          , description = "Ce talk fera un retour d’expérience de différentes expérimentations pour intégrer des composants en Elm dans une application existante, en passant sur les différentes problématiques d'appels HTTP, de traitement de payload et d'échange de message avec du code JS."
          , slidesUrl = Just "http://slides.com/kevinlebrun/real-world-elm/fullscreen"
          , videoUrl = Nothing
          }
        ]
    }


meetup2 : Meetup
meetup2 =
    { date = "2016-05-04"
    , location = "BeMyApp"
    , lineUp =
        [ { speakers = [ tbrisbout ]
          , title = "Elm sur le desktop avec Electron"
          , description = ""
          , slidesUrl = Just "http://slides.com/thomasbrisbout/elm-electron/fullscreen"
          , videoUrl = Nothing
          }
        , { speakers = [ jumichot ]
          , title = "Elm Livecoding: JSON & API Call"
          , description = ""
          , slidesUrl = Nothing
          , videoUrl = Nothing
          }
        , { speakers = [ abaumann, alickonrails ]
          , title = "Elm et Graphisme"
          , description = "Comment dessiner en Elm avec elm-graphics et elm-svg"
          , slidesUrl = Nothing
          , videoUrl = Nothing
          }
        ]
    }


meetup3 : Meetup
meetup3 =
    { date = "2016-06-21"
    , location = "LeBonCoin"
    , lineUp =
        [ { speakers = [ tbrisbout ]
          , title = "Testing en Elm"
          , description = "Ce lightning talk tentera de répondre au questions suivantes: Quels outils sont disponibles pour faire des tests en elm, qu'est ce qui marche en 0.17, et pourquoi faire des tests quand on a un compilateur aussi pratique ?"
          , slidesUrl = Just "http://slides.com/thomasbrisbout/elm-testing/fullscreen"
          , videoUrl = Just "https://youtu.be/21rC5vSWF4o?list=PLFmYNJ_DUU2DPZH2Vfok0jdfkGPcrL0JA"
          }
        , { speakers = [ tellijo ]
          , title = "Routeur SPA en Elm"
          , description = "Ce lightning talk fera le tour de ce qui est possible en elm pour faire du routing, en passant par les besoins, les librairies tierces comme Hop et le package elm-lang/navigation disponible depuis elm 0.17."
          , slidesUrl = Just "http://slides.com/tellijo/routing-elm/fullscreen"
          , videoUrl = Just "https://youtu.be/92WSCp3AfTM?list=PLFmYNJ_DUU2DPZH2Vfok0jdfkGPcrL0JA"
          }
        , { speakers = [ klebrun ]
          , title = "Migration d'une application vers Elm 0.17"
          , description = "Ce talk fera le point sur les nouveautés de la version 0.17 via un retour d'expérience pratique sur la mise à jour d'une application de elm 0.16 à 0.17, comment migrer les signaux vers les subscriptions / commandes / messages, en décrivant les nouveaux patterns à utiliser."
          , slidesUrl = Just "http://slides.com/kevinlebrun/from-elm016-to-elm017/fullscreen"
          , videoUrl = Just "https://youtu.be/c9E9_vSaeDo?list=PLFmYNJ_DUU2DPZH2Vfok0jdfkGPcrL0JA"
          }
        , { speakers = [ abaumann, alickonrails ]
          , title = "Live coding d'un algorithme de génération de donjon en elm"
          , description = "Ce talk parlera de gaming avec le coding d'un algorithme de génération procédural et aléatoire de donjon avec sa représentation graphique. "
          , slidesUrl = Nothing
          , videoUrl = Just "https://youtu.be/w11dtJawNE0?list=PLFmYNJ_DUU2DPZH2Vfok0jdfkGPcrL0JA"
          }
        ]
    }


meetup4 : Meetup
meetup4 =
    { date = "2016-09-16"
    , location = "JS-Republic"
    , lineUp =
        [ { speakers = [ tbrisbout ]
          , title = "elm-css"
          , slidesUrl = Just "https://slides.com/thomasbrisbout/elm-css/fullscreen#/"
          , videoUrl = Just "https://youtu.be/LhxT6KzbIS0?t=211"
          , description = "Nous verrons dans ce talk comment un système de type peut aider à faire du CSS de manière fiable: Imaginez par exemple être notifié sur une typo dans un nom de classe..."
          }
        , { speakers = [ n_umiastowski ]
          , title = "Donner et recevoir avec la communauté Elm sur Slack"
          , slidesUrl = Just "http://slides.com/numiastowski/deck/fullscreen"
          , videoUrl = Just "https://youtu.be/LhxT6KzbIS0?t=991"
          , description = "Nous verrons dans ce talk comment un système de type peut aider à faire du CSS de manière fiable: Imaginez par exemple être notifié sur une typo dans un nom de classe..."
          }
        , { speakers = [ klebrun ]
          , title = "Elm + Polymer = <3"
          , description = "Après ce talk vous aurez tous les outils en main pour intégrer des composants tiers avec votre application Elm. Le cas d'étude portera sur les interactions entre Elm et des composants Polymer."
          , slidesUrl = Just "http://slides.com/kevinlebrun/elm-polymer-3/fullscreen"
          , videoUrl = Just "https://youtu.be/LhxT6KzbIS0?t=1668"
          }
        , { speakers = [ tibastral ]
          , title = "Video Game in Elm without any framework"
          , description = "How reactive programming will take over the world !!"
          , slidesUrl = Nothing
          , videoUrl = Just "https://youtu.be/LhxT6KzbIS0?t=2783"
          }
        ]
    }


meetup5 : Meetup
meetup5 =
    { date = "2016-11-09"
    , location = "Mozilla"
    , lineUp =
        [ { speakers = [ n_umiastowski ]
          , title = "Debug, test unitaires et états impossibles"
          , slidesUrl = Nothing
          , videoUrl = Just "https://www.youtube.com/watch?v=NA-jApMBKf0"
          , description = "Comment j'ai commencé à faire du debug puis des tests unitaires avec elm-test, puis comment j'ai fini par vouloir rendre impossibles les états impossibles. Un challenge qui s'est révélé passionnant et instructif."
          }
        , { speakers = [ sebcreme, erwan ]
          , title = "Highway to Elm"
          , slidesUrl = Nothing
          , videoUrl = Just "https://www.youtube.com/watch?v=_tGWuHdSKXY"
          , description = "À Nomalab, jeune société de l'audiovisuel, on code en elm quotidiennement.\nNotre mission : recevoir des vidéos fraîchements sorties de la post-production, les transformer dans un format prêt à diffuser, puis les livrer aux chaînes TV et plateformes de VoD - avec archivage et SLA à chaque étape.\n\nPuisqu'il il ne faut pas concevoir les services de demain avec les technos d'hier, on a choisi AWS, Docker, Rust et elm pour faire face à nos challenges techniques : gestion de gros fichiers, analyse et édition de vidéo sur une plateforme 100% web.\n\nÀ l'aube de notre V1, zoom sur les raisons du choix d'elm, les bénéfices constatés et les leçons tirées sur 6 mois d'utilisation d’une techno très prometteuse, exemples concrets à l'appui !"
          }
        , { speakers = [ tbrisbout ]
          , title = "Live Coding: 3D et VR en elm"
          , slidesUrl = Nothing
          , videoUrl = Just "https://www.youtube.com/watch?v=3fX1TWZ-Vi8"
          , description = ""
          }
        , { speakers = [ nicoespeon ]
          , title = "Live Coding: Paris Web Component exercise"
          , slidesUrl = Nothing
          , videoUrl = Just "https://www.youtube.com/watch?v=uy0gV-XGuuY"
          , description = ""
          }
        ]
    }
