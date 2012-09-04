package flex.common.css {
import flash.display.GradientType;

import mx.core.UIComponent;

public class GradientPanelTitleSkin extends UIComponent {

    import flash.display.Graphics;
    import flash.geom.Rectangle;
    import mx.graphics.GradientEntry;
    import mx.graphics.LinearGradient;

    protected override function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
        super.updateDisplayList(unscaledWidth,unscaledHeight);
        var w:Number = unscaledWidth;
        var h:Number = unscaledHeight;

        var fill:LinearGradient = new LinearGradient();

        var g:Graphics = graphics;
        g.clear();
        color:0xFFFFDD;
        fill.angle = 90;
        g.moveTo(0,0);
        fill.begin(g,new Rectangle(0,0,w,h));
        g.lineStyle(5);
        g.lineGradientStyle(GradientType.RADIAL, [0xE2F795, 0xFFCB86], [0.9, 0.8], [10, 150]);
        g.drawRect(0,0, w, h);
        fill.end(g);
    }
    }
}