package flex.common.css {
import flash.display.CapsStyle;
import flash.display.Graphics;

import mx.core.UIComponent;

public class SeparatorSkin extends UIComponent {
    protected override function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
        super.updateDisplayList(unscaledWidth,unscaledHeight);
        var w:Number = unscaledWidth;
        var h:Number = unscaledHeight;
        var g:Graphics = graphics;
        g.lineStyle(2, 100000, 0.7, true, "normal", CapsStyle.ROUND);
        g.drawRect(0, 0, w, h);
    }
    }
}