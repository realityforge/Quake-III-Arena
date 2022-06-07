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
