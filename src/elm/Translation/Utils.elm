module Translation.Utils
    exposing
        ( Language(..)
        , TranslationId(..)
        , translateObject
        , newtranslate
        , Translator
        )

-- FR = French, DE = German, IT = Italian, EN = English

import Decisions.Types exposing (Category)


type alias TranslationSet =
    { english : String
    , french : String
    , german : String
    , italian : String
    }


type TranslationId
    = MyLogin
    | Welcome String
    | Dashboard
    | Register
    | Edit
    | Logout
    | Login_id
    | ForgotPassword_id
    | Follow_id
    | UnFollow_id
    | Name String
    | Initiatives_id
    | Create
    | MyInitiatives_id
    | MyVotes
    | MyFavorites
    | MyProfile
    | Title_id
    | Name_id
    | Given_name_id
    | Default_id
    | Home_Act_id
    | Home_People_id
    | Validate_Blank_id
    | Email_id
    | Password_id
    | Confirm_Password_id
    | Submit_id
    | RememberPassword_id
    | Label_Language_id
    | Ideas_id
    | Request_certificate_id
    | Certificated_status_id
    | Status_id
    | Report_lable_id
    | Birth
    | Permit


type Language
    = English
    | French
    | German
    | Italian


translateObject : Language -> Category -> String
translateObject language category =
    case language of
        English ->
            category.name

        French ->
            category.name_fr

        German ->
            category.name_de

        Italian ->
            category.name_it



{- _ ->
   category.name_gb
-}


gettranset : TranslationId -> TranslationSet
gettranset trans =
    case trans of
        MyLogin ->
            TranslationSet "Please login" "Por favor haga login" "Please login" "Accedete, per favore"

        Welcome val ->
            TranslationSet ("Welcome  " ++ val) ("Bienvenido " ++ val) ("Bienvenido " ++ val) ("Bienvenido " ++ val)

        Name val ->
            TranslationSet ("Hello, this is  " ++ val) ("Hello, this is " ++ val) ("Hello, this is " ++ val) ("Hello, this is " ++ val)

        Dashboard ->
            TranslationSet "Dasboard" "Tableau de bord" "Armaturenbrett" "Cruscotto"

        Register ->
            TranslationSet "Register" "Registre" "Registrieren" "Registro"

        Edit ->
            TranslationSet "Edit" "Modifier" "Modifier" "Modifica"

        Logout ->
            TranslationSet "Logout" "Se déconnecter" "Ausloggen" "Disconnettersi"

        Login_id ->
            TranslationSet "Login" "S'identifier" "Einloggen" "Accesso"

        ForgotPassword_id ->
            TranslationSet "Forgot Password" "Mot De Passe Oublié" "Forgot" "Forgot"

        Follow_id ->
            TranslationSet "Follow" "Suivre" "Suivre" "Suivre"

        UnFollow_id ->
            TranslationSet "Un Follow" "Ne pas suivre" "Un Follow" "Un Follow"

        Initiatives_id ->
            TranslationSet "Initiatives" "Initiatives" "Initiativen" "Iniziative"

        Create ->
            TranslationSet "Create" "Créer" "Schaffen" "Creare"

        MyInitiatives_id ->
            TranslationSet "My Initiatives" "Mes Initiatives" "Meine initiativen" "Le Mie Iniziative"

        MyVotes ->
            TranslationSet "My Votes" "Mes votes" "Meine stimmen" "i miei voti"

        MyFavorites ->
            TranslationSet "My Favorites" "Mes favoris" "Meine favoriten" "I miei preferiti"

        MyProfile ->
            TranslationSet "My Profile" "Mon profil" "Mein Profil" "Il mio profilo"

        Title_id ->
            TranslationSet "Title" "Titre" "Titre_ge" "Titre_it"

        Name_id ->
            TranslationSet "Name" "Name" "Name" "Nome"

        Given_name_id ->
            TranslationSet "Given Name" "Prénom" "Vorname" "Dato nome"

        Home_Act_id ->
            TranslationSet "Summary" "Summary_fr" "Summary_de" "Summary_it"

        Validate_Blank_id ->
            TranslationSet "Can't be blank" "Ne peut pas être vide" "Can't be blank_de" "Can't be blank_it"

        Email_id ->
            TranslationSet "Email" "Adresse Email" "Email" "Email"

        Password_id ->
            TranslationSet "Password" "Mot de passe" "Password_de" "Passowrd_it"

        Confirm_Password_id ->
            TranslationSet "Confirm Password" "Mot de passe" "Password_de" "Passowrd_it"

        Submit_id ->
            TranslationSet "Submit" "Valider" "Submit_de" "Submit_it"

        RememberPassword_id ->
            TranslationSet "Remember Password" "Se souvenir du mot de passe" "Remember_de" "Remember_it"

        Label_Language_id ->
            TranslationSet "Language" "RLangue" "Sprache" "Lingua"

        Ideas_id ->
            TranslationSet "Ideas" "Idées" "Ideen" "Idee"

        Request_certificate_id ->
            TranslationSet
                "Request to get certificated"
                "Accéder au statut certifé"
                "Accéder au statut certifé"
                "Accéder au statut certifé"

        Certificated_status_id ->
            TranslationSet
                "Your status : "
                "Votre statut est : "
                "Votre statut est : "
                "Votre statut est : "

        Status_id ->
            TranslationSet "Status" "Statut" "Statut" "Statut"

        Report_lable_id ->
            TranslationSet "What is the reason ?" "Quelle règle est enfreinte ?" "Quelle règle est enfreinte ? " "Quelle règle est enfreinte ? "

        Birth ->
            TranslationSet "Birth date" "Date de naissance" "Geburtsdatum" "Data di nascita"

        Permit ->
            TranslationSet "Permit" "Permis de séjour" "Aufenthaltserlaubnis" "permesso di soggiorno"

        _ ->
            TranslationSet "?" "?" "?" "?"


type alias Translator =
    TranslationId -> String


translatorEnglish : TranslationId -> String
translatorEnglish trans =
    let
        translationSet =
            gettranset trans
    in
        .english translationSet


translatorFrench : TranslationId -> String
translatorFrench trans =
    let
        translationSet =
            gettranset trans
    in
        .french translationSet


translatorGerman : TranslationId -> String
translatorGerman trans =
    let
        translationSet =
            gettranset trans
    in
        .german translationSet


translatorItalian : TranslationId -> String
translatorItalian trans =
    let
        translationSet =
            gettranset trans
    in
        .italian translationSet


newtranslate : Language -> Translator
newtranslate language =
    case language of
        English ->
            translatorEnglish

        French ->
            translatorFrench

        German ->
            translatorGerman

        Italian ->
            translatorItalian



-- call: translate TranslationId  = translator TranslationId
