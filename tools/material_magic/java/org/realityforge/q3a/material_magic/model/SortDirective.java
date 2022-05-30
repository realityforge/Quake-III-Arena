package org.realityforge.q3a.material_magic.model;

import java.io.IOException;
import java.util.Objects;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

public final class SortDirective
{
  // One of key or sort should be specified
  @Nullable
  private SortKey _key;
  private float _value;

  @Nullable
  public SortKey getKey()
  {
    return _key;
  }

  public void setKey( @Nullable final SortKey key )
  {
    if ( null != key )
    {
      _value = 0;
    }
    _key = key;
  }

  public float getValue()
  {
    return _value;
  }

  public void setValue( final float value )
  {
    if ( 0 != value )
    {
      _key = null;
    }
    _value = value;
  }

  void write( @Nonnull final MaterialOutput output )
    throws IOException
  {
    if ( isNonDefault() )
    {
      output.writeDirective( "sort",
                             null != _key ? _key.name() :
                             ( (int) _value ) == _value ? Integer.toString( (int) _value ) : Float.toString( _value ) );
    }
  }

  public boolean isNonDefault()
  {
    return null != _key || 0F != _value;
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
      final SortDirective that = (SortDirective) o;
      return Objects.equals( _key, that._key ) && _value == that._value;
    }
  }

  @Override
  public int hashCode()
  {
    return Objects.hash( _key, _value );
  }

  @Nonnull
  @Override
  public String toString()
  {
    return MaterialOutput.outputAsString( this::write );
  }
}
