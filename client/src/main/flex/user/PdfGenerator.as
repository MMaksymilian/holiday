package flex.user {
import flash.events.EventDispatcher;
import flash.geom.Rectangle;
import flash.utils.ByteArray;

import flex.data.HolidaysInMonth;

import mx.collections.ArrayCollection;

import mx.collections.ArrayList;
import mx.collections.Sort;
import mx.collections.SortField;
import mx.controls.Alert;

import org.alivepdf.colors.RGBColor;
import org.alivepdf.data.Grid;
import org.alivepdf.data.GridColumn;
import org.alivepdf.display.Display;
import org.alivepdf.drawing.Joint;
import org.alivepdf.fonts.CodePage;
import org.alivepdf.fonts.EmbeddedFont;
import org.alivepdf.layout.Align;
import org.alivepdf.layout.Orientation;
import org.alivepdf.layout.Size;
import org.alivepdf.layout.Unit;
import org.alivepdf.pdf.PDF;
import org.alivepdf.saving.Method;

public class PdfGenerator extends EventDispatcher {

    private var pdfData:ArrayCollection;

    public function PdfGenerator(mapObject:Object) {
        pdfData = new ArrayCollection();
        for (var i:String in mapObject) {
            var holidaysThisMonth:HolidaysInMonth = new HolidaysInMonth();
            pdfData.addItem(holidaysThisMonth);
            holidaysThisMonth.month = i;
            for each (var holiday in mapObject[i]) {
                holidaysThisMonth.holidays.push(holiday);
            }
        }
        var sort:Sort = new Sort();
        sort.fields = [new SortField('month', true)];
        sort.compareFunction = compareValues;
        pdfData.sort = sort;
        pdfData.refresh();
    }

    private function compareValues(a:Object, b:Object, fields:Array = null):int
    {
        if (a.month.substring(3) > b.month.substring(3)) {
            return 1;
        }

        if (a.month.substring(3) < b.month.substring(3)) {
            return -1;
        }

        if (a.month.substring(0,2) > b.month.substring(0,2)) {
            return 1;
        }

        if (a.month.substring(0,2) < b.month.substring(0,2)) {
            return -1;
        }

        return 0;
    }

    [Embed(source="DejaVuSans.ttf", mimeType="application/octet-stream")]
    private var fontStream:Class;

    [Embed(source="DejaVuSans.afm", mimeType="application/octet-stream")]
    private var afmStream:Class;

    public function generatePDF():ByteArray {
        var printPDF:PDF = new PDF(Orientation.PORTRAIT, Unit.MM, Size.A4);
        printPDF.setDisplayMode(Display.FULL_PAGE);
        printPDF.setAuthor("Maksymilian Małek");
        printPDF.setTitle("test pdf");
        printPDF.setSubject("temat dowolny");
        printPDF.setMargins(25, 20, 25, 20);
        printPDF.addPage();

        /*zwyk�y tekst*/
        printPDF.setX(45);
        printPDF.writeText(10, "Nad rzeczką opodal krzaczka,\n mieszkała Kaczka Dziwaczka \nLecz zamiast trzymać się rzeczki \nRobiła piesze wycieczki \nRaz posz�a wi�c do fryzjera: Poprosz� o kilo sera! \nTu� obok by�a apteka: Poprosz� mleka pi�� deka. \nZ apteki posz�a do praczki skupowa� poczytowe znaczki. \nGryz�y si� kaczki okropnie: A niech t� kaczk� g� kopnie!\n");
        /*zwyk�y tekst*/

        /*GRID - wszystko na pocz�tku jest potrzebne, aby u�wya� grid'a, columns nie jest potrzebne*/
//        printPDF.setFontSize(18);
//        var arialFont:IFont = new CoreFont ( FontFamily.TIMES );
//        printPDF.setFont( arialFont , 18);
        printPDF.setFont(new EmbeddedFont(new fontStream(), new afmStream(), CodePage.CP1250), 12);
        printPDF.textStyle(new RGBColor(0x000000), 1);
        // create columns to specify the column order

        var index:int;
        for (index = 0; index < pdfData.length; index++) {
            printPDF.addPage();
            printPDF.setFontSize(15);
            printPDF.writeText(15, " Raport za miesiąc  " + pdfData.getItemAt(index).month + "\n\n");
            printPDF.setFontSize(12);
            var gridColumnCause:GridColumn = new GridColumn("Cause", "cause", 40, Align.CENTER, Align.CENTER);
            var gridColumnStatus:GridColumn = new GridColumn("Status", "status", 40, Align.CENTER, Align.CENTER);
            var gridColumnDateFrom:GridColumn = new GridColumn("Date from", "dateFrom", 30, Align.CENTER, Align.RIGHT);
            var gridColumnDateTo:GridColumn = new GridColumn("Date to", "dateTo", 30, Align.CENTER, Align.RIGHT);
            var pdfDataMonth:Array = pdfData.getItemAt(index).holidays;
            var data:Array = new Array();
            for ( var singleH = 0; singleH < pdfDataMonth.length ; singleH++) {
                var row:GridRow = new GridRow();
                row.cause = pdfDataMonth[singleH].cause.toString();
                row.dateFrom = pdfDataMonth[singleH].dateFrom.getFullYear() + "-" + (pdfDataMonth[singleH].dateFrom.getMonth() + 1) + "-" + pdfDataMonth[singleH].dateFrom.getDate() ;
                row.dateTo = pdfDataMonth[singleH].dateTo.getFullYear() + "-" + (pdfDataMonth[singleH].dateTo.getMonth() + 1) + "-" + pdfDataMonth[singleH].dateTo.getDate();
                row.status = pdfDataMonth[singleH].status;
                data.push(row);
            }
            /*można użyć prościej - tego, jeśli tylko nie ma daty albo innych, gdzie jest użyty toString(), który zwraca nie to co byśmy chcieli*/
//            var data:Array = pdfData.getItemAt(index).holidays;
            var columns:Array = new Array(gridColumnCause, gridColumnStatus, gridColumnDateFrom, gridColumnDateTo);
            var grid:Grid = new Grid(data, 190, 200, new RGBColor(0x000229), new RGBColor(0x2255CC), true, new RGBColor(0xFFFFFF), 0.5, Joint.MITER, columns);
            grid.columns = columns;
            printPDF.addGrid(grid);
        }
//            printPDF.setFont( FontFamily.HELVETICA, Style.BOLD );
        //nie spowoduje zmiany linii
//        printPDF.addText("My Teax",1,10);
//        printPDF.addCell(100, 5, "Napis");
//        printPDF.addMultiCell(300, 1, "This is my PDF Headline");

        printPDF.textStyle(new RGBColor(0x6598FF));
        printPDF.drawCircle(105, 15, 3);
        printPDF.lineStyle(new RGBColor(0x3498AA), 1, .3, .2, "EvenOdd", null);
        printPDF.beginFill(new RGBColor(0x3482AA));
        printPDF.drawRect(new Rectangle(420, 46, 100, 45));
        printPDF.end();
        printPDF.endFill();

        printPDF.addBookmark("zakładka", 0, 0, new RGBColor(0x990000));
        printPDF.addBookmark("zakładka", 1, 1);

        var bytes:ByteArray = printPDF.save(Method.LOCAL);
        return bytes;
    }
}
}