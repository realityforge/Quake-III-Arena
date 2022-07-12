/*
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.realityforge.q3a.material_magic.model;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;
import javax.annotation.Nonnull;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

/**
 * A single "materials" unit contains all the materials that are present in a single unit or file.
 */
public final class Unit
{
  @Nonnull
  public static final String EXTENSION = ".shader";
  @Nonnull
  private final List<Material> _materials = new ArrayList<>();

  /**
   * Add the specified material to the unit.
   *
   * @param material the material.
   */
  public void addMaterial( @Nonnull final Material material ) { _materials.add( material ); }

  /**
   * Remove the specified material from the unit.
   *
   * @param material the material to remove
   * @return true if it was present and removed, false otherwise.
   */
  public boolean removeMaterial( @Nonnull final Material material ) { return _materials.remove( material ); }

  @Nonnull
  public List<Material> getMaterials()
  {
    return _materials;
  }

  @Nonnull
  public List<Material> getSortedMaterials()
  {
    return getMaterials().stream().sorted( Comparator.comparing( Material::getName ) ).collect( Collectors.toList() );
  }

  /**
   * Write the unit using the standard text serialization mechanisms to the specified output object.
   *
   * @param output the output object to emit unit to.
   * @throws IOException if there is an error writing to MaterialOutput
   */
  public void write( @Nonnull final MaterialOutput output ) throws IOException
  {
    for ( final Material material : getSortedMaterials() ) {
      material.write( output );
    }
  }

  @Override
  public boolean equals( Object o )
  {
    if ( this == o ) {
      return true;
    } else if ( o == null || getClass() != o.getClass() ) {
      return false;
    } else {
      final Unit that = (Unit)o;
      return getSortedMaterials().equals( that.getSortedMaterials() );
    }
  }

  @Override
  public int hashCode()
  {
    return Objects.hash( getSortedMaterials() );
  }

  @Nonnull
  @Override
  public String toString()
  {
    return MaterialOutput.outputAsString( this::write );
  }
}
