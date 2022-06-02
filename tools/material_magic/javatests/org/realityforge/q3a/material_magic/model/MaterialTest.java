package org.realityforge.q3a.material_magic.model;

import org.junit.jupiter.api.Test;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

import static org.junit.jupiter.api.Assertions.*;

public final class MaterialTest
{
  @Test
  public void basicOperation()
  {
    final Material material = new Material( "materials/my/Material1" );

    assertFalse( material.hasQ3map() );
    assertFalse( material.hasFog() );
    assertFalse( material.hasSky() );
    assertFalse( material.hasSort() );
    assertEquals( "materials/my/Material1", material.getName() );
    assertEquals( "materials/my/Material1\n{\n}\n", material.toString() );
    assertEquals( "materials/my/Material1\n{\n}\n", MaterialOutput.outputAsString( material::write ) );
    assertEquals( "materials/my/Material1\n{\n}\n",
                  MaterialOutput.outputAsString( material::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    material.setName( "materials/my/Material2" );

    assertEquals( "materials/my/Material2", material.getName() );
    assertEquals( "materials/my/Material2\n{\n}\n", material.toString() );
    assertEquals( "materials/my/Material2\n{\n}\n", MaterialOutput.outputAsString( material::write ) );
    assertEquals( "materials/my/Material2\n{\n}\n",
                  MaterialOutput.outputAsString( material::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    material.q3map().setForceSunLight( true );
    material.q3map().setSurfaceLight( 500 );
    material.q3map().setGlobalTexture( true );
    material.q3map().setNoVertexShadows( true );
    material.q3map().setLightImage( "tex/img" );
    material.setCull( CullType.BACK );
    material.setNoPicMip( true );
    material.setNoMipMaps( true );
    material.setPortal( true );
    material.setEntityMergable( true );
    material.setPolygonOffset( true );
    material.fog().setRed( 1.0F );
    material.fog().setGreen( 0.1F );
    material.fog().setBlue( 0.5F );
    material.fog().setDepthForOpaque( 50 );
    material.sky().setFarBox( "myFarBox" );
    material.sky().setCloudHeight( 512 );
    material.sky().setNearBox( "myNearBox" );
    material.sort().setKey( SortKey.portal );
    material.addSurfaceParameter( SurfaceParameter.botclip );
    material.addSurfaceParameter( SurfaceParameter.slime );
    material.addSurfaceParameter( SurfaceParameter.dust );

    assertTrue( material.hasQ3map() );
    assertTrue( material.hasFog() );
    assertTrue( material.hasSky() );
    assertTrue( material.hasSort() );

    assertEquals( "materials/my/Material2\n"
                    + "{\n"
                    + "  q3map_surfacelight 500\n"
                    + "  q3map_lightimage tex/img\n"
                    + "  q3map_globaltexture\n"
                    + "  q3map_novertexshadows\n"
                    + "  q3map_forcesunlight\n"
                    + "  cull back\n"
                    + "  nopicmip\n"
                    + "  nomipmaps\n"
                    + "  portal\n"
                    + "  entityMergable\n"
                    + "  polygonOffset\n"
                    + "  fogparms 1 .1 .5 50\n"
                    + "  skyparms myFarBox 512 myNearBox\n"
                    + "  sort portal\n"
                    + "  surfaceparm botclip\n"
                    + "  surfaceparm dust\n"
                    + "  surfaceparm slime\n"
                    + "}\n",
                  material.toString() );
    assertEquals( "materials/my/Material2\n"
                    + "{\n"
                    + "cull back\n"
                    + "nopicmip\n"
                    + "nomipmaps\n"
                    + "portal\n"
                    + "entityMergable\n"
                    + "polygonOffset\n"
                    + "fogparms 1 .1 .5 50\n"
                    + "skyparms myFarBox 512 myNearBox\n"
                    + "sort portal\n"
                    + "surfaceparm botclip\n"
                    + "surfaceparm dust\n"
                    + "surfaceparm slime\n"
                    + "}\n",
                  MaterialOutput.outputAsString( material::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );
  }

  @Test
  public void testEqualsAndHash()
  {
    final Material material1 = new Material( "materials/my/Material1" );
    final Material material2 = new Material( "materials/my/Material1" );

    assertEquals( material1, material2 );
    assertEquals( material1.hashCode(), material2.hashCode() );

    material1.setName( "X" );

    assertNotEquals( material1, material2 );
    assertNotEquals( material1.hashCode(), material2.hashCode() );

    material2.setName( "X" );

    assertEquals( material1, material2 );
    assertEquals( material1.hashCode(), material2.hashCode() );

    assertEquals( material1, material2 );
    assertEquals( material1.hashCode(), material2.hashCode() );

    material1.setCull( CullType.BACK );

    assertNotEquals( material1, material2 );
    assertNotEquals( material1.hashCode(), material2.hashCode() );

    material2.setCull( CullType.BACK );

    assertEquals( material1, material2 );
    assertEquals( material1.hashCode(), material2.hashCode() );

    material1.setNoPicMip( true );

    assertNotEquals( material1, material2 );
    assertNotEquals( material1.hashCode(), material2.hashCode() );

    material2.setNoPicMip( true );

    assertEquals( material1, material2 );
    assertEquals( material1.hashCode(), material2.hashCode() );

    material1.setPortal( true );

    assertNotEquals( material1, material2 );
    assertNotEquals( material1.hashCode(), material2.hashCode() );

    material2.setPortal( true );

    assertEquals( material1, material2 );
    assertEquals( material1.hashCode(), material2.hashCode() );

    material1.setEntityMergable( true );

    assertNotEquals( material1, material2 );
    assertNotEquals( material1.hashCode(), material2.hashCode() );

    material2.setEntityMergable( true );

    assertEquals( material1, material2 );
    assertEquals( material1.hashCode(), material2.hashCode() );

    material1.setPolygonOffset( true );

    assertNotEquals( material1, material2 );
    assertNotEquals( material1.hashCode(), material2.hashCode() );

    material2.setPolygonOffset( true );

    assertEquals( material1, material2 );
    assertEquals( material1.hashCode(), material2.hashCode() );

    material1.q3map().setLightImage( "X" );

    assertNotEquals( material1, material2 );
    assertNotEquals( material1.hashCode(), material2.hashCode() );

    material2.q3map().setLightImage( "X" );

    assertEquals( material1, material2 );
    assertEquals( material1.hashCode(), material2.hashCode() );

    material1.addSurfaceParameter( SurfaceParameter.botclip );
    material1.addSurfaceParameter( SurfaceParameter.slime );

    assertNotEquals( material1, material2 );
    assertNotEquals( material1.hashCode(), material2.hashCode() );

    // Note: These are added in a different order to demonstrate hashing and
    // equality uses sorted order
    material2.addSurfaceParameter( SurfaceParameter.slime );
    material2.addSurfaceParameter( SurfaceParameter.botclip );

    assertEquals( material1, material2 );
    assertEquals( material1.hashCode(), material2.hashCode() );

    material1.fog().setRed( 1.0F );
    material1.fog().setGreen( 0.1F );
    material1.fog().setBlue( 0.5F );
    material1.fog().setDepthForOpaque( 50 );

    assertNotEquals( material1, material2 );
    assertNotEquals( material1.hashCode(), material2.hashCode() );

    material2.fog().setRed( 1.0F );
    material2.fog().setGreen( 0.1F );
    material2.fog().setBlue( 0.5F );
    material2.fog().setDepthForOpaque( 50 );

    assertEquals( material1, material2 );
    assertEquals( material1.hashCode(), material2.hashCode() );

    final SkyDirective sky1 = material1.sky();
    sky1.setFarBox( "myFarBox" );
    sky1.setCloudHeight( 112 );
    sky1.setNearBox( "myNearBox" );

    assertNotEquals( material1, material2 );
    assertNotEquals( material1.hashCode(), material2.hashCode() );

    final SkyDirective sky2 = material2.sky();
    sky2.setFarBox( "myFarBox" );
    sky2.setCloudHeight( 112 );
    sky2.setNearBox( "myNearBox" );

    assertEquals( material1, material2 );
    assertEquals( material1.hashCode(), material2.hashCode() );

    assertEquals( material1, material2 );
    assertEquals( material1.hashCode(), material2.hashCode() );

    // Reset
    sky1.setFarBox( null );
    sky1.setCloudHeight( SkyDirective.DEFAULT_CLOUD_HEIGHT );
    sky1.setNearBox( null );

    assertNotEquals( material1, material2 );
    assertNotEquals( material1.hashCode(), material2.hashCode() );

    material2.setSky( null );

    assertEquals( material1, material2 );
    assertEquals( material1.hashCode(), material2.hashCode() );

    final SortDirective sort1 = material1.sort();
    sort1.setKey( SortKey.sky );

    assertNotEquals( material1, material2 );
    assertNotEquals( material1.hashCode(), material2.hashCode() );

    final SortDirective sort2 = material2.sort();
    sort2.setKey( SortKey.sky );

    assertEquals( material1, material2 );
    assertEquals( material1.hashCode(), material2.hashCode() );

    assertEquals( material1, material2 );
    assertEquals( material1.hashCode(), material2.hashCode() );

    // Reset
    sort1.setKey( null );

    assertNotEquals( material1, material2 );
    assertNotEquals( material1.hashCode(), material2.hashCode() );

    material2.setSort( null );

    assertEquals( material1, material2 );
    assertEquals( material1.hashCode(), material2.hashCode() );
  }
}
