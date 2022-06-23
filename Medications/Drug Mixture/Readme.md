## Approval Status 

* Approval Status: Approved
* Example Task Force: 2022-06-23
* SDWG: Pending

### C-CDA 2.1 Example:

* Medications Section: 2.16.840.1.113883.10.20.22.2.1.1:2014-06-09
* Medication Activity: 2.16.840.1.113883.10.20.22.4.16:2014-06-09
* Medication Information: 2.16.840.1.113883.10.20.22.4.23:2014-06-09

### Reference to full CDA sample:
* Medications in empty CCD

### Validation location

* [SITE](https://site.healthit.gov/sandbox-ccda/ccda-validator)


### Comments

* This is an example of a mixture of three or more different drug ingredients, each with a different relative concentration.
* Note the use of the urn:ihe:pharm:medication namespace, which is required by the UV Medication Information (detail) template.
  The CDA schema doesn't recognize content from this namespace and so flags it as invalid by default, although extension content from other namespaces
  is allowed in CDA even when not recognized by the schema (see 1.4 CDA Extensibility).

### Custodian

* Matt Szczepankiewicz, mszczepa@epic.com (GitHub: mjszczep)

### Keywords

* drug mixture



### Permalink 

* ???
