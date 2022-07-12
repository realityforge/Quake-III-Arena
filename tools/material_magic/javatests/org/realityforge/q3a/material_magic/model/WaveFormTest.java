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

import static org.junit.jupiter.api.Assertions.*;

public final class WaveFormTest
{
  @Test
  public void basicOperation()
  {
    final WaveForm form = new WaveForm();

    form.setGenerator( WaveForm.Generator.SIN );
    form.setBase( 0.7F );
    form.setAmplitude( 0.5F );
    form.setPhase( 0 );
    form.setFrequency( 0.1F );

    assertEquals( "sin .7 .5 0 .1", form.toString() );

    form.setGenerator( WaveForm.Generator.INVERSESAWTOOTH );
    form.setBase( 1 );
    form.setAmplitude( 0.2F );
    form.setPhase( 0 );
    form.setFrequency( 0.75F );

    assertEquals( "inversesawtooth 1 .2 0 .75", form.toString() );

    assertFalse( form.isDefault() );

    form.setBase( 0 );

    assertFalse( form.isDefault() );

    form.setAmplitude( 0 );

    assertTrue( form.isDefault() );
  }

  @Test
  public void verifyEqualsAndHash()
  {
    final WaveForm directive1 = new WaveForm();
    final WaveForm directive2 = new WaveForm();

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setGenerator( WaveForm.Generator.NOISE );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setGenerator( WaveForm.Generator.NOISE );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setBase( 0.7F );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setBase( 0.7F );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setAmplitude( 0.5F );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setAmplitude( 0.5F );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setPhase( 0.5F );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setPhase( 0.5F );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setFrequency( 0.75F );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setFrequency( 0.75F );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );
  }
}
