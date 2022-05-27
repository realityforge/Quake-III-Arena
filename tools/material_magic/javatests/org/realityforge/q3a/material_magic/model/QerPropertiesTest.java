package org.realityforge.q3a.material_magic.model;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

public final class QerPropertiesTest {
    @Test
    public void basicOperation()
    {
        final QerProperties properties = new QerProperties();

        assertFalse(properties.noCarve());
        assertNull(properties.getEditorImage());
        assertEquals(0F, properties.getTransparency());
        assertEquals("", MaterialOutput.outputAsString(properties::write));
        assertEquals("", MaterialOutput.outputAsString(properties::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED));

        properties.setNoCarve(true);

        assertTrue(properties.noCarve());
        assertNull(properties.getEditorImage());
        assertEquals(0F, properties.getTransparency());
        assertEquals("qer_nocarve\n", MaterialOutput.outputAsString(properties::write));
        assertEquals("", MaterialOutput.outputAsString(properties::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED));

        properties.setTransparency(0.3F);
        properties.setEditorImage("images/editor");

        assertTrue(properties.noCarve());
        assertEquals("images/editor", properties.getEditorImage());
        assertEquals(0.3F, properties.getTransparency());
        assertEquals("qer_editorimage images/editor\n"
                + "qer_nocarve\n"
                + "qer_trans 0.3\n",
            MaterialOutput.outputAsString(properties::write));
        assertEquals("", MaterialOutput.outputAsString(properties::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED));
    }

    @Test
    public void testEqualsAndHash()
    {
        final QerProperties properties1 = new QerProperties();
        final QerProperties properties2 = new QerProperties();

        assertEquals(properties1, properties2);
        assertEquals(properties1.hashCode(), properties2.hashCode());

        properties1.setTransparency(0.2F);

        assertNotEquals(properties1, properties2);
        assertNotEquals(properties1.hashCode(), properties2.hashCode());

        properties2.setTransparency(0.2F);

        assertEquals(properties1, properties2);
        assertEquals(properties1.hashCode(), properties2.hashCode());

        properties1.setEditorImage("X");

        assertNotEquals(properties1, properties2);
        assertNotEquals(properties1.hashCode(), properties2.hashCode());

        properties2.setEditorImage("X");

        assertEquals(properties1, properties2);
        assertEquals(properties1.hashCode(), properties2.hashCode());

        properties1.setNoCarve(true);

        assertNotEquals(properties1, properties2);
        assertNotEquals(properties1.hashCode(), properties2.hashCode());

        properties2.setNoCarve(true);

        assertEquals(properties1, properties2);
        assertEquals(properties1.hashCode(), properties2.hashCode());
    }
}
