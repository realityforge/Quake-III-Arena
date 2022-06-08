package org.realityforge.q3a.material_magic.model;

import java.io.IOException;
import java.util.Objects;
import java.util.stream.Stream;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

public final class AnimMapStageDirective
{
  private float _frequency;
  private String _texture1;
  private String _texture2;
  private String _texture3;
  private String _texture4;
  private String _texture5;
  private String _texture6;
  private String _texture7;
  private String _texture8;

  public boolean isDefault() { return 0 == _frequency || null == _texture1; }

  public float getFrequency() { return _frequency; }

  public void setFrequency( final float frequency ) { _frequency = frequency; }

  @Nonnull
  public String getTexture1()
  {
    assert null != _texture1;
    return _texture1;
  }

  public void setTexture1( @Nonnull final String texture1 ) { _texture1 = texture1; }

  public String getTexture2() { return _texture2; }

  public void setTexture2( final String texture2 ) { _texture2 = texture2; }

  public String getTexture3() { return _texture3; }

  public void setTexture3( final String texture3 ) { _texture3 = texture3; }

  public String getTexture4() { return _texture4; }

  public void setTexture4( final String texture4 ) { _texture4 = texture4; }

  public String getTexture5() { return _texture5; }

  public void setTexture5( final String texture5 ) { _texture5 = texture5; }

  public String getTexture6() { return _texture6; }

  public void setTexture6( final String texture6 ) { _texture6 = texture6; }

  public String getTexture7() { return _texture7; }

  public void setTexture7( final String texture7 ) { _texture7 = texture7; }

  public String getTexture8() { return _texture8; }

  public void setTexture8( final String texture8 ) { _texture8 = texture8; }

  void write( @Nonnull final MaterialOutput output ) throws IOException
  {
    final String[] textures = Stream
                                .of( EmitUtil.floatToString( _frequency ),
                                     _texture1,
                                     _texture2,
                                     _texture3,
                                     _texture4,
                                     _texture5,
                                     _texture6,
                                     _texture7,
                                     _texture8 )
                                .filter( Objects::nonNull )
                                .toArray( String[] ::new );
    output.writeDirective( "animMap", textures );
  }

  @Override
  public int hashCode()
  {
    return Objects.hash(
      "animMap", _frequency, _texture1, _texture2, _texture3, _texture4, _texture5, _texture6, _texture7, _texture8 );
  }

  @Override
  public boolean equals( @Nullable final Object o )
  {
    if ( this == o ) {
      return true;
    } else if ( null == o || getClass() != o.getClass() ) {
      return false;
    } else {
      final AnimMapStageDirective other = (AnimMapStageDirective)o;
      return _frequency == other._frequency && Objects.equals( _texture1, other._texture1 ) &&
        Objects.equals( _texture2, other._texture2 ) && Objects.equals( _texture3, other._texture3 ) &&
        Objects.equals( _texture4, other._texture4 ) && Objects.equals( _texture5, other._texture5 ) &&
        Objects.equals( _texture6, other._texture6 ) && Objects.equals( _texture7, other._texture7 ) &&
        Objects.equals( _texture8, other._texture8 );
    }
  }

  @Nonnull
  @Override
  public String toString()
  {
    return MaterialOutput.outputAsString( this::write );
  }
}
