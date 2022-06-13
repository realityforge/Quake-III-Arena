package org.realityforge.q3a.material_magic.model;

import org.junit.jupiter.api.Test;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

import static org.junit.jupiter.api.Assertions.*;

public final class ProjectionShadowDeformStageDirectiveTest
{
  @Test
  public void basicOperation()
  {
    final ProjectionShadowDeformStageDirective directive = new ProjectionShadowDeformStageDirective();

    assertEquals( "deformVertexes projectionShadow\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "deformVertexes projectionShadow\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );
  }

  @Test
  public void verifyEqualsAndHash()
  {
    final ProjectionShadowDeformStageDirective directive1 = new ProjectionShadowDeformStageDirective();
    final ProjectionShadowDeformStageDirective directive2 = new ProjectionShadowDeformStageDirective();

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );
  }
}
