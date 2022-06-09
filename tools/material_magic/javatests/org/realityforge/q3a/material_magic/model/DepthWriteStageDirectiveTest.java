package org.realityforge.q3a.material_magic.model;

import org.junit.jupiter.api.Test;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

import static org.junit.jupiter.api.Assertions.*;

public final class DepthWriteStageDirectiveTest
{
  @Test
  public void basicOperation()
  {
    final DepthWriteStageDirective directive = new DepthWriteStageDirective();

    assertEquals( "depthWrite\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "depthWrite\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );
  }

  @Test
  public void verifyEqualsAndHash()
  {
    final DepthWriteStageDirective directive1 = new DepthWriteStageDirective();
    final DepthWriteStageDirective directive2 = new DepthWriteStageDirective();

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );
  }
}
