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
    assertEquals( new Validator().validate( new Unit(), new Unit(), new HashSet<>() ).getMessages(),
                  messages( warning( "Unit contains zero materials" ) ) );
  }

  @Test
  public void validateValidUnit()
  {
    // Add a single material ... it has no stages but it is one of the magic
    // ones that need no stages
    final Material material = new Material( "my_material" );
    material.addSurfaceParameter( SurfaceParameter.nolightmap );

    final Unit unit = new Unit();
    unit.addMaterial( material );
    assertEquals( new Validator().validate( unit, new Unit(), new HashSet<>() ).getMessages(),
                  Collections.emptyList() );
  }

  @Test
  public void duplicateMaterials()
  {
    final Material material1 = new Material( "my_material1" );
    material1.addSurfaceParameter( SurfaceParameter.nolightmap );
    final Material material2 = new Material( "my_material1" );
    material2.addSurfaceParameter( SurfaceParameter.nolightmap );
    final Material material3 = new Material( "my_material2" );
    material3.addSurfaceParameter( SurfaceParameter.nolightmap );
    final Material material4 = new Material( "my_material2" );
    material4.addSurfaceParameter( SurfaceParameter.nolightmap );
    final Material material5 = new Material( "my_material3" );
    material5.addSurfaceParameter( SurfaceParameter.nolightmap );

    final Unit unit = new Unit();
    unit.addMaterial( material1 );
    unit.addMaterial( material2 );
    unit.addMaterial( material3 );
    unit.addMaterial( material4 );
    unit.addMaterial( material5 );

    assertEquals( new Validator().validate( unit, new Unit(), new HashSet<>() ).getErrorMessages(),
                  messages( error( "Multiple materials exist with the name 'my_material1'." ),
                            error( "Multiple materials exist with the name 'my_material2'." ) ) );
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
  private ValidationMessage warning( @Nonnull final String message )
  {
    return new ValidationMessage( ValidationMessage.Type.WARNING, message );
  }
}
