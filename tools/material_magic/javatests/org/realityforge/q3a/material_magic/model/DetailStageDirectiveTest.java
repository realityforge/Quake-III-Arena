package org.realityforge.q3a.material_magic.model;

import org.junit.jupiter.api.Test;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

import static org.junit.jupiter.api.Assertions.*;

public final class DetailStageDirectiveTest
{
  @Test
  public void basicOperation()
  {
    final DetailStageDirective directive = new DetailStageDirective();

    assertEquals( "detail\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "detail\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );
  }

  @Test
  public void verifyEqualsAndHash()
  {
    final DetailStageDirective directive1 = new DetailStageDirective();
    final DetailStageDirective directive2 = new DetailStageDirective();

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );
  }
}
