package org.realityforge.q3a.material_magic.model;

import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

public final class EmitTest
{
  @Test
  public void basicOperation()
  {
    assertEquals( "1", EmitUtil.floatToString( 1.0F ) );
    assertEquals( "1.1", EmitUtil.floatToString( 1.1F ) );
    assertEquals( ".1", EmitUtil.floatToString( 0.1F ) );
  }
}
