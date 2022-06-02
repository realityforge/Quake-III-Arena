package org.realityforge.q3a.material_magic.model;

import java.io.IOException;
import java.util.Objects;
import javax.annotation.Nonnull;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

public final class ProjectionShadowDeformStageDirective
  extends DeformStageDirective<ProjectionShadowDeformStageDirective>
{
  @Override
  void write( @Nonnull final MaterialOutput output )
    throws IOException
  {
    output.writeDirective( "deformVertexes", "projectionShadow" );
  }

  @Override
  protected boolean performEquals( @Nonnull final ProjectionShadowDeformStageDirective other )
  {
    return true;
  }

  @Override
  public int hashCode()
  {
    return Objects.hash( "projectionShadow" );
  }
}
