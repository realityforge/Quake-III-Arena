package org.realityforge.q3a.material_magic;

import org.realityforge.q3a.material_magic.model.MaterialsUnit;
import org.realityforge.q3a.material_magic.model.reader.LoadError;
import org.realityforge.q3a.material_magic.model.reader.MaterialsReadException;
import org.realityforge.q3a.material_magic.model.reader.MaterialsUnitReader;
import picocli.CommandLine;
import picocli.CommandLine.Command;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Callable;


@Command(name = "material_magick",
        mixinStandardHelpOptions = true,
        description = "Read and process shader/material files.")
public class Main implements Callable<Integer> {
    @CommandLine.Option(names = {"-i", "--input-file"}, description = "The input file to load", paramLabel = "I", required = true)
    private List<Path> _input;

    @CommandLine.Option(names = {"-o", "--output-file"}, description = "The file to save unit to", paramLabel = "O")
    private Path _output;

    @Override
    public Integer call() throws Exception {
        final List<MaterialsUnit> units = new ArrayList<>();
        for (final Path input : _input) {
            final MaterialsUnit unit = loadUnit(input);
            if (null == unit) {
                return 1;
            } else {
                // Perform save/load/compare here
                units.add(unit);
            }
        }
        final MaterialsUnit unit;
        if (1 != units.size()) {
            unit = merge(units);
        } else {
            unit = units.get(0);
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

    @Nonnull
    private MaterialsUnit merge(@Nonnull final List<MaterialsUnit> units) {
        final MaterialsUnit unit = new MaterialsUnit();
        units.forEach(u -> u.getMaterials().forEach(unit::addMaterial));
        return unit;
    }

    /**
     * Load a unit from the specified file.
     * Emit errors to stderr and return null on error.
     *
     * @param path the file to load.
     * @return the loaded unit or null if the load failed.
     */
    @Nullable
    private MaterialsUnit loadUnit(@Nonnull final Path path) {
        try {
            return MaterialsUnitReader.fromPath(path);
        } catch (final MaterialsReadException e) {
            System.err.println("Error: Invalid input file " + path);
            for (final LoadError syntaxError : e.getSyntaxErrors()) {
                System.err.println(syntaxError.toString(path.toString()));
            }
            return null;
        } catch (IOException e) {
            System.err.println("Error: Failed to read input file " + path);
            return null;
        }
    }

    public static void main(@Nonnull final String... args) {
        System.exit(new CommandLine(new Main()).execute(args));
    }
}
