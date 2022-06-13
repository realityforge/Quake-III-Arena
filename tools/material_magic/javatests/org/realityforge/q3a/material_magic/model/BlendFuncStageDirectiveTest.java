package org.realityforge.q3a.material_magic.model;

import org.junit.jupiter.api.Test;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

import static org.junit.jupiter.api.Assertions.*;

public final class BlendFuncStageDirectiveTest
{
  @Test
  public void basicOperation()
  {
    final BlendFuncStageDirective directive = new BlendFuncStageDirective();

    assertTrue( directive.isDefault() );

    directive.setSrcBlend( BlendFuncStageDirective.SrcBlendMode.ONE );
    directive.setDstBlend( BlendFuncStageDirective.DstBlendMode.ONE );

    assertFalse( directive.isDefault() );

    assertEquals( "blendFunc add\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "blendFunc add\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    directive.setSrcBlend( BlendFuncStageDirective.SrcBlendMode.SRC_ALPHA );
    directive.setDstBlend( BlendFuncStageDirective.DstBlendMode.ONE_MINUS_SRC_ALPHA );

    assertFalse( directive.isDefault() );

    assertEquals( "blendFunc blend\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "blendFunc blend\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    directive.setSrcBlend( BlendFuncStageDirective.SrcBlendMode.DST_COLOR );
    directive.setDstBlend( BlendFuncStageDirective.DstBlendMode.ZERO );

    assertFalse( directive.isDefault() );

    assertEquals( "blendFunc filter\n", MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "blendFunc filter\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    directive.setSrcBlend( BlendFuncStageDirective.SrcBlendMode.DST_COLOR );
    directive.setDstBlend( BlendFuncStageDirective.DstBlendMode.ONE_MINUS_DST_ALPHA );

    assertFalse( directive.isDefault() );

    assertEquals( "blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA\n",
                  MaterialOutput.outputAsString( directive::write ) );
    assertEquals( "blendFunc GL_DST_COLOR GL_ONE_MINUS_DST_ALPHA\n",
                  MaterialOutput.outputAsString( directive::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );
  }

  @Test
  public void verifyEqualsAndHash()
  {
    final BlendFuncStageDirective directive1 = new BlendFuncStageDirective();
    final BlendFuncStageDirective directive2 = new BlendFuncStageDirective();

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setSrcBlend( BlendFuncStageDirective.SrcBlendMode.DST_COLOR );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setSrcBlend( BlendFuncStageDirective.SrcBlendMode.DST_COLOR );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );

    directive1.setDstBlend( BlendFuncStageDirective.DstBlendMode.ONE_MINUS_DST_ALPHA );

    assertNotEquals( directive1, directive2 );
    assertNotEquals( directive1.hashCode(), directive2.hashCode() );

    directive2.setDstBlend( BlendFuncStageDirective.DstBlendMode.ONE_MINUS_DST_ALPHA );

    assertEquals( directive1, directive2 );
    assertEquals( directive1.hashCode(), directive2.hashCode() );
  }
}
