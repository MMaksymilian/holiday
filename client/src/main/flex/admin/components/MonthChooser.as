/**
 * Created by IntelliJ IDEA.
 * User: Leon
 * Date: 30.07.12
 * Time: 16:20
 * To change this template use File | Settings | File Templates.
 */
package flex.admin.components {
    import mx.controls.DateChooser;
    import mx.core.mx_internal;
    import mx.events.CalendarLayoutChangeEvent;
    import mx.events.DateChooserEvent;

    use namespace mx_internal;

    public class MonthChooser extends DateChooser {

        public function MonthChooser(){
            monthNames = [ "Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec" ];
        }

        override protected function createChildren():void {
            super.createChildren();
            dateGrid.addEventListener(DateChooserEvent.SCROLL,dateGrid_scrollHandler);
        }

        override protected function measure():void {
            super.measure();
            dateGrid.visible = false;
            measuredHeight = measuredHeight - dateGrid.getExplicitOrMeasuredHeight();
        }

        private function dateGrid_scrollHandler(event:DateChooserEvent):void {
            var month:int = event.currentTarget.displayedMonth;
            var year:int = event.currentTarget.displayedYear;

            selectedDate = new Date(year, month, 1);
            var e:CalendarLayoutChangeEvent = new CalendarLayoutChangeEvent(CalendarLayoutChangeEvent.CHANGE);
            e.newDate = selectedDate;
            dispatchEvent(e);
        }
    }
}