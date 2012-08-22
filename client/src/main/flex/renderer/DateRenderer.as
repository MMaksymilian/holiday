package flex.renderer {
import mx.controls.Label;
import mx.formatters.DateFormatter;

public class DateRenderer extends Label {

    public static const formatter:DateFormatter = new DateFormatter();
    formatter.formatString = 'DD - MM - YYYY';

    public function DateRenderer() {
    }

    override public function set text(value:String):void {
        super.text = formatter.format(data[listData["dataField"]]);
    }

}
}