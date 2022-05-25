package org.realityforge.q3a.material_magic.model;

import org.junit.jupiter.api.Test;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

import static org.junit.jupiter.api.Assertions.*;

public final class Q3mapPropertiesTest {
    @Test
    public void basicOperation() {
        final Q3mapProperties properties = new Q3mapProperties();

        assertFalse(properties.forceSunLight());
        assertFalse(properties.noVertexShadows());
        assertFalse(properties.globalTexture());
        assertFalse(properties.light());
        assertNull(properties.getLightImage());
        assertEquals(0, properties.getSurfaceLight());
        assertEquals("", MaterialOutput.outputAsString(properties::write));
        assertEquals("", MaterialOutput.outputAsString(properties::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED));

        properties.setForceSunLight(true);

        assertTrue(properties.forceSunLight());
        assertFalse(properties.noVertexShadows());
        assertFalse(properties.globalTexture());
        assertNull(properties.getLightImage());
        assertEquals(0, properties.getSurfaceLight());
        assertEquals("q3map_forcesunlight\n", MaterialOutput.outputAsString(properties::write));
        assertEquals("", MaterialOutput.outputAsString(properties::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED));

        properties.setNoVertexShadows(true);
        properties.setGlobalTexture(true);
        properties.setLight(true);
        properties.setLightImage("images/foo");
        properties.setSurfaceLight(500);

        assertTrue(properties.forceSunLight());
        assertTrue(properties.noVertexShadows());
        assertTrue(properties.globalTexture());
        assertTrue(properties.light());
        assertEquals("images/foo", properties.getLightImage());
        assertEquals(500, properties.getSurfaceLight());
        assertEquals("q3map_surfacelight 500\n" +
                        "q3map_lightimage images/foo\n" +
                        "q3map_globaltexture\n" +
                        "q3map_novertexshadows\n" +
                        "q3map_forcesunlight\n",
                "light 1\n",
                MaterialOutput.outputAsString(properties::write));
        assertEquals("", MaterialOutput.outputAsString(properties::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED));
    }

    @Test
    public void testEqualsAndHash() {
        final Q3mapProperties properties1 = new Q3mapProperties();
        final Q3mapProperties properties2 = new Q3mapProperties();

        assertEquals(properties1, properties2);
        assertEquals(properties1.hashCode(), properties2.hashCode());

        properties1.setSurfaceLight(2);

        assertNotEquals(properties1, properties2);
        assertNotEquals(properties1.hashCode(), properties2.hashCode());

        properties2.setSurfaceLight(2);

        assertEquals(properties1, properties2);
        assertEquals(properties1.hashCode(), properties2.hashCode());

        properties1.setLightImage("X");

        assertNotEquals(properties1, properties2);
        assertNotEquals(properties1.hashCode(), properties2.hashCode());

        properties2.setLightImage("X");

        assertEquals(properties1, properties2);
        assertEquals(properties1.hashCode(), properties2.hashCode());

        properties1.setNoVertexShadows(true);

        assertNotEquals(properties1, properties2);
        assertNotEquals(properties1.hashCode(), properties2.hashCode());

        properties2.setNoVertexShadows(true);

        assertEquals(properties1, properties2);
        assertEquals(properties1.hashCode(), properties2.hashCode());

        properties1.setGlobalTexture(true);

        assertNotEquals(properties1, properties2);
        assertNotEquals(properties1.hashCode(), properties2.hashCode());

        properties2.setGlobalTexture(true);

        assertEquals(properties1, properties2);
        assertEquals(properties1.hashCode(), properties2.hashCode());

        properties1.setForceSunLight(true);

        assertNotEquals(properties1, properties2);
        assertNotEquals(properties1.hashCode(), properties2.hashCode());

        properties2.setForceSunLight(true);

        assertEquals(properties1, properties2);
        assertEquals(properties1.hashCode(), properties2.hashCode());

        properties1.setLight(true);

        assertNotEquals(properties1, properties2);
        assertNotEquals(properties1.hashCode(), properties2.hashCode());

        properties2.setLight(true);

        assertEquals(properties1, properties2);
        assertEquals(properties1.hashCode(), properties2.hashCode());
    }
}
