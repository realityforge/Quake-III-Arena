package org.realityforge.q3a.material_magic;

import org.realityforge.q3a.material_magic.model.MaterialsUnit;
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
    @CommandLine.Option(names = {"-i", "--input-file"}, description = "The input file to load", required = true)
    private Path _input;

    @CommandLine.Option(names = {"-o", "--output-file"}, description = "The file to save unit to", arity = "0..1")
    private Path _output;

    @Override
    public Integer call() throws Exception {
        final MaterialsUnit unit = MaterialsUnitReader.fromPath(_input);
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


    public static void main(final String... args) throws IOException {
        System.exit(new CommandLine(new Main()).execute(args));
    }
}
