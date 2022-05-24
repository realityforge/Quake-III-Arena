package org.realityforge.q3a.material_magic;

import org.antlr.v4.runtime.CharStreams;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public final class MaterialsParserToolTest {
    @DisplayName("MinimalMaterialParseTest")
    @Test
    public void basicParse() {
        // Test just performs a parse of a fragment to verify that the basic parsing infrastructure works
        final String materialText =
                "textures/base/myBase\n" +
                        "{\n" +
                        //"  q3map_surfacelight 1500\n" +
                        "}\n";
        final MaterialsParser parser = MaterialsParserTool.createParser(CharStreams.fromString(materialText), new BailErrorListener("MyMaterial.material"));
        final MaterialsParser.MaterialsContext materials = parser.materials();
        final MaterialsParser.MaterialContext material = materials.material();
        final String label = material.LABEL().getText();
        assertEquals("textures/base/myBase", label);
        final MaterialsParser.MaterialsContext materials2 = materials.materials();
    }
}
