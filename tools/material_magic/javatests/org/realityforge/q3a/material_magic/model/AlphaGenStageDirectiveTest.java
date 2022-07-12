/*
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.realityforge.q3a.material_magic.model;

import org.junit.jupiter.api.Test;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

import static org.junit.jupiter.api.Assertions.*;

public final class AlphaGenStageDirectiveTest
{
  @Test
  public void basicOperation()
  {
    final AlphaGenStageDirective directive = new AlphaGenStageDirective();

    assertTrue( directive.isDefault() );

    directive.setFunc( AlphaGenStageDirective.Func.vertex );

    assertFalse( directive.isDefault() );

    assertEquals( "alphaGen vertex\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "alphaGen vertex\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    directive.setFunc( AlphaGenStageDirective.Func.entity );

    assertFalse( directive.isDefault() );

    assertEquals( "alphaGen entity\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "alphaGen entity\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    directive.setFunc( AlphaGenStageDirective.Func.lightingSpecular );

    assertFalse( directive.isDefault() );

    assertEquals( "alphaGen lightingSpecular\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "alphaGen lightingSpecular\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    directive.setFunc( AlphaGenStageDirective.Func.portal );

    assertTrue( directive.isDefault() );

    assertEquals( "", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "", MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    assertTrue( directive.isDefault() );

    directive.setPortalRange( 256F );

    assertEquals( "alphaGen portal 256\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "alphaGen portal 256\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    directive.setFunc( AlphaGenStageDirective.Func.wave );

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

    assertEquals( "alphaGen wave sawtooth 0 5 2 .1\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "alphaGen wave sawtooth 0 5 2 .1\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );
  }

  @Test
  public void verifyEqualsAndHash()
  {
    final AlphaGenStageDirective directive1 = new AlphaGenStageDirective();
    final AlphaGenStageDirective directive2 = new AlphaGenStageDirective();

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setFunc( AlphaGenStageDirective.Func.vertex );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setFunc( AlphaGenStageDirective.Func.vertex );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    // PortalRange ignored unless func is portal
    directive1.setPortalRange( 256 );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setFunc( AlphaGenStageDirective.Func.portal );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setFunc( AlphaGenStageDirective.Func.portal );
    directive2.setPortalRange( 256 );

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

    directive1.setFunc( AlphaGenStageDirective.Func.wave );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setFunc( AlphaGenStageDirective.Func.wave );

    // Still need to add wave to 2 to get them to align
    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setWave( wave );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );
  }
}
