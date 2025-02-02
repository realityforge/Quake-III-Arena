/*
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.realityforge.q3a.material_magic.model.reader;

import java.util.List;
import org.junit.jupiter.api.Test;
import org.realityforge.q3a.material_magic.model.Material;
import org.realityforge.q3a.material_magic.model.Q3mapDirectives;
import org.realityforge.q3a.material_magic.model.Unit;

import static org.junit.jupiter.api.Assertions.*;

public final class UnitReaderTest
{
  @Test
  public void readSingleMaterial() throws Exception
  {
    final String materialText = "textures/base/myBase\n"
                                + "{\n"
                                + "  q3map_surfacelight 1500\n"
                                + "  q3map_lightimage textures/wall/glowglow\n"
                                + "  q3map_novertexshadows\n"
                                + "\t\t\t\t  q3map_globaltexture\n"
                                + "}\n";
    final Unit unit = UnitReader.readFromString( materialText );
    final List<Material> materials = unit.getMaterials();
    assertEquals( 1, materials.size() );
    final Material material = materials.get( 0 );
    assertEquals( "textures/base/myBase", material.getName() );
    assertTrue( material.hasQ3map() );
    final Q3mapDirectives q3map = material.q3map();
    assertEquals( "textures/wall/glowglow", q3map.getLightImage() );
    assertEquals( 1500, q3map.getSurfaceLight() );
    assertTrue( q3map.noVertexShadows() );
    assertTrue( q3map.globalTexture() );
    assertFalse( q3map.forceSunLight() );

    final Unit unit2 = UnitReader.readFromString( unit.toString() );
    assertEquals( unit2, unit, "Expected the unit that was read post writing to match" );
  }

  @Test
  public void readMultipleMaterial() throws Exception
  {
    final String materialText = "textures/base/mat1\n{\nq3map_surfacelight 1500\n}\n"
                                + "textures/base/mat2\n{\nq3map_lightimage textures/wall/glowglow\n}\n";
    final Unit unit = UnitReader.readFromString( materialText );
    final List<Material> materials = unit.getMaterials();
    assertEquals( 2, materials.size() );
    {
      final Material material = materials.get( 0 );
      assertEquals( "textures/base/mat1", material.getName() );
      assertTrue( material.hasQ3map() );
      final Q3mapDirectives q3map = material.q3map();
      assertNull( q3map.getLightImage() );
      assertEquals( 1500, q3map.getSurfaceLight() );
      assertFalse( q3map.noVertexShadows() );
      assertFalse( q3map.globalTexture() );
      assertFalse( q3map.forceSunLight() );
    }
    {
      final Material material = materials.get( 1 );

      assertEquals( "textures/base/mat2", material.getName() );
      assertTrue( material.hasQ3map() );
      final Q3mapDirectives q3map = material.q3map();
      assertEquals( "textures/wall/glowglow", q3map.getLightImage() );
      assertEquals( 0, q3map.getSurfaceLight() );
      assertFalse( q3map.noVertexShadows() );
      assertFalse( q3map.globalTexture() );
      assertFalse( q3map.forceSunLight() );
    }

    final Unit unit2 = UnitReader.readFromString( unit.toString() );
    assertEquals( unit2, unit, "Expected the unit that was read post writing to match" );
  }

  @Test
  public void readProducesSyntaxError()
  {
    final String materialText = "textures/base/myBase\n"
                                + "{\n"
                                + "  q3map_surfacelight 1500\n"
                                + "  q3map_lightimage textures/wall/glowglow\n"
                                + "\t\t\t\t  q3map_globaltexture <>\n"
                                + "}\n"
                                + "}\n";

    try {
      UnitReader.readFromString( materialText );
      fail( "Unexpectedly succeeded in parsing bad input without an error" );
    } catch ( final MaterialsReadException e ) {
      final List<LoadError> errors = e.getSyntaxErrors();
      assertEquals( 1, errors.size() );
      final LoadError error = errors.get( 0 );
      assertEquals( "<string>", error.getFile() );
      assertEquals( 5, error.getLine() );
      assertEquals( 26, error.getCharPositionInLine() );
      assertEquals( "token recognition error at: '<'", error.getMessage() );
    }
  }
}
