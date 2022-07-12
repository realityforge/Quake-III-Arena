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

public final class MapStageDirectiveTest
{
  @Test
  public void basicOperation()
  {
    final MapStageDirective directive = new MapStageDirective();

    assertTrue( directive.isDefault() );

    directive.setTexture( "*white" );

    assertFalse( directive.isDefault() );

    assertEquals( "map *white\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "map *white\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    directive.setTexture( "textures/base_water/wetstuff" );

    assertEquals( "map textures/base_water/wetstuff\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "map textures/base_water/wetstuff\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );
  }

  @Test
  public void verifyEqualsAndHash()
  {
    final MapStageDirective directive1 = new MapStageDirective();
    final MapStageDirective directive2 = new MapStageDirective();

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setTexture( "*white" );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setTexture( "*white" );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );
  }
}
