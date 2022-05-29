package org.realityforge.q3a.material_magic.model;

import java.io.IOException;
import java.util.Objects;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

public final class SkyDirective
{
  public static final int DEFAULT_CLOUD_HEIGHT = 128;
  @Nullable
  private String _farBox;
  private int _cloudHeight = DEFAULT_CLOUD_HEIGHT;
  @Nullable
  private String _nearBox;

  @Nullable
  public String getFarBox()
  {
    return _farBox;
  }

  public void setFarBox( @Nullable final String farBox )
  {
    _farBox = farBox;
  }

  public int getCloudHeight()
  {
    return _cloudHeight;
  }

  public void setCloudHeight( final int cloudHeight )
  {
    _cloudHeight = cloudHeight;
  }

  @Nullable
  public String getNearBox()
  {
    return _nearBox;
  }

  public void setNearBox( @Nullable final String nearBox )
  {
    _nearBox = nearBox;
  }

  void write( @Nonnull final MaterialOutput output )
    throws IOException
  {
    if ( isNonDefault() )
    {
      output.writeDirective( "skyparms",
                             null == _farBox ? "-" : _farBox,
                             DEFAULT_CLOUD_HEIGHT == _cloudHeight ? "-" : Integer.toString( _cloudHeight ),
                             null == _nearBox ? "-" : _nearBox );
    }
  }

  public boolean isNonDefault()
  {
    return null != _farBox || DEFAULT_CLOUD_HEIGHT != _cloudHeight || null != _nearBox;
  }

  public boolean isDefault()
  {
    return !isNonDefault();
  }

  @Override
  public boolean equals( final Object o )
  {
    if ( this == o )
    {
      return true;
    }
    else if ( o == null || getClass() != o.getClass() )
    {
      return false;
    }
    else
    {
      final SkyDirective that = (SkyDirective) o;
      return Objects.equals( _farBox, that._farBox ) &&
             _cloudHeight == that._cloudHeight &&
             Objects.equals( _nearBox, that._nearBox );
    }
  }

  @Override
  public int hashCode()
  {
    return Objects.hash( _farBox, _cloudHeight, _nearBox );
  }

  @Nonnull
  @Override
  public String toString()
  {
    return MaterialOutput.outputAsString(this::write);
  }
}
