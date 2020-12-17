## Approval Status 

* Approval Status: Approved
* Example Task Force: 2/15/2018
* SDWG: 6/27/2019

### C-CDA 2.1 Example:
* 2.16.840.1.113883.10.20.22.2.1:2014-06-09
* 2.16.840.1.113883.10.20.22.2.1.1:2014-06-09
* 2.16.840.1.113883.10.20.22.4.16:2014-06-09
* 2.16.840.1.113883.10.20.22.4.23:2014-06-09
* 2.16.840.1.113883.10.20.22.4.119

### Reference to full CDA sample:
* Medications in empty CCD


### Validation location

* [SITE](https://site.healthit.gov/sandbox-ccda/ccda-validator)


### Comments

This example illustrates an example of a medication order with the following characteristics:

* an IV drug with a relative dose quantity that is based on weight,

* a drug vehicle used for preparation,

* and indications for the medication.



This example was created to address the following Use Case:
An oncologist is ordering a drug as part of a chemotherapy regimen. Chemotherapy regimens consist of orders could be administered weeks or months in advance.  Moreover their preparation is based on the patient's weight at the time of administration.  Because of these constraints, the C-CDA medications section needs to be represented in a way that reflects this.


Additional Notes and Assumptions:
* the /entry/substanceAdministration/effectiveTime/@value is meant to be set at a future date relative to the date of the encounter.  The date of the encounter would have been represented in a separate section outside of this example.

### Custodian

* May Terry (GitHub: mayterry88)

### Keywords

* medication, chemo, IV, realtive dosing

### Permalink

* [http://cdasearch.hl7.org/examples/view/5ac26c0e0e797a000bb5d3be](http://cdasearch.hl7.org/examples/view/5ac26c0e0e797a000bb5d3be)
