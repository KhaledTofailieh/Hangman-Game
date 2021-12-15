package application

class HelpWordGenerator {
	String[] helpword

	package new() {
		this.helpword = newArrayOfSize(10)
		{
			val _wrVal_helpword = helpword
			_wrVal_helpword.set(0, "Name Of Player")
		}
		{
			val _wrVal_helpword = helpword
			_wrVal_helpword.set(1, "Big City")
		}
		{
			val _wrVal_helpword = helpword
			_wrVal_helpword.set(2, "Great Rivere")
		}
		{
			val _wrVal_helpword = helpword
			_wrVal_helpword.set(3, "Old Building")
		}
		{
			val _wrVal_helpword = helpword
			_wrVal_helpword.set(4, "Television Channel")
		}
		{
			val _wrVal_helpword = helpword
			_wrVal_helpword.set(5, "International Market")
		}
		{
			val _wrVal_helpword = helpword
			_wrVal_helpword.set(6, "Scientest")
		}
		{
			val _wrVal_helpword = helpword
			_wrVal_helpword.set(7, "Singer ")
		}
		{
			val _wrVal_helpword = helpword
			_wrVal_helpword.set(8, "Coach")
		}
		{
			val _wrVal_helpword = helpword
			_wrVal_helpword.set(9, "Operating System")
		}
	}

	def String HelpGenerator(int index, boolean easy) {
		if (easy) {
			return {
				val _rdIndx_tmpNode = index
				this.helpword.get(_rdIndx_tmpNode)
			}
		} else {
			return {
				val _rdIndx_tmpNode = index + 5
				this.helpword.get(_rdIndx_tmpNode)
			}
		}
	}
}
