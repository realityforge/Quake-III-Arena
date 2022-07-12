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

import java.io.IOException;
import java.util.Objects;
import javax.annotation.Nonnull;
import org.realityforge.q3a.material_magic.util.MaterialOutput;

public final class TextDeformStageDirective extends DeformStageDirective<TextDeformStageDirective>
{
  private int _level;

  public int getLevel() { return _level; }

  public void setLevel( final int level )
  {
    assert 0 <= level && level <= 7;
    _level = level;
  }

  @Override
  void write( @Nonnull final MaterialOutput output ) throws IOException
  {
    output.writeDirective( "deformVertexes", "text" + _level );
  }

  @Override
  protected boolean performEquals( @Nonnull final TextDeformStageDirective other )
  {
    return _level == other._level;
  }

  @Override
  public int hashCode()
  {
    return Objects.hash( "text", _level );
  }
}
