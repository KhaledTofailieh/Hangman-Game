package application

class Player {
	SingleGame CurrentGame

	package new() {
		CurrentGame = new SingleGame()
	}

	def Gamestate GetGameState() {
		return CurrentGame.Getgamestate()
	}

	def StringBuffer gethidden() {
		return CurrentGame.Getrevealed()
	}

	def StringBuffer getrevaled() {
		return CurrentGame.Getword()
	}

	def int getscore() {
		return this.CurrentGame.getscore()
	}

	def int getTrycount() {
		return this.CurrentGame.gettrycnt()
	}

	@SuppressWarnings("static-access") def
	/*public void GetNextLetter(char c)
	 * {
	 *    // OutPutResult(MakeGusse(c));
	 * if(CurrentGame.Getgamestate()==Gamestate.playerlose)
	 * 
	 * else if(CurrentGame.Getgamestate()==Gamestate.playerwin)
	 * 

	 }*/
	/*public void OutPutResult(StringBuffer Result) 
	 * {


	 * }
	 * /*public SingleGame StartNewGame() 
	 * {
	 * 
	 }*/
	// public SingleGame StartNewGame(WordGenerator generator) {}
	StringBuffer MakeGusse(char Letter) {
		var Gamestate x = CurrentGame.acceptguess(Letter)
		return CurrentGame.Getrevealed()
	}

	def String StartEasyGame() {
		var String helpword = CurrentGame.setvaluesEasy()
		return helpword
	}

	def String StartHardGame() {
		var String helpword = CurrentGame.setvaluesfixed()
		return helpword
	}
}
