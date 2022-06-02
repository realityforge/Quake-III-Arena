package org.realityforge.q3a.material_magic.model;

import org.junit.jupiter.api.Test;
import org.realityforge.q3a.material_magic.util.MaterialOutput;
import static org.junit.jupiter.api.Assertions.*;

public final class BulgeDeformStageDirectiveTest
{
  @Test
  public void basicOperation()
  {
    final BulgeDeformStageDirective directive = new BulgeDeformStageDirective();

    directive.setWidth( 128 );
    directive.setHeight( 5 );
    directive.setSpeed( 2 );

    assertEquals( "deformVertexes bulge 128.0 5.0 2.0\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "deformVertexes bulge 128.0 5.0 2.0\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    directive.setWidth( 0.6F );
    directive.setHeight( 0.7F );
    directive.setSpeed( 0.333F );

    assertEquals( "deformVertexes bulge 0.6 0.7 0.333\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "deformVertexes bulge 0.6 0.7 0.333\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );
  }

  @Test
  public void testEqualsAndHash()
  {
    final BulgeDeformStageDirective directive1 = new BulgeDeformStageDirective();
    final BulgeDeformStageDirective directive2 = new BulgeDeformStageDirective();

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setWidth( 0.6F );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setWidth( 0.6F );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setHeight( 0.7F );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setHeight( 0.7F );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setSpeed( 0.333F );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setSpeed( 0.333F );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );
  }
}
