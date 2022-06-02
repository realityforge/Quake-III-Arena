package org.realityforge.q3a.material_magic.model;

import org.junit.jupiter.api.Test;
import org.realityforge.q3a.material_magic.util.MaterialOutput;
import static org.junit.jupiter.api.Assertions.*;

public final class SunDirectiveTest
{
  @Test
  public void basicOperation()
  {
    final SunDirective directive = new SunDirective();

    //q3map_sun 1 .77 .77 80 315 70
    directive.setRed( 1F );
    directive.setGreen( .77F );
    directive.setBlue( .76F );
    directive.setIntensity( 80 );
    directive.setDegrees( 315 );
    directive.setElevation( 70 );

    assertEquals( "q3map_sun 1 .77 .76 80 315 70\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "q3map_sun 1 .77 .76 80 315 70\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );
  }

  @Test
  public void testEqualsAndHash()
  {
    final SunDirective directive1 = new SunDirective();
    final SunDirective directive2 = new SunDirective();

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setRed( 0.2F );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setRed( 0.2F );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setGreen( 0.3F );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setGreen( 0.3F );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setBlue( 0.4F );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setBlue( 0.4F );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setIntensity( 100 );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setIntensity( 100 );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setDegrees( 311 );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setDegrees( 311 );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setElevation( 22 );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setElevation( 22 );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );
  }
}
