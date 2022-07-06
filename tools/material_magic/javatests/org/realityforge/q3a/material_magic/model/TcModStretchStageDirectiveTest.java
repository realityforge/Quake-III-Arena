package org.realityforge.q3a.material_magic.model;

import org.junit.jupiter.api.Test;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

import static org.junit.jupiter.api.Assertions.*;

public final class TcModStretchStageDirectiveTest
{
  @Test
  public void basicOperation()
  {
    final TcModStretchStageDirective directive = new TcModStretchStageDirective();

    assertTrue( directive.isDefault() );

    directive.getWave().setGenerator( WaveForm.Generator.SAWTOOTH );
    directive.getWave().setBase( 0 );
    directive.getWave().setAmplitude( 5 );
    directive.getWave().setPhase( 2 );
    directive.getWave().setFrequency( 0.1F );

    assertFalse( directive.isDefault() );

    assertEquals( "tcmod stretch sawtooth 0 5 2 .1\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "tcmod stretch sawtooth 0 5 2 .1\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    directive.getWave().setBase( 0 );
    directive.getWave().setAmplitude( 0 );

    assertTrue( directive.isDefault() );

    assertEquals( "", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "", MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );
  }

  @Test
  public void verifyEqualsAndHash()
  {
    final TcModStretchStageDirective directive1 = new TcModStretchStageDirective();
    final TcModStretchStageDirective directive2 = new TcModStretchStageDirective();

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.getWave().setGenerator( WaveForm.Generator.SAWTOOTH );
    directive1.getWave().setBase( 0 );
    directive1.getWave().setAmplitude( 5 );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.getWave().setGenerator( WaveForm.Generator.SAWTOOTH );
    directive2.getWave().setBase( 0 );
    directive2.getWave().setAmplitude( 5 );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );
  }
}