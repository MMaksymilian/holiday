package flex.common.renderer {
import mx.controls.Alert;
import mx.controls.Label;
import mx.controls.dataGridClasses.DataGridListData;

public class StatusRenderer extends Label {

        override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
            super.updateDisplayList(unscaledWidth, unscaledHeight);
            if (data != null && listData != null && data[DataGridListData(listData).dataField] == "APPLIED") {
                setStyle('color', '#1110FF');
                text = "WNIOSEK";
            } else if (data != null && listData != null && data[DataGridListData(listData).dataField] == "APPROVED")  {
                setStyle('color', '#00FF23');
                text = "ZAAKCEPTOWANY";
            } else {
                setStyle('color', '#FF1111');
                text = "ODRZUCONY";
            }

        }
    }
}