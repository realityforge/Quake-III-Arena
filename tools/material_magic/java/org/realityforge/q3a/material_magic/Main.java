package org.realityforge.q3a.material_magic;

import org.realityforge.q3a.material_magic.model.Material;
import org.realityforge.q3a.material_magic.model.MaterialsUnit;
import org.realityforge.q3a.material_magic.model.reader.LoadError;
import org.realityforge.q3a.material_magic.model.reader.MaterialsReadException;
import org.realityforge.q3a.material_magic.model.reader.MaterialsUnitReader;
import org.realityforge.q3a.material_magic.util.MaterialOutput;
import picocli.CommandLine;
import picocli.CommandLine.Command;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Callable;


@SuppressWarnings({"unused", "BooleanMethodIsAlwaysInverted"})
@Command(name = "material_magick",
        mixinStandardHelpOptions = true,
        description = "Read and process shader/material files.")
public class Main implements Callable<Integer> {
    @SuppressWarnings("MismatchedQueryAndUpdateOfCollection")
    @CommandLine.Option(names = {"-i", "--input-file"}, description = "The input file to load", paramLabel = "I", required = true)
    private List<Path> _input;
    @CommandLine.Option(names = {"-o", "--output-file"}, description = "The file to save unit to", paramLabel = "O")
    private Path _output;
    @CommandLine.Option(names = {"-d", "--output-directory"}, description = "The directory in which to save shaders. One file per material", paramLabel = "D")
    private Path _outputDirectory;
    @CommandLine.Option(names = {"--optimize"}, description = "Optimize the unit for loading by the engine by stripping tooling data", arity = "0")
    private boolean _optimize;
    @CommandLine.Option(names = {"--identity-transform"}, description = "Attempt to perform the identity transform and verify the pre-transform and post-transform match. This is done for every unit after loading and every unit prior to saving. This primarily used to verify the integrity of the tool.", arity = "0")
    private boolean _identityTransform;
    @Override
    public Integer call() throws Exception {
        final MaterialsUnit unit = loadInputs();
        if (null == unit) {
            return 1;
        }
        if (null != _output) {
            if (!writeUnit(_output, unit)) {
                return 1;
            }
        }

        if (null != _outputDirectory) {
            for (final Material material : unit.getMaterials()) {
                final MaterialsUnit newUnit = new MaterialsUnit();
                newUnit.addMaterial(material);
                if (!writeUnit(_output.resolve(material.getName()), newUnit)) {
                    return 1;
                }
            }
        }

        if (null == _output && null == _outputDirectory) {
            System.out.print(unit);
        }
        return 0;
    }

    private boolean writeUnit(@Nonnull final Path path, @Nonnull final MaterialsUnit unit) {
        if (_identityTransform && !verifyIdentityTransform(path, unit)) {
            return false;
        } else {
            try {
                final Path directory = path.getParent();
                if (!Files.exists(directory)) {
                    Files.createDirectories(directory);
                }
                final ByteArrayOutputStream baos = new ByteArrayOutputStream();
                final MaterialOutput.Strategy strategy =
                        _optimize ? MaterialOutput.Strategy.RUNTIME_OPTIMIZED : MaterialOutput.Strategy.PRETTY;
                unit.write(new MaterialOutput(baos, strategy));
                Files.write(path, baos.toByteArray());
            } catch (final IOException ioe) {
                System.err.println("Failed to write output file " + path + " due to " + ioe);
                return false;
            }
        }
        return true;
    }

    @Nullable
    private MaterialsUnit loadInputs() {
        final List<MaterialsUnit> units = new ArrayList<>();
        for (final Path input : _input) {
            final MaterialsUnit unit = loadUnit(input);
            if (null == unit) {
                return null;
            } else {
                if (_identityTransform && !verifyIdentityTransform(input, unit)) {
                    return null;
                }
                units.add(unit);
            }
        }
        if (1 != units.size()) {
            return merge(units);
        } else {
            return units.get(0);
        }
    }

    private boolean verifyIdentityTransform(@Nonnull final Path file, @Nonnull final MaterialsUnit unit) {
        final MaterialsUnit transformedUnit;
        try {
            transformedUnit = MaterialsUnitReader.readFromString(unit.toString());
        } catch (final MaterialsReadException e) {
            System.err.println("Error: Invalid unit when checking identity transform of file " + file);
            for (final LoadError syntaxError : e.getSyntaxErrors()) {
                System.err.println(syntaxError.toString(file.toString()));
            }
            return false;
        }
        if (!transformedUnit.equals(unit)) {
            System.err.println("Identity transform for file " + file + " failed to produce identical output.");
            System.err.println("Original unit source:");
            System.err.println("--------------------------------------------------------------------------------");
            System.err.print(unit);
            System.err.println("--------------------------------------------------------------------------------");
            System.err.println("Transformed unit source:");
            System.err.println("--------------------------------------------------------------------------------");
            System.err.print(transformedUnit);
            System.err.println("--------------------------------------------------------------------------------");
            return false;
        } else {
            return true;
        }
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
