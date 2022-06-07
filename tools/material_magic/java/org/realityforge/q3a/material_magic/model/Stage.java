package org.realityforge.q3a.material_magic.model;

import java.io.IOException;
import java.util.Objects;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

public final class Stage
{
  @Nullable
  private MapStageDirective _map;

  public boolean hasMap() { return null != _map && !_map.isDefault(); }

  @Nonnull
  public MapStageDirective map()
  {
    if ( null == _map ) {
      _map = new MapStageDirective();
    }
    return _map;
  }

  public void setMap( @Nullable final MapStageDirective map ) { _map = map; }

  /**
   * Write the material using the standard text serialization mechanisms to the specified output
   * object.
   *
   * @param output the output object to emit material to.
   * @throws IOException if there is an error writing to MaterialOutput
   */
  void write( @Nonnull final MaterialOutput output ) throws IOException
  {
    output.writeStage( o -> {
      if ( hasMap() ) {
        map().write( o );
      }
    } );
  }

  @Override
  public boolean equals( Object o )
  {
    if ( this == o ) {
      return true;
    } else if ( o == null || getClass() != o.getClass() ) {
      return false;
    } else {
      final Stage that = (Stage)o;
      return Objects.equals( hasMap() ? _map : null, that.hasMap() ? that._map : null );
    }
  }

  @Override
  public int hashCode()
  {
    return Objects.hash( hasMap() ? _map : null );
  }

  @Nonnull
  @Override
  public String toString()
  {
    return MaterialOutput.outputAsString( this::write );
  }
}
