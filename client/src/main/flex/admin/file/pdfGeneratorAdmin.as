package flex.admin.file {
import flash.utils.ByteArray;

import flex.common.data.GridRow;

import flex.common.data.Holiday;
import flex.common.data.HolidaysForUser;

import mx.collections.ArrayCollection;
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

public class PdfGeneratorAdmin {

    private var pdfData:ArrayCollection;


    [Embed(source="/flex/common/font/DejaVuSans.ttf", mimeType="application/octet-stream")]
    private var fontStream:Class;

    [Embed(source="/flex/common/font/DejaVuSans.afm", mimeType="application/octet-stream")]
    private var afmStream:Class;

    public function PdfGeneratorAdmin(data:Object) {
        pdfData = new ArrayCollection();
        for (var name:String in data) {
            var holidays:HolidaysForUser = new HolidaysForUser();
            holidays.userString = name;
            for each (var holiday:Holiday in data[name]) {
                holidays.holidays.push(holiday);
            }
            pdfData.addItem(holidays);
        }
        var sort:Sort = new Sort();
        sort.fields = [new SortField('userString', true)];
        pdfData.sort = sort;
        pdfData.refresh();
    }

    public function generate():ByteArray {
        var printPDF:PDF = new PDF(Orientation.PORTRAIT, Unit.MM, Size.A4);
        var data:Array = new Array();
        printPDF.addPage();
        printPDF.setDisplayMode(Display.FULL_PAGE);
        printPDF.setAuthor("Maksymilian Małek");
        printPDF.setTitle("test pdf");
        printPDF.setSubject("temat dowolny");
        printPDF.setMargins(25, 20, 25, 20);
        printPDF.setFont(new EmbeddedFont(new fontStream(), new afmStream(), CodePage.CP1250), 12);
        printPDF.textStyle(new RGBColor(0x000000), 1);
        for(var index:int = 0; index < pdfData.length ; index++) {
            if (index != 0 ) {
                printPDF.addPage();
            }
            printPDF.writeText(15, "Raport dla użytkownika : " + pdfData.getItemAt(index).userString + ".\n\n");
            printPDF.setFontSize(12);
            var gridColumnCause:GridColumn = new GridColumn("Cause", "cause", 40, Align.CENTER, Align.CENTER);
            var gridColumnStatus:GridColumn = new GridColumn("Status", "status", 40, Align.CENTER, Align.CENTER);
            var gridColumnDateFrom:GridColumn = new GridColumn("Date from", "dateFrom", 30, Align.CENTER, Align.RIGHT);
            var gridColumnDateTo:GridColumn = new GridColumn("Date to", "dateTo", 30, Align.CENTER, Align.RIGHT);
            var columns:Array = new Array(gridColumnCause, gridColumnStatus, gridColumnDateFrom, gridColumnDateTo);
            var pdfDataUser:Array = pdfData.getItemAt(index).holidays;
            for each (var holiday:Holiday in pdfDataUser) {
                var row:GridRow = new GridRow();
                row.cause = holiday.cause.toString();
                row.dateFrom = holiday.dateFrom.getFullYear() + "-" + (holiday.dateFrom.getMonth() + 1) + "-" + holiday.dateFrom.getDate() ;
                row.dateTo = holiday.dateTo.getFullYear() + "-" + (holiday.dateTo.getMonth() + 1) + "-" + holiday.dateTo.getDate();
                row.status = holiday.status;
                data.push(row);
            }
            var grid:Grid = new Grid(data, 190, 200, new RGBColor(0x000229), new RGBColor(0x2255CC), true, new RGBColor(0xFFFFFF), 0.5, Joint.BEVEL, columns);
            printPDF.addGrid(grid);
        }
        var bytes:ByteArray = printPDF.save(Method.LOCAL);
        return bytes;
    }


}

}