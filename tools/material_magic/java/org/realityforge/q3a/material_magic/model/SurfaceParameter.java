package org.realityforge.q3a.material_magic.model;

import java.io.IOException;
import java.util.Arrays;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

public enum SurfaceParameter
{
  alphashadow,
  areaportal,
  botclip,
  clusterportal,
  detail,
  donotenter,
  dust,
  flesh,
  fog,
  hint,
  ladder,
  lava,
  lightfilter,
  metalsteps,
  monsterclip,
  nobotclip,
  nodamage,
  nodlight,
  nodraw,
  nodrop,
  noimpact,
  nolightmap,
  nomarks,
  nonsolid,
  nosteps,
  origin,
  playerclip,
  pointlight,
  sky,
  slick,
  slime,
  structural,
  trans,
  water;

  void write( @Nonnull final MaterialOutput output )
    throws IOException
  {
    output.writeDirective( "surfaceparm", name());
  }

  @Nullable
  public static SurfaceParameter findByName( @Nonnull final String name )
  {
    return
      Arrays
        .stream( SurfaceParameter.values() )
        .filter( value -> value.name().equals( name ) )
        .findFirst()
        .orElse( null );
  }
}
