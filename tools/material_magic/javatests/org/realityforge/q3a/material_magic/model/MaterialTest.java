package org.realityforge.q3a.material_magic.model;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

public final class MaterialTest {
    @Test
    public void basicOperation()
    {
        final Material material = new Material("materials/my/Material1");

        assertFalse(material.hasQ3map());
        assertFalse(material.hasFog());
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
        material.setCull(CullType.BACK);
        material.setNoPicMip(true);
        material.setNoMipMaps(true);
        material.setPortal(true);
        material.setEntityMergable(true);
        material.fog().setRed( 1.0F );
        material.fog().setGreen( 0.1F );
        material.fog().setBlue( 0.5F );
        material.fog().setDepthForOpaque( 50 );
        material.getSurfaceParameters().add( SurfaceParameter.botclip);
        material.getSurfaceParameters().add( SurfaceParameter.slime);
        material.getSurfaceParameters().add( SurfaceParameter.dust);

        assertTrue(material.hasQ3map());
        assertTrue(material.hasFog());

        assertEquals("materials/my/Material2\n"
                + "{\n"
                + "  q3map_surfacelight 500\n"
                + "  q3map_lightimage tex/img\n"
                + "  q3map_globaltexture\n"
                + "  q3map_novertexshadows\n"
                + "  q3map_forcesunlight\n"
                + "  cull back\n"
                + "  nopicmip\n"
                + "  nomipmaps\n"
                + "  portal\n"
                + "  entityMergable\n"
                + "  fogparms 1.0 0.1 0.5 50\n"
                + "  surfaceparm botclip\n"
                + "  surfaceparm dust\n"
                + "  surfaceparm slime\n"
                + "}\n",
            material.toString());
        assertEquals("materials/my/Material2\n"
                + "{\n"
                + "cull back\n"
                + "nopicmip\n"
                + "nomipmaps\n"
                + "portal\n"
                + "entityMergable\n"
                + "fogparms 1.0 0.1 0.5 50\n"
                + "surfaceparm botclip\n"
                + "surfaceparm dust\n"
                + "surfaceparm slime\n"
                + "}\n",
            MaterialOutput.outputAsString(material::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED));
    }

    @Test
    public void testEqualsAndHash()
    {
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

        material1.setCull(CullType.BACK);

        assertNotEquals(material1, material2);
        assertNotEquals(material1.hashCode(), material2.hashCode());

        material2.setCull(CullType.BACK);

        assertEquals(material1, material2);
        assertEquals(material1.hashCode(), material2.hashCode());

        material1.setNoPicMip( true );

        assertNotEquals(material1, material2);
        assertNotEquals(material1.hashCode(), material2.hashCode());

        material2.setNoPicMip( true );

        assertEquals(material1, material2);
        assertEquals(material1.hashCode(), material2.hashCode());

        material1.setPortal( true );

        assertNotEquals(material1, material2);
        assertNotEquals(material1.hashCode(), material2.hashCode());

        material2.setPortal( true );

        assertEquals(material1, material2);
        assertEquals(material1.hashCode(), material2.hashCode());

        material1.setEntityMergable( true );

        assertNotEquals(material1, material2);
        assertNotEquals(material1.hashCode(), material2.hashCode());

        material2.setEntityMergable( true );

        assertEquals(material1, material2);
        assertEquals(material1.hashCode(), material2.hashCode());

        material1.q3map().setLightImage("X");

        assertNotEquals(material1, material2);
        assertNotEquals(material1.hashCode(), material2.hashCode());

        material2.q3map().setLightImage("X");

        assertEquals(material1, material2);
        assertEquals(material1.hashCode(), material2.hashCode());

        material1.getSurfaceParameters().add( SurfaceParameter.botclip);
        material1.getSurfaceParameters().add( SurfaceParameter.slime);

        assertNotEquals(material1, material2);
        assertNotEquals(material1.hashCode(), material2.hashCode());

        // Note: These are added in a different order to demonstrate hashing and equality uses sorted order
        material2.getSurfaceParameters().add( SurfaceParameter.slime);
        material2.getSurfaceParameters().add( SurfaceParameter.botclip);

        assertEquals(material1, material2);
        assertEquals(material1.hashCode(), material2.hashCode());

        material1.fog().setRed( 1.0F );
        material1.fog().setGreen( 0.1F );
        material1.fog().setBlue( 0.5F );
        material1.fog().setDepthForOpaque( 50 );

        assertNotEquals(material1, material2);
        assertNotEquals(material1.hashCode(), material2.hashCode());

        material2.fog().setRed( 1.0F );
        material2.fog().setGreen( 0.1F );
        material2.fog().setBlue( 0.5F );
        material2.fog().setDepthForOpaque( 50 );

        assertEquals(material1, material2);
        assertEquals(material1.hashCode(), material2.hashCode());
    }
}
