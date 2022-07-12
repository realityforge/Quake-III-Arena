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

public final class TcModScaleStageDirectiveTest
{
  @Test
  public void basicOperation()
  {
    final TcModScaleStageDirective directive = new TcModScaleStageDirective();

    assertTrue( directive.isDefault() );

    directive.setSScale( .1F );
    directive.setTScale( 1 );

    assertFalse( directive.isDefault() );

    assertEquals( "tcmod scale .1 1\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "tcmod scale .1 1\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    directive.setSScale( 1 );
    directive.setTScale( 1 );

    assertTrue( directive.isDefault() );

    assertEquals( "", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "", MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );
  }

  @Test
  public void verifyEqualsAndHash()
  {
    final TcModScaleStageDirective directive1 = new TcModScaleStageDirective();
    final TcModScaleStageDirective directive2 = new TcModScaleStageDirective();

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setSScale( .1F );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setSScale( .1F );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setTScale( 2.1F );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setTScale( 2.1F );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );
  }
}
