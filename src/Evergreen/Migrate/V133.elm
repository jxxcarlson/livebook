module Evergreen.Migrate.V133 exposing (..)

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

import Evergreen.V115.LiveBook.DataSet
import Evergreen.V115.LiveBook.Types
import Evergreen.V115.Types
import Evergreen.V133.LiveBook.DataSet
import Evergreen.V133.LiveBook.Types
import Evergreen.V133.Types
import Lamdera.Migrations exposing (..)
import List


frontendModel : Evergreen.V115.Types.FrontendModel -> ModelMigration Evergreen.V133.Types.FrontendModel Evergreen.V133.Types.FrontendMsg
frontendModel old =
    ModelUnchanged


backendModel : Evergreen.V115.Types.BackendModel -> ModelMigration Evergreen.V133.Types.BackendModel Evergreen.V133.Types.BackendMsg
backendModel old =
    ModelUnchanged


frontendMsg : Evergreen.V115.Types.FrontendMsg -> MsgMigration Evergreen.V133.Types.FrontendMsg Evergreen.V133.Types.FrontendMsg
frontendMsg old =
    MsgMigrated ( migrate_Types_FrontendMsg old, Cmd.none )


toBackend : Evergreen.V115.Types.ToBackend -> MsgMigration Evergreen.V133.Types.ToBackend Evergreen.V133.Types.BackendMsg
toBackend old =
    MsgUnchanged


backendMsg : Evergreen.V115.Types.BackendMsg -> MsgMigration Evergreen.V133.Types.BackendMsg Evergreen.V133.Types.BackendMsg
backendMsg old =
    MsgUnchanged


toFrontend : Evergreen.V115.Types.ToFrontend -> MsgMigration Evergreen.V133.Types.ToFrontend Evergreen.V133.Types.FrontendMsg
toFrontend old =
    MsgUnchanged


migrate_LiveBook_DataSet_DataSetMetaData : Evergreen.V115.LiveBook.DataSet.DataSetMetaData -> Evergreen.V133.LiveBook.DataSet.DataSetMetaData
migrate_LiveBook_DataSet_DataSetMetaData old =
    old


migrate_LiveBook_Types_Book : Evergreen.V115.LiveBook.Types.Book -> Evergreen.V133.LiveBook.Types.Book
migrate_LiveBook_Types_Book old =
    { id = old.id
    , dirty = old.dirty
    , slug = old.slug
    , origin = old.origin
    , author = old.author
    , createdAt = old.createdAt
    , updatedAt = old.updatedAt
    , public = old.public
    , title = old.title
    , cells = old.cells |> List.map migrate_LiveBook_Types_Cell
    , currentIndex = old.currentIndex
    , initialStateString = old.initialStateString
    , stateExpression = old.stateExpression
    , stateBindings = old.stateBindings
    , fastTickInterval = old.fastTickInterval
    , stopExpressionString = old.stopExpressionString
    , valuesToKeep = old.valuesToKeep
    }


migrate_LiveBook_Types_Cell : Evergreen.V115.LiveBook.Types.Cell -> Evergreen.V133.LiveBook.Types.Cell
migrate_LiveBook_Types_Cell old =
    { index = old.index
    , text = old.text
    , bindings = old.bindings
    , expression = old.expression
    , value = old.value |> migrate_LiveBook_Types_CellValue
    , cellState = old.cellState |> migrate_LiveBook_Types_CellState
    , locked = old.locked
    }


migrate_LiveBook_Types_CellState : Evergreen.V115.LiveBook.Types.CellState -> Evergreen.V133.LiveBook.Types.CellState
migrate_LiveBook_Types_CellState old =
    case old of
        Evergreen.V115.LiveBook.Types.CSEdit ->
            Evergreen.V133.LiveBook.Types.CSEdit

        Evergreen.V115.LiveBook.Types.CSView ->
            Evergreen.V133.LiveBook.Types.CSView


migrate_LiveBook_Types_CellValue : Evergreen.V115.LiveBook.Types.CellValue -> Evergreen.V133.LiveBook.Types.CellValue
migrate_LiveBook_Types_CellValue old =
    case old of
        Evergreen.V115.LiveBook.Types.CVNone ->
            Evergreen.V133.LiveBook.Types.CVNone

        Evergreen.V115.LiveBook.Types.CVString p0 ->
            Evergreen.V133.LiveBook.Types.CVString p0

        Evergreen.V115.LiveBook.Types.CVVisual p0 p1 ->
            Evergreen.V133.LiveBook.Types.CVVisual (p0 |> migrate_LiveBook_Types_VisualType) p1

        Evergreen.V115.LiveBook.Types.CVPlot2D p0 p1 ->
            Evergreen.V133.LiveBook.Types.CVPlot2D p0 p1


migrate_LiveBook_Types_VisualType : Evergreen.V115.LiveBook.Types.VisualType -> Evergreen.V133.LiveBook.Types.VisualType
migrate_LiveBook_Types_VisualType old =
    case old of
        Evergreen.V115.LiveBook.Types.VTChart ->
            Evergreen.V133.LiveBook.Types.VTChart

        Evergreen.V115.LiveBook.Types.VTSvg ->
            Evergreen.V133.LiveBook.Types.VTSvg

        Evergreen.V115.LiveBook.Types.VTImage ->
            Evergreen.V133.LiveBook.Types.VTImage


migrate_Types_AppMode : Evergreen.V115.Types.AppMode -> Evergreen.V133.Types.AppMode
migrate_Types_AppMode old =
    case old of
        Evergreen.V115.Types.AMWorking ->
            Evergreen.V133.Types.AMWorking

        Evergreen.V115.Types.AMEditTitle ->
            Evergreen.V133.Types.AMEditTitle


migrate_Types_ClockState : Evergreen.V115.Types.ClockState -> Evergreen.V133.Types.ClockState
migrate_Types_ClockState old =
    case old of
        Evergreen.V115.Types.ClockRunning ->
            Evergreen.V133.Types.ClockRunning

        Evergreen.V115.Types.ClockStopped ->
            Evergreen.V133.Types.ClockStopped

        Evergreen.V115.Types.ClockPaused ->
            Evergreen.V133.Types.ClockPaused


migrate_Types_DataSetDescription : Evergreen.V115.Types.DataSetDescription -> Evergreen.V133.Types.DataSetDescription
migrate_Types_DataSetDescription old =
    case old of
        Evergreen.V115.Types.PublicDatasets ->
            Evergreen.V133.Types.PublicDatasets

        Evergreen.V115.Types.UserDatasets p0 ->
            Evergreen.V133.Types.UserDatasets p0


migrate_Types_FrontendMsg : Evergreen.V115.Types.FrontendMsg -> Evergreen.V133.Types.FrontendMsg
migrate_Types_FrontendMsg old =
    case old of
        Evergreen.V115.Types.UrlClicked p0 ->
            Evergreen.V133.Types.UrlClicked p0

        Evergreen.V115.Types.UrlChanged p0 ->
            Evergreen.V133.Types.UrlChanged p0

        Evergreen.V115.Types.NoOpFrontendMsg ->
            Evergreen.V133.Types.NoOpFrontendMsg

        Evergreen.V115.Types.FETick p0 ->
            Evergreen.V133.Types.FETick p0

        Evergreen.V115.Types.FastTick p0 ->
            Evergreen.V133.Types.FastTick p0

        Evergreen.V115.Types.KeyboardMsg p0 ->
            Evergreen.V133.Types.KeyboardMsg p0

        Evergreen.V115.Types.GetRandomProbabilities p0 ->
            Evergreen.V133.Types.GetRandomProbabilities p0

        Evergreen.V115.Types.GotRandomProbabilities p0 ->
            Evergreen.V133.Types.GotRandomProbabilities p0

        Evergreen.V115.Types.StringDataRequested p0 p1 ->
            Evergreen.V133.Types.StringDataRequested p0 p1

        Evergreen.V115.Types.StringDataSelected p0 p1 p2 ->
            Evergreen.V133.Types.StringDataSelected p0 p1 p2

        Evergreen.V115.Types.StringDataLoaded p0 p1 p2 p3 ->
            Evergreen.V133.Types.StringDataLoaded p0 p1 p2 p3

        Evergreen.V115.Types.InputName p0 ->
            Evergreen.V133.Types.InputName p0

        Evergreen.V115.Types.InputIdentifier p0 ->
            Evergreen.V133.Types.InputIdentifier p0

        Evergreen.V115.Types.InputDescription p0 ->
            Evergreen.V133.Types.InputDescription p0

        Evergreen.V115.Types.InputComments p0 ->
            Evergreen.V133.Types.InputComments p0

        Evergreen.V115.Types.InputData p0 ->
            Evergreen.V133.Types.InputData p0

        Evergreen.V115.Types.InputAuthor p0 ->
            Evergreen.V133.Types.InputAuthor p0

        Evergreen.V115.Types.InputInitialStateValue p0 ->
            Evergreen.V133.Types.InputInitialStateValue p0

        Evergreen.V115.Types.InputFastTickInterval p0 ->
            Evergreen.V133.Types.InputFastTickInterval p0

        Evergreen.V115.Types.InputStateExpression p0 ->
            Evergreen.V133.Types.InputStateExpression p0

        Evergreen.V115.Types.InputStateBindings p0 ->
            Evergreen.V133.Types.InputStateBindings p0

        Evergreen.V115.Types.InputStopExpression p0 ->
            Evergreen.V133.Types.InputStopExpression p0

        Evergreen.V115.Types.InputValuesToKeep p0 ->
            Evergreen.V133.Types.InputValuesToKeep p0

        Evergreen.V115.Types.AskToListDataSets p0 ->
            Evergreen.V133.Types.AskToListDataSets (p0 |> migrate_Types_DataSetDescription)

        Evergreen.V115.Types.AskToSaveDataSet p0 ->
            Evergreen.V133.Types.AskToSaveDataSet (p0 |> migrate_LiveBook_DataSet_DataSetMetaData)

        Evergreen.V115.Types.AskToCreateDataSet ->
            Evergreen.V133.Types.AskToCreateDataSet

        Evergreen.V115.Types.AskToDeleteDataSet p0 ->
            Evergreen.V133.Types.AskToDeleteDataSet (p0 |> migrate_LiveBook_DataSet_DataSetMetaData)

        Evergreen.V115.Types.ToggleCellLock p0 ->
            Evergreen.V133.Types.ToggleCellLock (p0 |> migrate_LiveBook_Types_Cell)

        Evergreen.V115.Types.NewCell p0 ->
            Evergreen.V133.Types.NewCell p0

        Evergreen.V115.Types.DeleteCell p0 ->
            Evergreen.V133.Types.DeleteCell p0

        Evergreen.V115.Types.EditCell p0 ->
            Evergreen.V133.Types.EditCell (p0 |> migrate_LiveBook_Types_Cell)

        Evergreen.V115.Types.ClearCell p0 ->
            Evergreen.V133.Types.ClearCell p0

        Evergreen.V115.Types.EvalCell p0 ->
            Evergreen.V133.Types.EvalCell p0

        Evergreen.V115.Types.InputElmCode p0 p1 ->
            Evergreen.V133.Types.InputElmCode p0 p1

        Evergreen.V115.Types.UpdateNotebookTitle ->
            Evergreen.V133.Types.UpdateNotebookTitle

        Evergreen.V115.Types.NewNotebook ->
            Evergreen.V133.Types.NewNotebook

        Evergreen.V115.Types.ProposeDeletingNotebook ->
            Evergreen.V133.Types.ProposeDeletingNotebook

        Evergreen.V115.Types.CancelDeleteNotebook ->
            Evergreen.V133.Types.CancelDeleteNotebook

        Evergreen.V115.Types.ChangeAppMode p0 ->
            Evergreen.V133.Types.ChangeAppMode (p0 |> migrate_Types_AppMode)

        Evergreen.V115.Types.SetClock p0 ->
            Evergreen.V133.Types.SetClock (p0 |> migrate_Types_ClockState)

        Evergreen.V115.Types.SetState ->
            Evergreen.V133.Types.SetState

        Evergreen.V115.Types.Reset ->
            Evergreen.V133.Types.Reset

        Evergreen.V115.Types.TogglePublic ->
            Evergreen.V133.Types.TogglePublic

        Evergreen.V115.Types.ClearNotebookValues ->
            Evergreen.V133.Types.ClearNotebookValues

        Evergreen.V115.Types.SetCurrentNotebook p0 ->
            Evergreen.V133.Types.SetCurrentNotebook (p0 |> migrate_LiveBook_Types_Book)

        Evergreen.V115.Types.CloneNotebook ->
            Evergreen.V133.Types.CloneNotebook

        Evergreen.V115.Types.PullNotebook ->
            Evergreen.V133.Types.PullNotebook

        Evergreen.V115.Types.ExportNotebook ->
            Evergreen.V133.Types.ExportNotebook

        Evergreen.V115.Types.SetShowNotebooksState p0 ->
            Evergreen.V133.Types.SetShowNotebooksState (p0 |> migrate_Types_ShowNotebooks)

        Evergreen.V115.Types.ImportRequested ->
            Evergreen.V133.Types.ImportRequested

        Evergreen.V115.Types.ImportSelected p0 ->
            Evergreen.V133.Types.ImportSelected p0

        Evergreen.V115.Types.ImportLoaded p0 ->
            Evergreen.V133.Types.ImportLoaded p0

        Evergreen.V115.Types.ChangePopup p0 ->
            Evergreen.V133.Types.ChangePopup (p0 |> migrate_Types_PopupState)

        Evergreen.V115.Types.GotViewport p0 ->
            Evergreen.V133.Types.GotViewport p0

        Evergreen.V115.Types.GotNewWindowDimensions p0 p1 ->
            Evergreen.V133.Types.GotNewWindowDimensions p0 p1

        Evergreen.V115.Types.SignUp ->
            Evergreen.V133.Types.SignUp

        Evergreen.V115.Types.SignIn ->
            Evergreen.V133.Types.SignIn

        Evergreen.V115.Types.SignOut ->
            Evergreen.V133.Types.SignOut

        Evergreen.V115.Types.SetSignupState p0 ->
            Evergreen.V133.Types.SetSignupState (p0 |> migrate_Types_SignupState)

        Evergreen.V115.Types.InputUsername p0 ->
            Evergreen.V133.Types.InputUsername p0

        Evergreen.V115.Types.InputSignupUsername p0 ->
            Evergreen.V133.Types.InputSignupUsername p0

        Evergreen.V115.Types.InputPassword p0 ->
            Evergreen.V133.Types.InputPassword p0

        Evergreen.V115.Types.InputPasswordAgain p0 ->
            Evergreen.V133.Types.InputPasswordAgain p0

        Evergreen.V115.Types.InputEmail p0 ->
            Evergreen.V133.Types.InputEmail p0

        Evergreen.V115.Types.InputTitle p0 ->
            Evergreen.V133.Types.InputTitle p0

        Evergreen.V115.Types.InputCloneReference p0 ->
            Evergreen.V133.Types.InputCloneReference p0

        Evergreen.V115.Types.AdminRunTask ->
            Evergreen.V133.Types.AdminRunTask

        Evergreen.V115.Types.GetUsers ->
            Evergreen.V133.Types.GetUsers


migrate_Types_PopupState : Evergreen.V115.Types.PopupState -> Evergreen.V133.Types.PopupState
migrate_Types_PopupState old =
    case old of
        Evergreen.V115.Types.NoPopup ->
            Evergreen.V133.Types.NoPopup

        Evergreen.V115.Types.AdminPopup ->
            Evergreen.V133.Types.AdminPopup

        Evergreen.V115.Types.ManualPopup ->
            Evergreen.V133.Types.ManualPopup

        Evergreen.V115.Types.NewDataSetPopup ->
            Evergreen.V133.Types.NewDataSetPopup

        Evergreen.V115.Types.EditDataSetPopup p0 ->
            Evergreen.V133.Types.EditDataSetPopup (p0 |> migrate_LiveBook_DataSet_DataSetMetaData)

        Evergreen.V115.Types.SignUpPopup ->
            Evergreen.V133.Types.SignUpPopup

        Evergreen.V115.Types.NewNotebookPopup ->
            Evergreen.V133.Types.NewNotebookPopup

        Evergreen.V115.Types.StateEditorPopup ->
            Evergreen.V133.Types.StateEditorPopup

        Evergreen.V115.Types.ViewPublicDataSetsPopup ->
            Evergreen.V133.Types.ViewPublicDataSetsPopup

        Evergreen.V115.Types.ViewPrivateDataSetsPopup ->
            Evergreen.V133.Types.ViewPrivateDataSetsPopup


migrate_Types_ShowNotebooks : Evergreen.V115.Types.ShowNotebooks -> Evergreen.V133.Types.ShowNotebooks
migrate_Types_ShowNotebooks old =
    case old of
        Evergreen.V115.Types.ShowUserNotebooks ->
            Evergreen.V133.Types.ShowUserNotebooks

        Evergreen.V115.Types.ShowPublicNotebooks ->
            Evergreen.V133.Types.ShowPublicNotebooks


migrate_Types_SignupState : Evergreen.V115.Types.SignupState -> Evergreen.V133.Types.SignupState
migrate_Types_SignupState old =
    case old of
        Evergreen.V115.Types.ShowSignUpForm ->
            Evergreen.V133.Types.ShowSignUpForm

        Evergreen.V115.Types.HideSignUpForm ->
            Evergreen.V133.Types.HideSignUpForm
