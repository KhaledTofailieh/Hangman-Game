package application;
public class SingleGame {
private  StringBuffer hiddenword,help,revealed;
private Gamestate state;
private int score,trycount;
private Easywordgenerator Easygenerator;
private fixedwordgenerator fixedgenerator;
 SingleGame() {
	 
	Easygenerator =new Easywordgenerator();
	fixedgenerator=new fixedwordgenerator();
	help=new StringBuffer();
	hiddenword=new StringBuffer();
	revealed=new StringBuffer();
	score=0;
	trycount=3;
	//state=0;
	//help.append(hiddenword);
	
}
public Gamestate acceptguess(char letter)
{
	String s=new String();
	s=s.valueOf(letter);
int index=hiddenword.indexOf(s); 
if(index!=-1)
 {
score++;
revealed.setCharAt(index, letter);
hiddenword.setCharAt(index,'*');
return Getgamestate();
}
else
{
score--;
trycount--;
index=revealed.indexOf("*");
revealed.setCharAt(index, hiddenword.charAt(index));
hiddenword.setCharAt(index, '*');
return Getgamestate();
}
}

Gamestate Getgamestate()
{
if(trycount!=0&&revealed.indexOf("*")!=-1)
	return state.RunningGame;
else if(trycount!=0&&revealed.indexOf("*")==-1)
	return state.playerwin;
else if(trycount==0&&revealed.indexOf("*")!=-1||(trycount==0&&revealed.indexOf("*")==-1))
	return state.playerlose;
return state.NewGame;
}
StringBuffer Getrevealed() 
{ 
	if(Getgamestate()==Gamestate.playerlose)
		{
	return help;
		}
return revealed;
}

int getscore()
{
	return this.score;
}
int gettrycnt()
{
	return this.trycount;
}
StringBuffer Getword()
{
return this.help;	
}
public String  setvaluesEasy()
{
	hiddenword.delete(0, hiddenword.length());
	hiddenword.append(Easygenerator.GenerateWord());
	help.delete(0, help.length());
	help.append(hiddenword);
	revealed.delete(0, revealed.length());
	for(int i=0;i<hiddenword.length();i++)
	{
		revealed.append("*");
	}
	
	score=0;
	trycount=3;
	return this.Easygenerator.gethelpword();
}
public String setvaluesfixed()
{
	hiddenword.delete(0, hiddenword.length());
	hiddenword.append(fixedgenerator.GenerateWord());
	help.delete(0, help.length());
	help.append(hiddenword);
	revealed.delete(0, revealed.length());
	for(int i=0;i<hiddenword.length();i++)
	{
		revealed.append("*");	
	}
	
	score=0;
	trycount=3;
	return this.fixedgenerator.gethelpword();
}

}
