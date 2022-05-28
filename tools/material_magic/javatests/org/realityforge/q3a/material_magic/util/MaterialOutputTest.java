package org.realityforge.q3a.material_magic.util;

import static org.junit.jupiter.api.Assertions.*;

import java.nio.file.Files;
import java.nio.file.Path;
import org.junit.jupiter.api.Test;

public final class MaterialOutputTest {
    @Test
    public void basicOperationWithPrettyStrategy() throws Exception
    {
        final Path file = Files.createTempFile("m", ".material");
        try (final MaterialOutput output = new MaterialOutput(file, MaterialOutput.Strategy.PRETTY)) {
            assertFalse(output.shouldOmitNonRuntimeDirectives());
            assertTrue(output.shouldPrettyPrint());
            assertEquals(MaterialOutput.Strategy.PRETTY, output.getStrategy());
        }
    }

    @Test
    public void basicOperationWithRuntimeOptimizedStrategy() throws Exception
    {
        final Path file = Files.createTempFile("m", ".material");
        try (final MaterialOutput output = new MaterialOutput(file, MaterialOutput.Strategy.RUNTIME_OPTIMIZED)) {
            assertTrue(output.shouldOmitNonRuntimeDirectives());
            assertFalse(output.shouldPrettyPrint());
            assertEquals(MaterialOutput.Strategy.RUNTIME_OPTIMIZED, output.getStrategy());
        }
    }

    @Test
    public void writeMaterialPretty()
    {
        final String text = MaterialOutput.outputAsString(o0 -> o0.writeMaterial("textures/super/mat", o1 -> {
            o1.writeDirective( "q3map_lightimage", "textures/super/mat_1");
            o1.writeDirective( "q3map_surfacelight", "37");
            o1.writeDirective( "q3map_globaltexture");
            o1.writeStage(o2 -> {
                o2.writeDirective( "map", "textures/common/mymat");
                o2.writeDirective( "alphaFunc", "GE128");
                o2.writeDirective( "depthWrite");
                o2.writeDirective( "rgbGen", "vertex");
            });
        }));
        assertEquals("textures/super/mat\n"
                + "{\n"
                + "  q3map_lightimage textures/super/mat_1\n"
                + "  q3map_surfacelight 37\n"
                + "  q3map_globaltexture\n"
                + "  {\n"
                + "    map textures/common/mymat\n"
                + "    alphaFunc GE128\n"
                + "    depthWrite\n"
                + "    rgbGen vertex\n"
                + "  }\n"
                + "}\n",
            text);
    }

    @Test
    public void writeMaterialOptimised()
    {
        final String text = MaterialOutput.outputAsString(o0 -> o0.writeMaterial("textures/super/mat", o1 -> {
            o1.writeDirective( "q3map_lightimage", "textures/super/mat_1");
            o1.writeDirective( "q3map_surfacelight", "37");
            o1.writeDirective( "q3map_globaltexture");
            o1.writeStage(o2 -> {
                o2.writeDirective( "map", "textures/common/mymat");
                o2.writeDirective( "alphaFunc", "GE128");
                o2.writeDirective( "depthWrite");
                o2.writeDirective( "rgbGen", "vertex");
            });
        }), MaterialOutput.Strategy.RUNTIME_OPTIMIZED);
        assertEquals("textures/super/mat\n"
                + "{\n"
                + "q3map_lightimage textures/super/mat_1\n"
                + "q3map_surfacelight 37\n"
                + "q3map_globaltexture\n"
                + "{\n"
                + "map textures/common/mymat\n"
                + "alphaFunc GE128\n"
                + "depthWrite\n"
                + "rgbGen vertex\n"
                + "}\n"
                + "}\n",
            text);
    }
}
