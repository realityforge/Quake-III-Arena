package org.realityforge.q3a.material_magic.util;

import org.junit.jupiter.api.Test;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;

import static org.junit.jupiter.api.Assertions.assertEquals;

public final class MaterialOutputTest {
    @Test
    public void writeMaterial() throws IOException {
        final ByteArrayOutputStream baos = new ByteArrayOutputStream();
        new MaterialOutput(baos).writeMaterial("textures/super/mat", o -> {
            o.writeProperty("q3map_lightimage", "textures/super/mat_1");
            o.writeProperty("q3map_surfacelight", "37");
            o.writeProperty("q3map_globaltexture");
            o.writeStage(o2 -> {
                o2.writeProperty("map", "textures/common/mymat");
                o2.writeProperty("alphaFunc", "GE128");
                o2.writeProperty("depthWrite");
                o2.writeProperty("rgbGen", "vertex");
            });
        });
        final byte[] bytes = baos.toByteArray();
        final String text = new String(bytes, 0, bytes.length, StandardCharsets.US_ASCII);
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
