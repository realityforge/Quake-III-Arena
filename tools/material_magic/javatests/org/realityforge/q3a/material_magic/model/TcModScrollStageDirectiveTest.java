package org.realityforge.q3a.material_magic.model;

import org.junit.jupiter.api.Test;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

import static org.junit.jupiter.api.Assertions.*;

public final class TcModScrollStageDirectiveTest
{
  @Test
  public void basicOperation()
  {
    final TcModScrollStageDirective directive = new TcModScrollStageDirective();

    assertTrue( directive.isDefault() );

    directive.setSSpeed( .1F );
    directive.setTSpeed( 1 );

    assertFalse( directive.isDefault() );

    assertEquals( "tcmod scroll .1 1\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "tcmod scroll .1 1\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    directive.setSSpeed( 1 );
    directive.setTSpeed( 1 );

    assertTrue( directive.isDefault() );

    assertEquals( "", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "", MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );
  }

  @Test
  public void verifyEqualsAndHash()
  {
    final TcModScrollStageDirective directive1 = new TcModScrollStageDirective();
    final TcModScrollStageDirective directive2 = new TcModScrollStageDirective();

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setSSpeed( .1F );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setSSpeed( .1F );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setTSpeed( 2.1F );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setTSpeed( 2.1F );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );
  }
}
