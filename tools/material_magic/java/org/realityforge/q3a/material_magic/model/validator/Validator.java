package org.realityforge.q3a.material_magic.model.validator;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;
import javax.annotation.Nonnull;
import org.realityforge.q3a.material_magic.model.Material;
import org.realityforge.q3a.material_magic.model.Unit;

public final class Validator
{
  @Nonnull
  public ValidationResult validate( @Nonnull final Unit unit,
                                    @Nonnull final Unit libraryUnit,
                                    @Nonnull final Set<String> allowedLibraryOverrides )
  {
    final Set<String> overrides = new HashSet<>( allowedLibraryOverrides );
    final List<ValidationMessage> errors = new ArrayList<>();
    final List<Material> materials = unit.getMaterials();
    if ( materials.isEmpty() ) {
      errors.add( new ValidationMessage( ValidationMessage.Type.WARNING, "Unit contains zero materials" ) );
    } else {
      final Set<String> libraryNames =
        libraryUnit.getMaterials().stream().map( Material::getName ).collect( Collectors.toSet() );

      final Map<String, Material> materialMap = new HashMap<>();
      for ( final Material material : materials ) {
        final String name = material.getName();
        if ( name.isEmpty() ) {
          errors.add( new ValidationMessage( ValidationMessage.Type.ERROR,
                                             "Material exists with empty name. Material definition:\n"
                                               + "--------------\n" + material + "\n--------------\n" ) );
        } else {
          if ( materialMap.containsKey( name ) ) {
            errors.add( new ValidationMessage( ValidationMessage.Type.ERROR,
                                               "Multiple materials exist with the name '" + name + "'." ) );
          } else {
            if ( !name.toLowerCase().equals( name ) ) {
              errors.add(
                new ValidationMessage( ValidationMessage.Type.INFO,
                                       "Material with the name '" + name + "' has uppercase letters in the name." ) );
            }
            if ( libraryNames.contains( name ) ) {
              if ( !overrides.remove( name ) ) {
                errors.add(
                  new ValidationMessage( ValidationMessage.Type.ERROR,
                                         "Material with the name '" + name + "' unexpectedly "
                                           + "overrides material with the same name from the library files." ) );
              } else {
                errors.add(
                  new ValidationMessage( ValidationMessage.Type.INFO,
                                         "Material with the name '" + name +
                                           "' overrides material with the same name from the library files." ) );
              }
            }
            materialMap.put( name, material );
          }
        }
        // TODO: We should validate that the material has stages or has a
        // surfaceParm that does not need stages
        // TODO: Verify directives with POSITIVE_INTEGERS have positive
        // values (or 0)
        // TODO: Another verify step should ensure that referenced textures
        // all present and of the expected format
        // TODO: Does FogDirective imply surfaceparm fog and vice versa?
      }
    }
    if ( !overrides.isEmpty() ) {
      errors.add( new ValidationMessage(
        ValidationMessage.Type.ERROR,
        "Material overrides with the following names were expected "
          + "but are not present: " +
          overrides.stream().map( v -> "\"" + v + "\"" ).collect( Collectors.joining( "," ) ) ) );
    }
    return new ValidationResult( errors );
  }
}
