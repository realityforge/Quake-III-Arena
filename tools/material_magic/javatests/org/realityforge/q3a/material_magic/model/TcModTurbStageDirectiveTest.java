package org.realityforge.q3a.material_magic.model;

import org.junit.jupiter.api.Test;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

import static org.junit.jupiter.api.Assertions.*;

public final class TcModTurbStageDirectiveTest
{
  @Test
  public void basicOperation()
  {
    final TcModTurbStageDirective directive = new TcModTurbStageDirective();

    assertTrue( directive.isDefault() );

    directive.setBase( 0 );
    directive.setAmplitude( 5 );
    directive.setPhase( 2 );
    directive.setFrequency( 0.1F );

    assertFalse( directive.isDefault() );

    assertEquals( "tcmod turb 0 5 2 .1\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "tcmod turb 0 5 2 .1\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    directive.setBase( 0 );
    directive.setAmplitude( 0 );

    assertTrue( directive.isDefault() );

    assertEquals( "", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "", MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );
  }

  @Test
  public void verifyEqualsAndHash()
  {
    final TcModTurbStageDirective directive1 = new TcModTurbStageDirective();
    final TcModTurbStageDirective directive2 = new TcModTurbStageDirective();

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setBase( 0 );
    directive1.setAmplitude( 5 );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setBase( 0 );
    directive2.setAmplitude( 5 );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );
  }
}
