package application

class SingleGame {
	StringBuffer hiddenwordStringBuffer
	helpStringBuffer revealed
	Gamestate state
	int scoreint
	trycount Easywordgenerator
	Easygenerator fixedwordgenerator
	fixedgenerator

	package new() {
		Easygenerator = new Easywordgenerator()
		fixedgenerator = new fixedwordgenerator()
		help = new StringBuffer()
		hiddenword = new StringBuffer()
		revealed = new StringBuffer()
		score = 0
		trycount = 3 // state=0;
		// help.append(hiddenword);
	}

	def Gamestate acceptguess(char letter) {
		var String s = new String()
		s = s::valueOf(letter)
		var int index = hiddenword.indexOf(s)
		if (index !== -1) {
			score++
			revealed.setCharAt(index, letter)
			hiddenword.setCharAt(index, Character.valueOf('*').charValue)
			return Getgamestate()
		} else {
			score--
			trycount--
			index = revealed.indexOf("*")
			revealed.setCharAt(index, hiddenword.charAt(index))
			hiddenword.setCharAt(index, Character.valueOf('*').charValue)
			return Getgamestate()
		}
	}

	def package Gamestate Getgamestate() {
		if(trycount !== 0 && revealed.indexOf("*") !== -1) return state::RunningGame else if(trycount !== 0 &&
			revealed.indexOf("*") === -1) return state::playerwin else if(trycount === 0 &&
			revealed.indexOf("*") !== -1 || (trycount === 0 && revealed.indexOf("*") === -1)) return state::playerlose
		return state::NewGame
	}

	def package StringBuffer Getrevealed() {
		if (Getgamestate() === Gamestate::playerlose) {
			return help
		}
		return revealed
	}

	def package int getscore() {
		return this.score
	}

	def package int gettrycnt() {
		return this.trycount
	}

	def package StringBuffer Getword() {
		return this.help
	}

	def String setvaluesEasy() {
		hiddenword.delete(0, hiddenword.length())
		hiddenword.append(Easygenerator.GenerateWord())
		help.delete(0, help.length())
		help.append(hiddenword)
		revealed.delete(0, revealed.length())
		for (var int i = 0; i < hiddenword.length(); i++) {
			revealed.append("*")
		}
		score = 0
		trycount = 3
		return this.Easygenerator.gethelpword()
	}

	def String setvaluesfixed() {
		hiddenword.delete(0, hiddenword.length())
		hiddenword.append(fixedgenerator.GenerateWord())
		help.delete(0, help.length())
		help.append(hiddenword)
		revealed.delete(0, revealed.length())
		for (var int i = 0; i < hiddenword.length(); i++) {
			revealed.append("*")
		}
		score = 0
		trycount = 3
		return this.fixedgenerator.gethelpword()
	}
}
