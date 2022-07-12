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

public final class AnimMapStageDirectiveTest
{
  @Test
  public void basicOperation()
  {
    final AnimMapStageDirective directive = new AnimMapStageDirective();

    assertTrue( directive.isDefault() );

    directive.setFrequency( 0.25F );
    directive.setTexture1( "textures/base_water/water1" );

    assertFalse( directive.isDefault() );

    assertEquals( "animMap .25 textures/base_water/water1\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "animMap .25 textures/base_water/water1\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    directive.setTexture2( "textures/base_water/water2" );

    assertEquals( "animMap .25 textures/base_water/water1 textures/base_water/water2\n",
                  MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "animMap .25 textures/base_water/water1 textures/base_water/water2\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    directive.setTexture3( "textures/base_water/water3" );

    assertEquals( "animMap .25 textures/base_water/water1 textures/base_water/water2 textures/base_water/water3\n",
                  MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "animMap .25 textures/base_water/water1 textures/base_water/water2 textures/base_water/water3\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    directive.setTexture4( "textures/base_water/water4" );

    assertEquals(
      "animMap .25 textures/base_water/water1 textures/base_water/water2 textures/base_water/water3 textures/base_water/water4\n",
      MaterialOutput.outputAsString( directive::write ) );
    assertEquals(
      "animMap .25 textures/base_water/water1 textures/base_water/water2 textures/base_water/water3 textures/base_water/water4\n",
      MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    directive.setTexture5( "textures/base_water/water5" );

    assertEquals(
      "animMap .25 textures/base_water/water1 textures/base_water/water2 textures/base_water/water3 textures/base_water/water4 textures/base_water/water5\n",
      MaterialOutput.outputAsString( directive::write ) );
    assertEquals(
      "animMap .25 textures/base_water/water1 textures/base_water/water2 textures/base_water/water3 textures/base_water/water4 textures/base_water/water5\n",
      MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    directive.setTexture6( "textures/base_water/water6" );

    assertEquals(
      "animMap .25 textures/base_water/water1 textures/base_water/water2 textures/base_water/water3 textures/base_water/water4 textures/base_water/water5 textures/base_water/water6\n",
      MaterialOutput.outputAsString( directive::write ) );
    assertEquals(
      "animMap .25 textures/base_water/water1 textures/base_water/water2 textures/base_water/water3 textures/base_water/water4 textures/base_water/water5 textures/base_water/water6\n",
      MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    directive.setTexture7( "textures/base_water/water7" );

    assertEquals(
      "animMap .25 textures/base_water/water1 textures/base_water/water2 textures/base_water/water3 textures/base_water/water4 textures/base_water/water5 textures/base_water/water6 textures/base_water/water7\n",
      MaterialOutput.outputAsString( directive::write ) );
    assertEquals(
      "animMap .25 textures/base_water/water1 textures/base_water/water2 textures/base_water/water3 textures/base_water/water4 textures/base_water/water5 textures/base_water/water6 textures/base_water/water7\n",
      MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    directive.setTexture8( "textures/base_water/water8" );

    assertEquals(
      "animMap .25 textures/base_water/water1 textures/base_water/water2 textures/base_water/water3 textures/base_water/water4 textures/base_water/water5 textures/base_water/water6 textures/base_water/water7 textures/base_water/water8\n",
      MaterialOutput.outputAsString( directive::write ) );
    assertEquals(
      "animMap .25 textures/base_water/water1 textures/base_water/water2 textures/base_water/water3 textures/base_water/water4 textures/base_water/water5 textures/base_water/water6 textures/base_water/water7 textures/base_water/water8\n",
      MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );
  }

  @Test
  public void verifyEqualsAndHash()
  {
    final AnimMapStageDirective directive1 = new AnimMapStageDirective();
    final AnimMapStageDirective directive2 = new AnimMapStageDirective();

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setFrequency( 0.25F );
    directive1.setTexture1( "textures/base_water/water1" );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setFrequency( 0.25F );
    directive2.setTexture1( "textures/base_water/water1" );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setTexture2( "textures/base_water/water2" );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setTexture2( "textures/base_water/water2" );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setTexture3( "textures/base_water/water3" );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setTexture3( "textures/base_water/water3" );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setTexture4( "textures/base_water/water4" );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setTexture4( "textures/base_water/water4" );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setTexture5( "textures/base_water/water5" );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setTexture5( "textures/base_water/water5" );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setTexture6( "textures/base_water/water6" );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setTexture6( "textures/base_water/water6" );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setTexture7( "textures/base_water/water7" );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setTexture7( "textures/base_water/water7" );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setTexture8( "textures/base_water/water8" );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setTexture8( "textures/base_water/water8" );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );
  }
}
