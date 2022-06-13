package org.realityforge.q3a.material_magic.model.validator;

import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import javax.annotation.Nonnull;
import org.junit.jupiter.api.Test;
import org.realityforge.q3a.material_magic.model.Material;
import org.realityforge.q3a.material_magic.model.SurfaceParameter;
import org.realityforge.q3a.material_magic.model.Unit;

import static org.junit.jupiter.api.Assertions.*;

public final class ValidatorTest
{
  @Test
  public void validateEmptyUnit()
  {
    assertEquals( validate( new Unit() ), messages( error( "Unit contains zero materials" ) ) );
  }

  @Test
  public void validateValidUnit()
  {
    // Add a single material ... it has no stages but it is one of the magic
    // ones that need no stages
    final Material material = new Material( "MyMaterial" );
    material.addSurfaceParameter( SurfaceParameter.nolightmap );

    final Unit unit = new Unit();
    unit.addMaterial( material );
    assertEquals( validate( unit ), Collections.emptyList() );
  }

  @Test
  public void duplicateMaterials()
  {
    final Material material1 = new Material( "MyMaterial1" );
    material1.addSurfaceParameter( SurfaceParameter.nolightmap );
    final Material material2 = new Material( "MyMaterial1" );
    material2.addSurfaceParameter( SurfaceParameter.nolightmap );
    final Material material3 = new Material( "MyMaterial2" );
    material3.addSurfaceParameter( SurfaceParameter.nolightmap );
    final Material material4 = new Material( "MyMaterial2" );
    material4.addSurfaceParameter( SurfaceParameter.nolightmap );
    final Material material5 = new Material( "MyMaterial3" );
    material5.addSurfaceParameter( SurfaceParameter.nolightmap );

    final Unit unit = new Unit();
    unit.addMaterial( material1 );
    unit.addMaterial( material2 );
    unit.addMaterial( material3 );
    unit.addMaterial( material4 );
    unit.addMaterial( material5 );

    assertEquals( validate( unit ),
                  messages( error( "Multiple materials exist with the name 'MyMaterial1'." ),
                            error( "Multiple materials exist with the name 'MyMaterial2'." ) ) );
  }

  @Nonnull
  private Collection<ValidationMessage> messages( @Nonnull final ValidationMessage... messages )
  {
    return Arrays.asList( messages );
  }

  @Nonnull
  private ValidationMessage error( @Nonnull final String message )
  {
    return new ValidationMessage( ValidationMessage.Type.ERROR, message );
  }

  @Nonnull
  private Collection<ValidationMessage> validate( @Nonnull final Unit unit )
  {
    return new Validator().validate( unit, new Unit(), new HashSet<>() ).getMessages();
  }
}
