package org.realityforge.q3a.material_magic.model;

import org.junit.jupiter.api.Test;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

import static org.junit.jupiter.api.Assertions.assertEquals;

public final class MaterialsUnitTest {
    @Test
    public void basicOperation() {
        final MaterialsUnit unit = new MaterialsUnit();
        final Material material1 = new Material("materials/my/MaterialZ");
        final Material material2 = new Material("materials/my/MaterialA");
        final Material material3 = new Material("materials/my/MaterialB");
        final Material material4 = new Material("materials/my/MaterialY");

        material1.q3map().setForceSunLight(true);
        material3.q3map().setSurfaceLight(500);

        unit.addMaterial(material1);
        unit.addMaterial(material2);
        unit.addMaterial(material3);
        unit.addMaterial(material4);

        assertEquals("materials/my/MaterialA\n" +
                "{\n" +
                "}\n" +
                "materials/my/MaterialB\n" +
                "{\n" +
                "  q3map_surfacelight 500\n" +
                "}\n" +
                "materials/my/MaterialY\n" +
                "{\n" +
                "}\n" +
                "materials/my/MaterialZ\n" +
                "{\n" +
                "  q3map_forcesunlight\n" +
                "}\n", MaterialOutput.outputAsString(unit::write));
        assertEquals("materials/my/MaterialA\n" +
                "{\n" +
                "}\n" +
                "materials/my/MaterialB\n" +
                "{\n" +
                "}\n" +
                "materials/my/MaterialY\n" +
                "{\n" +
                "}\n" +
                "materials/my/MaterialZ\n" +
                "{\n" +
                "}\n", MaterialOutput.outputAsString(unit::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED));

        unit.removeMaterial(material3);


        assertEquals("materials/my/MaterialA\n" +
                "{\n" +
                "}\n" +
                "materials/my/MaterialY\n" +
                "{\n" +
                "}\n" +
                "materials/my/MaterialZ\n" +
                "{\n" +
                "  q3map_forcesunlight\n" +
                "}\n", MaterialOutput.outputAsString(unit::write));
        assertEquals("materials/my/MaterialA\n" +
                "{\n" +
                "}\n" +
                "materials/my/MaterialY\n" +
                "{\n" +
                "}\n" +
                "materials/my/MaterialZ\n" +
                "{\n" +
                "}\n", MaterialOutput.outputAsString(unit::write, MaterialOutput.Strategy.RUNTIME_OPTIMIZED));
    }
}
