package org.realityforge.q3a.material_magic.model;

final class EmitUtil
{
  private EmitUtil() {}

  static String floatToString( final float value )
  {
    final int iValue = (int)value;
    if ( iValue == value ) {
      return Integer.toString( iValue );
    } else {
      final String sValue = Float.toString( value );
      return sValue.startsWith( "0." ) ? sValue.substring( 1 )
      : sValue.endsWith( ".0" )        ? sValue.substring( 0, sValue.length() - 2 )
                                       : sValue;
    }
  }
}
