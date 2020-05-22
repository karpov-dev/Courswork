public class TimeConverterController  {
	public TimeConverterController(){
		GMT = 0;
		GMTTime = Datetime.now();
	}

	public Integer GMT{
		get{
			return GMT;
		}
		set{
			if(value == null) return;
			while (value < -12)
				value += 12;
			while (value > 12)
				value -= 12;
			GMT = value;
		}
	}
	public DateTime GMTTime{
		get{
			GMTTime = Datetime.now().addHours(GMT);
			return  GMTTime;
		}
		private set{
			GMTTime = value;
		}
	}
}