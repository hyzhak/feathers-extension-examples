package org.hyzhak.starling.example
{
	import feathers.controls.Header;
	import feathers.controls.Label;
	import feathers.controls.Screen;
	import feathers.controls.Slider;
	
	import org.hyzhak.starling.display.DynamicImage;
	import org.hyzhak.starling.display.PerlinNoiseImage;
	import org.hyzhak.starling.display.WhiteNoiseImage;
	import org.hyzhak.starling.display.ZXSpectrumLinesImage;
	
	import starling.events.Event;
	import starling.textures.Texture;
	
	public class MainMenuScreen extends Screen
	{
		private var _header:Header;

		private var _whiteNoiseImage:DynamicImage;
		private var _perlinNoiseImage:DynamicImage;
		private var _zxSpectrumLinesImage:DynamicImage;

		private var _zxSpectrumSlider:Slider;
		private var _perlinNoiseSlider:Slider;
		private var _zxSpectrumSliderLabel:Label;
		private var _perlinNoiseSliderLabel:Label;
		
		private var _zxSpectrumControl:NumberControl;
		private var _zxSpectrumSizeControl:NumberControl;
		private var _perlinNoiseControl:NumberControl;
		private var _perlinNoiseSizeControl:NumberControl;
		
		private var _whiteNoiseSizeControl:NumberControl;
		
		private var _whiteNoiseImageSize:int = 128;
		private var _perlinNoiseImageSize:int = 128;
		private var _zxSpectrumImageSize:int = 128;
		
		override protected function initialize():void
		{
			var texture : starling.textures.Texture;
			
			_whiteNoiseImage = new WhiteNoiseImage(_whiteNoiseImageSize, _whiteNoiseImageSize);
			addChild(_whiteNoiseImage);
			
			_perlinNoiseImage = new PerlinNoiseImage(_perlinNoiseImageSize, _perlinNoiseImageSize);
			_perlinNoiseImage.alpha = 0.3;
			addChild(_perlinNoiseImage);
			
			_zxSpectrumLinesImage = new ZXSpectrumLinesImage(_zxSpectrumImageSize, _zxSpectrumImageSize);
			_zxSpectrumLinesImage.alpha = 0.3;
			addChild(_zxSpectrumLinesImage);
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			
			//controls
			
			_zxSpectrumControl = new NumberControl();
			_zxSpectrumControl.label = "zx alpha";
			_zxSpectrumControl.minimum = 0;
			_zxSpectrumControl.maximum = 1;
			_zxSpectrumControl.value = _zxSpectrumLinesImage.alpha;
			_zxSpectrumControl.onChange.add(onChangeSlider);
			addChild(_zxSpectrumControl);
			
			_zxSpectrumSizeControl = new NumberControl();
			_zxSpectrumSizeControl.label = "zx size";
			_zxSpectrumSizeControl.minimum = 1;
			_zxSpectrumSizeControl.maximum = 512;
			_zxSpectrumSizeControl.value = _zxSpectrumImageSize;
			_zxSpectrumSizeControl.onChange.add(onZXSpectrumChangeSizeControl);
			addChild(_zxSpectrumSizeControl);
			
			_perlinNoiseControl = new NumberControl();
			_perlinNoiseControl.label = "perlin alpha";
			_perlinNoiseControl.minimum = 0;
			_perlinNoiseControl.maximum = 1;
			_perlinNoiseControl.value = _perlinNoiseImage.alpha;
			_perlinNoiseControl.onChange.add(onChangePerlinNoiseAlpha);
			addChild(_perlinNoiseControl);
			
			_perlinNoiseSizeControl = new NumberControl();
			_perlinNoiseSizeControl.label = "perlin size";
			_perlinNoiseSizeControl.minimum = 1;
			_perlinNoiseSizeControl.maximum = 512;
			_perlinNoiseSizeControl.value = _perlinNoiseImageSize;
			_perlinNoiseSizeControl.onChange.add(onPerlinNoiseChangeSizeControl);
			addChild(_perlinNoiseSizeControl);
			
			_whiteNoiseSizeControl = new NumberControl();
			_whiteNoiseSizeControl.label = "white size";
			_whiteNoiseSizeControl.minimum = 1;
			_whiteNoiseSizeControl.maximum = 512;
			_whiteNoiseSizeControl.value = _whiteNoiseImageSize;
			_whiteNoiseSizeControl.onChange.add(onWhiteNoiseChangeSizeControl);
			addChild(_whiteNoiseSizeControl);
		}
		
		private function onPerlinNoiseChangeSizeControl(control : NumberControl):void
		{
			_perlinNoiseImageSize = int(control.value);
		}
		
		private function onWhiteNoiseChangeSizeControl(control : NumberControl):void
		{
			_whiteNoiseImageSize = int(control.value);
		}
		
		private function onZXSpectrumChangeSizeControl(control : NumberControl):void
		{
			_zxSpectrumImageSize = int(control.value);
		}
		
		private function onChangeSlider(control : NumberControl) : void
		{
			_zxSpectrumLinesImage.alpha = control.value;
		}
		
		private function onChangePerlinNoiseAlpha(control : NumberControl):void
		{
			_perlinNoiseImage.alpha = control.value;
		}
		
		override protected function draw():void
		{
			var center : int = stage.stageWidth / 3;
			var start : int = 20;
			var step : int = 80;
			
			_zxSpectrumControl.x = center;
			_zxSpectrumControl.y = start + step * 0;
			
			_zxSpectrumSizeControl.x = center;
			_zxSpectrumSizeControl.y = start + step * 1;
			
			_perlinNoiseControl.x = center;
			_perlinNoiseControl.y = start + step * 2;
			
			_perlinNoiseSizeControl.x = center;
			_perlinNoiseSizeControl.y = start + step * 3;
			
			_whiteNoiseSizeControl.x = center;
			_whiteNoiseSizeControl.y = start + step * 4;
			
			_whiteNoiseImage.width = stage.stageWidth;
			_whiteNoiseImage.height = stage.stageHeight;
			
			_perlinNoiseImage.width = stage.stageWidth;
			_perlinNoiseImage.height = stage.stageHeight;
			
			_zxSpectrumLinesImage.width = stage.stageWidth;
			_zxSpectrumLinesImage.height = stage.stageHeight;
		}
		
		private function onEnterFrame(event : Event):void
		{
			_whiteNoiseImage.textureWidth = _whiteNoiseImageSize;
			_whiteNoiseImage.textureHeight = _whiteNoiseImageSize;
			_whiteNoiseImage.invalidateTexture();
			
			_perlinNoiseImage.textureWidth = _perlinNoiseImageSize;
			_perlinNoiseImage.textureHeight = _perlinNoiseImageSize;
			_perlinNoiseImage.invalidateTexture();
			
			_zxSpectrumLinesImage.textureWidth = _zxSpectrumImageSize;
			_zxSpectrumLinesImage.textureHeight = _zxSpectrumImageSize;
			_zxSpectrumLinesImage.invalidateTexture();			
		}
	}
}