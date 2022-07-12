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

public final class TextDeformStageDirectiveTest
{
  @Test
  public void basicOperation()
  {
    final TextDeformStageDirective directive = new TextDeformStageDirective();

    directive.setLevel( 0 );

    assertEquals( "deformVertexes text0\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "deformVertexes text0\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    directive.setLevel( 4 );

    assertEquals( "deformVertexes text4\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "deformVertexes text4\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    directive.setLevel( 7 );

    assertEquals( "deformVertexes text7\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "deformVertexes text7\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );
  }

  @Test
  public void verifyEqualsAndHash()
  {
    final TextDeformStageDirective directive1 = new TextDeformStageDirective();
    final TextDeformStageDirective directive2 = new TextDeformStageDirective();

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setLevel( 3 );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setLevel( 3 );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );
  }
}
