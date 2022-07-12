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
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

public final class MaterialsParserTest
{
  @DisplayName( "MinimalMaterialParseTest" )
  @Test
  public void basicParse()
  {
    // Test just performs a parse of a fragment to verify that the basic
    // parsing infrastructure works
    final String materialText = "textures/base/myBase\n"
                                + "{\n"
                                + "  q3map_surfacelight 1500\n"
                                + "  q3map_lightimage textures/wall/glowglow\n"
                                + "  q3map_novertexshadows\n"
                                + "  q3map_globaltexture\n"
                                + "\tq3map_forcesunlight\n"
                                + "}\n";
    final RecordingErrorListener errorListener = new RecordingErrorListener();
    final CharStream input = CharStreams.fromString( materialText );
    final BailLexer lexer = new BailLexer( input );
    final MaterialsParser parser = new MaterialsParser( new CommonTokenStream( lexer ) );
    parser.getErrorListeners().clear();
    parser.addErrorListener( errorListener );
    final MaterialsParser.MaterialsContext materials = parser.materials();
    final MaterialsParser.MaterialContext material = materials.material();
    final List<Error> errors = errorListener.getErrors();
    assertEquals( 0, errors.size(), "Unexpected errors: " + errors );

    final String label = material.LABEL().getText();
    assertEquals( "textures/base/myBase", label );
    assertNotNull( material.directives().directive().q3mapDirective().q3mapSurfaceLightDirective() );
    assertNotNull( material.directives().directives().directive().q3mapDirective().q3mapLightImageDirective() );
    assertNotNull(
      material.directives().directives().directives().directive().q3mapDirective().q3mapNoVertexShadowsDirective() );
    assertNotNull( material.directives()
                     .directives()
                     .directives()
                     .directives()
                     .directive()
                     .q3mapDirective()
                     .q3mapGlobalTextureDirective() );
    assertNotNull( material.directives()
                     .directives()
                     .directives()
                     .directives()
                     .directives()
                     .directive()
                     .q3mapDirective()
                     .q3mapForceSunlightDirective() );
    assertNull( materials.materials().materials() );
  }
}
