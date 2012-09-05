package flex.common.css {
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.GradientType;

import mx.core.UIComponent;

public class PanelHeaderSkin extends UIComponent {

    import flash.display.Graphics;
    import flash.geom.Rectangle;
    import mx.graphics.GradientEntry;
    import mx.graphics.LinearGradient;

    [Embed(source="/flex/common/image/grid.jpg")]
    private var embeddedImage : Class;

    protected override function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void {
        super.updateDisplayList(unscaledWidth,unscaledHeight);

        var image : Bitmap = new embeddedImage();
        var bitmapData : BitmapData = image.bitmapData.clone();

        var w:Number = unscaledWidth;
        var h:Number = unscaledHeight;

        var g:Graphics = graphics;
        g.clear();
        g.beginBitmapFill(bitmapData, null, true, true);
        g.drawRect (0,0,w,h);
        g.beginFill(0x24702A, 0.5);
        g.moveTo(0,0);
        g.drawRect(0,0, w, h);
    }
    }
}