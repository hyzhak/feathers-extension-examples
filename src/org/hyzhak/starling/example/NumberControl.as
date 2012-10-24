package org.hyzhak.starling.example
{
	import feathers.controls.Label;
	import feathers.controls.Slider;
	import feathers.core.FeathersControl;
	
	import org.hyzhak.starling.display.KnobControl;
	
	import starling.events.Event;
	
	public class NumberControl extends FeathersControl
	{
		private var _label : String;
		
		private var _value : Number;
		
		private var _maximum : Number;
		
		private var _minimum : Number;
		
		private var _labelControl : Label;
		
		private var _sliderControl : Slider;
		
		private var _knob : KnobControl;
		
		private var _gap : int = 50;
		
		public function get label():String
		{
			return _label;
		}
		
		public function set label(value:String):void
		{
			if(_label == value)
			{
				return
			}
			_label = value;
			invalidate(INVALIDATION_FLAG_DATA);
		}
		
		public function get value():Number
		{
			return _value;
		}

		public function set value(value:Number):void
		{
			if(_value == value)
			{
				return;
			}
			
			_value = value;
			dispatchEventWith(Event.CHANGE);
			invalidate(INVALIDATION_FLAG_DATA);
		}

		public function get maximum():Number
		{
			return _maximum;
		}

		public function set maximum(value:Number):void
		{
			_maximum = value;
			invalidate(INVALIDATION_FLAG_DATA);
		}

		public function get minimum():Number
		{
			return _minimum;
		}

		public function set minimum(value:Number):void
		{
			_minimum = value;
			invalidate(INVALIDATION_FLAG_DATA);
		}
				
		override protected function initialize():void
		{
			_labelControl = new Label();
			addChild(_labelControl);
			
			_sliderControl = new Slider();
			_sliderControl.addEventListener(Event.CHANGE, onSliderChanged);
			_sliderControl.alpha = 0;
			addChild(_sliderControl);
			
			_knob = new KnobControl();
			_knob.addEventListener(Event.CHANGE, onChangeKnob);
			addChild(_knob);
		}
		
		private function onChangeKnob(event:Event):void
		{
			value = _knob.value;
		}
		
		override public function validate():void
		{
			if(!this.stage || !this.isInvalid())
			{
				return;
			}
			
			_labelControl.text = label;
			
			_sliderControl.minimum = minimum;
			_sliderControl.maximum = maximum;
			_sliderControl.value = value;
			
			//TODO : _knob
			_knob.minimum = minimum;
			_knob.maximum = maximum;
			_knob.delta = maximum - minimum;
			_knob.value = value;
			
			super.validate();
		}	
		
		private function onSliderChanged(event : Event):void
		{
			value = _sliderControl.value;
		}
		
		override protected function draw():void
		{
			_labelControl.x = 0;
			_labelControl.validate();
			
			_labelControl.y =(_sliderControl.height - _labelControl.height) / 2;
			
			var gap : int = Math.max(_gap, _labelControl.width);
			_sliderControl.x = _labelControl.x + gap + 10;
			_sliderControl.y = 0;
			
			_knob.x = 0;// + _gap;
			_knob.y = 20;
		}
	}
}