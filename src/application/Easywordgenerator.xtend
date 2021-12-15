package application

import java.util.Random

class Easywordgenerator extends WordGenerator {
	package int x

	package new() {
		randobject = new Random()
		helpword = new HelpWordGenerator()
		words = newArrayOfSize(5)
		{
			val _wrVal_words = words
			_wrVal_words.set(0, "nymar")
		}
		{
			val _wrVal_words = words
			_wrVal_words.set(1, "london")
		}
		{
			val _wrVal_words = words
			_wrVal_words.set(2, "amazon")
		}
		{
			val _wrVal_words = words
			_wrVal_words.set(3, "evil")
		}
		{
			val _wrVal_words = words
			_wrVal_words.set(4, "mbc")
		}
		x = 0
	}

	override String GenerateWord() {
		this.x = randobject.nextInt(5)
		return {
			val _rdIndx_words = x
			words.get(_rdIndx_words)
		}
	}

	def String gethelpword() {
		return helpword.HelpGenerator(x, true)
	}
}
