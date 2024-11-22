package nhcx;


import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
 
import java.util.List;
import java.util.Scanner;

import org.apache.commons.io.FilenameUtils;
import org.hl7.fhir.common.hapi.validation.support.CachingValidationSupport;
import org.hl7.fhir.common.hapi.validation.support.CommonCodeSystemsTerminologyService;
import org.hl7.fhir.common.hapi.validation.support.InMemoryTerminologyServerValidationSupport;
import org.hl7.fhir.common.hapi.validation.support.NpmPackageValidationSupport;
import org.hl7.fhir.common.hapi.validation.support.SnapshotGeneratingValidationSupport;
import org.hl7.fhir.common.hapi.validation.support.ValidationSupportChain;
import org.hl7.fhir.common.hapi.validation.validator.FhirInstanceValidator;
import org.hl7.fhir.instance.model.api.IBaseResource;
import org.hl7.fhir.r4.model.Bundle;
import org.hl7.fhir.r4.model.Bundle.BundleEntryComponent;
import org.hl7.fhir.r4.model.Bundle.BundleType;
import org.hl7.fhir.r4.model.Coding;
import org.hl7.fhir.r4.model.Identifier;
import org.hl7.fhir.r4.model.InstantType;
import org.hl7.fhir.r4.model.Meta;
import ca.uhn.fhir.context.FhirContext;
import ca.uhn.fhir.context.support.DefaultProfileValidationSupport;
import ca.uhn.fhir.parser.IParser;
import ca.uhn.fhir.validation.FhirValidator;
import ca.uhn.fhir.validation.SingleValidationMessage;
import ca.uhn.fhir.validation.ValidationResult;

public class TaskBundleForCommunicationRequest {

	static FhirContext ctx = FhirContext.forR4();
	static FhirValidator validator;
	static FhirInstanceValidator fhirInstanceValidator;

	public static void main(String[] arg) throws Exception {

		 

		// Initialize validation support and loads all required profiles
		init();
         Scanner scanner = new Scanner(System.in);
 
		Bundle TaskBundle = populateTaskBundleForCommunicationRequest();

		if (validator(TaskBundle)) {

			// Instantiate a new parser
			IParser parser; 

			// Enter file path (Eg: C://generatedexamples//bundle-insurancePlanBundle.json)
			// Depending on file type xml/json instantiate the parser type
			File file;
			
			System.out.println("\nEnter file path to write bundle");
			String filePath = scanner.nextLine();
			if(FilenameUtils.getExtension(filePath).equals("json"))
			{
				parser = ctx.newJsonParser();
			}
			else if(FilenameUtils.getExtension(filePath).equals("xml"))
			{
				parser = ctx.newXmlParser();
			}
			else
			{
				System.out.println("Invalid file extension!");
				if(scanner!=null)
					scanner.close();
				return;
			}

			// Indent the output
			parser.setPrettyPrint(true);

			// Serialize populated bundle
			String serializeBundle = parser.encodeResourceToString(TaskBundle);

			// Write serialized bundle in xml/json file
			file = new File(filePath);
			file.createNewFile();	
			FileWriter writer = new FileWriter(file);
			writer.write(serializeBundle);
			writer.flush();
			writer.close();
			scanner.close();

			// Parse the xml/json file
			IBaseResource resource = parser.parseResource(new FileReader(new File(filePath)));

			// Validate Parsed file
			if(validator(resource)){
				System.out.println("Validated parsed file successfully");
			}
			else{
				System.out.println("Failed to validate parsed file");
			}
			
		}
		else
		{
			System.out.println("Failed to validate populated insurancePlan Bundle");
		}
	}

	
	// populating TaskBundleForCommunicationRequest Resource
	public static Bundle populateTaskBundleForCommunicationRequest() {

		Bundle TaskBundle = new Bundle();

		// set Id - Logical id of this artifact
		TaskBundle.setId("TaskBundleForCommunicationRequest-example-01");

		// set Meta - Metadata about the resource
		Meta meta = new Meta();
		meta.setVersionId("1");
		meta.addProfile("https://nrces.in/ndhm/fhir/r4/StructureDefinition/TaskBundle");
		meta.addSecurity(
				new Coding("http://terminology.hl7.org/CodeSystem/v3-Confidentiality", "V", "very restricted"));
		TaskBundle.setMeta(meta);

		TaskBundle.setIdentifier(new Identifier().setSystem("http://hip.in").setValue("bc3c6c57-2053-4d0e-ac40-139ccccff645"));

		// set Type - collection
		TaskBundle.setType(BundleType.COLLECTION);

		// set Timestamp - When the bundle was assembled
		TaskBundle.setTimestampElement(new InstantType("2023-09-07T15:32:26.605+05:30"));

		// set Entry - Entry in the bundle - will have a resource or information
		List<Bundle.BundleEntryComponent> list = TaskBundle.getEntry();

		BundleEntryComponent bundleEntry0 = new BundleEntryComponent();
		bundleEntry0.setFullUrl("urn:uuid:602081df-e50a-4b02-89d0-f7edffcfbcb8");
		bundleEntry0.setResource(ResourcePopulator.populateTaskResourceForCommunicationRequest());

		BundleEntryComponent bundleEntry1 = new BundleEntryComponent();
		bundleEntry1.setFullUrl("urn:uuid:d137441d-e494-4c9f-a847-0c28eb1e31cc");
		bundleEntry1.setResource(ResourcePopulator.populateCommunicationRequestResource());

		BundleEntryComponent bundleEntry2 = new BundleEntryComponent();
		bundleEntry2.setFullUrl("urn:uuid:760ec93e-7ec8-4e82-b8a3-fe6512fccd8b");
		bundleEntry2.setResource(ResourcePopulator.populateClaimPreauthResource());

		BundleEntryComponent bundleEntry3 = new BundleEntryComponent();
		bundleEntry3.setFullUrl("urn:uuid:1efe03bf-9506-40ba-bc9a-80b0d5045afe");
		bundleEntry3.setResource(ResourcePopulator.populatePatientResource());

		BundleEntryComponent bundleEntry4 = new BundleEntryComponent();
		bundleEntry4.setFullUrl("urn:uuid:3a947161-4033-45d1-8b9c-7e9115c6000f");
		bundleEntry4.setResource(ResourcePopulator.populateOrganizationResource());

		BundleEntryComponent bundleEntry5 = new BundleEntryComponent();
		bundleEntry5.setFullUrl("urn:uuid:acefdfbd-e612-483e-90fc-a5c44d09a4b9");
		bundleEntry5.setResource(ResourcePopulator.populateSecondMedicationRequestResource());

		BundleEntryComponent bundleEntry6 = new BundleEntryComponent();
		bundleEntry6.setFullUrl("urn:uuid:4a88bdc0-d320-4138-8014-d41913d9745a");
		bundleEntry6.setResource(ResourcePopulator.populateSecondOrganizationResource());

		BundleEntryComponent bundleEntry7 = new BundleEntryComponent();
		bundleEntry7.setFullUrl("urn:uuid:3bc96820-c7c9-4f59-900d-6b0ed1fa558e");
		bundleEntry7.setResource(ResourcePopulator.populatePractitionerResource());

		BundleEntryComponent bundleEntry8 = new BundleEntryComponent();
		bundleEntry8.setFullUrl("urn:uuid:0316e4d7-03e6-48b8-bcfd-8a3254f3f7b5");
		bundleEntry8.setResource(ResourcePopulator.populateCoverageResource());

		BundleEntryComponent bundleEntry9 = new BundleEntryComponent();
		bundleEntry9.setFullUrl("urn:uuid:bdaebfe7-8296-4241-9629-b16c364a10b4");
		bundleEntry9.setResource(ResourcePopulator.populateSecondConditionResource());
		
		BundleEntryComponent bundleEntry10 = new BundleEntryComponent();
		bundleEntry10.setFullUrl("urn:uuid:514bcad3-7bf0-43a0-b566-e8ecd815dc91");
		bundleEntry10.setResource(ResourcePopulator.populateThirdDocumentReferenceResource());
		
		list.add(bundleEntry0);
		list.add(bundleEntry1);
	    list.add(bundleEntry2);
		list.add(bundleEntry3);
		list.add(bundleEntry4);
		list.add(bundleEntry5);
		list.add(bundleEntry6);
		list.add(bundleEntry7);
		list.add(bundleEntry8);
		list.add(bundleEntry9);
		list.add(bundleEntry10);

		TaskBundle.setEntry(list);

		return TaskBundle;

	}

	/**
	 * This method initiates loading of FHIR default profiles and NDHM profiles for
	 * validation
	 */
	public static void init() throws IOException {

		/*
		 * Load NPM Package containing ABDM FHIR Profiles , Codesystems, ValueSets 
		 * Copy NPM Package.tgz (<package_name>.tgz) at "src/main/resource"
		 * Download Package : https://nrces.in/ndhm/fhir/r4/package.tgz
		 */
		

		NpmPackageValidationSupport npmValidationSupport = new NpmPackageValidationSupport(ctx);
		/* If you possess a package with a distinct name, kindly modify the package name
		 here correspondingly. */
		npmValidationSupport.loadPackageFromClasspath("classpath:<Enter the package name>");

		// Create a chain that will hold our modules
		ValidationSupportChain validationsupportchain = new ValidationSupportChain(

				npmValidationSupport, new DefaultProfileValidationSupport(ctx),
				new InMemoryTerminologyServerValidationSupport(ctx), new CommonCodeSystemsTerminologyService(ctx),
				new SnapshotGeneratingValidationSupport(ctx));

		CachingValidationSupport validationSupport = new CachingValidationSupport(validationsupportchain);

		validator = ctx.newValidator();
		fhirInstanceValidator = new FhirInstanceValidator(validationSupport);
		validator.registerValidatorModule(fhirInstanceValidator);

	}

	// Validation method will validate claimBundle against ABDM ClaimBundle FHIR
	// Profile and return true or false boolean value

	public static boolean validator(IBaseResource resource) throws Exception {

		ValidationResult outcome = validator.validateWithResult(resource);
		System.out.println(outcome);

		for (SingleValidationMessage next : outcome.getMessages()) {

			System.out.println(next.getSeverity() + " - " + next.getLocationString() + " - " + next.getMessage());
		}

		return outcome.isSuccessful();

	}
  

}
