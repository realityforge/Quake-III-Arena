package org.realityforge.q3a.material_magic.util;

import org.junit.jupiter.api.Test;

import java.io.IOException;

import static org.junit.jupiter.api.Assertions.assertEquals;

public final class MaterialOutputTest {
    @Test
    public void writeMaterial() throws IOException {
        final String text = MaterialOutput.outputAsString(o0 -> o0.writeMaterial("textures/super/mat", o1 -> {
            o1.writeProperty("q3map_lightimage", "textures/super/mat_1");
            o1.writeProperty("q3map_surfacelight", "37");
            o1.writeProperty("q3map_globaltexture");
            o1.writeStage(o2 -> {
                o2.writeProperty("map", "textures/common/mymat");
                o2.writeProperty("alphaFunc", "GE128");
                o2.writeProperty("depthWrite");
                o2.writeProperty("rgbGen", "vertex");
            });
        }));
        assertEquals("textures/super/mat\n" +
                        "{\n" +
                        "    q3map_lightimage textures/super/mat_1\n" +
                        "    q3map_surfacelight 37\n" +
                        "    q3map_globaltexture\n" +
                        "    {\n" +
                        "        map textures/common/mymat\n" +
                        "        alphaFunc GE128\n" +
                        "        depthWrite\n" +
                        "        rgbGen vertex\n" +
                        "    }\n" +
                        "}\n",
                text);
    }
}
