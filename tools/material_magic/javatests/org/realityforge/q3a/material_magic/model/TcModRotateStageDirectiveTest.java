package org.realityforge.q3a.material_magic.model;

import org.junit.jupiter.api.Test;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

import static org.junit.jupiter.api.Assertions.*;

public final class TcModRotateStageDirectiveTest
{
  @Test
  public void basicOperation()
  {
    final TcModRotateStageDirective directive = new TcModRotateStageDirective();

    directive.setDegreesPerSecond( .1F );

    assertEquals( "tcmod rotate .1\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "tcmod rotate .1\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );
  }

  @Test
  public void verifyEqualsAndHash()
  {
    final TcModRotateStageDirective directive1 = new TcModRotateStageDirective();
    final TcModRotateStageDirective directive2 = new TcModRotateStageDirective();

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setDegreesPerSecond( .1F );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setDegreesPerSecond( .1F );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );
  }
}
