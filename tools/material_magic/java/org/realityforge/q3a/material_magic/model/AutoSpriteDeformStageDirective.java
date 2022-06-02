package org.realityforge.q3a.material_magic.model;

import java.io.IOException;
import java.util.Objects;
import javax.annotation.Nonnull;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

public final class AutoSpriteDeformStageDirective extends DeformStageDirective<AutoSpriteDeformStageDirective>
{
  @Override
  void write( @Nonnull final MaterialOutput output ) throws IOException
  {
    output.writeDirective( "deformVertexes", "autoSprite" );
  }

  @Override
  protected boolean performEquals( @Nonnull final AutoSpriteDeformStageDirective other )
  {
    return true;
  }

  @Override
  public int hashCode()
  {
    return Objects.hash( "autosprite" );
  }
}
