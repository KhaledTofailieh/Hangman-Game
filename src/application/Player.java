package application;
public class Player {
private SingleGame CurrentGame;
Player()
{
	CurrentGame =new SingleGame();
}

public  Gamestate GetGameState()
{
	return CurrentGame.Getgamestate();
}
public StringBuffer gethidden()
{
	return CurrentGame.Getrevealed();
}
public StringBuffer getrevaled()
{
	return CurrentGame.Getword();
}
public int getscore()
{
	return this.CurrentGame.getscore();
}
public int getTrycount()
{
	return this.CurrentGame.gettrycnt();
}
@SuppressWarnings("static-access")
/*public void GetNextLetter(char c)
{
   // OutPutResult(MakeGusse(c));
if(CurrentGame.Getgamestate()==Gamestate.playerlose)
	
else if(CurrentGame.Getgamestate()==Gamestate.playerwin)
	

}*/
/*public void OutPutResult(StringBuffer Result) 
{


}
/*public SingleGame StartNewGame() 
{
	
}*/
//public SingleGame StartNewGame(WordGenerator generator) {}
public StringBuffer MakeGusse(char Letter) 
{
	Gamestate x=CurrentGame.acceptguess(Letter);
		return CurrentGame.Getrevealed();
	
}
public String  StartEasyGame()
{
	String helpword=CurrentGame.setvaluesEasy();
	return helpword;
}
public String StartHardGame()
{
	String helpword =CurrentGame.setvaluesfixed();
	return helpword;
	
}
}
