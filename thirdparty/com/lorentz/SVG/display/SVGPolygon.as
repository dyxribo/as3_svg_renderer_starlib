﻿package com.lorentz.SVG.display {
import com.lorentz.SVG.display.base.SVGShape;
import com.lorentz.SVG.drawing.IDrawer;

public class SVGPolygon extends SVGShape {
		public function SVGPolygon(){
			super("polygon");
		}
		
		private var _points:Vector.<String>;
		public function get points():Vector.<String> {
			return _points;
		}
		public function set points(value:Vector.<String>):void {
			_points = value;
			invalidateRender();
		}
		
		override protected function drawToDrawer(drawer:IDrawer):void {
			if(points.length>2){
				drawer.moveTo(Number(points[0]), Number(points[1]));
				
				var j:int = 2;
				while(j < points.length - 1)
					drawer.lineTo(Number(points[j++]), Number(points[j++]));
				
				drawer.lineTo(Number(points[0]), Number(points[1]));
			}
		}
		
		override public function clone():Object {
			var c:SVGPolygon = super.clone() as SVGPolygon;
			c.points = points.slice();
			return c;
		}
	}
}