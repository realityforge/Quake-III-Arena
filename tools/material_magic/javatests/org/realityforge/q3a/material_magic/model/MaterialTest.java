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
        material.setCull(Material.CullType.BACK);

        assertTrue(material.hasQ3map());

        assertEquals("materials/my/Material2\n" +
                "{\n" +
                "  q3map_surfacelight 500\n" +
                "  q3map_lightimage tex/img\n" +
                "  q3map_globaltexture\n" +
                "  q3map_novertexshadows\n" +
                "  q3map_forcesunlight\n" +
                "  cull back\n" +
                "}\n", material.toString());
        assertEquals("materials/my/Material2\n{\ncull back\n}\n", MaterialOutput.outputAsString(material::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED));
    }

    @Test
    public void testEqualsAndHash() {
        final Material material1 = new Material("materials/my/Material1");
        final Material material2 = new Material("materials/my/Material1");

        assertEquals(material1, material2);
        assertEquals(material1.hashCode(), material2.hashCode());

        material1.setName("X");

        assertNotEquals(material1, material2);
        assertNotEquals(material1.hashCode(), material2.hashCode());

        material2.setName("X");

        assertEquals(material1, material2);
        assertEquals(material1.hashCode(), material2.hashCode());

        assertEquals(material1, material2);
        assertEquals(material1.hashCode(), material2.hashCode());

        material1.setCull(Material.CullType.BACK);

        assertNotEquals(material1, material2);
        assertNotEquals(material1.hashCode(), material2.hashCode());

        material2.setCull(Material.CullType.BACK);

        assertEquals(material1, material2);
        assertEquals(material1.hashCode(), material2.hashCode());

        material1.q3map().setLightImage("X");

        assertNotEquals(material1, material2);
        assertNotEquals(material1.hashCode(), material2.hashCode());

        material2.q3map().setLightImage("X");

        assertEquals(material1, material2);
        assertEquals(material1.hashCode(), material2.hashCode());
    }
}
