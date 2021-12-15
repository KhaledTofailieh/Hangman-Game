package application;

public class HelpWordGenerator {
private String [] helpword;
HelpWordGenerator()
{
	this.helpword=new String[10];
	        helpword[0]="Name Of Player";
	        helpword[1]="Big City";
			helpword[2]="Great Rivere";
			helpword[3]="Old Building";
			helpword[4]="Television Channel";
			helpword[5]="International Market";
			helpword[6]="Scientest";
			helpword[7]="Singer ";
			helpword[8]="Coach";
			helpword[9]="Operating System";
}
public String HelpGenerator(int index,boolean easy)
{
	if(easy)
	{
		return this.helpword[index];
	}
	else
	{
		
		return this.helpword[index+5];
	}
	
	
}

}
