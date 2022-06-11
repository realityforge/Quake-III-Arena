package org.realityforge.q3a.material_magic.model;

import org.junit.jupiter.api.Test;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

import static org.junit.jupiter.api.Assertions.*;

public final class AutoSpriteDeformStageDirectiveTest
{
  @Test
  public void basicOperation()
  {
    final AutoSpriteDeformStageDirective directive = new AutoSpriteDeformStageDirective();

    assertEquals( "deformVertexes autoSprite\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "deformVertexes autoSprite\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );
  }

  @Test
  public void verifyEqualsAndHash()
  {
    final AutoSpriteDeformStageDirective directive1 = new AutoSpriteDeformStageDirective();
    final AutoSpriteDeformStageDirective directive2 = new AutoSpriteDeformStageDirective();

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );
  }
}
