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

public final class SortDirectiveTest
{
  @Test
  public void basicOperation()
  {
    final SortDirective directive = new SortDirective();

    assertEquals( "", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "", MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    assertTrue( directive.isDefault() );
    assertFalse( directive.isNonDefault() );

    directive.setKey( SortKey.seeThrough );

    assertEquals( "sort seeThrough\n", directive.toString() );
    assertEquals( "sort seeThrough\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "sort seeThrough\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    assertFalse( directive.isDefault() );
    assertTrue( directive.isNonDefault() );

    directive.setValue( 13.5F );

    assertNull( directive.getKey() );

    assertEquals( "sort 13.5\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "sort 13.5\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    directive.setValue( 13F );

    assertEquals( "sort 13\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "sort 13\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    directive.setKey( SortKey.portal );

    assertEquals( 0F, directive.getValue() );

    assertEquals( "sort portal\n", directive.toString() );
    assertEquals( "sort portal\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "sort portal\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );
  }

  @Test
  public void verifyEqualsAndHash()
  {
    final SortDirective directive1 = new SortDirective();
    final SortDirective directive2 = new SortDirective();

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setKey( SortKey.sky );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setKey( SortKey.sky );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setValue( 2 );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setValue( 2 );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );
  }
}
