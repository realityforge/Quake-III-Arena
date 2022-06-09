package org.realityforge.q3a.material_magic.model;

import org.junit.jupiter.api.Test;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

import static org.junit.jupiter.api.Assertions.*;

public final class DepthFuncStageDirectiveTest
{
  @Test
  public void basicOperation()
  {
    final DepthFuncStageDirective directive = new DepthFuncStageDirective();

    assertTrue( directive.isDefault() );

    directive.setEqual( true );

    assertFalse( directive.isDefault() );

    assertEquals( "depthFunc equal\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "depthFunc equal\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    directive.setEqual( false );

    assertTrue( directive.isDefault() );

    assertEquals( "depthFunc lequal\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "depthFunc lequal\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );
  }

  @Test
  public void verifyEqualsAndHash()
  {
    final DepthFuncStageDirective directive1 = new DepthFuncStageDirective();
    final DepthFuncStageDirective directive2 = new DepthFuncStageDirective();

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setEqual( true );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setEqual( true );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );
  }
}
