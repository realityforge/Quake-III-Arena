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

public final class QerDirectivesTest
{
  @Test
  public void basicOperation()
  {
    final QerDirectives directives = new QerDirectives();

    assertFalse( directives.noCarve() );
    assertNull( directives.getEditorImage() );
    assertEquals( 0F, directives.getTransparency() );
    assertEquals( "", MaterialOutput.outputAsString( directives::write ) );
    assertEquals( "", MaterialOutput.outputAsString( directives::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    directives.setNoCarve( true );

    assertTrue( directives.noCarve() );
    assertNull( directives.getEditorImage() );
    assertEquals( 0F, directives.getTransparency() );
    assertEquals( "qer_nocarve\n", MaterialOutput.outputAsString( directives::write ) );
    assertEquals( "", MaterialOutput.outputAsString( directives::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    directives.setTransparency( 0.3F );
    directives.setEditorImage( "images/editor" );

    assertTrue( directives.noCarve() );
    assertEquals( "images/editor", directives.getEditorImage() );
    assertEquals( 0.3F, directives.getTransparency() );
    assertEquals( "qer_editorimage images/editor\n"
                    + "qer_nocarve\n"
                    + "qer_trans .3\n",
                  MaterialOutput.outputAsString( directives::write ) );
    assertEquals( "", MaterialOutput.outputAsString( directives::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );
  }

  @Test
  public void verifyEqualsAndHash()
  {
    final QerDirectives directives1 = new QerDirectives();
    final QerDirectives directives2 = new QerDirectives();

    assertEquals( directives1, directives2 );
    assertEquals( directives1.hashCode(), directives2.hashCode() );

    directives1.setTransparency( 0.2F );

    assertNotEquals( directives1, directives2 );
    assertNotEquals( directives1.hashCode(), directives2.hashCode() );

    directives2.setTransparency( 0.2F );

    assertEquals( directives1, directives2 );
    assertEquals( directives1.hashCode(), directives2.hashCode() );

    directives1.setEditorImage( "X" );

    assertNotEquals( directives1, directives2 );
    assertNotEquals( directives1.hashCode(), directives2.hashCode() );

    directives2.setEditorImage( "X" );

    assertEquals( directives1, directives2 );
    assertEquals( directives1.hashCode(), directives2.hashCode() );

    directives1.setNoCarve( true );

    assertNotEquals( directives1, directives2 );
    assertNotEquals( directives1.hashCode(), directives2.hashCode() );

    directives2.setNoCarve( true );

    assertEquals( directives1, directives2 );
    assertEquals( directives1.hashCode(), directives2.hashCode() );
  }
}
