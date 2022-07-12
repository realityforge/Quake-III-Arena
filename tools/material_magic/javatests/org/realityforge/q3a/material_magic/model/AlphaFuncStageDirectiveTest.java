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

public final class AlphaFuncStageDirectiveTest
{
  @Test
  public void basicOperation()
  {
    final AlphaFuncStageDirective directive = new AlphaFuncStageDirective();

    assertTrue( directive.isDefault() );

    directive.setFunc( AlphaFuncStageDirective.AlphaFunc.GE128 );

    assertFalse( directive.isDefault() );

    assertEquals( "alphaFunc GE128\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "alphaFunc GE128\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );
  }

  @Test
  public void verifyEqualsAndHash()
  {
    final AlphaFuncStageDirective directive1 = new AlphaFuncStageDirective();
    final AlphaFuncStageDirective directive2 = new AlphaFuncStageDirective();

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setFunc( AlphaFuncStageDirective.AlphaFunc.GT0 );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setFunc( AlphaFuncStageDirective.AlphaFunc.GT0 );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );
  }
}
