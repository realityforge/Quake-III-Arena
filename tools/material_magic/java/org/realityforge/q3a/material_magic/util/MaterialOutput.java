package org.realityforge.q3a.material_magic.util;

import javax.annotation.Nonnull;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Objects;

public final class MaterialOutput
        implements AutoCloseable {
    @FunctionalInterface
    public interface Block {
        void call(@Nonnull MaterialOutput output)
                throws IOException;
    }

    @Nonnull
    private final OutputStream _outputStream;
    private int _indent;

    @Nonnull
    public static String outputAsString(@Nonnull final Block body) {
        try {
            final ByteArrayOutputStream baos = new ByteArrayOutputStream();
            final MaterialOutput output = new MaterialOutput(baos);
            body.call(output);
            final byte[] bytes = baos.toByteArray();
            return new String(bytes, 0, bytes.length, StandardCharsets.US_ASCII);
        } catch (final IOException e) {
            throw new RuntimeException(e);
        }
    }

    public MaterialOutput(@Nonnull final Path extensionFile)
            throws IOException {
        this(Files.newOutputStream(extensionFile.toFile().toPath()));
    }

    public MaterialOutput(@Nonnull final OutputStream outputStream) {
        _outputStream = Objects.requireNonNull(outputStream);
    }

    public void writeMaterial(@Nonnull final String label, @Nonnull final Block body)
            throws IOException {
        write(label);
        writeSection(body);
    }

    public void writeStage(@Nonnull final Block body)
            throws IOException {
        writeSection(body);
    }

    public void writeProperty(@Nonnull final String name, @Nonnull final String... arguments)
            throws IOException {
        write(name + (0 == arguments.length ? "" : " " + String.join(" ", arguments)));
    }

    private void writeSection(@Nonnull final Block body)
            throws IOException {
        write("{");
        incIndent();
        body.call(this);
        decIndent();
        write("}");
    }

    private void write(@Nonnull final String line)
            throws IOException {
        for (int i = 0; i < _indent; i++) {
            emit("    ");
        }
        emit(line);
        newLine();
    }

    private void newLine()
            throws IOException {
        emit("\n");
    }

    private void incIndent() {
        _indent++;
    }

    private void decIndent() {
        _indent--;
        assert _indent >= 0;
    }

    @Override
    public void close()
            throws IOException {
        _outputStream.close();
    }

    private void emit(@Nonnull final String string)
            throws IOException {
        _outputStream.write(string.getBytes(StandardCharsets.US_ASCII));
    }
}
