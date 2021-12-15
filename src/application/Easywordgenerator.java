package application;
import java.util.Random;
public class Easywordgenerator extends WordGenerator {
	int x;
	 Easywordgenerator() {
	   randobject=new Random();
	   helpword=new HelpWordGenerator();
	   words=new String[5]; 
       words[0]="nymar";
       words[1]="london";
        words[2]="amazon";
        words[3]="evil";
        words[4]="mbc";  
        x=0;
      
}
	public String GenerateWord()
	{
		this.x=randobject.nextInt(5);
		return words[x];
	}
public String gethelpword()
{
	return helpword.HelpGenerator(x,true);
}
}
