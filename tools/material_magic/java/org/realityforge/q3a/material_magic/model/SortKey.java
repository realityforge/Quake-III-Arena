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
