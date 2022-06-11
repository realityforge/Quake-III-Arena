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

    assertFalse( stage.hasAnimMap() );

    stage.animMap().setFrequency( 0.25F );
    stage.animMap().setTexture1( "textures/foo1" );
    stage.animMap().setTexture2( "textures/foo2" );

    assertTrue( stage.hasAnimMap() );

    assertEquals( "{\n  map *white\n  clampmap textures/foo\n  animMap .25 textures/foo1 textures/foo2\n}\n",
                  MaterialOutput.outputAsString( stage::write ) );
    assertEquals( "{\nmap *white\nclampmap textures/foo\nanimMap .25 textures/foo1 textures/foo2\n}\n",
                  MaterialOutput.outputAsString( stage::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    assertFalse( stage.hasVideoMap() );

    stage.videoMap().setVideo( "myvideo.roq" );

    assertTrue( stage.hasVideoMap() );

    assertEquals( "{\n"
                    + "  map *white\n"
                    + "  clampmap textures/foo\n"
                    + "  animMap .25 textures/foo1 textures/foo2\n"
                    + "  videoMap myvideo.roq\n"
                    + "}\n",
                  MaterialOutput.outputAsString( stage::write ) );
    assertEquals( "{\n"
                    + "map *white\n"
                    + "clampmap textures/foo\n"
                    + "animMap .25 textures/foo1 textures/foo2\n"
                    + "videoMap myvideo.roq\n"
                    + "}\n",
                  MaterialOutput.outputAsString( stage::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    assertFalse( stage.hasDepthFunc() );

    stage.depthFunc().setEqual( true );

    assertTrue( stage.hasDepthFunc() );

    assertEquals( "{\n"
                    + "  map *white\n"
                    + "  clampmap textures/foo\n"
                    + "  animMap .25 textures/foo1 textures/foo2\n"
                    + "  videoMap myvideo.roq\n"
                    + "  depthFunc equal\n"
                    + "}\n",
                  MaterialOutput.outputAsString( stage::write ) );
    assertEquals( "{\n"
                    + "map *white\n"
                    + "clampmap textures/foo\n"
                    + "animMap .25 textures/foo1 textures/foo2\n"
                    + "videoMap myvideo.roq\n"
                    + "depthFunc equal\n"
                    + "}\n",
                  MaterialOutput.outputAsString( stage::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    stage.setDetail( new DetailStageDirective() );

    assertEquals( "{\n"
                    + "  map *white\n"
                    + "  clampmap textures/foo\n"
                    + "  animMap .25 textures/foo1 textures/foo2\n"
                    + "  videoMap myvideo.roq\n"
                    + "  depthFunc equal\n"
                    + "  detail\n"
                    + "}\n",
                  MaterialOutput.outputAsString( stage::write ) );
    assertEquals( "{\n"
                    + "map *white\n"
                    + "clampmap textures/foo\n"
                    + "animMap .25 textures/foo1 textures/foo2\n"
                    + "videoMap myvideo.roq\n"
                    + "depthFunc equal\n"
                    + "detail\n"
                    + "}\n",
                  MaterialOutput.outputAsString( stage::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    stage.setDepthWrite( new DepthWriteStageDirective() );

    assertEquals( "{\n"
                    + "  map *white\n"
                    + "  clampmap textures/foo\n"
                    + "  animMap .25 textures/foo1 textures/foo2\n"
                    + "  videoMap myvideo.roq\n"
                    + "  depthFunc equal\n"
                    + "  detail\n"
                    + "  depthWrite\n"
                    + "}\n",
                  MaterialOutput.outputAsString( stage::write ) );
    assertEquals( "{\n"
                    + "map *white\n"
                    + "clampmap textures/foo\n"
                    + "animMap .25 textures/foo1 textures/foo2\n"
                    + "videoMap myvideo.roq\n"
                    + "depthFunc equal\n"
                    + "detail\n"
                    + "depthWrite\n"
                    + "}\n",
                  MaterialOutput.outputAsString( stage::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    assertFalse( stage.hasAlphaFunc() );

    stage.alphaFunc().setFunc( AlphaFuncStageDirective.AlphaFunc.GE128 );

    assertTrue( stage.hasAlphaFunc() );
    assertEquals( "{\n"
                    + "  map *white\n"
                    + "  clampmap textures/foo\n"
                    + "  animMap .25 textures/foo1 textures/foo2\n"
                    + "  videoMap myvideo.roq\n"
                    + "  depthFunc equal\n"
                    + "  detail\n"
                    + "  depthWrite\n"
                    + "  alphaFunc GE128\n"
                    + "}\n",
                  MaterialOutput.outputAsString( stage::write ) );
    assertEquals( "{\n"
                    + "map *white\n"
                    + "clampmap textures/foo\n"
                    + "animMap .25 textures/foo1 textures/foo2\n"
                    + "videoMap myvideo.roq\n"
                    + "depthFunc equal\n"
                    + "detail\n"
                    + "depthWrite\n"
                    + "alphaFunc GE128\n"
                    + "}\n",
                  MaterialOutput.outputAsString( stage::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    assertFalse( stage.hasBlendFunc() );

    stage.blendFunc().setSrcBlend( BlendFuncStageDirective.SrcBlendMode.ONE );
    stage.blendFunc().setDstBlend( BlendFuncStageDirective.DstBlendMode.ONE );

    assertTrue( stage.hasBlendFunc() );

    assertEquals( "{\n"
                    + "  map *white\n"
                    + "  clampmap textures/foo\n"
                    + "  animMap .25 textures/foo1 textures/foo2\n"
                    + "  videoMap myvideo.roq\n"
                    + "  depthFunc equal\n"
                    + "  detail\n"
                    + "  depthWrite\n"
                    + "  alphaFunc GE128\n"
                    + "  blendFunc add\n"
                    + "}\n",
                  MaterialOutput.outputAsString( stage::write ) );
    assertEquals( "{\n"
                    + "map *white\n"
                    + "clampmap textures/foo\n"
                    + "animMap .25 textures/foo1 textures/foo2\n"
                    + "videoMap myvideo.roq\n"
                    + "depthFunc equal\n"
                    + "detail\n"
                    + "depthWrite\n"
                    + "alphaFunc GE128\n"
                    + "blendFunc add\n"
                    + "}\n",
                  MaterialOutput.outputAsString( stage::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    assertFalse( stage.hasTcGen() );

    stage.tcGen().setCoordinateSource( TcGenStageDirective.CoordinateSource.ENVIRONMENT );

    assertTrue( stage.hasTcGen() );

    assertEquals( "{\n"
                    + "  map *white\n"
                    + "  clampmap textures/foo\n"
                    + "  animMap .25 textures/foo1 textures/foo2\n"
                    + "  videoMap myvideo.roq\n"
                    + "  depthFunc equal\n"
                    + "  detail\n"
                    + "  depthWrite\n"
                    + "  alphaFunc GE128\n"
                    + "  blendFunc add\n"
                    + "  tcGen environment\n"
                    + "}\n",
                  MaterialOutput.outputAsString( stage::write ) );
    assertEquals( "{\n"
                    + "map *white\n"
                    + "clampmap textures/foo\n"
                    + "animMap .25 textures/foo1 textures/foo2\n"
                    + "videoMap myvideo.roq\n"
                    + "depthFunc equal\n"
                    + "detail\n"
                    + "depthWrite\n"
                    + "alphaFunc GE128\n"
                    + "blendFunc add\n"
                    + "tcGen environment\n"
                    + "}\n",
                  MaterialOutput.outputAsString( stage::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    assertFalse( stage.hasRgbGen() );

    stage.rgbGen().setFunc( RgbGenStageDirective.Func.vertex );

    assertTrue( stage.hasRgbGen() );

    assertEquals( "{\n"
                    + "  map *white\n"
                    + "  clampmap textures/foo\n"
                    + "  animMap .25 textures/foo1 textures/foo2\n"
                    + "  videoMap myvideo.roq\n"
                    + "  depthFunc equal\n"
                    + "  detail\n"
                    + "  depthWrite\n"
                    + "  alphaFunc GE128\n"
                    + "  blendFunc add\n"
                    + "  tcGen environment\n"
                    + "  rgbGen vertex\n"
                    + "}\n",
                  MaterialOutput.outputAsString( stage::write ) );
    assertEquals( "{\n"
                    + "map *white\n"
                    + "clampmap textures/foo\n"
                    + "animMap .25 textures/foo1 textures/foo2\n"
                    + "videoMap myvideo.roq\n"
                    + "depthFunc equal\n"
                    + "detail\n"
                    + "depthWrite\n"
                    + "alphaFunc GE128\n"
                    + "blendFunc add\n"
                    + "tcGen environment\n"
                    + "rgbGen vertex\n"
                    + "}\n",
                  MaterialOutput.outputAsString( stage::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED ) );

    assertFalse( stage.hasAlphaGen() );

    stage.alphaGen().setFunc( AlphaGenStageDirective.Func.vertex );

    assertTrue( stage.hasAlphaGen() );

    assertEquals( "{\n"
                    + "  map *white\n"
                    + "  clampmap textures/foo\n"
                    + "  animMap .25 textures/foo1 textures/foo2\n"
                    + "  videoMap myvideo.roq\n"
                    + "  depthFunc equal\n"
                    + "  detail\n"
                    + "  depthWrite\n"
                    + "  alphaFunc GE128\n"
                    + "  blendFunc add\n"
                    + "  tcGen environment\n"
                    + "  rgbGen vertex\n"
                    + "  alphaGen vertex\n"
                    + "}\n",
                  MaterialOutput.outputAsString( stage::write ) );
    assertEquals( "{\n"
                    + "map *white\n"
                    + "clampmap textures/foo\n"
                    + "animMap .25 textures/foo1 textures/foo2\n"
                    + "videoMap myvideo.roq\n"
                    + "depthFunc equal\n"
                    + "detail\n"
                    + "depthWrite\n"
                    + "alphaFunc GE128\n"
                    + "blendFunc add\n"
                    + "tcGen environment\n"
                    + "rgbGen vertex\n"
                    + "alphaGen vertex\n"
                    + "}\n",
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

    // This creates a default map that changes not the equals/hash commands
    stage1.animMap();

    assertEquals( stage1, stage2 );
    assertEquals( stage1.hashCode(), stage2.hashCode() );

    stage1.animMap().setFrequency( 0.25F );
    stage1.animMap().setTexture1( "textures/foo/other_foo" );

    assertNotEquals( stage1, stage2 );
    assertNotEquals( stage1.hashCode(), stage2.hashCode() );

    stage2.animMap().setFrequency( 0.25F );
    stage2.animMap().setTexture1( "textures/foo/other_foo" );

    assertEquals( stage1, stage2 );
    assertEquals( stage1.hashCode(), stage2.hashCode() );

    stage1.videoMap().setVideo( "movie.roq" );

    assertNotEquals( stage1, stage2 );
    assertNotEquals( stage1.hashCode(), stage2.hashCode() );

    stage2.videoMap().setVideo( "movie.roq" );

    assertEquals( stage1, stage2 );
    assertEquals( stage1.hashCode(), stage2.hashCode() );

    stage1.depthFunc().setEqual( true );

    assertNotEquals( stage1, stage2 );
    assertNotEquals( stage1.hashCode(), stage2.hashCode() );

    stage2.depthFunc().setEqual( true );

    assertEquals( stage1, stage2 );
    assertEquals( stage1.hashCode(), stage2.hashCode() );

    stage1.setDetail( new DetailStageDirective() );

    assertNotEquals( stage1, stage2 );
    assertNotEquals( stage1.hashCode(), stage2.hashCode() );

    stage2.setDetail( new DetailStageDirective() );

    assertEquals( stage1, stage2 );
    assertEquals( stage1.hashCode(), stage2.hashCode() );

    stage1.setDepthWrite( new DepthWriteStageDirective() );

    assertNotEquals( stage1, stage2 );
    assertNotEquals( stage1.hashCode(), stage2.hashCode() );

    stage2.setDepthWrite( new DepthWriteStageDirective() );

    assertEquals( stage1, stage2 );
    assertEquals( stage1.hashCode(), stage2.hashCode() );

    stage1.alphaFunc().setFunc( AlphaFuncStageDirective.AlphaFunc.GT0 );

    assertNotEquals( stage1, stage2 );
    assertNotEquals( stage1.hashCode(), stage2.hashCode() );

    stage2.alphaFunc().setFunc( AlphaFuncStageDirective.AlphaFunc.GT0 );

    assertEquals( stage1, stage2 );
    assertEquals( stage1.hashCode(), stage2.hashCode() );

    stage1.blendFunc().setSrcBlend( BlendFuncStageDirective.SrcBlendMode.ONE );
    stage1.blendFunc().setDstBlend( BlendFuncStageDirective.DstBlendMode.ONE );

    assertNotEquals( stage1, stage2 );
    assertNotEquals( stage1.hashCode(), stage2.hashCode() );

    stage2.blendFunc().setSrcBlend( BlendFuncStageDirective.SrcBlendMode.ONE );
    stage2.blendFunc().setDstBlend( BlendFuncStageDirective.DstBlendMode.ONE );

    assertEquals( stage1, stage2 );
    assertEquals( stage1.hashCode(), stage2.hashCode() );

    stage1.tcGen().setCoordinateSource( TcGenStageDirective.CoordinateSource.LIGHTMAP );

    assertNotEquals( stage1, stage2 );
    assertNotEquals( stage1.hashCode(), stage2.hashCode() );

    stage2.tcGen().setCoordinateSource( TcGenStageDirective.CoordinateSource.LIGHTMAP );

    assertEquals( stage1, stage2 );
    assertEquals( stage1.hashCode(), stage2.hashCode() );

    assertEquals( stage1, stage2 );
    assertEquals( stage1.hashCode(), stage2.hashCode() );

    stage1.rgbGen().setFunc( RgbGenStageDirective.Func.vertex );

    assertNotEquals( stage1, stage2 );
    assertNotEquals( stage1.hashCode(), stage2.hashCode() );

    stage2.rgbGen().setFunc( RgbGenStageDirective.Func.vertex );

    assertEquals( stage1, stage2 );
    assertEquals( stage1.hashCode(), stage2.hashCode() );

    stage1.alphaGen().setFunc( AlphaGenStageDirective.Func.vertex );

    assertNotEquals( stage1, stage2 );
    assertNotEquals( stage1.hashCode(), stage2.hashCode() );

    stage2.alphaGen().setFunc( AlphaGenStageDirective.Func.vertex );

    assertEquals( stage1, stage2 );
    assertEquals( stage1.hashCode(), stage2.hashCode() );
  }
}
