package org.realityforge.q3a.material_magic.model.validator;

import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import javax.annotation.Nonnull;
import org.junit.jupiter.api.Test;
import org.realityforge.q3a.material_magic.model.Material;
import org.realityforge.q3a.material_magic.model.MaterialsUnit;
import org.realityforge.q3a.material_magic.model.SurfaceProperty;
import static org.junit.jupiter.api.Assertions.*;

public final class ValidatorTest
{
  @Test
  public void validateEmptyUnit()
  {
    assertEquals( validate( new MaterialsUnit() ), Collections.singletonList( "Unit contains zero materials" ) );
  }

  @Test
  public void validateValidUnit()
  {
    // Add a single material ... it has no stages but it is one of the magic ones that need no stages
    final Material material = new Material( "MyMaterial" );
    material.getSurfaceProperties().add( SurfaceProperty.nolightmap );

    final MaterialsUnit unit = new MaterialsUnit();
    unit.addMaterial( material );
    assertEquals( validate( unit ), Collections.emptyList() );
  }

  @Test
  public void duplicateMaterials()
  {
    final Material material1 = new Material( "MyMaterial1" );
    material1.getSurfaceProperties().add( SurfaceProperty.nolightmap );
    final Material material2 = new Material( "MyMaterial1" );
    material2.getSurfaceProperties().add( SurfaceProperty.nolightmap );
    final Material material3 = new Material( "MyMaterial2" );
    material3.getSurfaceProperties().add( SurfaceProperty.nolightmap );
    final Material material4 = new Material( "MyMaterial2" );
    material4.getSurfaceProperties().add( SurfaceProperty.nolightmap );
    final Material material5 = new Material( "MyMaterial3" );
    material5.getSurfaceProperties().add( SurfaceProperty.nolightmap );

    final MaterialsUnit unit = new MaterialsUnit();
    unit.addMaterial( material1 );
    unit.addMaterial( material2 );
    unit.addMaterial( material3 );
    unit.addMaterial( material4 );
    unit.addMaterial( material5 );
    
    assertEquals( validate( unit ),
                  Arrays.asList( "Multiple materials exist with the name 'MyMaterial1'.",
                                 "Multiple materials exist with the name 'MyMaterial2'." ) );
  }

  @Nonnull
  private Collection<String> validate( @Nonnull final MaterialsUnit unit )
  {
    return new Validator().validate( unit );
  }
}
