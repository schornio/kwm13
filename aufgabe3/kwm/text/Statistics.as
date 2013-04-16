package kwm.text
{
	import kwm.*;
	
	public class Statistics
	{
		public var words:Vector.<String> = null; 
		public var numbers:Vector.<uint> = null; 
		
		public var wordsLength:int = 0;

		public var topWordIndex:int;
		
		public function Statistics() 
		{
			this.words = new Vector.<String>(10, true);
			this.numbers = new Vector.<uint>(10, true); 
			this.topWordIndex = -1; 
		}
		
		
		public function addLine(line:String):void 
		{
			
			var wordsInLine:Array = line.split(" ");
			
			for(var i:int = 0; i < wordsInLine.length; i++) 
			{
				var word:String = wordsInLine[i];
				addWord(word);
			}
		}
		
		public function addWord(word:String):void 
		{
			word = word.toLowerCase();
			
			for(var i:int = 0; i < wordsLength; i++)
			{
				if(words[i] == word)
				{
					// Fall2: Wort bereits enthalten: 
					numbers[i] += 1;
					isTopWord(i);
					return
				}
			}
			// Fall 1: Wort noch nicht vorhanden: 
			pushWord(word);
			isTopWord(wordsLength - 1);
		}
		
		public function isTopWord(index:int) : void 
		{	
			if(index == this.topWordIndex) return;
			
	        if(this.topWordIndex == -1 || numbers[index] > numbers[this.topWordIndex])
			{
				this.topWordIndex = index;
			}
		}
		
		public function count(word:String):int 
		{ 
			word = word.toLowerCase();
			
			for(var i:int = 0; i < wordsLength; i++) 
			{
				if(word == words[i])
				{
					return numbers[i];
				}
			}
			
			return 0;
		}

		public function countDifferent():int 
		{ 
			return wordsLength;
		}

		public function print(startIdx:int, n:uint):void 
		{ 
			Output.println("Die Woerter von " + startIdx + " bis " + (startIdx + n));
			
			for(var i:int = 0; i < n; i++)
			{
				Output.println(" - " + words[i] + ": " + numbers[i] + " x");
			}
		}
		
		public function topWord():String 
		{ 
			if(topWordIndex == -1) return "";
			
			return words[topWordIndex];
		}
		
		public function topWordCount():int 
		{
			if(topWordIndex == -1) return 0;
			
			return numbers[topWordIndex];
		}
		
		public function pushWord(word:String) : void 
		{
			if(wordsLength >= words.length)
			{
				var longerWordsLength: int = wordsLength * 2;
				var longerWords: Vector.<String> = new Vector.<String>(longerWordsLength, true); 
				var longerNumbers: Vector.<uint> = new Vector.<uint>(longerWordsLength, true);
				
				for(var i:int = 0; i < wordsLength; i++)
				{
					longerWords[i] = words[i];
					longerNumbers[i] = numbers[i];
				}
				
				words = longerWords;
				numbers = longerNumbers;
			}
			
			words[wordsLength] = word;
			numbers[wordsLength] = 1;
			wordsLength++;
		}
	}
}