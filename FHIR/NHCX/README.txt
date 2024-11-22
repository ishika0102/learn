********************************************************
		Introduction
********************************************************

FHIR resources can be used in many different contexts in healthcare. In order to include different use cases, specifications need to be able to describe restrictions on how one or more resource(s) are used, including defining extensions, and controlling how terminology is used. These things are done using a "Profile", which itself is represented as a resource.

NHCX FHIR profiles are designed for the National Health Claim Exchange Specifications 1.0. These includes following Health Claim Artifacts:
1. ClaimBundle
        The profile is based on a Bundle of type collection, where all the supporting information required for processing claim can be shared. Multiple entries can be added in a bundle to provide information like financial, clinical, provision of health care services with payors and for reporting to regulatory bodies and firms which provide data analytics. The bundle can be generated depending on the nature of the request defined by 'use' element in a claim resource, like preauthorization, predetermination and claim and can be shared over NHCX ecosystem.

2. ClaimResponseBundle
        The profile is based on a Bundle of type collection, where adjudicated response to a Claim, Predetermination or Preauthorization related information is carried. Multiple entries included in a bundle carries the information and provides application level adjudication results.

3. CoverageEligibilityRequestBundle
        The profile is based on a Bundle of type collection, where all the information required to process Coverage Eligibility Request can be shared. Depending on the purpose of the request like validation, discovery,auth-requirement and benefit data can be included in the etries of a bundle.

4. CoverageEligibilityResponseBundle
        The Coverage Eligibility Response Bundle is a Bundle profile with type collection. The bundle profile provides the response and plan details from the processing of an CoverageEligibilityRequest resource.

5. InsurancePlanBundle
        This profile is based on a Bundle of type collection, providing a description of a health insurance package that consists of a comprehensive list of covered benefits (referred to as the product), associated costs (known as the plan), and supplementary details regarding the offering, such as ownership and administration, coverage area, contact information, and more.

6. TaskBundle
        This profile is based on a Bundle of type collection, incorporating the Task resource to convey the information related to payments, status checks during claim adjudication, reprocessing claims, and facilitating the request or transmission of any supporting documentation as needed.

The purpose of NHCX FHIR Sample Codes is to demonstrate how to populate, validate Health Claim Artifacts against NHCX FHIR profiles, serialize and parse NHCX Health Claim Artifacts programmatically using HAPI library that can be captured and exchanged as per NHCX Health Claim Exchange Specifications 1.0. 

Resources in these sample codes are based on FHIR R4. Populated resources includes mandatory elements and terminology requirements that MUST be present.

Note: Sample Codes are compiled and tested on AdoptOpenJDK 11 and Maven 3.9.6. 

********************************************************
	Pre-Requisite requirements
********************************************************

1. JDK 11 or above to be installed on machine
      Set the environment variables for Java.
	e.g.: Setting the environment variables for Java considering AdoptOpenJDK 11 is installed.  
		Windows: Add System Environment Variable: JAVA_HOME - C:\Program Files\Java\jdk11
		LINUX: modify '/etc/profile': JAVA_HOME - export JAVA_HOME=/usr/lib/jvm/jdk11

	Append the path value for JAVA in the PATH environment variable.
	e.g :  Windows: C:\Program Files\Java\jdk11\bin
	       LINUX: modify '/etc/profile': export PATH=/usr/lib/jvm/jdk11/bin:$PATH

2. Maven 3.9.6 to be installed on machine 
        Append the path value for Maven in the PATH environment variable.
        e.g :  Windows: C:\Program Files\apache-maven-3.9.6\bin
	       LINUX: modify '/etc/profile': export PATH=/usr/lib/apache-maven-3.9.6/bin:$PATH

3. Dependencies required

   FHIR Hapi library - HAPI FHIR 6.4.3 

     a. hapi-fhir-structures-r4-6.4.3.jar
   
        <!-- https://mvnrepository.com/artifact/ca.uhn.hapi.fhir/hapi-fhir-structures-r4 -->
            <dependency>
                <groupId>ca.uhn.hapi.fhir</groupId>
                <artifactId>hapi-fhir-structures-r4</artifactId>
                <version>6.4.3</version>
            </dependency>
  

     b. hapi-fhir-validation-6.4.3.jar
  
        <!-- https://mvnrepository.com/artifact/ca.uhn.hapi.fhir/hapi-fhir-validation -->
            <dependency>
                <groupId>ca.uhn.hapi.fhir</groupId>
                <artifactId>hapi-fhir-validation</artifactId>
                <version>6.4.3</version>
            </dependency>
   

     c. hapi-fhir-validation-resources-r4-6.4.3.jar
   
        <!-- https://mvnrepository.com/artifact/ca.uhn.hapi.fhir/hapi-fhir-validation-resources-r4 -->
            <dependency>
                <groupId>ca.uhn.hapi.fhir</groupId>
                <artifactId>hapi-fhir-validation-resources-r4</artifactId>
                <version>6.4.3</version>
            </dependency>
   
4.  Download the FHIR npm package.tgz which is required for the validaton of the resources. Following ways can be used to download :-

    a. FHIR npm package.tgz (containing Structure Definitions , CodeSystems and ValueSets) can be download from this link: https://www.nrces.in/ndhm/fhir/r4/downloads.html (package.tgz).
        • Copy the file (package.tgz) to java project's resources folder (src/main/resources)
        • Replace "classpath:<Enter the package name>" with "classpath:package.tgz"

    b. Alternatively, To download the FHIR npm package using maven plugin, modify the "pom.xml" file.

        • Locate the "<build>" section in "pom.xml". If it does not exist, create one.

        • Add the following plugins configuration inside the "<build>" section:

 
        <plugins>
        <!-- Used for downloading package.tgz -->            
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-antrun-plugin</artifactId>
                <version>3.0.0</version>
                <executions>
                    <execution>
                        <id>download-package</id>
                        <phase>generate-resources</phase>
                        <goals>
                            <goal>run</goal>
                        </goals>
                        <configuration>
                            <target>
                                <get src="https://nrces.in/ndhm/fhir/r4/package.tgz" dest="src/main/resources/package.tgz"/>
                            </target>
                        </configuration>
                    </execution>
                </executions>
            </plugin>
            <!-- Used to compile Java source code --> 
            <plugin>
                    <groupId>org.apache.maven.plugins</groupId>
                    <artifactId>maven-compiler-plugin</artifactId>
                    <version>3.8.1</version>
                    <configuration>
                        <compilerId>eclipse</compilerId>
                    </configuration>
                    <dependencies>
                        <dependency>
                            <groupId>org.codehaus.plexus</groupId>
                            <artifactId>plexus-compiler-eclipse</artifactId>
                            <version>2.8.4</version>
                        </dependency>
                    </dependencies>
            </plugin>
        </plugins>

        • Execute the "mvn clean install" command to install all dependencies and compile the project.
        • Replace "classpath:<Enter the package name>" with "classpath:package.tgz"
        • To create the JSON and XML files for bundles, need to execute the Java files.

********************************************************
	Things to Consider
********************************************************

1. The package.tgz contains all the Structure Definitions and examples of profiles, CodeSystems, and ValueSets. The package.tgz is used for validating resources against the Structure Definitions of profiles.
2. The systems used in the examples are temporary place holders and the values may be different in actual implementation
3. The resource identifiers in the examples are URN (Uniform Resource Name) or UUID (Universally Unique Identifier). The source may preserve the identifiers for referring the resource for later purposes


********************************************************
	What zip includes 
********************************************************
1. Sample Codes
	a. ResourcePopulator:
		Populates all the required resources that are defined to exchange quality data and required to populate Health Claim Artifacts.

	b. ClaimBundle
		Populates Claim bundle, validates populated bundle, serializes it and writes it in json/xml format. Then parses the existing written file and validates it again.

        c. ClaimResponseBundle
		Populates ClaimResponse bundle, validates populated bundle, serializes it and writes it in json/xml format. Then parses the existing written file and validates it again.

	d. CoverageEligibilityRequestBundle
		Populates CoverageEligibilityRequest bundle, validates populated bundle, serializes it and writes it in json/xml format. Then parses the existing written file and validates it again.

	e. CoverageEligibilityResponseBundle
		Populates CoverageEligibilityResponse bundle, validates populated bundle, serializes it and writes it in json/xml format. Then parses the existing written file and validates it again.

	f. InsurancePlanBundle
		Populates InsurancePlan bundle, validates populated bundle, serializes it and writes it in json/xml format. Then parses the existing written file and validates it again.
       
        g. TaskBundle
                Populates Task bundle, validates populated bundle, serializes it and writes it in json/xml format. Then parses the existing written file and validates it again.

		
********************************************************
			FINISH
********************************************************
