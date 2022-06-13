package org.realityforge.q3a.material_magic.model;

import org.junit.jupiter.api.Test;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

import static org.junit.jupiter.api.Assertions.*;

public final class ClampMapStageDirectiveTest
{
  @Test
  public void basicOperation()
  {
    final ClampMapStageDirective directive = new ClampMapStageDirective();

    assertTrue( directive.isDefault() );

    directive.setTexture( "textures/base_water/wetstuff" );

    assertFalse( directive.isDefault() );

    assertEquals( "clampmap textures/base_water/wetstuff\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "clampmap textures/base_water/wetstuff\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );
  }

  @Test
  public void verifyEqualsAndHash()
  {
    final ClampMapStageDirective directive1 = new ClampMapStageDirective();
    final ClampMapStageDirective directive2 = new ClampMapStageDirective();

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setTexture( "textures/base_water/wetstuff" );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setTexture( "textures/base_water/wetstuff" );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );
  }
}
