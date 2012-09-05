package flex.common.css {
import flash.display.CapsStyle;
import flash.display.GradientType;
import flash.display.Graphics;

import mx.core.UIComponent;

public class HorizontalSeparatorSkin extends UIComponent {
            protected override function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
                super.updateDisplayList(unscaledWidth,unscaledHeight);
                var w:Number = unscaledWidth;
                var h:Number = unscaledHeight;
                var g:Graphics = graphics;
                g.lineGradientStyle(GradientType.RADIAL, [0xE257D5, 0xFFCB86], [0.9, 0.8], [90, 120]);
                g.drawRect(0, 0, w, h);
            }
    }
}