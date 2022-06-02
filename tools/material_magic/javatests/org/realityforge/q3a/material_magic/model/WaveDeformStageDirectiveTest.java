package org.realityforge.q3a.material_magic.model;

import org.junit.jupiter.api.Test;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

import static org.junit.jupiter.api.Assertions.*;

public final class WaveDeformStageDirectiveTest
{
  @Test
  public void basicOperation()
  {
    final WaveDeformStageDirective directive = new WaveDeformStageDirective();

    directive.setSpread( 100 );
    directive.getWave().setGenerator( WaveForm.Generator.SAWTOOTH );
    directive.getWave().setBase( 0 );
    directive.getWave().setAmplitude( 5 );
    directive.getWave().setPhase( 2 );
    directive.getWave().setFrequency( 0.1F );

    assertEquals( "deformVertexes wave 100 sawtooth 0 5 2 .1\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "deformVertexes wave 100 sawtooth 0 5 2 .1\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    directive.setSpread( 200 );
    directive.getWave().setGenerator( WaveForm.Generator.SIN );
    directive.getWave().setBase( 3 );

    assertEquals( "deformVertexes wave 200 sin 3 5 2 .1\n", MaterialOutput.outputAsString( directive::write ) );
  }

  @Test
  public void testEqualsAndHash()
  {
    final WaveDeformStageDirective directive1 = new WaveDeformStageDirective();
    final WaveDeformStageDirective directive2 = new WaveDeformStageDirective();

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setSpread( 500 );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setSpread( 500 );

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
