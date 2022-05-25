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
        properties.setLightImage("images/foo");
        properties.setSurfaceLight(500);

        assertTrue(properties.forceSunLight());
        assertTrue(properties.noVertexShadows());
        assertTrue(properties.globalTexture());
        assertEquals("images/foo", properties.getLightImage());
        assertEquals(500, properties.getSurfaceLight());
        assertEquals("q3map_surfacelight 500\n" +
                        "q3map_lightimage images/foo\n" +
                        "q3map_lightimage\n" +
                        "q3map_novertexshadows\n" +
                        "q3map_forcesunlight\n",
                MaterialOutput.outputAsString(properties::write));
        assertEquals("", MaterialOutput.outputAsString(properties::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED));
    }
}
