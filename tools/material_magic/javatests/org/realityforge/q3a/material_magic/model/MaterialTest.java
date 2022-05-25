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
        assertEquals("materials/my/Material1\n" +
                        "{\n" +
                        "}\n",
                MaterialOutput.outputAsString(material::write));

        material.setName("materials/my/Material2");

        assertEquals("materials/my/Material2", material.getName());
        assertEquals("materials/my/Material2\n" +
                        "{\n" +
                        "}\n",
                MaterialOutput.outputAsString(material::write));

        material.q3map().setForceSunLight(true);

        assertTrue(material.hasQ3map());
        assertEquals("materials/my/Material2", material.getName());

        assertEquals("materials/my/Material2\n" +
                        "{\n" +
                        "    q3map_forcesunlight\n" +
                        "}\n",
                MaterialOutput.outputAsString(material::write));
    }
}
