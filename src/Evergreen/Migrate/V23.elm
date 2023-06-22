module Evergreen.Migrate.V23 exposing (..)

{-| This migration file was automatically generated by the lamdera compiler.

It includes:

  - A migration for each of the 6 Lamdera core types that has changed
  - A function named `migrate_ModuleName_TypeName` for each changed/custom type

Expect to see:

  - `Unimplementеd` values as placeholders wherever I was unable to figure out a clear migration path for you
  - `@NOTICE` comments for things you should know about, i.e. new custom type constructors that won't get any
    value mappings from the old type by default

You can edit this file however you wish! It won't be generated again.

See <https://dashboard.lamdera.com/docs/evergreen> for more info.

-}

import Evergreen.V19.Types
import Evergreen.V23.Types
import Lamdera.Migrations exposing (..)
import List


frontendModel : Evergreen.V19.Types.FrontendModel -> ModelMigration Evergreen.V23.Types.FrontendModel Evergreen.V23.Types.FrontendMsg
frontendModel old =
    ModelUnchanged


backendModel : Evergreen.V19.Types.BackendModel -> ModelMigration Evergreen.V23.Types.BackendModel Evergreen.V23.Types.BackendMsg
backendModel old =
    ModelUnchanged


frontendMsg : Evergreen.V19.Types.FrontendMsg -> MsgMigration Evergreen.V23.Types.FrontendMsg Evergreen.V23.Types.FrontendMsg
frontendMsg old =
    MsgMigrated ( migrate_Types_FrontendMsg old, Cmd.none )


toBackend : Evergreen.V19.Types.ToBackend -> MsgMigration Evergreen.V23.Types.ToBackend Evergreen.V23.Types.BackendMsg
toBackend old =
    MsgUnchanged


backendMsg : Evergreen.V19.Types.BackendMsg -> MsgMigration Evergreen.V23.Types.BackendMsg Evergreen.V23.Types.BackendMsg
backendMsg old =
    MsgUnchanged


toFrontend : Evergreen.V19.Types.ToFrontend -> MsgMigration Evergreen.V23.Types.ToFrontend Evergreen.V23.Types.FrontendMsg
toFrontend old =
    MsgUnchanged


migrate_Types_AppMode : Evergreen.V19.Types.AppMode -> Evergreen.V23.Types.AppMode
migrate_Types_AppMode old =
    case old of
        Evergreen.V19.Types.AMWorking ->
            Evergreen.V23.Types.AMWorking

        Evergreen.V19.Types.AMEditTitle ->
            Evergreen.V23.Types.AMEditTitle


migrate_Types_Book : Evergreen.V19.Types.Book -> Evergreen.V23.Types.Book
migrate_Types_Book old =
    { id = old.id
    , dirty = old.dirty
    , slug = old.slug
    , author = old.author
    , createdAt = old.createdAt
    , updatedAt = old.updatedAt
    , public = old.public
    , title = old.title
    , cells = old.cells |> List.map migrate_Types_Cell
    , currentIndex = old.currentIndex
    }


migrate_Types_Cell : Evergreen.V19.Types.Cell -> Evergreen.V23.Types.Cell
migrate_Types_Cell old =
    { index = old.index
    , text = old.text
    , value = old.value
    , cellState = old.cellState |> migrate_Types_CellState
    }


migrate_Types_CellState : Evergreen.V19.Types.CellState -> Evergreen.V23.Types.CellState
migrate_Types_CellState old =
    case old of
        Evergreen.V19.Types.CSEdit ->
            Evergreen.V23.Types.CSEdit

        Evergreen.V19.Types.CSView ->
            Evergreen.V23.Types.CSView


migrate_Types_FrontendMsg : Evergreen.V19.Types.FrontendMsg -> Evergreen.V23.Types.FrontendMsg
migrate_Types_FrontendMsg old =
    case old of
        Evergreen.V19.Types.UrlClicked p0 ->
            Evergreen.V23.Types.UrlClicked p0

        Evergreen.V19.Types.UrlChanged p0 ->
            Evergreen.V23.Types.UrlChanged p0

        Evergreen.V19.Types.NoOpFrontendMsg ->
            Evergreen.V23.Types.NoOpFrontendMsg

        Evergreen.V19.Types.FETick p0 ->
            Evergreen.V23.Types.FETick p0

        Evergreen.V19.Types.KeyboardMsg p0 ->
            Evergreen.V23.Types.KeyboardMsg p0

        Evergreen.V19.Types.NewCell p0 ->
            Evergreen.V23.Types.NewCell p0

        Evergreen.V19.Types.EditCell p0 ->
            Evergreen.V23.Types.EditCell p0

        Evergreen.V19.Types.ClearCell p0 ->
            Evergreen.V23.Types.ClearCell p0

        Evergreen.V19.Types.EvalCell p0 ->
            Evergreen.V23.Types.EvalCell p0

        Evergreen.V19.Types.InputElmCode p0 p1 ->
            Evergreen.V23.Types.InputElmCode p0 p1

        Evergreen.V19.Types.UpdateNotebookTitle ->
            Evergreen.V23.Types.UpdateNotebookTitle

        Evergreen.V19.Types.NewNotebook ->
            Evergreen.V23.Types.NewNotebook

        Evergreen.V19.Types.ChangeAppMode p0 ->
            Evergreen.V23.Types.ChangeAppMode (p0 |> migrate_Types_AppMode)

        Evergreen.V19.Types.SetCurrentNotebook p0 ->
            Evergreen.V23.Types.SetCurrentNotebook (p0 |> migrate_Types_Book)

        Evergreen.V19.Types.ChangePopup p0 ->
            Evergreen.V23.Types.ChangePopup (p0 |> migrate_Types_PopupState)

        Evergreen.V19.Types.GotViewport p0 ->
            Evergreen.V23.Types.GotViewport p0

        Evergreen.V19.Types.GotNewWindowDimensions p0 p1 ->
            Evergreen.V23.Types.GotNewWindowDimensions p0 p1

        Evergreen.V19.Types.SignUp ->
            Evergreen.V23.Types.SignUp

        Evergreen.V19.Types.SignIn ->
            Evergreen.V23.Types.SignIn

        Evergreen.V19.Types.SignOut ->
            Evergreen.V23.Types.SignOut

        Evergreen.V19.Types.SetSignupState p0 ->
            Evergreen.V23.Types.SetSignupState (p0 |> migrate_Types_SignupState)

        Evergreen.V19.Types.InputUsername p0 ->
            Evergreen.V23.Types.InputUsername p0

        Evergreen.V19.Types.InputSignupUsername p0 ->
            Evergreen.V23.Types.InputSignupUsername p0

        Evergreen.V19.Types.InputPassword p0 ->
            Evergreen.V23.Types.InputPassword p0

        Evergreen.V19.Types.InputPasswordAgain p0 ->
            Evergreen.V23.Types.InputPasswordAgain p0

        Evergreen.V19.Types.InputEmail p0 ->
            Evergreen.V23.Types.InputEmail p0

        Evergreen.V19.Types.InputTitle p0 ->
            Evergreen.V23.Types.InputTitle p0

        Evergreen.V19.Types.AdminRunTask ->
            Evergreen.V23.Types.AdminRunTask

        Evergreen.V19.Types.GetUsers ->
            Evergreen.V23.Types.GetUsers


migrate_Types_PopupState : Evergreen.V19.Types.PopupState -> Evergreen.V23.Types.PopupState
migrate_Types_PopupState old =
    case old of
        Evergreen.V19.Types.NoPopup ->
            Evergreen.V23.Types.NoPopup

        Evergreen.V19.Types.AdminPopup ->
            Evergreen.V23.Types.AdminPopup

        Evergreen.V19.Types.SignUpPopup ->
            Evergreen.V23.Types.SignUpPopup

        Evergreen.V19.Types.NewNotebookPopup ->
            Evergreen.V23.Types.NewNotebookPopup


migrate_Types_SignupState : Evergreen.V19.Types.SignupState -> Evergreen.V23.Types.SignupState
migrate_Types_SignupState old =
    case old of
        Evergreen.V19.Types.ShowSignUpForm ->
            Evergreen.V23.Types.ShowSignUpForm

        Evergreen.V19.Types.HideSignUpForm ->
            Evergreen.V23.Types.HideSignUpForm
