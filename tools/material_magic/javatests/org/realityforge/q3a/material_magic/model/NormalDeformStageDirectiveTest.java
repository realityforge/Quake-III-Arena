package org.realityforge.q3a.material_magic.model;

import org.junit.jupiter.api.Test;
import org.realityforge.q3a.material_magic.util.MaterialOutput;
import static org.junit.jupiter.api.Assertions.*;

public final class NormalDeformStageDirectiveTest
{
  @Test
  public void basicOperation()
  {
    final NormalDeformStageDirective directive = new NormalDeformStageDirective();

    directive.setFrequency( 0.5F );
    directive.setAmplitude( 0.1F );

    assertEquals( "deformVertexes normal .5 .1\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "deformVertexes normal .5 .1\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );


    directive.setFrequency( 0.3F );
    directive.setAmplitude( 0.2F );

    assertEquals( "deformVertexes normal .3 .2\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "deformVertexes normal .3 .2\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );
  }

  @Test
  public void testEqualsAndHash()
  {
    final NormalDeformStageDirective directive1 = new NormalDeformStageDirective();
    final NormalDeformStageDirective directive2 = new NormalDeformStageDirective();

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setFrequency( 0.3F );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setFrequency( 0.3F );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setAmplitude( 0.2F );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setAmplitude( 0.2F );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );
  }
}
