package org.realityforge.q3a.material_magic.model;

import java.io.IOException;
import java.util.Objects;
import javax.annotation.Nonnull;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

public final class AutoSprite2DeformStageDirective extends DeformStageDirective<AutoSprite2DeformStageDirective>
{
  @Override
  void write( @Nonnull final MaterialOutput output ) throws IOException
  {
    output.writeDirective( "deformVertexes", "autoSprite2" );
  }

  @Override
  protected boolean performEquals( @Nonnull final AutoSprite2DeformStageDirective other )
  {
    return true;
  }

  @Override
  public int hashCode()
  {
    return Objects.hash( "autoSprite2" );
  }
}
