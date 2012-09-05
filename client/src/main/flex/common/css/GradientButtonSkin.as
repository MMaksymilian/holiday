package flex.common.css {
import flash.display.GradientType;

import mx.core.UIComponent;
import flash.filters.DropShadowFilter;

public class GradientButtonSkin extends UIComponent  {

    import flash.display.Graphics;
    import flash.geom.Rectangle;
    import mx.graphics.GradientEntry;
    import mx.graphics.LinearGradient;

    protected override function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
        super.updateDisplayList(unscaledWidth,unscaledHeight);
        var w:Number = unscaledWidth;
        var h:Number = unscaledHeight;

        var backgroundFillColor:Number;
        var backgroundFillColor2:Number;

        var fill:LinearGradient = new LinearGradient();

        var g:Graphics = graphics;
        g.clear();

        switch (name) {
            case "upSkin":
                backgroundFillColor = 0xA6C6B2;
                backgroundFillColor2 = 0xA3AB9A;
                color: 0x332233;
                break;
            case "overSkin":
                backgroundFillColor = 0xA3AB9A;
                backgroundFillColor2 = 0xA6C6B2;
                color: 0x332233;
                break;
            case "downSkin":
                backgroundFillColor = 0xA3AB9A;
                backgroundFillColor2 = 0x112212;
                color: 0x221040;
                break;
            case "disabledSkin":
                backgroundFillColor = 0xCCCCCC;
                backgroundFillColor2 = 0xCCCCCC;
                break;
        }
        var g1:GradientEntry = new GradientEntry(backgroundFillColor,.10,100);
        var g2:GradientEntry = new GradientEntry(backgroundFillColor2,.60,100);

        fill.entries = [g1,g2];
        fill.angle = 90;
        // fill the rectangle
        g.moveTo(0,0);
        fill.begin(g,new Rectangle(0,0,w,h));
        g.lineStyle(3);
        g.lineGradientStyle(GradientType.RADIAL, [0xE2F795, 0xFFCB86], [0.9, 0.8], [0, 120]);
        g.drawRect(0,0, w, h);
        fill.end(g);

        if(name != "downSkin") {
            filters = [new DropShadowFilter(4, 45,0x000000,.2)];
        }
    }
}
}