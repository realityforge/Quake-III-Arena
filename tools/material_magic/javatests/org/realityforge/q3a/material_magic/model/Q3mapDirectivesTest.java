package org.realityforge.q3a.material_magic.model;

import org.junit.jupiter.api.Test;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

import static org.junit.jupiter.api.Assertions.*;

public final class Q3mapDirectivesTest
{
  @Test
  public void basicOperation()
  {
    final Q3mapDirectives directives = new Q3mapDirectives();

    assertFalse( directives.forceSunLight() );
    assertFalse( directives.noVertexShadows() );
    assertFalse( directives.globalTexture() );
    assertNull( directives.getFlare() );
    assertNull( directives.getLightImage() );
    assertEquals( 0, directives.getSurfaceLight() );
    assertEquals( 0, directives.getLightSubDivide() );
    assertEquals( 0, directives.getTessSize() );
    assertEquals( Q3mapDirectives.DEFAULT_BACKSPLASH_PERCENT, directives.getBackSplashPercent() );
    assertEquals( Q3mapDirectives.DEFAULT_BACKSPLASH_DISTANCE, directives.getBackSplashDistance() );
    assertEquals( "", MaterialOutput.outputAsString( directives::write ) );
    assertEquals( "", MaterialOutput.outputAsString( directives::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    directives.setForceSunLight( true );

    assertTrue( directives.forceSunLight() );
    assertFalse( directives.noVertexShadows() );
    assertFalse( directives.globalTexture() );
    assertNull( directives.getLightImage() );
    assertEquals( 0, directives.getSurfaceLight() );
    assertEquals( 0, directives.getLightSubDivide() );
    assertEquals( 0, directives.getTessSize() );
    assertEquals( Q3mapDirectives.DEFAULT_BACKSPLASH_PERCENT, directives.getBackSplashPercent() );
    assertEquals( Q3mapDirectives.DEFAULT_BACKSPLASH_DISTANCE, directives.getBackSplashDistance() );
    assertEquals( "q3map_forcesunlight\n", MaterialOutput.outputAsString( directives::write ) );
    assertEquals( "", MaterialOutput.outputAsString( directives::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    directives.setNoVertexShadows( true );
    directives.setGlobalTexture( true );
    directives.setFlare( "flareshader" );
    directives.setLightImage( "images/foo" );
    directives.setSurfaceLight( 500 );
    directives.setLightSubDivide( 200 );
    directives.setTessSize( 64 );
    directives.setBackSplashPercent( 0 );
    directives.setBackSplashDistance( 0 );

    assertTrue( directives.forceSunLight() );
    assertTrue( directives.noVertexShadows() );
    assertTrue( directives.globalTexture() );
    assertEquals( "flareshader", directives.getFlare() );
    assertEquals( "images/foo", directives.getLightImage() );
    assertEquals( 500, directives.getSurfaceLight() );
    assertEquals( 200, directives.getLightSubDivide() );
    assertEquals( 64, directives.getTessSize() );
    assertEquals( 0, directives.getBackSplashDistance() );
    assertEquals( 0, directives.getBackSplashDistance() );
    assertEquals( "q3map_surfacelight 500\n"
                    + "q3map_lightsubdivide 200\n"
                    + "q3map_lightimage images/foo\n"
                    + "q3map_globaltexture\n"
                    + "q3map_novertexshadows\n"
                    + "q3map_forcesunlight\n"
                    + "q3map_flare flareshader\n"
                    + "q3map_backsplash 0 0\n"
                    + "tesssize 64\n",
                  MaterialOutput.outputAsString( directives::write ) );
    assertEquals( "", MaterialOutput.outputAsString( directives::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );
  }

  @Test
  public void testEqualsAndHash()
  {
    final Q3mapDirectives directives1 = new Q3mapDirectives();
    final Q3mapDirectives directives2 = new Q3mapDirectives();

    assertEquals( directives1, directives2 );
    assertEquals( directives1.hashCode(), directives2.hashCode() );

    directives1.setTessSize( 32 );

    assertNotEquals( directives1, directives2 );
    assertNotEquals( directives1.hashCode(), directives2.hashCode() );

    directives2.setTessSize( 32 );

    assertEquals( directives1, directives2 );
    assertEquals( directives1.hashCode(), directives2.hashCode() );

    assertEquals( directives1, directives2 );
    assertEquals( directives1.hashCode(), directives2.hashCode() );

    directives1.setBackSplashPercent( 55 );

    assertNotEquals( directives1, directives2 );
    assertNotEquals( directives1.hashCode(), directives2.hashCode() );

    directives2.setBackSplashPercent( 55 );

    assertEquals( directives1, directives2 );
    assertEquals( directives1.hashCode(), directives2.hashCode() );

    directives1.setBackSplashDistance( 56 );

    assertNotEquals( directives1, directives2 );
    assertNotEquals( directives1.hashCode(), directives2.hashCode() );

    directives2.setBackSplashDistance( 56 );

    assertEquals( directives1, directives2 );
    assertEquals( directives1.hashCode(), directives2.hashCode() );

    directives1.setSurfaceLight( 2 );

    assertNotEquals( directives1, directives2 );
    assertNotEquals( directives1.hashCode(), directives2.hashCode() );

    directives2.setSurfaceLight( 2 );

    assertEquals( directives1, directives2 );
    assertEquals( directives1.hashCode(), directives2.hashCode() );

    directives1.setLightSubDivide( 20 );

    assertNotEquals( directives1, directives2 );
    assertNotEquals( directives1.hashCode(), directives2.hashCode() );

    directives2.setLightSubDivide( 20 );

    assertEquals( directives1, directives2 );
    assertEquals( directives1.hashCode(), directives2.hashCode() );

    directives1.setLightImage( "X" );

    assertNotEquals( directives1, directives2 );
    assertNotEquals( directives1.hashCode(), directives2.hashCode() );

    directives2.setLightImage( "X" );

    assertEquals( directives1, directives2 );
    assertEquals( directives1.hashCode(), directives2.hashCode() );

    directives1.setNoVertexShadows( true );

    assertNotEquals( directives1, directives2 );
    assertNotEquals( directives1.hashCode(), directives2.hashCode() );

    directives2.setNoVertexShadows( true );

    assertEquals( directives1, directives2 );
    assertEquals( directives1.hashCode(), directives2.hashCode() );

    directives1.setGlobalTexture( true );

    assertNotEquals( directives1, directives2 );
    assertNotEquals( directives1.hashCode(), directives2.hashCode() );

    directives2.setGlobalTexture( true );

    assertEquals( directives1, directives2 );
    assertEquals( directives1.hashCode(), directives2.hashCode() );

    directives1.setForceSunLight( true );

    assertNotEquals( directives1, directives2 );
    assertNotEquals( directives1.hashCode(), directives2.hashCode() );

    directives2.setForceSunLight( true );

    assertEquals( directives1, directives2 );
    assertEquals( directives1.hashCode(), directives2.hashCode() );

    directives1.setFlare( "flareshader" );

    assertNotEquals( directives1, directives2 );
    assertNotEquals( directives1.hashCode(), directives2.hashCode() );

    directives2.setFlare( "flareshader" );

    assertEquals( directives1, directives2 );
    assertEquals( directives1.hashCode(), directives2.hashCode() );
  }
}
