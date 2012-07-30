package flex.renderer {
import mx.controls.Alert;
import mx.controls.Label;
import mx.controls.dataGridClasses.DataGridListData;

public class ColorRenderer extends Label {

        override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
            super.updateDisplayList(unscaledWidth, unscaledHeight);
            if (data != null && listData != null && data[DataGridListData(listData).dataField] == "APPLIED") {
                setStyle('color', '#EEE618');
            } else if (data != null && listData != null && data[DataGridListData(listData).dataField] == "APPROVED")  {
                setStyle('color', '#00FF23');
            } else {
                setStyle('color', '#FF1111');
            }

        }
    }
}