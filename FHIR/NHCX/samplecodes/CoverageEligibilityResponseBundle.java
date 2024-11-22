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
import org.hl7.fhir.r4.model.CoverageEligibilityRequest.EligibilityRequestPurpose;
import org.hl7.fhir.r4.model.CoverageEligibilityResponse.EligibilityResponsePurpose;
import org.hl7.fhir.r4.model.InstantType;

 

import org.hl7.fhir.r4.model.Meta;

import ca.uhn.fhir.context.FhirContext;
import ca.uhn.fhir.context.support.DefaultProfileValidationSupport;
import ca.uhn.fhir.parser.IParser;
import ca.uhn.fhir.validation.FhirValidator;
import ca.uhn.fhir.validation.SingleValidationMessage;
import ca.uhn.fhir.validation.ValidationResult;

public class CoverageEligibilityResponseBundle {

	// Initialize the FHIR context for r4
	static FhirContext ctx = FhirContext.forR4();
	static FhirValidator validator;
	static FhirInstanceValidator fhirInstanceValidator;

	public static void main(String[] arg) throws Exception {

		 

		// Initialize validation support and loads all required profiles
		init();
        Scanner scanner = new Scanner(System.in);
		// Populate CoverageEligibilityResponseBundle resource
		Bundle coverageEligibilityResponseBundle = populateCoverageEligibilityResponseBundle(scanner);
		
		if (validator(coverageEligibilityResponseBundle)) {
	         
			// Instantiate a new parser
		     IParser parser;

			// Enter file path (Eg: C://generatedexamples//CoverageEligibilityResponseBundle.json)
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
			String serializeBundle = parser.encodeResourceToString(coverageEligibilityResponseBundle);

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
			System.out.println("Failed to validate populated CoverageEligibilityResponse bundle");
		}
	}

	// populating CoverageEligibilityResponseBundle Resource
	public static Bundle populateCoverageEligibilityResponseBundle(Scanner scanner) {

		Bundle coverageEligibilityResponseBundle = new Bundle();

		// set Id - Logical id of this artifact
		coverageEligibilityResponseBundle.setId("CoverageEligibilityResponseBundle-example-01");

		// set Meta - Metadata about the resource
		Meta meta = new Meta();
		meta.setVersionId("1");
		meta.addProfile("https://nrces.in/ndhm/fhir/r4/StructureDefinition/CoverageEligibilityResponseBundle");
		meta.addSecurity(
				new Coding("http://terminology.hl7.org/CodeSystem/v3-Confidentiality", "V", "very restricted"));
		coverageEligibilityResponseBundle.setMeta(meta);

		// set Type - collection
		coverageEligibilityResponseBundle.setType(BundleType.COLLECTION);

		// set Timestamp - When the bundle was assembled
		coverageEligibilityResponseBundle.setTimestampElement(new InstantType("2020-07-09T15:32:26.605+05:30"));

		// set Entry - Entry in the bundle - will have a resource or information
		List<Bundle.BundleEntryComponent> list = coverageEligibilityResponseBundle.getEntry();

		EligibilityResponsePurpose CoverageEligibilityResponsePurpose = null;
		EligibilityRequestPurpose CoverageEligibilityRequestPurpose =null;

		System.out.println(
				"Please Choose the purpose for the CoverageEligbilityResponse \nEnter 1 for auth-requirements\nEnter 2 for benefits\nEnter 3 for discovery\nEnter 4 for validation");
		int choice = scanner.nextInt();
		scanner.nextLine();
		switch (choice) {
		case 1:
		   CoverageEligibilityResponsePurpose = EligibilityResponsePurpose.AUTHREQUIREMENTS;
		   CoverageEligibilityRequestPurpose = EligibilityRequestPurpose.AUTHREQUIREMENTS;
			break;
		case 2:
			CoverageEligibilityResponsePurpose = EligibilityResponsePurpose.BENEFITS;
			CoverageEligibilityRequestPurpose = EligibilityRequestPurpose.BENEFITS;
			break;
		case 3:
			CoverageEligibilityResponsePurpose = EligibilityResponsePurpose.DISCOVERY;
			CoverageEligibilityRequestPurpose = EligibilityRequestPurpose.DISCOVERY;
			break;
		case 4:
			CoverageEligibilityResponsePurpose = EligibilityResponsePurpose.VALIDATION;
			CoverageEligibilityRequestPurpose = EligibilityRequestPurpose.VALIDATION;
			break;
		default:
			System.out.println("Wrong input");
			break;
		}

		BundleEntryComponent bundleEntry1 = new BundleEntryComponent();
		bundleEntry1.setFullUrl("urn:uuid:e40cab97-69fd-43cc-9b28-2ba43874e879");
		bundleEntry1.setResource(ResourcePopulator.populateCoverageEligiblityResponse(CoverageEligibilityResponsePurpose));

		BundleEntryComponent bundleEntry2 = new BundleEntryComponent();
		bundleEntry2.setFullUrl("urn:uuid:1efe03bf-9506-40ba-bc9a-80b0d5045afe");
		bundleEntry2.setResource(ResourcePopulator.populatePatientResource());

		BundleEntryComponent bundleEntry3 = new BundleEntryComponent();
		bundleEntry3.setFullUrl("urn:uuid:3bc96820-c7c9-4f59-900d-6b0ed1fa558e");
		bundleEntry3.setResource(ResourcePopulator.populatePractitionerResource());

		BundleEntryComponent bundleEntry4 = new BundleEntryComponent();
		bundleEntry4.setFullUrl("urn:uuid:4daab13d-d2ed-4d7a-9612-3ab17d9e926a");
		bundleEntry4.setResource(ResourcePopulator.populateCoverageEligibilityRequest(CoverageEligibilityRequestPurpose));

		BundleEntryComponent bundleEntry5 = new BundleEntryComponent();
		bundleEntry5.setFullUrl("urn:uuid:3a947161-4033-45d1-8b9c-7e9115c6000f");
		bundleEntry5.setResource(ResourcePopulator.populateOrganizationResource());

		
		BundleEntryComponent bundleEntry6 = new BundleEntryComponent();
		bundleEntry6.setFullUrl("urn:uuid:e81d20b0-39c1-4df8-b556-31cda07071e4");
		bundleEntry6.setResource(ResourcePopulator.populateLocationResource());

		
		BundleEntryComponent bundleEntry7 = new BundleEntryComponent();
		bundleEntry7.setFullUrl("urn:uuid:0316e4d7-03e6-48b8-bcfd-8a3254f3f7b5");
		bundleEntry7.setResource(ResourcePopulator.populateCoverageResource());

		list.add(bundleEntry1);
		list.add(bundleEntry2);
		list.add(bundleEntry3);
		list.add(bundleEntry4);
		list.add(bundleEntry5);
		list.add(bundleEntry6);
		list.add(bundleEntry7);
		coverageEligibilityResponseBundle.setEntry(list);

		return coverageEligibilityResponseBundle;

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

	// Validation method will validate CoverageEligibilityResponseBundle against ABDM CoverageEligibilityResponseBundle FHIR
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
