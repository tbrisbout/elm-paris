module Speakers exposing (..)


type alias Speaker =
    { fullName : String
    , profileUrl : Maybe Profile
    }


type Profile
    = Twitter String
    | LinkedIn String


tbrisbout : Speaker
tbrisbout =
    { fullName = "Thomas Brisbout"
    , profileUrl = Just <| Twitter "tbrisbout"
    }


jumichot : Speaker
jumichot =
    { fullName = "Julien Michot"
    , profileUrl = Just <| Twitter "jumichot"
    }


klebrun : Speaker
klebrun =
    { fullName = "Kevin Le Brun"
    , profileUrl = Just <| LinkedIn "https://www.linkedin.com/in/kevinlebrun"
    }


abaumann : Speaker
abaumann =
    { fullName = "Adrien Baumann"
    , profileUrl = Just <| LinkedIn "https://fr.linkedin.com/in/adrien-baumann-7244694/fr"
    }


alickonrails : Speaker
alickonrails =
    { fullName = "Alick Paul"
    , profileUrl = Just <| Twitter "alickonrails"
    }


tellijo : Speaker
tellijo =
    { fullName = "Joel Matëlli"
    , profileUrl = Just <| Twitter "telllijo"
    }


n_umiastowski : Speaker
n_umiastowski =
    { fullName = "Nicolas Umiastowski"
    , profileUrl = Just <| Twitter "n_umiastowski"
    }


tibastral : Speaker
tibastral =
    { fullName = "Thibault Assus"
    , profileUrl = Just <| Twitter "tibastral"
    }


erwan : Speaker
erwan =
    { fullName = "Erwan Queffélec"
    , profileUrl = Just <| LinkedIn "https://www.linkedin.com/in/erwanqueffelec"
    }


sebcreme : Speaker
sebcreme =
    { fullName = "Sebastien Crème"
    , profileUrl = Just <| Twitter "sebcreme"
    }


nicoespeon : Speaker
nicoespeon =
    { fullName = "Nicolas Carlo"
    , profileUrl = Just <| Twitter "nicoespeon"
    }


pauldijou : Speaker
pauldijou =
    { fullName = "Paul Dijou"
    , profileUrl = Just <| Twitter "paul_dijou"
    }


theokalumbu : Speaker
theokalumbu =
    { fullName = "Théophile Kalumbu"
    , profileUrl = Just <| Twitter "kalu_theo"
    }


iamwarry : Speaker
iamwarry =
    { fullName = "Maxime Dantec"
    , profileUrl = Just <| Twitter "iamwarry"
    }


engelsjeroen : Speaker
engelsjeroen =
    { fullName = "Jeroen Engels"
    , profileUrl = Just <| Twitter "engelsjeroen"
    }
