package org.realityforge.q3a.material_magic.model.validator;

import java.util.List;
import java.util.Objects;
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
}
