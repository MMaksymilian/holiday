package flex.common.components {
import mx.controls.DateField;

    public class CustomDateField extends DateField {
        public function CustomDateField() {
            super();
            monthNames = ["Styczeń", "Luty", "Marzec", "Kwiecień", "Maj", "Czerwiec", "Lipiec",
                "Sierpień", "Wrzesień", "Październik", "Listopad", "Grudzień"];
            dayNames= ["N", "Pon", "Wt", "Śr", "Czw", "Pt", "Sb"];
        }
    }
}