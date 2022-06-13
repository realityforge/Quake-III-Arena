package org.realityforge.q3a.material_magic.model;

import java.util.Arrays;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public enum SortKey
{
  portal,
  sky,
  opaque,
  decal,
  seeThrough,
  banner,
  additive,
  nearest,
  underwater;

  @Nullable
  public static SortKey findByName( @Nonnull final String name )
  {
    return Arrays.stream( SortKey.values() ).filter( value -> value.name().equals( name ) ).findFirst().orElse( null );
  }
}
