package org.realityforge.q3a.material_magic.model;

import org.junit.jupiter.api.Test;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

import static org.junit.jupiter.api.Assertions.*;

public final class TcGenStageDirectiveTest
{
  @Test
  public void basicOperation()
  {
    final TcGenStageDirective directive = new TcGenStageDirective();

    assertTrue( directive.isDefault() );

    directive.setCoordinateSource( TcGenStageDirective.CoordinateSource.ENVIRONMENT );

    assertFalse( directive.isDefault() );

    assertEquals( "tcGen environment\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "tcGen environment\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    directive.setCoordinateSource( TcGenStageDirective.CoordinateSource.LIGHTMAP );

    assertFalse( directive.isDefault() );

    assertEquals( "tcGen lightmap\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "tcGen lightmap\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    directive.setCoordinateSource( TcGenStageDirective.CoordinateSource.BASE );

    assertTrue( directive.isDefault() );

    assertEquals( "", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "", MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );
  }

  @Test
  public void verifyEqualsAndHash()
  {
    final TcGenStageDirective directive1 = new TcGenStageDirective();
    final TcGenStageDirective directive2 = new TcGenStageDirective();

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setCoordinateSource( TcGenStageDirective.CoordinateSource.ENVIRONMENT );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setCoordinateSource( TcGenStageDirective.CoordinateSource.ENVIRONMENT );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );
  }
}
