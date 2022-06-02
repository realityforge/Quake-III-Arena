package org.realityforge.q3a.material_magic.model;

import java.io.IOException;
import java.util.Objects;
import javax.annotation.Nonnull;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

public final class BulgeDeformStageDirective
  extends DeformStageDirective<BulgeDeformStageDirective>
{
  private float _width;
  private float _height;
  private float _speed;

  public float getWidth()
  {
    return _width;
  }

  public void setWidth( final float width )
  {
    _width = width;
  }

  public float getHeight()
  {
    return _height;
  }

  public void setHeight( final float height )
  {
    _height = height;
  }

  public float getSpeed()
  {
    return _speed;
  }

  public void setSpeed( final float speed )
  {
    _speed = speed;
  }

  @Override
  void write( @Nonnull final MaterialOutput output )
    throws IOException
  {
    output.writeDirective( "deformVertexes",
                           "bulge",
                           Float.toString( _width ),
                           Float.toString( _height ),
                           Float.toString( _speed ) );
  }

  @Override
  protected boolean performEquals( @Nonnull final BulgeDeformStageDirective other )
  {
    return _width == other._width && _height == other._height && _speed == other._speed;
  }

  @Override
  public int hashCode()
  {
    return Objects.hash( "text", _width, _height, _speed );
  }
}
