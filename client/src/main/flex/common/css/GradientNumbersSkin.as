package flex.common.css {
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.GradientType;
import flash.display.Graphics;
import flash.geom.Rectangle;

import mx.core.UIComponent;
import mx.graphics.LinearGradient;

public class GradientNumbersSkin extends UIComponent {

    [Embed(source="/flex/common/image/grid.jpg")]
    private var embeddedImage : Class;

    protected override function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
        super.updateDisplayList(unscaledWidth,unscaledHeight);
        var w:Number = unscaledWidth;
        var h:Number = unscaledHeight;
        color:0xFFFFFF;
//        var fill:LinearGradient = new LinearGradient();
        var g:Graphics = graphics;
        g.clear();
        var image : Bitmap = new embeddedImage();
        var bitmapData : BitmapData = image.bitmapData.clone();
        g.drawRect(0,0, w, h);
//        g.clear();
//        fill.angle = 90;
//        g.moveTo(0,0);
//        fill.begin(g,new Rectangle(0,0,w,h));
//        g.lineStyle(5);
//        g.lineGradientStyle(GradientType.RADIAL, [0xE2F795, 0xFFCB86], [0.9, 0.8], [10, 150]);
//        g.drawRect(0,0, w, h);
//        fill.end(g);
    }
    }
}