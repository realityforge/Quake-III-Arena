package org.realityforge.q3a.material_magic.model;

import org.junit.jupiter.api.Test;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

import static org.junit.jupiter.api.Assertions.*;

public final class AutoSprite2DeformStageDirectiveTest
{
  @Test
  public void basicOperation()
  {
    final AutoSprite2DeformStageDirective directive = new AutoSprite2DeformStageDirective();

    assertEquals( "deformVertexes autoSprite2\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "deformVertexes autoSprite2\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );
  }

  @Test
  public void verifyEqualsAndHash()
  {
    final AutoSprite2DeformStageDirective directive1 = new AutoSprite2DeformStageDirective();
    final AutoSprite2DeformStageDirective directive2 = new AutoSprite2DeformStageDirective();

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );
  }
}
