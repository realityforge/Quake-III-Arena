package org.realityforge.q3a.material_magic.model;

import org.junit.jupiter.api.Test;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

import static org.junit.jupiter.api.Assertions.*;

public final class MaterialTest {
    @Test
    public void basicOperation() {
        final Material material = new Material("materials/my/Material1");

        assertFalse(material.hasQ3map());
        assertEquals("materials/my/Material1", material.getName());
        assertEquals("materials/my/Material1\n{\n}\n", material.toString());
        assertEquals("materials/my/Material1\n{\n}\n", MaterialOutput.outputAsString(material::write));
        assertEquals("materials/my/Material1\n{\n}\n", MaterialOutput.outputAsString(material::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED));

        material.setName("materials/my/Material2");

        assertEquals("materials/my/Material2", material.getName());
        assertEquals("materials/my/Material2\n{\n}\n", material.toString());
        assertEquals("materials/my/Material2\n{\n}\n", MaterialOutput.outputAsString(material::write));
        assertEquals("materials/my/Material2\n{\n}\n", MaterialOutput.outputAsString(material::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED));

        material.q3map().setForceSunLight(true);
        material.q3map().setSurfaceLight(500);
        material.q3map().setGlobalTexture(true);
        material.q3map().setNoVertexShadows(true);
        material.q3map().setLightImage("tex/img");

        assertTrue(material.hasQ3map());

        assertEquals("materials/my/Material2\n" +
                "{\n" +
                "  q3map_surfacelight 500\n" +
                "  q3map_lightimage tex/img\n" +
                "  q3map_globaltexture\n" +
                "  q3map_novertexshadows\n" +
                "  q3map_forcesunlight\n" +
                "}\n", material.toString());
        assertEquals("materials/my/Material2\n{\n}\n", MaterialOutput.outputAsString(material::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED));
    }
}
