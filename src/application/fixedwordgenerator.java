package application;

import java.util.Random;

public class fixedwordgenerator extends WordGenerator{
	int x;
	fixedwordgenerator() {
		helpword=new HelpWordGenerator();
		words=new String[5];
		 randobject=new Random();
		words[0]="toshiba";
		words[1]="tesla";
		words[2]="shakira";
		words[3]="zeidan";
		words[4]="linux";
		x=0;
	}
	public String GenerateWord()
	{
		this.x=randobject.nextInt(5);
		return words[x];
	}
public String gethelpword()
{
	return helpword.HelpGenerator(x,false);
}
}

