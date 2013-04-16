package
{
	import kwm.*;
	import kwm.text.Statistics;
	
	public class TextStaticticsTest
	{
		public static function main() : void
		{
			var statistic1: Statistics = new Statistics();
			
			while(true)
			{
				var line: String = Input.readString();
				if (line == null) break;
				statistic1.addLine(line);
			}
			
			Output.println("Das am haeufigsten vorkommende Wort ist \"" + statistic1.topWord() + "\" mit " + statistic1.topWordCount() + " Vorkommen.");
			statistic1.print(0, statistic1.countDifferent()); 
		}
	}
}