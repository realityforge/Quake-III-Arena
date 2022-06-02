package org.realityforge.q3a.material_magic.model;

import org.junit.jupiter.api.Test;
import org.realityforge.q3a.material_magic.util.MaterialOutput;
import static org.junit.jupiter.api.Assertions.*;

public final class MoveDeformStageDirectiveTest
{
  @Test
  public void basicOperation()
  {
    final MoveDeformStageDirective directive = new MoveDeformStageDirective();

    directive.setX( 500 );
    directive.setY( 0 );
    directive.setZ( 0 );
    directive.getWave().setGenerator( WaveForm.Generator.SAWTOOTH );
    directive.getWave().setBase( 0 );
    directive.getWave().setAmplitude( 5 );
    directive.getWave().setPhase( 2 );
    directive.getWave().setFrequency( 0.1F );

    assertEquals( "deformVertexes move 500.0 0.0 0.0 sawtooth 0.0 5.0 2.0 0.1\n",
                  MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "deformVertexes move 500.0 0.0 0.0 sawtooth 0.0 5.0 2.0 0.1\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    directive.setZ( 2 );
    directive.getWave().setGenerator( WaveForm.Generator.SIN );
    directive.getWave().setBase( 3 );

    assertEquals( "deformVertexes move 500.0 0.0 2.0 sin 3.0 5.0 2.0 0.1\n",
                  MaterialOutput.outputAsString( directive::write ) );
  }

  @Test
  public void testEqualsAndHash()
  {
    final MoveDeformStageDirective directive1 = new MoveDeformStageDirective();
    final MoveDeformStageDirective directive2 = new MoveDeformStageDirective();

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setX( 500 );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setX( 500 );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setY( 30 );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setY( 30 );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setZ( 35 );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setZ( 35 );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.getWave().setGenerator( WaveForm.Generator.SAWTOOTH );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.getWave().setGenerator( WaveForm.Generator.SAWTOOTH );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.getWave().setBase( 2.4F );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.getWave().setBase( 2.4F );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.getWave().setAmplitude( 3.4F );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.getWave().setAmplitude( 3.4F );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.getWave().setPhase( 3 );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.getWave().setPhase( 3 );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.getWave().setFrequency( 0.1F );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.getWave().setFrequency( 0.1F );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );
  }
}
