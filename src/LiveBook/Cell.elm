module LiveBook.Cell exposing (view)

import Dict exposing (Dict)
import Element as E exposing (Element)
import Element.Background as Background
import Element.Events
import Element.Font as Font
import Element.Input
import List.Extra
import LiveBook.Chart
import LiveBook.Eval
import LiveBook.Process
import Types exposing (Cell, CellState(..), CellValue(..), FrontendModel, FrontendMsg(..), VisualType(..))
import UILibrary.Button as Button
import UILibrary.Color as Color
import View.CellThemed as MarkdownThemed


view : Dict String String -> Int -> String -> Cell -> Element FrontendMsg
view kvDict width cellContents cell =
    E.column
        [ E.paddingEach { top = 0, right = 0, bottom = 0, left = 0 }
        , E.width (E.px width)
        , Background.color (E.rgb 0.1 0.1 0.1)
        ]
        [ E.row
            [ E.width (E.px width) ]
            [ viewSourceAndValue kvDict width cellContents cell
            , controls cell
            ]
        ]


viewSourceAndValue : Dict String String -> Int -> String -> Cell -> Element FrontendMsg
viewSourceAndValue kvDict width cellContents cell =
    E.column [ E.alignBottom ]
        [ viewSource (width - controlWidth) cell cellContents
        , viewValue kvDict (width - controlWidth) cell
        ]


controls cell =
    E.column
        [ E.spacing 2
        , E.width (E.px controlWidth)
        , E.alignTop
        , E.height E.fill
        , E.paddingEach { top = 0, bottom = 8, left = 4, right = 0 }
        , Background.color Color.darkSteelGray
        ]
        [ viewIndex cell
        , newCellAt cell.cellState cell.index
        , deleteCellAt cell.cellState cell.index
        , clearCellAt cell.cellState cell.index
        ]


controlWidth =
    60


viewSource : Int -> Cell -> String -> Element FrontendMsg
viewSource width cell cellContent =
    case cell.cellState of
        CSView ->
            viewSource_ width cell

        CSEdit ->
            editCell width cell cellContent


viewValue kvDict width cell =
    E.paragraph
        [ E.spacing 8
        , Font.color Color.black
        , E.paddingEach { top = 8, right = 0, bottom = 12, left = 8 }
        , E.width (E.px width)
        , Background.color (E.rgb 0.85 0.85 0.95)
        ]
        [ case cell.value of
            CVNone ->
                E.text "-- unevaluated --"

            CVString str ->
                E.text str

            CVVisual vt args ->
                renderVT kvDict vt args
        ]


renderVT : Dict String String -> VisualType -> List String -> Element FrontendMsg
renderVT kvDict vt args =
    case vt of
        VTImage ->
            E.image
                []
                { src = getArg 0 args, description = "image" }

        VTChart ->
            let
                dict =
                    Dict.fromList [ ( "columns", "1" ), ( "lowest", "3700" ), ( "label", "S&P Index, 06/14/2021 to 06/10/2022" ) ]
            in
            LiveBook.Chart.chart [ "timeseries", "reverse" ] dict (args |> String.join "\\n" |> LiveBook.Eval.transformWordsWithKVDict kvDict)


getArg : Int -> List String -> String
getArg k args =
    List.Extra.getAt k args |> Maybe.withDefault "--"


viewIndex : Cell -> Element msg
viewIndex cell =
    E.el [ E.paddingEach { top = 8, bottom = 0, left = 8, right = 0 } ] (E.text <| String.fromInt (cell.index + 1))


viewSource_ width cell =
    let
        processedLines =
            LiveBook.Process.cellContents cell

        delta nLines =
            -- TODO: Bad code!
            if nLines == 1 then
                30

            else if nLines < 3 then
                10

            else if nLines < 8 then
                20

            else if nLines < 11 then
                40

            else
                50

        cellHeight_ =
            List.length processedLines |> (\x -> scale 14.5 x + delta x)

        source =
            processedLines |> String.join "\n"
    in
    E.column
        [ E.spacing 8
        , Element.Events.onMouseDown (EditCell cell.index)
        , E.paddingEach { top = 8, right = 0, bottom = 8, left = 0 }
        , E.width (E.px width)
        , Font.size 14
        ]
        [ MarkdownThemed.renderFull (scale 1.0 width)
            cellHeight_
            source
        ]


stepFunction : List ( number, number ) -> number -> number
stepFunction steps x =
    List.Extra.find (\( a, b ) -> x <= a) steps |> Maybe.map Tuple.second |> Maybe.withDefault 0


scale : Float -> Int -> Int
scale factor x =
    round <| factor * toFloat x


editCell : Int -> Cell -> String -> Element FrontendMsg
editCell width cell cellContent =
    E.column
        [ E.spacing 8
        , E.paddingEach { top = 1, right = 1, bottom = 1, left = 1 }
        , E.width (E.px width)
        , Background.color (E.rgb 0.1 0.1 0.8)
        ]
        [ Element.Input.multiline
            [ Background.color (E.rgb 0.8 0.8 1.0)
            , Font.color Color.black
            ]
            { onChange = InputElmCode cell.index
            , text = cellContent
            , placeholder = Nothing
            , label = Element.Input.labelHidden ""
            , spellcheck = False
            }
        ]


newCellAt : CellState -> Int -> Element FrontendMsg
newCellAt cellState index =
    case cellState of
        CSView ->
            Button.smallPrimary { msg = NewCell index, status = Button.ActiveTransparent, label = Button.Text "New", tooltipText = Just "Insert  new cell" }

        CSEdit ->
            E.none


deleteCellAt : CellState -> Int -> Element FrontendMsg
deleteCellAt cellState index =
    case cellState of
        CSView ->
            Button.smallPrimary { msg = DeleteCell index, status = Button.ActiveTransparent, label = Button.Text "Delete", tooltipText = Just "Insert  new cell" }

        CSEdit ->
            E.none


clearCellAt : CellState -> Int -> Element FrontendMsg
clearCellAt cellState index =
    case cellState of
        CSView ->
            E.none

        CSEdit ->
            Button.smallPrimary { msg = ClearCell index, status = Button.Active, label = Button.Text "x", tooltipText = Just "Edit cell" }
