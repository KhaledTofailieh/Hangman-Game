package application;

import application.WordGenerator;
import java.util.List;
import org.eclipse.xtext.xbase.lib.Conversions;

@SuppressWarnings("all")
public class Easywordgenerator extends WordGenerator {
  int x;
  
  Easywordgenerator() {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method newArrayOfSize(int) is undefined");
  }
  
  @Override
  public String GenerateWord() {
    this.x = this.randobject.nextInt(5);
    String _xblockexpression = null;
    {
      final int _rdIndx_words = this.x;
      _xblockexpression = ((List<String>)Conversions.doWrapArray(this.words)).get(_rdIndx_words);
    }
    return _xblockexpression;
  }
  
  public String gethelpword() {
    return this.helpword.HelpGenerator(this.x, true);
  }
}
