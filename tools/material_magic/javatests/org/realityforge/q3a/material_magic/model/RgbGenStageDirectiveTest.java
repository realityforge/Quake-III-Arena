package org.realityforge.q3a.material_magic.model;

import org.junit.jupiter.api.Test;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

import static org.junit.jupiter.api.Assertions.*;

public final class RgbGenStageDirectiveTest
{
  @Test
  public void basicOperation()
  {
    final RgbGenStageDirective directive = new RgbGenStageDirective();

    assertTrue( directive.isDefault() );

    directive.setFunc( RgbGenStageDirective.Func.identity );

    assertFalse( directive.isDefault() );

    assertEquals( "rgbGen identity\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "rgbGen identity\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    directive.setFunc( RgbGenStageDirective.Func.identityLighting );

    assertFalse( directive.isDefault() );

    assertEquals( "rgbGen identityLighting\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "rgbGen identityLighting\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    directive.setFunc( RgbGenStageDirective.Func.vertex );

    assertFalse( directive.isDefault() );

    assertEquals( "rgbGen vertex\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "rgbGen vertex\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    directive.setFunc( RgbGenStageDirective.Func.exactVertex );

    assertFalse( directive.isDefault() );

    assertEquals( "rgbGen exactVertex\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "rgbGen exactVertex\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    directive.setFunc( RgbGenStageDirective.Func.entity );

    assertFalse( directive.isDefault() );

    assertEquals( "rgbGen entity\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "rgbGen entity\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    directive.setFunc( RgbGenStageDirective.Func.oneMinusEntity );

    assertFalse( directive.isDefault() );

    assertEquals( "rgbGen oneMinusEntity\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "rgbGen oneMinusEntity\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    directive.setFunc( RgbGenStageDirective.Func.lightingDiffuse );

    assertFalse( directive.isDefault() );

    assertEquals( "rgbGen lightingDiffuse\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "rgbGen lightingDiffuse\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    directive.setFunc( RgbGenStageDirective.Func.wave );

    assertTrue( directive.isDefault() );

    assertEquals( "", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "", MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    final WaveForm wave = new WaveForm();
    wave.setGenerator( WaveForm.Generator.SAWTOOTH );
    wave.setBase( 0 );
    wave.setAmplitude( 5 );
    wave.setPhase( 2 );
    wave.setFrequency( 0.1F );
    directive.setWave( wave );

    assertFalse( directive.isDefault() );

    assertEquals( "rgbGen wave sawtooth 0 5 2 .1\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "rgbGen wave sawtooth 0 5 2 .1\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );
  }

  @Test
  public void verifyEqualsAndHash()
  {
    final RgbGenStageDirective directive1 = new RgbGenStageDirective();
    final RgbGenStageDirective directive2 = new RgbGenStageDirective();

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setFunc( RgbGenStageDirective.Func.vertex );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setFunc( RgbGenStageDirective.Func.vertex );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    // Adding a wave ... should have no impact as func is not wave
    final WaveForm wave = new WaveForm();
    wave.setGenerator( WaveForm.Generator.SAWTOOTH );
    wave.setBase( 0 );
    wave.setAmplitude( 5 );
    wave.setPhase( 2 );
    wave.setFrequency( 0.1F );
    directive1.setWave( wave );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setFunc( RgbGenStageDirective.Func.wave );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setFunc( RgbGenStageDirective.Func.wave );

    // Still need to add wave to 2 to get them to align
    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setWave( wave );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );
  }
}
