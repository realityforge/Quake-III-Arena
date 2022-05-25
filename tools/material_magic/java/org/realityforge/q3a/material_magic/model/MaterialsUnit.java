package org.realityforge.q3a.material_magic.model;

import org.realityforge.q3a.material_magic.util.MaterialOutput;

import javax.annotation.Nonnull;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

/**
 * A single "materials" unit contains all the materials that are present in a single unit or file.
 */
public final class MaterialsUnit {
    @Nonnull
    private final List<Material> _materials = new ArrayList<>();

    /**
     * Add the specified material to the unit.
     *
     * @param material the material.
     */
    public void addMaterial(@Nonnull final Material material) {
        _materials.add(material);
    }

    /**
     * Remove the specified material from the unit.
     *
     * @param material the material to remove
     * @return true if it was present and removed, false otherwise.
     */
    public boolean removeMaterial(@Nonnull final Material material) {
        return _materials.remove(material);
    }

    @Nonnull
    public List<Material> getMaterials() {
        return _materials;
    }

    /**
     * Write the unit using the standard text serialization mechanisms to the specified output object.
     *
     * @param output the output object to emit unit to.
     * @throws IOException if there is an error writing to MaterialOutput
     */
    public void write(@Nonnull final MaterialOutput output) throws IOException {
        final List<Material> materials =
                getMaterials().stream().sorted(Comparator.comparing(Material::getName)).collect(Collectors.toList());
        for (final Material material : materials) {
            material.write(output);
        }
    }

    @Nonnull
    @Override
    public String toString() {
        return MaterialOutput.outputAsString(this::write);
    }
}