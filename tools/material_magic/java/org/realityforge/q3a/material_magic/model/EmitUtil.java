/*
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
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
