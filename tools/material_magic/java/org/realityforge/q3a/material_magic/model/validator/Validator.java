package org.realityforge.q3a.material_magic.model.validator;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Nonnull;
import org.realityforge.q3a.material_magic.model.Material;
import org.realityforge.q3a.material_magic.model.MaterialsUnit;

public final class Validator
{
  @Nonnull
  public Collection<String> validate( @Nonnull final MaterialsUnit unit )
  {
    final Collection<String> errors = new ArrayList<>();
    final List<Material> materials = unit.getMaterials();
    if ( materials.isEmpty() )
    {
      errors.add( "Unit contains zero materials" );
    }
    else
    {
      final Map<String, Material> materialMap = new HashMap<>();
      for ( final Material material : materials )
      {
        final String name = material.getName();
        if ( name.isEmpty() )
        {
          errors.add( "Material exists with empty name. Material definition:\n" +
                      "--------------\n" + material + "\n--------------\n" );
        }
        else
        {
          if ( materialMap.containsKey( name ) )
          {
            errors.add( "Multiple materials exist with the name '" + name + "'." );
          }
          else
          {
            materialMap.put( name, material );
          }
        }
        // We should validate that the material has stages or has a surfaceParm that does not need stages
      }
    }
    return errors;
  }
}
