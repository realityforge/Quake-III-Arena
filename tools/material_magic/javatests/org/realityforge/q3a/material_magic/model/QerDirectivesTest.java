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
  public void testEqualsAndHash()
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
