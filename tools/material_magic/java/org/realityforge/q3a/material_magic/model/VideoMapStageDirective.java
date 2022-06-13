package org.realityforge.q3a.material_magic.model;

import java.io.IOException;
import java.util.Objects;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

public final class VideoMapStageDirective
{
  private String _video;

  public boolean isDefault() { return null == _video; }

  public String getVideo() { return _video; }

  public void setVideo( @Nonnull final String video ) { _video = video; }

  void write( @Nonnull final MaterialOutput output ) throws IOException { output.writeDirective( "videoMap", _video ); }

  @Override
  public int hashCode()
  {
    return Objects.hash( "videoMap", _video );
  }

  @Override
  public boolean equals( @Nullable final Object o )
  {
    if ( this == o ) {
      return true;
    } else if ( null == o || getClass() != o.getClass() ) {
      return false;
    } else {
      return Objects.equals( _video, ( (VideoMapStageDirective)o )._video );
    }
  }

  @Nonnull
  @Override
  public String toString()
  {
    return MaterialOutput.outputAsString( this::write );
  }
}
