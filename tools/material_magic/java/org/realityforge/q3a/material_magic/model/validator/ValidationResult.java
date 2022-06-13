package org.realityforge.q3a.material_magic.model.validator;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;
import javax.annotation.Nonnull;

public final class ValidationResult
{
  @Nonnull
  private final List<ValidationMessage> _messages;

  public ValidationResult( @Nonnull final List<ValidationMessage> messages )
  {
    _messages = Objects.requireNonNull( messages );
  }

  public boolean hasErrorMessages()
  {
    return _messages.stream().anyMatch( m -> ValidationMessage.Type.ERROR == m.getType() );
  }

  public boolean hasWarningMessages()
  {
    return _messages.stream().anyMatch( m -> ValidationMessage.Type.WARNING == m.getType() );
  }

  public boolean hasInfoMessages()
  {
    return _messages.stream().anyMatch( m -> ValidationMessage.Type.INFO == m.getType() );
  }

  @Nonnull
  public List<ValidationMessage> getMessages()
  {
    return _messages;
  }

  @Nonnull
  public List<ValidationMessage> getErrorMessages()
  {
    return getMessages()
      .stream()
      .filter( m -> ValidationMessage.Type.ERROR == m.getType() )
      .collect( Collectors.toList() );
  }

  @Nonnull
  public List<ValidationMessage> getWarningMessages()
  {
    return getMessages()
      .stream()
      .filter( m -> ValidationMessage.Type.WARNING == m.getType() )
      .collect( Collectors.toList() );
  }

  @Nonnull
  public List<ValidationMessage> getInfoMessages()
  {
    return getMessages()
      .stream()
      .filter( m -> ValidationMessage.Type.INFO == m.getType() )
      .collect( Collectors.toList() );
  }
}
