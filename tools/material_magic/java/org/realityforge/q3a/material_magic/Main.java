package org.realityforge.q3a.material_magic;

import org.realityforge.q3a.material_magic.model.MaterialsUnit;
import org.realityforge.q3a.material_magic.model.reader.LoadError;
import org.realityforge.q3a.material_magic.model.reader.MaterialsReadException;
import org.realityforge.q3a.material_magic.model.reader.MaterialsUnitReader;
import picocli.CommandLine;
import picocli.CommandLine.Command;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.concurrent.Callable;


@Command(name = "material_magick",
        mixinStandardHelpOptions = true,
        description = "Read and process shader/material files.")
public class Main implements Callable<Integer> {
    @CommandLine.Option(names = {"-i", "--input-file"}, description = "The input file to load", paramLabel = "I", required = true)
    private Path _input;

    @CommandLine.Option(names = {"-o", "--output-file"}, description = "The file to save unit to", paramLabel = "O")
    private Path _output;

    @Override
    public Integer call() throws Exception {
        final MaterialsUnit unit;
        try {
            unit = MaterialsUnitReader.fromPath(_input);
        } catch (final MaterialsReadException e) {
            System.err.println("Error: Invalid input file " + _input);
            for (final LoadError syntaxError : e.getSyntaxErrors()) {
                System.err.println(syntaxError.toString(_input.toString()));
            }
            return 1;
        } catch (IOException e) {
            System.err.println("Error: Failed to read input file " + _input);
            return 1;
        }
        if (null != _output) {
            final Path directory = _output.getParent();
            try {
                if (!Files.exists(directory)) {
                    Files.createDirectories(directory);
                }
                Files.writeString(_output, unit.toString(), StandardCharsets.US_ASCII);
            } catch (final IOException ioe) {
                System.err.println("Failed to write output file " + _output + " due to " + ioe);
                return 1;
            }
        } else {
            System.out.print(unit);
        }
        return 0;
    }


    public static void main(@Nonnull final String... args) {
        System.exit(new CommandLine(new Main()).execute(args));
    }
}
