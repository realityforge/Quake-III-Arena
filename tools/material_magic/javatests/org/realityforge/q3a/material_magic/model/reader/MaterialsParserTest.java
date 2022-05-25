package org.realityforge.q3a.material_magic.model.reader;

import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import java.util.List;

import static org.junit.jupiter.api.Assertions.*;

public final class MaterialsParserTest {
    @DisplayName("MinimalMaterialParseTest")
    @Test
    public void basicParse() {
        // Test just performs a parse of a fragment to verify that the basic parsing infrastructure works
        final String materialText =
                "textures/base/myBase\n" +
                        "{\n" +
                        "  q3map_surfacelight 1500\n" +
                        "  q3map_lightimage textures/wall/glowglow\n" +
                        "  q3map_novertexshadows\n" +
                        "  q3map_globaltexture\n" +
                        "\tq3map_forcesunlight\n" +
                        "}\n";
        final RecordingErrorListener errorListener = new RecordingErrorListener();
        final CharStream input = CharStreams.fromString(materialText);
        final BailLexer lexer = new BailLexer(input);
        final MaterialsParser parser = new MaterialsParser(new CommonTokenStream(lexer));
        parser.getErrorListeners().clear();
        parser.addErrorListener(errorListener);
        final MaterialsParser.MaterialsContext materials = parser.materials();
        final MaterialsParser.MaterialContext material = materials.material();
        final List<Error> errors = errorListener.getErrors();
        assertEquals(0, errors.size(), "Unexpected errors: " + errors);

        final String label = material.LABEL().getText();
        assertEquals("textures/base/myBase", label);
        final MaterialsParser.Q3mapMaterialPropertyContext materialProperty1 = material.materialProperties().materialProperty().q3mapMaterialProperty();
        final MaterialsParser.Q3mapMaterialPropertyContext materialProperty2 = material.materialProperties().materialProperties().materialProperty().q3mapMaterialProperty();
        final MaterialsParser.Q3mapMaterialPropertyContext materialProperty3 = material.materialProperties().materialProperties().materialProperties().materialProperty().q3mapMaterialProperty();
        final MaterialsParser.Q3mapMaterialPropertyContext materialProperty4 = material.materialProperties().materialProperties().materialProperties().materialProperties().materialProperty().q3mapMaterialProperty();
        final MaterialsParser.Q3mapMaterialPropertyContext materialProperty5 = material.materialProperties().materialProperties().materialProperties().materialProperties().materialProperties().materialProperty().q3mapMaterialProperty();
        assertNotNull(materialProperty1.Q3MAP_SURFACELIGHT());
        assertEquals("1500", materialProperty1.POSITIVE_INTEGER().getText());
        assertNotNull(materialProperty2.Q3MAP_LIGHTIMAGE());
        assertEquals("textures/wall/glowglow", materialProperty2.LABEL().getText());
        assertNotNull(materialProperty3.Q3MAP_NOVERTEXSHADOWS());
        assertNotNull(materialProperty4.Q3MAP_GLOBALTEXTURE());
        assertNotNull(materialProperty5.Q3MAP_FORCESUNLIGHT());
        assertNull(materials.materials().materials());
    }
}