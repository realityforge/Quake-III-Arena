package org.realityforge.q3a.material_magic.model;

import org.junit.jupiter.api.Test;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

import static org.junit.jupiter.api.Assertions.*;

public final class StageDirectiveTest
{
  @Test
  public void basicOperation()
  {
    final Stage stage = new Stage();

    assertFalse( stage.hasMap() );

    stage.map().setTexture( "*white" );

    assertTrue( stage.hasMap() );

    assertEquals( "{\n  map *white\n}\n", MaterialOutput.outputAsString( stage::write ) );
    assertEquals( "{\nmap *white\n}\n",
                  MaterialOutput.outputAsString( stage::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    assertFalse( stage.hasClampMap() );

    stage.clampMap().setTexture( "textures/foo" );

    assertTrue( stage.hasClampMap() );

    assertEquals( "{\n  map *white\n  clampmap textures/foo\n}\n", MaterialOutput.outputAsString( stage::write ) );
    assertEquals( "{\nmap *white\nclampmap textures/foo\n}\n",
                  MaterialOutput.outputAsString( stage::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );
  }

  @Test
  public void verifyEqualsAndHash()
  {
    final Stage stage1 = new Stage();
    final Stage stage2 = new Stage();

    assertEquals( stage1, stage2 );
    assertEquals( stage1.hashCode(), stage2.hashCode() );

    // This creates a default map that changes not the equals/hash commands
    stage1.map();

    assertEquals( stage1, stage2 );
    assertEquals( stage1.hashCode(), stage2.hashCode() );

    stage1.map().setTexture( "textures/foo/base_foo" );

    assertNotEquals( stage1, stage2 );
    assertNotEquals( stage1.hashCode(), stage2.hashCode() );

    stage2.map().setTexture( "textures/foo/base_foo" );

    assertEquals( stage1, stage2 );
    assertEquals( stage1.hashCode(), stage2.hashCode() );

    // This creates a default map that changes not the equals/hash commands
    stage1.clampMap();

    assertEquals( stage1, stage2 );
    assertEquals( stage1.hashCode(), stage2.hashCode() );

    stage1.clampMap().setTexture( "textures/foo/other_foo" );

    assertNotEquals( stage1, stage2 );
    assertNotEquals( stage1.hashCode(), stage2.hashCode() );

    stage2.clampMap().setTexture( "textures/foo/other_foo" );

    assertEquals( stage1, stage2 );
    assertEquals( stage1.hashCode(), stage2.hashCode() );
  }
}
