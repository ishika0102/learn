import com.nedap.archie.adlparser.ADLParseException;
import com.nedap.archie.adlparser.ADLParser; // Assuming ArchetypeParser is ADLParser
import com.nedap.archie.aom.Archetype;
import com.nedap.archie.aom.ArchetypeConstraint;
import com.nedap.archie.flattener.Flattener;
import com.nedap.archie.flattener.FlattenerConfiguration;
import com.nedap.archie.flattener.InMemoryFullArchetypeRepository;
import com.nedap.archie.rminfo.ArchieRMInfoLookup;
import com.nedap.archie.rminfo.MetaModels;
import com.nedap.archie.rminfo.ReferenceModels;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.openehr.referencemodels.BuiltinReferenceModels;

public class Main {

    public static void main(String[] args) throws ADLParseException {
        try {
            // Load your template archetype
            Path templatePath = Paths.get("path/to/your/archetype.adls");
            Archetype archetype = ArchieUtils.loadArchetype(templatePath);

            // Flatten the archetype to get paths
            List<ArchetypeConstraint> flattenedConstraints = ArchieUtils.flattenArchetype(archetype);

            // Output paths
            System.out.println("Paths in flattened archetype:");
            for (ArchetypeConstraint constraint : flattenedConstraints) {
                System.out.println(constraint.getPath());
            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}

class ArchieUtils {

    // Method to load an archetype from a file
    public static Archetype loadArchetype(Path archetypePath) throws IOException, ADLParseException {
        return new ADLParser().parse(Files.newInputStream(archetypePath));
    }

    // Method to flatten an archetype and get all paths
    public static List<ArchetypeConstraint> flattenArchetype(Archetype archetype) {
    	InMemoryFullArchetypeRepository repository = new InMemoryFullArchetypeRepository();
//        Flattener flattener = new Flattener(new InMemoryFullArchetypeRepository()
    	Flattener flattener = new Flattener(repository, BuiltinReferenceModels.getMetaModels());
//        ReferenceModels models = new ReferenceModels(ArchieRMInfoLookup.getInstance());
//        MetaModels metaModels = new MetaModels(models, null);
//        FlattenerConfiguration config = new FlattenerConfiguration(); // Adjust parameters as needed
        return (List<ArchetypeConstraint>) flattener.flatten(archetype);
    }
}
