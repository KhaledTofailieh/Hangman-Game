package application;

import application.Gamestate;
import application.SingleGame;

@SuppressWarnings("all")
public class Player {
  private SingleGame CurrentGame;
  
  Player() {
    SingleGame _singleGame = new SingleGame();
    this.CurrentGame = _singleGame;
  }
  
  public Gamestate GetGameState() {
    return this.CurrentGame.Getgamestate();
  }
  
  public StringBuffer gethidden() {
    return this.CurrentGame.Getrevealed();
  }
  
  public StringBuffer getrevaled() {
    return this.CurrentGame.Getword();
  }
  
  public int getscore() {
    return this.CurrentGame.getscore();
  }
  
  public int getTrycount() {
    return this.CurrentGame.gettrycnt();
  }
  
  @SuppressWarnings("static-access")
  public StringBuffer MakeGusse(final char Letter) {
    Gamestate x = this.CurrentGame.acceptguess(Letter);
    return this.CurrentGame.Getrevealed();
  }
  
  public String StartEasyGame() {
    String helpword = this.CurrentGame.setvaluesEasy();
    return helpword;
  }
  
  public String StartHardGame() {
    String helpword = this.CurrentGame.setvaluesfixed();
    return helpword;
  }
}
