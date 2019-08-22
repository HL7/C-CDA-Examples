<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xd="http://www.oxygenxml.com/ns/doc/xsl"
    xmlns:hl7="urn:hl7-org:v3"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xhtml="http://www.w3.org/1999/xhtml"
    xmlns:exslt="http://exslt.org/common"
    xmlns:sdtc="urn:hl7-org:sdtc"
    xmlns="http://www.w3.org/1999/xhtml"
    exclude-result-prefixes="xd hl7 xsi xhtml exslt sdtc">
    <xd:doc scope="stylesheet">
        <xd:desc>
            <xd:p><xd:b>Title:</xd:b> CDA R2 StyleSheet</xd:p>
            <xd:p><xd:b>Version:</xd:b> 4.0.2 beta 1</xd:p>
            <xd:p><xd:b>Maintained by:</xd:b> HL7 <xd:a href="https://confluence.hl7.org/display/SD/Structured+Documents">Structured Documents Work Group</xd:a></xd:p>
            <xd:p><xd:b>Purpose:</xd:b> Provide general purpose display of CDA release 2 (Specification: ANSI/HL7 CDAR2) and CDA release 3 (Specification: currently in ballot) documents, and be a starting point for people interested in extending the display. This stylesheet displays all section content, but does not try to render each and every header attribute. For header attributes it tries to be smart in displaying essentials, which is still a lot. </xd:p>
            <xd:p><xd:b>License:</xd:b> Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at <a href="http://www.apache.org/licenses/LICENSE-2.0">http://www.apache.org/licenses/LICENSE-2.0</a></xd:p>
            <xd:p><xd:b>Download link:</xd:b> <xd:a href="https://gforge.hl7.org/gf/project/strucdoc/frs/?action=FrsReleaseBrowse&amp;frs_package_id=239">https://gforge.hl7.org/gf/project/strucdoc/frs/?action=FrsReleaseBrowse&amp;frs_package_id=239</xd:a> (soon...)</xd:p>
            <xd:p><xd:b>Documentation/manual:</xd:b> <xd:a href="https://confluence.hl7.org/display/SD/CDA+R2+Stylesheet">https://confluence.hl7.org/display/SD/CDA+R2+Stylesheet</xd:a></xd:p>
            <xd:p><xd:b>History:</xd:b> This stylesheet stands on the shoulders of giants. The stylesheet is the cumulative work of several developers; the most significant prior milestones were the foundation work from HL7 Germany and Finland (Tyylitiedosto) and HL7 US (Calvin Beebe), and the presentation approach from Tony Schaller, medshare GmbH provided at IHIC 2009. The stylesheet has subsequently been maintained/updated by Lantana Group (US) and Nictiz (NL).</xd:p>
            <xd:p><xd:b>TODO</xd:b>
                <xd:ul>
                    <!--<xd:li>Remove any temporary cruft from the CDAr3 ballot that does not make it into the final version</xd:li>-->
                    <xd:li>Fix for Mobile Safari (iOS 6): doesn't support opening the table of contents</xd:li>
                    <xd:li>Check additional structural vocabulary for CDA 2.1 (RIM 2.35) - NullFlavors already done</xd:li>
                    <xd:li>Fix a problem where the footer div will not be rendered by browsers when an iframe exists (pdf usually)</xd:li>
                </xd:ul>
            </xd:p>
            <xd:p><xd:b>Revisions</xd:b>
                <xd:ul>
                    <xd:li>
                        <xd:b>06/19/2019, AH, v4.0.2 beta 1</xd:b>
                        <xd:ul>
                            <xd:li>Circumvention for a warning from XSL 1.0 processors: "Non-text output nodes are ignored when writing an attribute, comment or PI."</xd:li>
                            <xd:li>Added support for (legal) authenticator sdtc:signatureText. This renders a small signature icon with mouse over text that reads that a signature is present, but that this signature has not been verified. If a thumbnail is present is will trail that title.</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>01/17/2019 AH, v4.0.1</xd:b>
                        <xd:p>Approved all changes in beta 1 and beta 2 as-is except for the addition of IHE PCC MCV. The StrucDoc WG feels that this addition needs some more thought before a decision on re-adding it can be made.</xd:p>
                        <xd:ul>
                            <xd:li>Added support for patient/languageCommunication</xd:li>
                            <xd:li>Added support for patientRole/providerOrganization</xd:li>
                            <xd:li>Added support for informationRecipient/intendedRecipient/receivedOrganization</xd:li>
                            <xd:li>Updated rendering of nonXMLBody and observationMedia to check for Base64 content before checking text/plain. This fixes support for Base64 encoded text/plain.</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>01/14/2019 AH, v4.0.1 beta 2</xd:b>
                        <xd:ul>
                            <xd:li>As requested per <xd:a href="https://gforge.hl7.org/gf/project/strucdoc/tracker/?action=TrackerItemEdit&amp;tracker_item_id=20000">GForge#20000</xd:a>, added support for <xd:a href="https://www.ihe.net/uploadedFiles/Documents/PCC/IHE_PCC_Suppl_MCV.pdf">IHE PCC MCV, Revision 1.2, Trial Implementation, November 2, 2018</xd:a>. Implementation coverage is based on AllScripts stylesheet implementation (license Apache License, Version 2.0): <table>
                                    <caption>Table 5.1.X-1: styleCode</caption>
                                    <thead>
                                        <tr>
                                            <th>Covered?</th>
                                            <th>styleCode</th>
                                            <th>Description</th>
                                            <th>Suggested Rendering (Hints)</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>No. TODO? How?</td>
                                            <td>xEmptySection</td>
                                            <td>Section is empty</td>
                                            <td>When showing other than complete content, do something special to show that the entire section is empty. See Section 3.1.5.3.1 for an example. </td>
                                        </tr>
                                        <tr>
                                            <td>No. TODO? How?</td>
                                            <td>xHistoric</td>
                                            <td>Content is Historic When showing content that was assessed, these data should be hidden. See Section 3.1.5.3.2 for an example. </td>
                                        </tr>
                                        <tr>
                                            <td>No. TODO? How?</td>
                                            <td>xAssessed</td>
                                            <td>Content Assessed/Discussed this visit</td>
                                            <td>When showing content that was assessed, these data shall be shown. See Section 3.1.5.3.2 for an example. </td>
                                        </tr>
                                        <tr>
                                            <td>No. TODO? How?</td>
                                            <td>xDetail</td>
                                            <td>Extra Detail – not necessarily for Patients</td>
                                            <td>When showing patient related views, this content may be omitted. See Section 3.1.5.3.3 for an example. </td>
                                        </tr>
                                        <tr>
                                            <td>No. TODO? How?</td>
                                            <td>xDate</td>
                                            <td>Content is a Date</td>
                                            <td>Show as a date. </td>
                                        </tr>
                                        <tr>
                                            <td>No. TODO? How?</td>
                                            <td>xDateTime</td>
                                            <td>Content is a Date with Time</td>
                                            <td>Show as a date with time. </td>
                                        </tr>
                                        <tr>
                                            <td>No. TODO? How?</td>
                                            <td>xCode</td>
                                            <td>Content is a code from some code system.</td>
                                            <td>Show as a code. </td>
                                        </tr>
                                        <tr>
                                            <td>No. TODO? How?</td>
                                            <td>xPhone</td>
                                            <td>Content is a telephone number</td>
                                            <td>Show as a phone number. </td>
                                        </tr>
                                        <tr>
                                            <td>No. TODO? How?</td>
                                            <td>xEmail</td>
                                            <td>Content is an email address</td>
                                            <td>Show as an email address. </td>
                                        </tr>
                                        <tr>
                                            <td>No. TODO? How?</td>
                                            <td>xAddress</td>
                                            <td>Content is a Street Address</td>
                                            <td>Shows an address. </td>
                                        </tr>
                                        <tr>
                                            <td>No. TODO? How?</td>
                                            <td>xPersonName</td>
                                            <td>Content is a person name</td>
                                            <td>Show as the name of a person. </td>
                                        </tr>
                                        <tr>
                                            <td>No. TODO? How?</td>
                                            <td>xIdentifier</td>
                                            <td>Content is an identifier</td>
                                            <td>Show as an identifier. </td>
                                        </tr>
                                        <tr>
                                            <td>Yes. Rendered with red font color</td>
                                            <td>xAlert</td>
                                            <td>The content contains information of importance that needs to be used to alert the reader, for example level of severity considered life threatening.</td>
                                            <td>Show in some manner to indicate an Alert. </td>
                                        </tr>
                                        <tr>
                                            <td>Yes. Rendered with red font color</td>
                                            <td>xAbnormal</td>
                                            <td>The content contains information that may be considered to be not within what are considered to be normal values.</td>
                                            <td>Show in some manner to indicate a value that is not normal. </td>
                                        </tr>
                                        <tr>
                                            <td>No. TODO? How? Just display:none or with javascript for unhide?</td>
                                            <td>xHidden</td>
                                            <td>Content may typically be repetitive and unnecessary to display.</td>
                                            <td>Hide the content. </td>
                                        </tr>
                                        <tr>
                                            <td>Yes. Rendered in italics</td>
                                            <td>xLabel</td>
                                            <td>The content is a label of some data, e.g., Refills:</td>
                                            <td>Show content as a label. </td>
                                        </tr>
                                        <tr>
                                            <td>Yes. No specifics</td>
                                            <td>xValue</td>
                                            <td>The content contains a data that is a value, e.g., 98.6</td>
                                            <td>Show content as a clinical item status value. </td>
                                        </tr>
                                        <tr>
                                            <td>Yes. No specifics</td>
                                            <td>xReaction</td>
                                            <td>The content represents text about a reaction.</td>
                                            <td>Show content as a reaction. </td>
                                        </tr>
                                        <tr>
                                            <td>Yes. No specifics</td>
                                            <td>xComment</td>
                                            <td>The content is comment text.</td>
                                            <td>Show as a comment. </td>
                                        </tr>
                                        <tr>
                                            <td>Yes. text-align: center</td>
                                            <td>xCenter</td>
                                            <td>Text to be centered</td>
                                            <td>Alignment should be centered. </td>
                                        </tr>
                                        <tr>
                                            <td>Yes. text-align: right</td>
                                            <td>xRight</td>
                                            <td>Text to be right justified</td>
                                            <td>Alignment should be right. </td>
                                        </tr>
                                        <tr>
                                            <td>Yes. text-align:left</td>
                                            <td>xLeft</td>
                                            <td>Text to be left justified</td>
                                            <td>Alignment should be left. </td>
                                        </tr>
                                        <tr>
                                            <td>Yes. font-family: monospace</td>
                                            <td>xMono</td>
                                            <td>Text to be output in a monospace font</td>
                                            <td>Render in a monospace font. </td>
                                        </tr>
                                        <tr>
                                            <td>Yes. background-color: yellow; color: black;</td>
                                            <td>xHighlight</td>
                                            <td>Text to be highlighted</td>
                                            <td>Render with highlight. </td>
                                        </tr>
                                        <tr>
                                            <td>Yes. render an hr element</td>
                                            <td>xHR</td>
                                            <td>A horizontal line is to be drawn</td>
                                            <td>Render a horizontal line. </td>
                                        </tr>
                                        <tr>
                                            <td>Yes</td>
                                            <td>xRowNormal</td>
                                            <td>For example, to indicate an odd numbered row of a table.</td>
                                            <td>Render table row as normal. </td>
                                        </tr>
                                        <tr>
                                            <td>Yes</td>
                                            <td>xRowAlt</td>
                                            <td>For example, to indicate an even numbered row of a table.</td>
                                            <td>Render table row as alternate. </td>
                                        </tr>
                                        <tr>
                                            <td>Yes</td>
                                            <td>xIndent</td>
                                            <td>Render content indented.</td>
                                            <td> </td>
                                        </tr>
                                        <tr>
                                            <td>Yes</td>
                                            <td>xSecondary</td>
                                            <td>This content is of secondary importance.</td>
                                            <td>Render in some manner to indicate this content is of secondary importance, for example in a lighter font color. </td>
                                        </tr>
                                        <tr>
                                            <td>Yes</td>
                                            <td>xRowGroup</td>
                                            <td>This is used on table rows to show that children and parent objects are related</td>
                                            <td>Keep lines from appearing between child objects and their parents in a table together </td>
                                        </tr>
                                        <tr>
                                            <td>Yes</td>
                                            <td>xContentWrapping</td>
                                            <td>This is used to keep the text in the first column from wrapping under the bullets that appear for child objects inside of a table</td>
                                            <td>Prevent text from wrapping under child objects</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </xd:li>
                            <xd:li>Added support for patient/languageCommunication</xd:li>
                            <xd:li>Added support for patientRole/providerOrganization</xd:li>
                            <xd:li>Added support for informationRecipient/intendedRecipient/receivedOrganization</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>11/13/2018 AH, v4.0.1 beta 1</xd:b> 
                        Updated rendering of nonXMLBody and observationMedia to check for Base64 content before checking text/plain. This fixes support for Base64 encoded text/plain.
                    </xd:li>
                    <xd:li>
                        <xd:b>10/02/2018 AH, v4.0.0</xd:b> 
                        Administrative rename to final product after StrucDoc committee approval
                    </xd:li>
                    <xd:li>
                        <xd:b>09/26/2018 AH, v4.0.0 beta 8</xd:b>
                        <xd:ul>
                            <xd:li>Fixed an issue that for certain ids would cause a warning "Non-text output nodes are ignored when writing an attribute, comment, or PI" and/or "Cannot write an attribute node when no element start tag is open"</xd:li>
                            <xd:li>Fixed an issue for caption elements under anything but a table, e.g. a list, where the text content would be duplicated</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>08/31/2018 AH, v4.0.0 beta 7</xd:b>
                        <xd:ul>
                            <xd:li>Consistency update. Changed all US English label names to use Camel Casing</xd:li>
                            <xd:li>Added OID labels for SNOMED CT, ICD-10-NL, ICD-10-DE, ICD-10-CM</xd:li>
                            <xd:li>Added support for originalText and translation rendering on coded elements, regardless of nullFlavor status</xd:li>
                            <xd:li>Fixed a bug that would occur when AD.useablePeriod exists and added rendering support when it does</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>08/27/2018 AH, v4.0.0 beta 6</xd:b>
                        <xd:ul>
                            <xd:li>Improved rendering of empty (sub)sections</xd:li>
                            <xd:li>Added various more OID translations like the NHS Number</xd:li>
                            <xd:li>Extended the l10.xsd to include an enumeration for language, and made attributes required</xd:li>
                            <xd:li>Fixed all uppercase language codes in l10n file</xd:li>
                            <xd:li>Improved rendering of confidentialityCode in the title when the code is not from x_BasicConfidentialityKind</xd:li>
                            <xd:li>Removed illegal css instruction "float: top;" on documentheader, documentbody and documentfooter</xd:li>
                            <xd:li>Hide expand/collapse triangle for sections upon print</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>08/16/2018 AH, v4.0.0 beta 5</xd:b>
                        <xd:ul>
                            <xd:li>Added support to switch <xd:ref name="sectionNumbering" type="parameter">sectionNumbering</xd:ref> on or off (default)</xd:li>
                            <xd:li>Added support for collapsing/expanding all or selected (sub) sections</xd:li>
                            <xd:li>Fix for empty elements causing XHTML grief</xd:li>
                            <xd:li>Improved rendered warning for potential malicious contents</xd:li>
                            <xd:li>Improved rendering of inFulFillment</xd:li>
                            <xd:li>Improved rendering of names by eliminating leading/trailing spaces, and by rendering only the first name in the header. All names are in the footer.</xd:li>
                            <xd:li>Improved rendering of addresses by pulling buildingNumberSuffix into the address line</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>08/05/2018 AH, v4.0.0 beta 4</xd:b>
                        <xd:ul>
                            <xd:li>Added support to <xd:ref name="mask-ids" type="parameter">mask</xd:ref> or <xd:ref name="skip-ids" type="parameter">skip</xd:ref> patient ids based on a comma separated list of @root values. Masking will cause xxx-xxx-xxx to appear with a mouse over that states "masked"</xd:li>
                            <xd:li>Now renders subsection almost the same way as top level sections including any overriding authors/informants/subjects, section numbering. The difference lies in increasing left indenting for every subsection</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>06/19/2018 AH, v4.0.0 beta 3</xd:b>
                        <xd:ul>
                            <xd:li>Fixed a bug in rendering ClinicalDocument/confidentialityCode causing it not to get rendered</xd:li>
                            <xd:li>Based on physician feedback: header labels are now all bold (was normal), header values are now all normal (was italic). This leads to more focus on what's important</xd:li>
                            <xd:li>Based on physician feedback: Patient-IDs now all go on a new line when the view becomes too small to be on one line (was: line wrapped). This is always true for print</xd:li>
                            <xd:li>Based on physician feedback: More space between Patient header parts</xd:li>
                            <xd:li>Based on physician feedback: Updated encounter/code label from "Code" to "Type" as it caused confusion</xd:li>
                            <xd:li>Smarter interval of time rendering: when both low/high are on the same date, renders date only once, so "January 12, 2018 10AM -0500 - 11PM -0500" instead of "from January 12, 2018 10AM -0500 to January 12, 2018 11PM -0500"</xd:li>
                            <xd:li>Now renders id/@assigningAuthorityName as title on an id. This was not rendered at all before. May need better solutions for that info in future update</xd:li>
                            <xd:li>Smart rendering of addresses. Now skips rendering of streetName, houseNumber, houseNumberNumeric when there is a streetAddressLine. Now renders postalCode next to city (leading/trailing depending on CDA order)</xd:li>
                            <xd:li>Fixed rendering issue in outlining of authenticator and legalAuthenticator in the footer</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>05/23/2018 AH, v4.0.0 beta 2</xd:b>
                        <xd:ul>
                            <xd:li>Rerouted rendering of narrative block renderMultiMedia to rendering of nonXMLBody so there's now one block of logic and security checks on that. At the same time this extends the support for types of renderMultiMedia as originally only gif and jpeg were supported. At least some ELGA examples now render their PDF contents correctly.</xd:li>
                            <xd:li>Fixed rendering of caption elements when not under a table</xd:li>
                            <xd:li>Fixed duplicate rendering of ids for footnotes</xd:li>
                            <xd:li>Updated all @name based anchors to @id based anchors for xhtml alignment</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>05/09/2018 AH, v4.0.0 beta 1</xd:b>
                        <xd:ul>
                            <xd:li>Updates to the color scheme and a few other visual aids for accessibility alignment with <xd:a href="http://www.afb.org/info/programs-and-services/public-policy-center/technology-and-information-accessibility/section-508-key-links/1235">American Foundation for the Blind Section 508</xd:a></xd:li>
                            <xd:li>Added new parameters for color: <xd:ref name="bgcolor-th" type="parameter">bgcolor-th</xd:ref> and <xd:ref name="bgcolor-td" type="parameter">bgcolor-td</xd:ref></xd:li>
                            <xd:li>Added new parameters for skipping the rendering of the CDA header info at the top of the document (<xd:ref name="dohtmlheader" type="parameter">dohtmlheader</xd:ref>) and/or footer (<xd:ref name="dohtmlfooter" type="parameter">dohtmlfooter</xd:ref>)</xd:li>
                            <xd:li>Fix for visibility in the TOC of empty sections as specified by the StrucDoc WG with section/@nullFlavor</xd:li>
                            <xd:li>Fix in documentationOf: don't render @classCode if ACT as that doesn't hold information, and improved serviceEvent/performer contact detail rendering</xd:li>
                            <xd:li>Fix for missing space in rendering of time intervals</xd:li>
                            <xd:li>Update localization function for the compressed l10n structure</xd:li>
                            <xd:li>Update menu behavior. Now only expands sublevels (if any) when hovering the parent</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>04/11/2018 Alexander Henket</xd:b>
                        <xd:ul>
                            <xd:li>Updated rendering of documentationOf/serviceEvent/@classCode so it does not render if it is 'ACT'</xd:li>
                            <xd:li>Fixed a bug in rendering documentationOf/serviceEvent/code (it was inadvertently not rendered)</xd:li>
                            <xd:li>Added rendering of documentationOf/serviceEvent/performer name in the document header</xd:li>
                            <xd:li>Added rendering of documentationOf/serviceEvent/performer contact details in the document footer</xd:li>
                            <xd:li>Fixed l10n for keys typeCode-PRP, typeCode-PPRP and typeCode-SPRP. Each last P should have been an F.</xd:li>
                            <xd:li>Little tweak to author to avoid rendering of additional commas when certain content is missing</xd:li>
                            <xd:li>Skip timestamp seconds when they are 00. Skip minutes and seconds when they are 00:00. Both for readability.</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>03/24/2018 Alexander Henket</xd:b>
                        <xd:ul>
                            <xd:li>Added parameter menu-depth with min 1, max 3, default 1 (the way it always has been) -- temporarily left on 3 for browser testing</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>02/16/2018 Alexander Henket</xd:b>
                        <xd:ul>
                            <xd:li>Moved header authenticator so it is right above legalAuthenticator instead of just under participant</xd:li>
                            <xd:li>Improved readability. Moved contact details for all header participants (recordTarget, author, informant, authenticator, legalAuthenticator, ...) to the right instead of underneath the participant name.</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>02/15/2018 Alexander Henket</xd:b>
                        <xd:ul>
                            <xd:li>Fixed rendering of serviceEvent/code, location/healthCareFacility/id, order/code, order/priorityCode, consent/code, consent/statusCode</xd:li>
                            <xd:li>Fixed casing of "inFulfillmentOf" and added call to it under documentationOf (GForge#3169)</xd:li>
                            <xd:li>Render recordTarget regardless of nullFlavor in id. (GForge#3590)</xd:li>
                            <xd:li>Added support for encompassingEncounter dischargeDispositionCode, sdtc:admissionReferralSourceCode, encounterParticipant</xd:li>
                            <xd:li>Added support for ClinicalDocument/versionNumber, ClinicalDocument/setId, and relatedDocument (it was not called)</xd:li>
                            <xd:li>(CDA R2.1) Added support for hl7:admissionReferralSourceCode</xd:li>
                            <xd:li>(CDA R2.1) Added support for Person/desc as div under name</xd:li>
                            <xd:li>(CDA R2.1) Added support for Person/birthTime</xd:li>
                            <xd:li>(CDA R2.1) Added support for relatedDocument/@inversionInd</xd:li>
                            <xd:li>(CDA R2.1) Added support for serviceEvent/statusCode</xd:li>
                            <xd:li>(CDA R2.1) Added support for section subject/relatedSubject/subject/birthTime | deceasedTime | deceasedInd | multipleBirthInd | multipleBirthOrderNumber | raceCode | ehtnicGroupCode</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>12/15/2017 Alexander Henket</xd:b>
                        <xd:ul>
                            <xd:li>Reimplemented security fix from Rick Geimer, Lantana, that does full checking on narrative table components</xd:li>
                            <xd:li>Fixed capitals in iframe properties WIDTH and HEIGHT</xd:li>
                            <xd:li>Added support for looking up an author organization name based on orgsanization id</xd:li>
                            <xd:li>Fixed getting the relatedDocument/parentDocument/id</xd:li>
                            <xd:li>Enhanced rendering of date/time. Now renders with AM/PM in English and with h or u on 24h clock otherwise if at least hours are present.</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>10/20/2014 Alexander Henket</xd:b>
                        <xd:ul>
                            <xd:li>Fixed support for recordTarget/patient extensions deceasedInd/deceasedTime and multipleBirthInd/multipleBirthOrderNumber. They were inadvertently called in the HL7 namespace.</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>10/13/2014 Alexander Henket</xd:b>
                        <xd:ul>
                            <xd:li>Fixed @ID by adding it to whatever in scope element (div, sup, sub, a, etc.) as @id. To this end the separate calls were replaced by a central call in mode 'handleSectionTextAttributes'.</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>10/02/2014 Alexander Henket</xd:b>
                        <xd:ul>
                            <xd:li>Fixed linkHtml support as it was calling the wrong named template and thus would not render at all.</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>08/28/2014 Alexander Henket</xd:b>
                        <xd:ul>
                            <xd:li>Adjusted time zone in <xd:ref name="formatDateTime" type="template">formatDateTime</xd:ref> representation so it just displays as-is when available. The number2name conversion, e.g. PST or CET, would fail part of the year due to daylight savings</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>17/04/2014 Alexander Henket</xd:b>
                        <xd:ul>
                            <xd:li>Implemented mitigation for the <a href="http://smartplatforms.org/2014/04/security-vulnerabilities-in-ccda-display/">security risk</a> in rendering iframes for an arbritrary reference/@value based on work done in <a href="http://gforge.hl7.org/gf/project/strucdoc/frs/">SampleCDAStyleSheet v3.0.0</a></xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>09/04/2014 Alexander Henket</xd:b>
                        <xd:ul>
                            <xd:li>Implemented minimal mitigation for the <a href="http://smartplatforms.org/2014/04/security-vulnerabilities-in-ccda-display/">security risk</a> in rendering iframes for an arbritrary reference/@value</xd:li>
                            <xd:li>Note that this cda.xsl does not copy arbritrary attributes from section text. The noted risk on calling external images thereby sending HTTP Referer URL is <xd:b>not</xd:b> mitigated</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>05/30/2013 Alexander Henket</xd:b>
                        <xd:ul>
                            <xd:li>Made parameters out of font-family and font-sizes for the main font, h1-h6, and footers</xd:li>
                            <xd:li>Font-sizes are now all in points rather than pixels and points so more reliable in rendering</xd:li>
                            <xd:li>Fixed <xd:ref name="getLocalizedString" type="template">getLocalizedString</xd:ref> so it now does a lowercase comparison of the language</xd:li>
                            <xd:li>Fixed <xd:ref name="getLocalizedString" type="template">getLocalizedString</xd:ref> for language only situations (without region)</xd:li>
                            <xd:li>Added German translations for Table of Contents and Show/Hide revisions</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>05/29/2013 Alexander Henket</xd:b>
                        <xd:ul>
                            <xd:li>Internet Explorer update: disabled the use of <xd:ref name="textEncoding" type="parameter">textEncoding</xd:ref>, otherwise it would not render</xd:li>
                            <xd:li>Fixed font-size problem for Internet Explorer 8 - it doesn't inherit size in td tags</xd:li>
                            <xd:li>Fixed table of contents problem for Internet Explorer 8 - wouldn't open</xd:li>
                            <xd:li>Fixed #documentfooter style</xd:li>
                            <xd:li>Pulled bgcolor in the header and footer part into CSS so it may be overridden</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>05/28/2013 Alexander Henket</xd:b>
                        <xd:ul>
                            <xd:li>Redesigned the setup. Now has three main divs. <xd:ul>
                                    <xd:li>#documentheader contains basic Patient and Author info</xd:li>
                                    <xd:li>#documentbody contains section content</xd:li>
                                    <xd:li>#documentfooter contains all relevant CDA header info</xd:li>
                                </xd:ul></xd:li>
                            <xd:li>Updated for CDA release 3 as of Ballot May 2013. Includes datatypes awareness in alle relevant places This update is largely about feature parity</xd:li>
                            <xd:li>Added &lt;oXygen/&gt; style documentation tags to facilitate HTML documentation</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>05/22/2013 Alexander Henket</xd:b>
                        <xd:ul>
                            <xd:li>Added parameter for external css if so desired</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>06/28/2011 Alexander Henket</xd:b>
                        <xd:ul>
                            <xd:li>Improved show-id by diplaying nullFlavor where applicable</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>05/31/2011 Alexander Henket</xd:b>
                        <xd:ul>
                            <xd:li>Improved show-code to return translated codes, and finally the original code if originalText and @displayName fail</xd:li>
                            <xd:li>Improved label on bottom participant to include translated assignedEntity/code if available</xd:li>
                            <xd:li>Improved readability of participant/assignedEntity</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>05/30/2011 Alexander Henket</xd:b>
                        <xd:ul>
                            <xd:li>Participant codes are now displayed by default instead of only when the name is omitted</xd:li>
                            <xd:li>Fixed translation of patientIdLong, by using the literal string instead treating it as a node</xd:li>
                            <xd:li>Improved title on ids in fixed top header by adding a newline between multiple ids</xd:li>
                            <xd:li>Changed behavior of "Waarschuwingen" and "Behandelaanwijzigingen" to display "Er zijn geen ..." if they are not applicable, instead of showing nothing</xd:li>
                            <xd:li>Changed "Behandelaanwijzingen into "Behandelrestricties"</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:b>05/03/2011 Alexander Henket</xd:b>
                        <xd:ul>
                            <xd:li>Added language file and a template getLocalizedString to deal with it</xd:li>
                            <xd:li>Added parameter textLang to feed the desired language. Does not work with just a browser, so textLang needs to be set in any environment</xd:li>
                            <xd:li>Replaced all current text in the stylesheet with calls to getLocalizedString</xd:li>
                            <xd:li>Improved layout of page so there's now a fixed header. Shrunk the TOC into a button with hover to open so it doesn't always take up all screen space. The layout is enforced using div with an id To avoid lots of scrolling in the header area this part needed to be predictable and small. All header info except recordTarget is now to the bottom of the document Also the document title was made less big</xd:li>
                            <xd:li>Added support for every styleCode in CDA release 2, not just bold/italics/underline, but also all list styles and e.g. Botrule</xd:li>
                            <xd:li>Added support for footnotes/footnoteRefs</xd:li>
                            <xd:li>Added support for multiple section authors (used to be just one, and support was bugged)</xd:li>
                            <xd:li>Added support for (multiple) section informants</xd:li>
                            <xd:li>Added support for section subject</xd:li>
                            <xd:li>Added support for @ID, @IDREF, @language, and all other style properties from CDA release 2</xd:li>
                            <xd:li>Added support for the display of nonXMLBody with text/plain content</xd:li>
                            <xd:li>Added support for Narrative block &lt;linkHtml/&gt;</xd:li>
                            <xd:li>Added support for revisions. Deletions will get a strikethrough, Insertions an underline and overline Both get a title saying 'delete' or 'insert'. This feature is off by default, but above the TOC there's a toggle to switch revisions marks on or off. A little Javascript was used for that.</xd:li>
                            <xd:li>Added confidentiality to the title of the document if present and other than N (Normal). If someone took the effort to send the confidentiality it should be 'in your face' as recipient.</xd:li>
                            <xd:li>Added support for multiple section authors (used to be just one, and support was bugged)</xd:li>
                            <xd:li>Added support for (multiple) section informants</xd:li>
                            <xd:li>Added support for section subject</xd:li>
                            <xd:li>Added a switch to diable Javascript in case the environment requires that</xd:li>
                            <xd:li>Improved support for data type II when there's only a root and no extension</xd:li>
                            <xd:li>Improved support for the author organization which not displayed</xd:li>
                            <xd:li>Improved support for telecom and addr use codes. Now supports multiples</xd:li>
                            <xd:li>Improved support for names. Now gets out every node, supporting mixed mode too.</xd:li>
                            <xd:li>Improved readability for the support for lists by combining the two templates</xd:li>
                            <xd:li>Improved support for observationMedia by removing the limitation of just gif and jpeg. If the browser does not support a given type, then at least a question mark is displayed. Before there was nothing</xd:li>
                            <xd:li>Improved support for observationMedia by adding the id (if available) to the alt and title of the image</xd:li>
                            <xd:li>Added support for inline base64 images. HTML actually can deal with that too</xd:li>
                            <xd:li>Improved handling of addresses so it now walks through all nodes, support mixed content. Also, the elements are now handled in the order of the instance and not just US order</xd:li>
                            <xd:li>Improved support for dates by including a language switch. Now just handles en-US and nl-NL, but could handle more Likely more sophisticated support is in order, but this works for our purposes while leaving US conventions intact</xd:li>
                            <xd:li>Improved handling of names, addresses and telecom. The templates gave incorrect results for multiples of these, mixing the contents of the latter with the first. Added name use code to the display of names if available.</xd:li>
                            <xd:li>Fixed the author string in the main document info. It used to '-', but is now "Author" in any supported language</xd:li>
                        </xd:ul>
                    </xd:li>
                    <xd:li>
                        <xd:pre>---------------------------------------------------</xd:pre>
                        <xd:p>Below is here the list of changes in the versions of the stylesheet up to version 3.1.1. This version of the stylesheet implements all changes done up to version 3.1.1.</xd:p>
                        <xd:pre>---------------------------------------------------</xd:pre>
                    </xd:li>
                    <xd:li>
                        <xd:b>05/14/2018 Alexander Henket</xd:b> Better use of variables (GForge#15683)</xd:li>
                    <xd:li>
                        <xd:b>02/15/2018 Alexander Henket</xd:b> Render recordTarget regardless of nullFlavor in id. Updated rendering of ids with nullFlavors (GForge#3590)</xd:li>
                    <xd:li>
                        <xd:b>02/15/2018 Alexander Henket</xd:b> Minor formatting fix to table/caption and ul captions. (GForge#3185)</xd:li>
                    <xd:li>
                        <xd:b>02/15/2018 Alexander Henket</xd:b> Fixed casing of "inFulfillmentOf" and added call to it under documentationOf (GForge#3169)</xd:li>
                    <xd:li>
                        <xd:b>09/19/2016 Rick Geimer</xd:b> Fixed some iframe issues (attribute typos). Added datauri support for nonXMLBody docs with B64 PDFs (does not work in IE or Edge as of this time, but does work in Chrome and FireFox).</xd:li>
                    <xd:li>
                        <xd:b>11/12/2014 Rick Geimer</xd:b> Minor formatting fix to authenticator. </xd:li>
                    <xd:li>
                        <xd:b>04/13/2014 Rick Geimer</xd:b> more security fixes. Added sandbox attribute to iframe. Added td to the list of elements with restricted table attributes (missed that one previously). Fixed some typos. Cleaned up CSS styles. Merged the table templates since they all use the same code. Fixed a bug with styleCode processing that could result in lost data. Added external-image-whitelist param.</xd:li>
                    <xd:li>
                        <xd:b>04/07/2014 Rick Geimer</xd:b> more security fixes. Limited copy of only legal CDA table attributes to XHTML output.</xd:li>
                    <xd:li>
                        <xd:b>04/07/2014 Rick Geimer</xd:b> more security fixes. Fixed some bugs from the hot fix on 4/6 ($uc and $lc swapped during some translates). Added limit-external-images param that defaults to yes. When set to yes, no URIs with colons (protocol URLs) or beginning with double slashes (protocol relative URLs) are allowed in observation media. I'll revise later to add a whitelist capability.</xd:li>
                    <xd:li>
                        <xd:b>04/06/2014 Rick Geimer</xd:b> security hot fixes: Addressed javascript in nonXMLBody/text/reference/@value and non-sanitized copy of all table attributes.</xd:li>
                    <xd:li>
                        <xd:b>01/05/2011 Jingdong Li</xd:b> updated.</xd:li>
                    <xd:li>
                        <xd:b>09/17/2010 Jingdong Li</xd:b> updated.</xd:li>
                    <xd:li>
                        <xd:b>08/25/2010 Jingdong Li</xd:b> updated.</xd:li>
                    <xd:li>
                        <xd:b>03/30/2010 Jingdong Li</xd:b> updated.</xd:li>
                    <xd:li>
                        <xd:b>12/11/2009 Kai Heitmann</xd:b> updated.</xd:li>
                    <xd:li>
                        <xd:b>08/12/2008 Jingdong Li</xd:b> updated.</xd:li>
                </xd:ul>
            </xd:p>
        </xd:desc>
    </xd:doc>
    
    <xd:doc>
        <xd:desc>
            <xd:p>XSLT 1.0 does not have date function, so we need something to compare against e.g. to get someones age</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="currentDate" select="(/hl7:ClinicalDocument/hl7:effectiveTime/@value)[1]"/>

    <xd:doc>
        <xd:desc>
            <xd:p>Vocabulary file containing language dependant strings such as labels</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="vocFile" select="'cda_l10n.xml'"/>

    <xd:doc>
        <xd:desc>
            <xd:p>Cache language dependant strings</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:variable name="vocMessages" select="document($vocFile)"/>

    <xd:doc>
        <xd:desc>
            <xd:p>Default language for retrieval of language dependant strings such as labels, e.g. 'en-US'. This is the fallback language in case the string is not available in the actual language. See also <xd:ref name="textLang" type="parameter">textLang</xd:ref>.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="textlangDefault" select="'en-US'"/>

    <xd:doc>
        <xd:desc>
            <xd:p>Actual language for retrieval of language dependant strings such as labels, e.g. 'en-US'. Unless supplied, this is taken from the ClinicalDocument/language/@code attribute, or in case that is not present from <xd:ref name="textlangDefault" type="parameter">textlangDefault</xd:ref>.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="textLang">
        <xsl:choose>
            <xsl:when test="/hl7:ClinicalDocument/hl7:languageCode/@code">
                <xsl:value-of select="/hl7:ClinicalDocument/hl7:languageCode/@code"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$textlangDefault"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:param>

    <xd:doc>
        <xd:desc>
            <xd:p>Currently unused. Unsupported by Internet Explorer. Text encoding to render the output in. Defaults to UTF-8 which is fine for most environments. Could change into more localized encodings such as cp-1252 (Windows Latin 1), iso-8859-1 (Latin 1), or shift-jis (Japanese Kanji table))</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="textEncoding" select="'utf-8'"/>

    <xd:doc>
        <xd:desc>
            <xd:p>Boolean value for whether the result document may contain JavaScript. Some environments forbid the use of JavaScript. Without JavaScript, certain more dynamic features may not work.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="useJavascript" select="'true'"/>

    <xd:doc>
        <xd:desc>
            <xd:p>Absolute or relative URI to an external Cascading Stylesheet (CSS) file that contains style attributes for custom markup, e.g. in the @styleCode attribute in Section.text</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="externalCss"/>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Determines the font family for the whole document unless overruled somewhere</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="font-family" select="'Verdana, Tahoma, sans-serif'"/>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Determines the font size for all text unless otherwise specified, and is the base value for other font sizes</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="font-size-main" select="'9pt'"/>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Determines the font size for text in the h1 tag, defaults to <xd:ref name="font-size-main" type="parameter">font-size-main</xd:ref> + 3</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="font-size-h1">
        <xsl:call-template name="raiseFontSize">
            <xsl:with-param name="with" select="3"/>
        </xsl:call-template>
    </xsl:param>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Determines the font size for text in the h2 tag, defaults to <xd:ref name="font-size-main" type="parameter">font-size-main</xd:ref> + 2</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="font-size-h2">
        <xsl:call-template name="raiseFontSize">
            <xsl:with-param name="with" select="2"/>
        </xsl:call-template>
    </xsl:param>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Determines the font size for text in the h3 tag, defaults to <xd:ref name="font-size-main" type="parameter">font-size-main</xd:ref> + 1</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="font-size-h3">
        <xsl:call-template name="raiseFontSize">
            <xsl:with-param name="with" select="1"/>
        </xsl:call-template>
    </xsl:param>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Determines the font size for text in the h4 tag, defaults to <xd:ref name="font-size-main" type="parameter">font-size-main</xd:ref></xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="font-size-h4" select="$font-size-main"/>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Determines the font size for text in the h5 tag, defaults to <xd:ref name="font-size-main" type="parameter">font-size-main</xd:ref></xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="font-size-h5" select="$font-size-main"/>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Determines the font size for text in the h6 tag, defaults to <xd:ref name="font-size-main" type="parameter">font-size-main</xd:ref></xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="font-size-h6" select="$font-size-main"/>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Determines the font size for footnote text, defaults to <xd:ref name="font-size-main" type="parameter">font-size-main</xd:ref> - 1</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="font-size-footnote">
        <xsl:call-template name="raiseFontSize">
            <xsl:with-param name="with" select="-1"/>
        </xsl:call-template>
    </xsl:param>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Determines the background-color, as any legal hex, rgb or named color, for header like table elements, e.g. th tags, defaults to "LightGrey".</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="bgcolor-th">LightGrey</xsl:param>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Determines the background-color, as any legal hex, rgb or named color, for body like table elements, e.g. td tags, defaults to "#f2f2f2".</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="bgcolor-td">#f2f2f2</xsl:param>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Determines if the document title and top level summary of header information (patient/guardian/author/encounter/documentationOf, inFulfillmentOf) should be rendered. Defaults to "true", any other value is interpreted as "do not render". Some systems may have a context around the rendering of the document that would make rendering the header superfluous. Note that the footer, which may be switched off separately contains everything that the header does and more.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="dohtmlheader">true</xsl:param>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Determines if the document footer containing a listing of everything in the CDA Header should be rendered. Defaults to "true", any other value is interpreted as "do not render". Some systems may have a context around the rendering of the document that would make rendering the footer superfluous, or just want to concentrate on document contents.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="dohtmlfooter">true</xsl:param>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Security parameter. May contain a vertical bar separated list of URI prefixes, such as "http://www.example.com|https://www.example.com". See parameter <xd:ref name="limit-external-images" type="parameter">limit-external-images</xd:ref> for more detail.</xd:p>
        </xd:desc>
    </xd:doc> 
    <xsl:param name="external-image-whitelist"/>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Security parameter. When set to 'yes' limits the URIs to images (if any) to locally attached images and/or images that are on the <xd:ref name="external-image-whitelist" type="parameter">external-image-whitelist</xd:ref>. When set to anything other than 'yes' also allows for arbitrary external images (e.g. through http:// or https://). Default value is 'yes' which is considered defensive against potential security risks that could stem from resources loaded from arbitrary source.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:param name="limit-external-images" select="'yes'"/>
    
    <xd:doc>
        <xd:desc>Determines depth of menu at the top of the document. Default is 1, which means just head section. Max is 3 which is head section + 2 levels (if any)</xd:desc>
    </xd:doc>
    <xsl:param name="menu-depth" select="3"/>
    
    <xd:doc>
        <xd:desc>Privacy parameter. Accepts a comma separated list of patient ID root values (normally OID's). When a patient ID is encountered with a root value in this list, then the rendering of the extension will be xxx-xxx-xxx regardless of what the actual value is. This is useful to prevent public display of for example the US SSN. Default is to render any ID as it occurs in the document. Note that this setting only affects human rendering and that it does not affect automated processing of the underlying document. If the same value also occurs in the <xd:ref name="skip-ids" type="parameter">skip-ids</xd:ref> list, then that takes precedence.</xd:desc>
    </xd:doc>
    <xsl:param name="skip-ids"/>
    <xsl:variable name="skip-ids-var" select="concat(',',$skip-ids,',')"/>
    
    <xd:doc>
        <xd:desc>Privacy parameter. Accepts a comma separated list of patient ID root values (normally OID's). When a patient ID is encountered with a root value in this list, then the rendering of this ID will be skipped. This is useful to prevent public display of for example the US SSN. Default is to render any ID as it occurs in the document. Note that this setting only affects human rendering and that it does not affect automated processing of the underlying document.</xd:desc>
    </xd:doc>
    <xsl:param name="mask-ids"/>
    <xsl:variable name="mask-ids-var" select="concat(',',$mask-ids,',')"/>
    
    <xd:doc>
        <xd:desc>Determines if sections will receive numbering according to ClinicalDocument order. Value 'true' activates numbering. Top level sections are 1, 2, 3, 4, sub level sections are 1.1, 1.2, 1.2.1, 1.2.2 etc.</xd:desc>
    </xd:doc>
    <xsl:param name="dosectionnumbering" select="'false'"/>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Do lowercase compare of language+region</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:variable name="textLangLowerCase">
        <xsl:call-template name="caseDown">
            <xsl:with-param name="data" select="$textLang"/>
        </xsl:call-template>
    </xsl:variable>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Do lowercase compare of language (assume alpha2 not alpha3)</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:variable name="textLangPartLowerCase" select="substring($textLangLowerCase,1,2)"/>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Do lowercase compare of default language+region</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:variable name="textLangDefaultLowerCase">
        <xsl:call-template name="caseDown">
            <xsl:with-param name="data" select="$textlangDefault"/>
        </xsl:call-template>
    </xsl:variable>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Do lowercase compare of default language (assume alpha2 not alpha3)</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:variable name="textLangDefaultPartLowerCase" select="substring($textLangDefaultLowerCase,1,2)"/>
    
    <xd:doc>
        <xd:desc>
            <xd:p>String processing variable. Lower-case alphabet</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:variable name="lc" select="'abcdefghijklmnopqrstuvwxyz'" />
    
    <xd:doc>
        <xd:desc>
            <xd:p>String processing variable. Upper-case alphabet</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:variable name="uc" select="'ABCDEFGHIJKLMNOPQRSTUVWXYZ'" />
    
    <xd:doc>
        <xd:desc>
            <xd:p>String processing variable. Removes the following characters, in addition to line breaks "':;?`{}“”„‚’</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:variable name="simple-sanitizer-match"><xsl:text>&#10;&#13;&#34;&#39;&#58;&#59;&#63;&#96;&#123;&#125;&#8220;&#8221;&#8222;&#8218;&#8217;</xsl:text></xsl:variable>
    
    <xd:doc>
        <xd:desc>
            <xd:p>String processing variable.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:variable name="simple-sanitizer-replace" select="'***************'"/>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Use XHTML 1.0 Strict with UTF-8 encoding. CDAr3 specifies an XHTML subset of tags in Section.text so that makes mapping easier.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:output indent="yes" encoding="utf-8" doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"/>

    <xd:doc>
        <xd:desc>
            <xd:p>Main template. Triggers on all top level ClinicalDocument elements</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="/">
        <xsl:apply-templates select="/hl7:ClinicalDocument"/>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Starts an HTML document containing a rendering of the ClinicalDocument</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:ClinicalDocument[not(ancestor::hl7:ClinicalDocument)]">
        <xsl:comment> Do NOT edit this HTML directly: it was generated via an XSLT transformation from a CDA Release 2 or 3 XML document. </xsl:comment>
        <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{substring($textLangLowerCase,1,2)}">
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
                <title>
                    <xsl:call-template name="show-title"/>
                </title>
                <xsl:comment> General CSS </xsl:comment>
                <style type="text/css" media="all">
                    *{
                        font-family: <xsl:value-of select="$font-family"/>;
                        font-size: <xsl:value-of select="$font-size-main"/>;
                    }
                    body{
                        padding: 2px;
                        color: #003366;
                        background-color: white;
                        font-size: <xsl:value-of select="$font-size-main"/>;
                    }
                    #documentheader,
                    #documentbody,
                    #documentfooter{
                        width: 100%;
                    }
                    #documentheader{
                        border-bottom: 1px solid grey;
                        margin-bottom: 1em;
                    }
                    #documentfooter{
                        border-top: 1px solid grey;
                        margin-top: 1em;
                    }
                    a{
                        color: #003366;
                        background-color: white;
                    }
                    h1{
                        font-size: <xsl:value-of select="$font-size-h1"/>;
                        font-weight: bold;
                    }
                    h1.title{
                        text-align: center;
                    }
                    h2{
                        font-size: <xsl:value-of select="$font-size-h2"/>;
                        font-weight: bold;
                    }
                    h3{
                        font-size: <xsl:value-of select="$font-size-h3"/>;
                        font-weight: bold;
                    }
                    h4{
                        font-size: <xsl:value-of select="$font-size-h4"/>;
                        font-weight: bold;
                    }
                    h5{
                        font-size: <xsl:value-of select="$font-size-h5"/>;
                        font-weight: bold;
                    }
                    h6{
                        font-size: <xsl:value-of select="$font-size-h6"/>;
                        font-weight: bold;
                    }
                    hr{
                        width: 100%;
                    }
                    span {
                        font-size: <xsl:value-of select="$font-size-main"/>; /* IE8 hack: doesn't understand inheritance */
                        display: inline; /* IE8 hack: would go to next line otherwise */
                    }
                    table{
                        line-height: 10pt;
                        width: 100%;
                    }
                    thead tr, th{
                        background-color: <xsl:value-of select="$bgcolor-th"/>;
                    }
                    tbody tr{
                        background-color: <xsl:value-of select="$bgcolor-td"/>;
                    }
                    td{
                        font-size: <xsl:value-of select="$font-size-main"/>; /* IE8 hack: doesn't understand inheritance */
                        padding: 0.1cm 0.2cm;
                        vertical-align: top;
                    }
                    .table_simple{
                        width: auto;
                        color: inherit;
                        background-color: inherit;
                    }
                    .table_simple td{
                        padding: 0;
                    }
                    .table_simple td.td_label{
                        font-size: <xsl:value-of select="$font-size-main"/>; /* IE8 hack: doesn't understand inheritance */
                        font-weight: inherit;
                        font-style: italic;
                        padding-right: 0.2cm;
                    }
                    .header_table{
                        border: 1pt solid #00008b;
                    }
                    .narr_table{
                        width: 100%;
                        margin: 0.3em 0;
                    }
                    .narr_tr{
                        //background-color: #ffffcc;
                    }
                    .narr_th{
                        background-color: <xsl:value-of select="$bgcolor-th"/>;
                        font-size: <xsl:value-of select="$font-size-main"/>; /* IE8 hack: doesn't understand inheritance */
                    }
                    .narr_footnote{
                        font-size: <xsl:value-of select="$font-size-footnote"/>;
                        font-style: italic;
                    }
                    .td_label{
                        font-size: <xsl:value-of select="$font-size-main"/>; /* IE8 hack: doesn't understand inheritance */
                        font-weight: bold;
                        background-color: <xsl:value-of select="$bgcolor-th"/>;
                    }
                    .td_label_width{
                        width: 20%;
                    }
                    .span_label{
                        font-size: <xsl:value-of select="$font-size-main"/>; /* IE8 hack: doesn't understand inheritance */
                        font-weight: bold;
                    }
                    .span_value{
                        font-size: <xsl:value-of select="$font-size-main"/>; /* IE8 hack: doesn't understand inheritance */
                        font-weight: normal;
                    }
                    .revision_insert{
                        text-decoration: underline overline;
                    }
                    .revision_insert_final{
                    }
                    .revision_delete{
                        text-decoration: line-through;
                    }
                    .revision_delete_final{
                        display: none;
                    }
                    .span_button {
                        display: table-cell;
                        cursor: pointer;
                        border: 2pt inset #585858;
                        border-radius: 15px;
                        -moz-border-radius: 15px;
                        padding: 0.1cm 0.2cm;
                        background-color: <xsl:value-of select="$bgcolor-td"/>;
                        font-weight: bold;
                        vertical-align: baseline;
                        width: 150px;
                    }
                    div.separator {
                        height: 1em;
                    }
                    div.caption {
                        font-weight: bold;
                        text-align: center;
                    }
                </style>
                <xsl:comment> Stylecode CSS </xsl:comment>
                <style type="text/css" media="all">
                    .Bold{
                        font-weight: bold;
                    }
                    .Italics{
                        font-style: italic;
                    }
                    .Underline{
                        text-decoration: underline;
                    }
                    .Emphasis{
                        font-weight: bold;
                        font-style: italic;
                    }
                    .Lrule{
                        border-left-width: 2px;
                        border-left-style: solid;
                    }
                    .Rrule{
                        border-right-width: 2px;
                        border-right-style: solid;
                    }
                    .Toprule{
                        border-top-width: 2px;
                        border-top-style: solid;
                    }
                    .Botrule{
                        border-bottom-width: 2px;
                        border-bottom-style: solid;
                    }
                    .Arabic{
                        list-style: arabic;
                    }
                    .LittleRoman{
                        list-style: lower-roman;
                    }
                    .BigRoman{
                        list-style: upper-roman;
                    }
                    .LittleAlpha{
                        list-style: lower-alpha;
                    }
                    .BigAlpha{
                        list-style: upper-alpha
                    }
                    .Disc{
                        list-style: disc;
                    }
                    .Circle{
                        list-style: circle;
                    }
                    .Square{
                        list-style: square;
                    }</style>
                <!--<xsl:comment> Stylecode CSS IHE PCC MCV, Revision 1.2, Trial Implementation, November 2, 2018</xsl:comment>
                <style type="text/css" media="all">
                    .xOrganizerRow > td, .organizer-row > td {
                        padding-bottom: 4px;
                    }
                    .xOrganizerRow, .organizer-row {
                        border-bottom: none;
                    }
                    .xWhitespace {
                        padding-left: 4px;
                    }
                    .xContentSpacing {
                        padding-left: 2.5em;
                    }
                    .xRowGroup > tr {
                        border-bottom: none;
                    }
                    table:first-of-type > tbody:first-of-type {
                        border-top: none;
                    }           
                    .xRowGroup {
                        border-top: 1px dotted #222;
                    }
                    .xSectionComments {
                        text-decoration: underline;
                    }
                    .xSectionComments, .xReconciliation {
                        margin-top: 15px;
                    }
                    .xLabel {
                        font-style:italic;
                    }
                    .xAlert, .xReaction{
                        color: red;
                    }
                    tr.xAlert {
                        background-color: #FDE7EC
                    }
                    tr.xAlert > td:first-of-type:before {
                        content: "\25B2";
                    } 
                    .xContentWrapping {
                        display: table-cell;
                        padding-left: 5px;
                    }
                    .xIndent, .xIndention{
                        white-space: pre;
                        vertical-align: top;
                        display: table-cell;
                    }
                    .xlistForTable {
                        list-style: none;
                        padding: 0;
                    }
                    .xtableWithinTable > tr > td {
                        margin: 0;
                        padding: 0;
                    }
                    xCenter {
                        text-align: center;
                    }
                    xRight {
                        text-align: right;
                    }
                    xLeft {
                        text-align: left;
                    }
                    xMono {
                        font-family: monospace;
                    }
                    xHighlight {
                        background-color: yellow;
                        color: black;
                    }
                </style>-->
                <xsl:comment> Section Button Toggle CSS </xsl:comment>
                <style type="text/css" media="screen">
                    div.button.expandCollapse {
                        float: left;
                        margin-right: 10px;
                        cursor: pointer;
                    }
                </style>
                <xsl:comment> Revision Toggle CSS </xsl:comment>
                <style type="text/css" media="print">
                    button, 
                    div.button,
                    #buttontable {
                        display: none;
                    }
                    div.section-content {
                        display: block !important;
                    }
                    .print_visible {
                        display: block;
                        float: none;
                        margin-right: 0;
                    }
                </style>
                <xsl:comment> Table of Contents CSS </xsl:comment>
                <style type="text/css" media="screen">
                    <xsl:text disable-output-escaping="yes">
                    #nav, #nav ul {
                        padding: 0;
                        margin: 0;
                        list-style: none;
                    }
                    
                    #nav li {
                        float: left;
                        width: 300px;
                    }
                    #nav ul {
                        position: absolute;
                        width: 300px;
                        left: -1000px;
                    }
                    #nav li ul li ul {
                        display: none;
                    }
                    
                    #nav li ul li:hover > ul {
                        display: block;
                        position: absolute;
                        left: 50px !important;
                    }
                    #nav li ul li:hover > ul > li > a {
                        border: 1px solid #585858;
                    }
                    
                    #nav li:hover ul, #nav li.ie_does_hover ul {
                        left: auto;
                        background-position: 0 0;
                    }
                    
                    #nav * a {
                        display: block;
                        padding: 2px 8px;
                        text-decoration: none;
                        font-weight: bold;
                        font-size: 11px;
                    }
                    </xsl:text>
                    #nav ul * a {
                        font-weight: bold;
                        color: #585858;
                        background-color: <xsl:value-of select="$bgcolor-td"/>;
                        cursor: pointer;
                    }
                    
                    #nav ul ul a:link, #nav ul ul a:visited {
                        font-weight: normal;
                        color: #585858;
                        background-color: <xsl:value-of select="$bgcolor-td"/>;
                        cursor: pointer;
                    }
                    
                    #nav * li a:hover, #nav * li a:active,
                    #nav * li * li a:hover, #nav * li * li a:active {
                        /*font-weight: normal;*/
                        color: white;
                        background-color: #585858;
                        cursor: pointer;
                    }
                    
                    #nav * li {
                        border-left: 2px solid white;
                    }
                    
                    #nav * ul li {
                        border-top: 2px solid white;
                        border-left: 0;
                    }
                    
                    /* IE only hack */
                    * html ul li, * html ul ul li{
                        border-bottom: 2px solid white;
                    }
                    
                    * html ul ul li{
                        border-top: 0;
                    }
                    /* End IE only hack */
                </style>
                <xsl:if test="string-length($externalCss)>0">
                    <xsl:comment> External CSS </xsl:comment>
                    <link type="text/css" rel="stylesheet" href="{$externalCss}"/>
                </xsl:if>
                
                <xsl:if test="string($useJavascript)='true'">
                    <xsl:comment> Javascript for Revisions switch </xsl:comment>
                    <script type="text/javascript">
                        <xsl:text>var gStringCollapse = "</xsl:text>
                        <xsl:call-template name="getLocalizedString">
                            <xsl:with-param name="key" select="'Collapse'"/>
                        </xsl:call-template>
                        <xsl:text>"; </xsl:text>
                        <xsl:text>var gStringExpand = "</xsl:text>
                        <xsl:call-template name="getLocalizedString">
                            <xsl:with-param name="key" select="'Expand'"/>
                        </xsl:call-template>
                        <xsl:text>";</xsl:text>
                        <xsl:text>
                        function expandAllSections() {
                            var toggleButtons = document.getElementsByClassName("expandCollapse");
                            if (toggleButtons != null) {
                                var i = 0;
                                while (i != toggleButtons.length) {
                                    expandSection(toggleButtons[i]);
                                    i++;
                                }
                            }
                            toggle('sectionsToggleExpand');
                            toggle('sectionsToggleCollapse');
                        }
                        function expandSection(sectionTitleButton) {
                            sectionTitleButton.title = gStringCollapse;
                            sectionTitleButton.innerText = '▼';
                            sectionTitleButton.onclick = function (){collapseSection(this);};
                            var sectionContent = sectionTitleButton.parentElement.parentElement.children[1]
                            if (sectionContent != null) {
                                sectionContent.style.display = '';
                            }
                        }
                        function collapseAllSections() {
                            var toggleButtons = document.getElementsByClassName("expandCollapse");
                            if (toggleButtons != null) {
                                var i = 0;
                                while (i != toggleButtons.length) {
                                    collapseSection(toggleButtons[i]);
                                    i++;
                                }
                            }
                            toggle('sectionsToggleExpand');
                            toggle('sectionsToggleCollapse');
                        }
                        function collapseSection(sectionTitleButton) {
                            sectionTitleButton.title = gStringExpand;
                            sectionTitleButton.innerText = '▶';
                            sectionTitleButton.onclick = function (){expandSection(this);};
                            var sectionContent = sectionTitleButton.parentElement.parentElement.children[1]
                            if (sectionContent != null) {
                                sectionContent.style.display = 'none';
                            }
                        }
                        function showReviewMarks() {
                            var allHTMLTags=document.getElementsByTagName("*");
                            for (i in allHTMLTags) {
                                //Get all tags with the specified class name.
                                if (allHTMLTags[i].className=='revision_insert_final') {
                                    allHTMLTags[i].className = 'revision_insert';
                                }
                                if (allHTMLTags[i].className=='revision_delete_final') {
                                    allHTMLTags[i].className = 'revision_delete';
                                }
                            }
                            toggle('revisionToggleOn');
                            toggle('revisionToggleOff');
                        }
                        function hideReviewMarks() {
                            var allHTMLTags=document.getElementsByTagName("*");
                            for (i in allHTMLTags) {
                                //Get all tags with the specified class name.
                                if (allHTMLTags[i].className=='revision_insert') {
                                    allHTMLTags[i].className = 'revision_insert_final';
                                }
                                if (allHTMLTags[i].className=='revision_delete') {
                                    allHTMLTags[i].className = 'revision_delete_final';
                                }
                            }
                            toggle('revisionToggleOn');
                            toggle('revisionToggleOff');
                        }
                        function toggle(obj) {
                            var el = document.getElementById(obj);
                            el.style.display = (el.style.display != 'none' ? 'none' : '' );
                        }
                        </xsl:text>
                    </script>
                    <xsl:comment> Javascript for Table of Contents menu </xsl:comment>
                    <script type="text/javascript">
                        sfHover = function() {
                            var sfEls = document.getElementById("nav").getElementsByTagName("li");
                            for (i in sfEls) {
                                sfEls[i].onmouseover=function() {
                                    this.className+=" ie_does_hover";
                                }
                                sfEls[i].onmouseout=function() {
                                    this.className=this.className.replace(new RegExp(" ie_does_hover"), "");
                                }
                            }
                        }
                        if (window.attachEvent) window.attachEvent("onload", sfHover);
                    </script>
                </xsl:if>
            </head>
            <body>
                <div id="documentheader">
                    <a id="_toc">&#160;</a>
                    <xsl:if test="$dohtmlheader = 'true'">
                        <h1 class="title">
                            <xsl:call-template name="show-title"/>
                        </h1>
                        <xsl:call-template name="show-header"/>
                    </xsl:if>
                    <!-- START TOC and Revision toggle -->
                    <xsl:if test="string($useJavascript)='true'">
                        <xsl:if test="//hl7:content[@revised] or count(hl7:component/hl7:structuredBody/hl7:component[hl7:section]) &gt; 1">
                            <div id="buttontable">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tbody>
                                        <tr>
                                            <xsl:call-template name="make-tableofcontents"/>
                                            <xsl:call-template name="make-revisiontoggle"/>
                                            <xsl:call-template name="make-sectiontoggle"/>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </xsl:if>
                    </xsl:if>
                    <!-- END TOC and Revision toggle -->
                </div>
                <div id="documentbody">
                    <xsl:apply-templates select="hl7:component/hl7:structuredBody | hl7:component/hl7:nonXMLBody"/>
                </div>
                <xsl:if test="$dohtmlfooter = 'true'">
                    <div id="documentfooter">
                        <xsl:call-template name="documentGeneral"/>
                        <xsl:call-template name="relatedDocument"/>
                        <xsl:call-template name="custodian"/>
                        <div class="separator">&#160;</div>
                        <xsl:call-template name="recordTarget"/>
                        <xsl:call-template name="authorization"/>
                        <div class="separator">&#160;</div>
                        <xsl:call-template name="documentationOf"/>
                        <xsl:call-template name="inFulfillmentOf"/>
                        <xsl:call-template name="componentOf"/>
                        <div class="separator">&#160;</div>
                        <xsl:call-template name="author"/>
                        <xsl:call-template name="participant"/>
                        <!--xsl:call-template name="participant1"/-->
                        <!--xsl:call-template name="participant2"/-->
                        <xsl:call-template name="dataEnterer"/>
                        <xsl:call-template name="informant"/>
                        <xsl:call-template name="informationRecipient"/>
                        <xsl:call-template name="authenticator"/>
                        <xsl:call-template name="legalAuthenticator"/>
                    </div>
                </xsl:if>
            </body>
        </html>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle structuredBody</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:component/hl7:structuredBody">
        <xsl:for-each select="hl7:component/hl7:section">
            <xsl:call-template name="section">
                <xsl:with-param name="level" select="3"/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle nonXMLBody</xd:p>
        </xd:desc>
        <xd:param name="usemap"/>
    </xd:doc>
    <xsl:template match="hl7:component/hl7:nonXMLBody | hl7:observationMedia">
        <xsl:param name="usemap"/>
        <xsl:variable name="renderID">
            <xsl:choose>
                <xsl:when test="@ID">
                    <xsl:value-of select="@ID"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="concat(generate-id(.), '_', local-name(.))"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:variable name="renderAltText">
            <xsl:variable name="i18nid">
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="key" select="'id'"/>
                </xsl:call-template>
            </xsl:variable>
            <xsl:if test="hl7:id">
                <xsl:value-of select="concat($i18nid, ' = ',hl7:id[1]/@root, ' ', hl7:id[1]/@extension)"/>
            </xsl:if>
        </xsl:variable>
        <xsl:variable name="renderElement" select="self::hl7:nonXMLBody/hl7:text | self::hl7:observationMedia/hl7:value"/>
        <xsl:choose>
            <!-- Minimal mitigation for security risk based on malicious input -->
            <xsl:when test="$renderElement/hl7:reference[starts-with(translate(normalize-space(@value),'JAVASCRIPT','javascript'),'javascript')]">
                <pre title="{$renderAltText}">
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="'securityRiskURLLabel'"/>
                    </xsl:call-template>
                    <b><i><xsl:value-of select="$renderElement/hl7:reference/@value"/></i></b>
                </pre>
            </xsl:when>
            <!-- if there is a reference, use that in an iframe -->
            <xsl:when test="$renderElement/hl7:reference">
                <xsl:variable name="source" select="string($renderElement/hl7:reference/@value)"/>
                <xsl:variable name="lcSource" select="translate($source, $uc, $lc)"/>
                <xsl:variable name="scrubbedSource" select="translate($source, $simple-sanitizer-match, $simple-sanitizer-replace)"/>
                <xsl:message><xsl:value-of select="$source"/>, <xsl:value-of select="$lcSource"/></xsl:message>
                <xsl:choose>
                    <xsl:when test="contains($lcSource,'javascript')">
                        <p>
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'javascript-injection-warning'"/>
                            </xsl:call-template>
                        </p>
                        <xsl:message>
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'javascript-injection-warning'"/>
                            </xsl:call-template>
                        </xsl:message>
                    </xsl:when>
                    <xsl:when test="not($source = $scrubbedSource)">
                        <p>
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'malicious-content-warning'"/>
                            </xsl:call-template>
                        </p>
                        <xsl:message>
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'malicious-content-warning'"/>
                            </xsl:call-template>
                        </xsl:message>
                    </xsl:when>
                    <xsl:when test="$renderElement[starts-with(@mediaType, 'image/')]">
                        <img alt="{$renderAltText}" title="{$renderAltText}" src="{$scrubbedSource}">
                            <xsl:if test="string-length($usemap) &gt; 0">
                                <xsl:attribute name="usemap">
                                    <xsl:value-of select="$usemap"/>
                                </xsl:attribute>
                            </xsl:if>
                        </img>
                    </xsl:when>
                    <xsl:otherwise>
                        <iframe name="{$renderID}" id="{$renderID}" width="100%" height="600" src="{$source}" title="{$renderAltText}" sandbox=""/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <!-- This is an image of some sort -->
            <xsl:when test="$renderElement[starts-with(@mediaType,'image/')]">
                <img alt="{$renderAltText}" title="{$renderAltText}">
                    <xsl:if test="string-length($usemap) &gt; 0">
                        <xsl:attribute name="usemap">
                            <xsl:value-of select="$usemap"/>
                        </xsl:attribute>
                    </xsl:if>
                    <xsl:attribute name="src">
                        <xsl:value-of select="concat('data:',$renderElement/@mediaType,';base64,',$renderElement/text())"/>
                    </xsl:attribute>
                </img>
            </xsl:when>
            <!-- This is something base64 -->
            <xsl:when test="$renderElement[@representation = 'B64']">
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="key" select="'If the contents are not displayed here, it may be offered as a download.'"/>
                </xsl:call-template>
                <iframe name="{$renderID}" id="{$renderID}" width="100%" height="600" title="{$renderAltText}">
                    <xsl:attribute name="src">
                        <xsl:value-of select="concat('data:', $renderElement/@mediaType, ';base64,', $renderElement/text())"/>
                    </xsl:attribute>
                </iframe>
            </xsl:when>
            <!-- This is plain text -->
            <xsl:when test="$renderElement[not(@mediaType) or @mediaType='text/plain']">
                <pre title="{$renderAltText}">
                    <xsl:value-of select="$renderElement/text()"/>
                </pre>
            </xsl:when>
            <xsl:otherwise>
                <pre title="{$renderAltText}">
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="'Cannot display the text'"/>
                    </xsl:call-template>
                </pre>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>component/section: display title and text, and process any nested component/sections increasing margin-left as we go deeper</xd:p>
        </xd:desc>
        <xd:param name="level">Header level element to call, e.g. h1, h2 or h3</xd:param>
        <xd:param name="margin">Margin defined in em</xd:param>
    </xd:doc>
    <xsl:template name="section">
        <xsl:param name="level" select="3"/>
        <xsl:param name="margin" select="0"/>
        
        <div style="margin-left: {$margin}em;" class="section">
            <div class="section-title">
                <xsl:if test="string($useJavascript)='true'">
                    <div class="button expandCollapse" onclick="collapseSection(this)">
                        <xsl:attribute name="title">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'Collapse'"/>
                            </xsl:call-template>
                        </xsl:attribute>
                        <xsl:text>▼</xsl:text>
                    </div>
                </xsl:if>
                <xsl:call-template name="section-title">
                    <xsl:with-param name="level" select="$level"/>
                </xsl:call-template>
            </div>
            <div class="section-content">
                <xsl:if test="hl7:author | hl7:informant | hl7:subject">
                    <div class="section-meta">
                        <xsl:call-template name="section-author"/>
                        <xsl:call-template name="section-informant"/>
                        <xsl:call-template name="section-subject"/>
                    </div>
                </xsl:if>
                <div class="section-body">
                    <xsl:if test="hl7:text">
                        <xsl:call-template name="section-text"/>
                    </xsl:if>
                    <xsl:for-each select="hl7:component/hl7:section">
                        <xsl:call-template name="section">
                            <xsl:with-param name="margin" select="$margin + 2"/>
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:if test="not(hl7:text | hl7:component/hl7:section)">
                        <xsl:text>&#160;</xsl:text>
                    </xsl:if>
                </div>
            </div>
        </div>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Produces a section title with at least an anchor based on relative position in the document (for the Table of Contents), and a second anchor if the section has the @ID tag</xd:p>
        </xd:desc>
        <xd:param name="level">Header level element to call, e.g. h1, h2 or h3</xd:param>
    </xd:doc>
    <xsl:template name="section-title">
        <xsl:param name="level" select="3"/>
        <!--<xsl:if test="@ID">
            <a name="{@ID}"/>
        </xsl:if>-->
        <xsl:element name="{concat('h', $level)}">
            <xsl:attribute name="id">
                <xsl:choose>
                    <xsl:when test="@ID">
                        <xsl:value-of select="@ID"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:apply-templates select="." mode="getAnchorName"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:if test="hl7:code">
                <xsl:attribute name="title">
                    <xsl:call-template name="show-code-set">
                        <xsl:with-param name="in" select="hl7:code"/>
                        <xsl:with-param name="sep" select="', '"/>
                        <xsl:with-param name="textonly" select="'true'"/>
                    </xsl:call-template>
                </xsl:attribute>
            </xsl:if>
            <xsl:choose>
                <xsl:when test="count(hl7:component/hl7:structuredBody/hl7:component[hl7:section]) &gt; 1">
                    <!-- Add link to go back to top if the document has more than one section, otherwise superfluous -->
                    <a href="#_toc">
                        <xsl:apply-templates select="." mode="getTitleName"/>
                    </a>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:apply-templates select="." mode="getTitleName"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:element>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Produces a legal style of numbering for a section. E.g. 1.1, 1.2.1, 1.2.2 etc.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:section" mode="getNumbering">
        <xsl:for-each select="ancestor-or-self::hl7:section">
            <xsl:value-of select="count(parent::hl7:component/preceding-sibling::hl7:component) + 1"/>
            <xsl:if test="position() != last()">
                <xsl:text>.</xsl:text>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Produces an anchor name suitable for the HTML &lt;a/&gt; tag</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:section" mode="getAnchorName">
        <xsl:value-of select="'section_'"/>
        <xsl:apply-templates select="." mode="getNumbering"/>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Produces a human readable section title based on its title, or code as fallback</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:section" mode="getTitleName">
        <xsl:if test="$dosectionnumbering = 'true'">
            <xsl:apply-templates select="." mode="getNumbering"/>
            <xsl:text> </xsl:text>
        </xsl:if>
        <xsl:choose>
            <xsl:when test="hl7:title">
                <xsl:call-template name="show-text-set">
                    <xsl:with-param name="in" select="hl7:title"/>
                    <xsl:with-param name="sep" select="', '"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="hl7:code">
                <xsl:call-template name="show-code-set">
                    <xsl:with-param name="in" select="hl7:code"/>
                    <xsl:with-param name="sep" select="', '"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="hl7:id">
                <xsl:call-template name="show-id-set">
                    <xsl:with-param name="in" select="hl7:id"/>
                    <xsl:with-param name="sep" select="', '"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="key" select="'section'"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle section author</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="section-author">
        <xsl:if test="hl7:author">
            <div>
                <b>
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="'sectionAuthor'"/>
                        <xsl:with-param name="post" select="': '"/>
                    </xsl:call-template>
                </b>
                <div>
                    <ul>
                        <xsl:for-each select="hl7:author">
                            <li>
                                <xsl:choose>
                                    <xsl:when test="hl7:assignedAuthor/hl7:assignedPerson">
                                        <xsl:call-template name="show-name-set">
                                            <xsl:with-param name="in" select="hl7:assignedAuthor/hl7:assignedPerson/hl7:name"/>
                                        </xsl:call-template>
                                        <xsl:if test="hl7:assignedAuthor/hl7:assignedPerson/hl7:desc">
                                            <div>
                                                <xsl:value-of select="hl7:assignedAuthor/hl7:assignedPerson/hl7:desc"/>
                                            </div>
                                        </xsl:if>
                                        <xsl:if test="hl7:assignedAuthor/hl7:assignedPerson/hl7:birthTime">
                                            <xsl:text> </xsl:text>
                                            <xsl:call-template name="getLocalizedString">
                                                <xsl:with-param name="key" select="'birthTimeLong'"/>
                                            </xsl:call-template>
                                            <xsl:text> </xsl:text>
                                            <xsl:call-template name="show-timestamp">
                                                <xsl:with-param name="in" select="hl7:assignedAuthor/hl7:assignedPerson/hl7:birthTime"/>
                                            </xsl:call-template>
                                        </xsl:if>
                                    </xsl:when>
                                    <xsl:when test="hl7:assignedAuthor/hl7:assignedAuthoringDevice">
                                        <xsl:value-of select="hl7:assignedAuthor/hl7:assignedAuthoringDevice/hl7:softwareName"/>
                                    </xsl:when>
                                    <xsl:when test="hl7:assignedAuthor/hl7:assignedDevice/hl7:softwareName">
                                        <xsl:value-of select="hl7:assignedAuthor/hl7:assignedDevice/hl7:softwareName/@value"/>
                                    </xsl:when>
                                    <xsl:when test="hl7:assignedAuthor/hl7:id">
                                        <xsl:call-template name="getLocalizedString">
                                            <xsl:with-param name="key" select="'id'"/>
                                            <xsl:with-param name="post" select="': '"/>
                                        </xsl:call-template>
                                        <xsl:call-template name="show-id-set">
                                            <xsl:with-param name="in" select="hl7:assignedAuthor/hl7:id"/>
                                        </xsl:call-template>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:if test="hl7:assignedAuthor/hl7:code">
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="pre" select="' - '"/>
                                        <xsl:with-param name="key" select="'code'"/>
                                        <xsl:with-param name="post" select="': '"/>
                                    </xsl:call-template>
                                    <xsl:call-template name="show-code-set">
                                        <xsl:with-param name="in" select="hl7:assignedAuthor/hl7:code"/>
                                    </xsl:call-template>
                                </xsl:if>
                                <xsl:choose>
                                    <xsl:when test="hl7:assignedAuthor/hl7:representedOrganization/hl7:name">
                                        <xsl:text>, </xsl:text>
                                        <xsl:call-template name="getLocalizedString">
                                            <xsl:with-param name="key" select="'organization'"/>
                                            <xsl:with-param name="post" select="': '"/>
                                        </xsl:call-template>
                                        <xsl:call-template name="show-name-set">
                                            <xsl:with-param name="in" select="hl7:assignedAuthor/hl7:representedOrganization/hl7:name"/>
                                        </xsl:call-template>
                                    </xsl:when>
                                    <xsl:when test="hl7:assignedAuthor/hl7:representedOrganization/hl7:id">
                                        <xsl:text>, </xsl:text>
                                        <xsl:call-template name="getLocalizedString">
                                            <xsl:with-param name="key" select="'organization'"/>
                                            <xsl:with-param name="post" select="': '"/>
                                        </xsl:call-template>
                                        <xsl:call-template name="show-id-set">
                                            <xsl:with-param name="in" select="hl7:assignedAuthor/hl7:representedOrganization/hl7:id"/>
                                        </xsl:call-template>
                                    </xsl:when>
                                </xsl:choose>
                                <xsl:if test="hl7:assignedAuthor/hl7:telecom">
                                    <br/>
                                    <xsl:call-template name="show-telecom-set">
                                        <xsl:with-param name="in" select="hl7:assignedAuthor/hl7:telecom"/>
                                    </xsl:call-template>
                                </xsl:if>
                            </li>
                        </xsl:for-each>
                    </ul>
                </div>
            </div>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle  section informant </xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="section-informant">
        <xsl:if test="hl7:informant">
            <div>
                <b>
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="'sectionInformant'"/>
                        <xsl:with-param name="post" select="': '"/>
                    </xsl:call-template>
                </b>
                <div>
                    <ul>
                        <xsl:for-each select="hl7:informant">
                            <li>
                                <xsl:choose>
                                    <xsl:when test="hl7:relatedEntity">
                                        <xsl:choose>
                                            <xsl:when test="hl7:relatedEntity/hl7:code">
                                                <xsl:text>(</xsl:text>
                                                <xsl:call-template name="show-code-set">
                                                    <xsl:with-param name="in" select="hl7:relatedEntity/hl7:code"/>
                                                </xsl:call-template>
                                                <xsl:text>) </xsl:text>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:text>(</xsl:text>
                                                <xsl:call-template name="getLocalizedString">
                                                    <xsl:with-param name="key" select="concat('2.16.840.1.113883.5.110-',hl7:relatedEntity/@classCode)"/>
                                                </xsl:call-template>
                                                <xsl:text>) </xsl:text>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                        <xsl:call-template name="show-name-set">
                                            <xsl:with-param name="in" select="hl7:relatedEntity/hl7:relatedPerson/hl7:name"/>
                                        </xsl:call-template>
                                        <xsl:if test="hl7:relatedEntity/hl7:relatedPerson/hl7:desc">
                                            <div>
                                                <xsl:value-of select="hl7:relatedEntity/hl7:relatedPerson/hl7:desc"/>
                                            </div>
                                        </xsl:if>
                                        <xsl:if test="hl7:relatedEntity/hl7:relatedPerson/hl7:birthTime">
                                            <xsl:text> </xsl:text>
                                            <xsl:call-template name="getLocalizedString">
                                                <xsl:with-param name="key" select="'birthTimeLong'"/>
                                            </xsl:call-template>
                                            <xsl:text> </xsl:text>
                                            <xsl:call-template name="show-timestamp">
                                                <xsl:with-param name="in" select="hl7:relatedEntity/hl7:relatedPerson/hl7:birthTime"/>
                                            </xsl:call-template>
                                        </xsl:if>
                                    </xsl:when>
                                    <xsl:when test="hl7:assignedEntity">
                                        <xsl:choose>
                                            <xsl:when test="hl7:assignedEntity/hl7:assignedPerson/hl7:name">
                                                <xsl:call-template name="show-name-set">
                                                    <xsl:with-param name="in" select="hl7:assignedEntity/hl7:assignedPerson/hl7:name"/>
                                                </xsl:call-template>
                                                <xsl:if test="hl7:assignedEntity/hl7:assignedPerson/hl7:desc">
                                                    <div>
                                                        <xsl:value-of select="hl7:assignedEntity/hl7:assignedPerson/hl7:desc"/>
                                                    </div>
                                                </xsl:if>
                                                <xsl:if test="hl7:assignedEntity/hl7:assignedPerson/hl7:birthTime">
                                                    <xsl:text> </xsl:text>
                                                    <xsl:call-template name="getLocalizedString">
                                                        <xsl:with-param name="key" select="'birthTimeLong'"/>
                                                    </xsl:call-template>
                                                    <xsl:text> </xsl:text>
                                                    <xsl:call-template name="show-timestamp">
                                                        <xsl:with-param name="in" select="hl7:assignedEntity/hl7:assignedPerson/hl7:birthTime"/>
                                                    </xsl:call-template>
                                                </xsl:if>
                                            </xsl:when>
                                            <xsl:when test="hl7:assignedEntity/hl7:id">
                                                <xsl:call-template name="getLocalizedString">
                                                    <xsl:with-param name="key" select="'id'"/>
                                                    <xsl:with-param name="post" select="': '"/>
                                                </xsl:call-template>
                                                <xsl:call-template name="show-id-set">
                                                    <xsl:with-param name="in" select="hl7:assignedEntity/hl7:id"/>
                                                    <xsl:with-param name="sep" select="', '"/>
                                                </xsl:call-template>
                                            </xsl:when>
                                        </xsl:choose>

                                        <xsl:if test="hl7:assignedEntity/hl7:representedOrganization">
                                            <xsl:text>, </xsl:text>
                                            <xsl:call-template name="getLocalizedString">
                                                <xsl:with-param name="key" select="'organization'"/>
                                                <xsl:with-param name="post" select="': '"/>
                                            </xsl:call-template>
                                            <xsl:call-template name="show-name-set">
                                                <xsl:with-param name="in" select="hl7:assignedEntity/hl7:representedOrganization/hl7:name"/>
                                                <xsl:with-param name="sep" select="', '"/>
                                            </xsl:call-template>
                                        </xsl:if>
                                        <xsl:if test="hl7:assignedEntity/hl7:representedOrganization/hl7:telecom">
                                            <xsl:text>, </xsl:text>
                                            <xsl:call-template name="show-telecom-set">
                                                <xsl:with-param name="in" select="hl7:assignedEntity/hl7:representedOrganization/hl7:telecom"/>
                                                <xsl:with-param name="sep" select="', '"/>
                                            </xsl:call-template>
                                        </xsl:if>
                                    </xsl:when>
                                </xsl:choose>

                                <xsl:if test="hl7:relatedEntity/hl7:telecom | hl7:assignedEntity/hl7:telecom">
                                    <br/>
                                    <xsl:call-template name="show-telecom-set">
                                        <xsl:with-param name="in" select="hl7:relatedEntity/hl7:telecom | hl7:assignedEntity/hl7:telecom"/>
                                    </xsl:call-template>
                                </xsl:if>
                            </li>
                        </xsl:for-each>
                    </ul>
                </div>
            </div>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle  section subject </xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="section-subject">
        <xsl:if test="hl7:subject">
            <div>
                <b>
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="'sectionSubject'"/>
                        <xsl:with-param name="post" select="': '"/>
                    </xsl:call-template>
                </b>
                <div>
                    <ul>
                        <xsl:for-each select="hl7:subject">
                            <li>
                                <xsl:if test="hl7:relatedSubject/hl7:subject/hl7:name">
                                    <xsl:call-template name="show-name-set">
                                        <xsl:with-param name="in" select="hl7:relatedSubject/hl7:subject/hl7:name"/>
                                    </xsl:call-template>
                                </xsl:if>
                                <xsl:if test="hl7:relatedSubject/hl7:code">
                                    <xsl:text> - </xsl:text>
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'code'"/>
                                        <xsl:with-param name="post" select="': '"/>
                                    </xsl:call-template>
                                    <xsl:call-template name="show-code-set">
                                        <xsl:with-param name="in" select="hl7:relatedSubject/hl7:code"/>
                                    </xsl:call-template>
                                </xsl:if>
                                <xsl:if test="hl7:relatedSubject/hl7:subject[*[local-name() = 'birthTime'] | *[local-name() = 'deceasedInd'] | *[local-name() = 'birthdeceasedTime'] | *[local-name() = 'multipleBirthInd'] | *[local-name() = 'multipleBirthOrderNumber']]">
                                    <xsl:text>, </xsl:text>
                                    <xsl:call-template name="show-birthDeathTime-multipleBirth">
                                        <xsl:with-param name="in" select="hl7:relatedSubject/hl7:subject"/>
                                        <xsl:with-param name="clinicalDocumentEffectiveTime" select="ancestor-or-self::hl7:ClinicalDocument/hl7:effectiveTime/@value"/>
                                    </xsl:call-template>
                                </xsl:if>
                                <xsl:if test="hl7:relatedSubject/hl7:subject/hl7:administrativeGenderCode">
                                    <xsl:text>, </xsl:text>
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'administrativeGenderCode'"/>
                                        <xsl:with-param name="post" select="': '"/>
                                    </xsl:call-template>
                                    <xsl:call-template name="show-code-set">
                                        <xsl:with-param name="in" select="hl7:relatedSubject/hl7:subject/hl7:administrativeGenderCode"/>
                                    </xsl:call-template>
                                </xsl:if>
                                <xsl:if test="hl7:relatedSubject/hl7:subject/hl7:raceCode">
                                    <xsl:text>, </xsl:text>
                                            <xsl:call-template name="getLocalizedString">
                                                <xsl:with-param name="key" select="'Race'"/>
                                                <xsl:with-param name="post" select="': '"/>
                                            </xsl:call-template>
                                            <xsl:call-template name="show-code-set">
                                                <xsl:with-param name="in" select="hl7:relatedSubject/hl7:subject/hl7:raceCode"/>
                                            </xsl:call-template>
                                </xsl:if>
                                <xsl:if test="hl7:relatedSubject/hl7:subject/hl7:ethnicGroupCode">
                                    <xsl:text>, </xsl:text>
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'Ethnicity'"/>
                                        <xsl:with-param name="post" select="': '"/>
                                    </xsl:call-template>
                                    <xsl:call-template name="show-code-set">
                                        <xsl:with-param name="in" select="hl7:relatedSubject/hl7:subject/hl7:ethnicGroupCode"/>
                                    </xsl:call-template>
                                </xsl:if>
                                <xsl:if test="hl7:relatedSubject/hl7:telecom">
                                    <div>
                                        <xsl:call-template name="show-telecom-set">
                                            <xsl:with-param name="in" select="hl7:relatedSubject/hl7:telecom"/>
                                        </xsl:call-template>
                                    </div>
                                </xsl:if>
                            </li>
                        </xsl:for-each>
                    </ul>
                </div>
            </div>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Puts a div around the Section.text and hands it off to other templates</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="section-text">
        <div>
            <xsl:apply-templates select="hl7:text"/>
        </div>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle    paragraph  </xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:paragraph">
        <p>
            <xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
            <!--<xsl:if test="@ID">
                <a name="{@ID}"/>
            </xsl:if>-->
            <xsl:apply-templates/>
        </p>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle    linkHtml  </xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:linkHtml">
        <xsl:element name="a">
            <xsl:apply-templates select="." mode="handleSectionTextAttributes">
                <xsl:with-param name="class">linkHtml</xsl:with-param>
            </xsl:apply-templates>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle pre</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:pre">
        <pre>
            <xsl:apply-templates/>
        </pre>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle content. Content w/ deleted text is hidden</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:content">
        <span>
            <xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
            <!--<xsl:if test="@ID">
                <a name="{@ID}"/>
            </xsl:if>-->
            <!-- IHE PCC MCV -->
            <!--<xsl:if test="@styleCode = 'xHR' or starts-with(@styleCode, 'xHR ')">
                <hr class="xHR"/>
            </xsl:if>-->
            <xsl:apply-templates/>
        </span>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle line break </xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:br">
        <xsl:element name="br">
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle list  </xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:list">
        <!-- caption -->
        <xsl:if test="hl7:caption">
            <div style="font-weight:bold; ">
                <xsl:apply-templates select="hl7:caption"/>
            </div>
        </xsl:if>
        <!-- item -->
        <xsl:choose>
            <xsl:when test="@listType='ordered'">
                <ol>
                    <xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
                    <!--<xsl:if test="@ID">
                        <a name="{@ID}"/>
                    </xsl:if>-->
                    <xsl:for-each select="hl7:item">
                        <li>
                            <xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
                            <!--<xsl:if test="@ID">
                                <a name="{@ID}"/>
                            </xsl:if>-->
                            <xsl:apply-templates/>
                        </li>
                    </xsl:for-each>
                </ol>
            </xsl:when>
            <xsl:otherwise>
                <!-- list is unordered -->
                <ul>
                    <xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
                    <!--<xsl:if test="@ID">
                        <a name="{@ID}"/>
                    </xsl:if>-->
                    <xsl:for-each select="hl7:item">
                        <li>
                            <xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
                            <!--<xsl:if test="@ID">
                                <a name="{@ID}"/>
                            </xsl:if>-->
                            <xsl:apply-templates/>
                        </li>
                    </xsl:for-each>
                </ul>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle caption  </xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:caption">
        <xsl:choose>
            <xsl:when test="parent::hl7:table">
                <caption>
                    <xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
                    <!--<xsl:if test="@ID">
                        <a name="{@ID}"/>
                    </xsl:if>-->
                    <xsl:apply-templates/>
                </caption>
            </xsl:when>
            <xsl:otherwise>
                <div class="caption">
                    <xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
                    <!--<xsl:if test="@ID">
                        <a name="{@ID}"/>
                    </xsl:if>-->
                    <xsl:apply-templates/>
                </div>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle footnote </xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:footnote">
        <xsl:variable name="id" select="@ID"/>
        <xsl:variable name="footNoteNum">
            <xsl:for-each select="//hl7:footnote">
                <xsl:if test="@ID = $id">
                    <xsl:value-of select="position()"/>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>
        <div>
            <xsl:apply-templates select="." mode="handleSectionTextAttributes">
                <xsl:with-param name="class" select="'narr_footnote'"/>
            </xsl:apply-templates>
            <xsl:text>[</xsl:text>
            <xsl:value-of select="$footNoteNum"/>
            <xsl:text>]. </xsl:text>
            <xsl:apply-templates/>
        </div>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle footnoteRef. Produces a superscript [n] where n is the occurence number of this ref in the
                whole document. Also adds a title with the first 50 characters of th footnote on the number so you 
                don't have to navigate to the footnote and just continue to read.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:footnoteRef">
        <xsl:variable name="idref" select="@IDREF"/>
        <xsl:variable name="footNoteNum">
            <xsl:for-each select="//hl7:footnote">
                <xsl:if test="@ID = $idref">
                    <xsl:value-of select="position()"/>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>
        <xsl:variable name="footNoteText">
            <xsl:copy-of select="//hl7:footnote[@ID = $idref]//text()"/>
        </xsl:variable>
        <sup>
            <xsl:text>[</xsl:text>
            <a href="#{$idref}">
                <!-- Render footnoteref with the first 50 characters of the text -->
                <xsl:attribute name="title">
                    <xsl:value-of select="substring($footNoteText, 1, 50)"/>
                    <xsl:if test="string-length($footNoteText) > 50">
                        <xsl:text>...</xsl:text>
                    </xsl:if>
                </xsl:attribute>
                <xsl:value-of select="$footNoteNum"/>
            </a>
            <xsl:text>]</xsl:text>
        </sup>
    </xsl:template>

    <!--<xd:doc>
        <xd:desc>
            <xd:p>Handle renderMultiMedia. Produces one or more iframes depending on the number of IDREFS in @referencedObject. Can have a caption on all of them.</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:renderMultiMedia">
        <xsl:variable name="idrefs">
            <xsl:call-template name="tokenize">
                <xsl:with-param name="string" select="@referencedObject"/>
            </xsl:call-template>
        </xsl:variable>
        
        <xsl:apply-templates select="ancestor::hl7:ClinicalDocument//hl7:observationMedia[@ID = $idrefs]"/>
    </xsl:template>-->
    
    <xsl:variable name="table-elem-attrs">
        <tableElems>
            <elem name="table">
                <attr name="ID"/>
                <attr name="language"/>
                <attr name="styleCode"/>
                <attr name="summary"/>
                <attr name="width"/>
                <attr name="border"/>
                <attr name="frame"/>
                <attr name="rules"/>
                <attr name="cellspacing"/>
                <attr name="cellpadding"/>
            </elem>
            <elem name="thead">
                <attr name="ID"/>
                <attr name="language"/>
                <attr name="styleCode"/>
                <attr name="align"/>
                <attr name="char"/>
                <attr name="charoff"/>
                <attr name="valign"/>
            </elem>
            <elem name="tfoot">
                <attr name="ID"/>
                <attr name="language"/>
                <attr name="styleCode"/>
                <attr name="align"/>
                <attr name="char"/>
                <attr name="charoff"/>
                <attr name="valign"/>
            </elem>
            <elem name="tbody">
                <attr name="ID"/>
                <attr name="language"/>
                <attr name="styleCode"/>
                <attr name="align"/>
                <attr name="char"/>
                <attr name="charoff"/>
                <attr name="valign"/>
            </elem>
            <elem name="colgroup">
                <attr name="ID"/>
                <attr name="language"/>
                <attr name="styleCode"/>
                <attr name="span"/>
                <attr name="width"/>
                <attr name="align"/>
                <attr name="char"/>
                <attr name="charoff"/>
                <attr name="valign"/>
            </elem>
            <elem name="col">
                <attr name="ID"/>
                <attr name="language"/>
                <attr name="styleCode"/>
                <attr name="span"/>
                <attr name="width"/>
                <attr name="align"/>
                <attr name="char"/>
                <attr name="charoff"/>
                <attr name="valign"/>
            </elem>
            <elem name="tr">
                <attr name="ID"/>
                <attr name="language"/>
                <attr name="styleCode"/>
                <attr name="align"/>
                <attr name="char"/>
                <attr name="charoff"/>
                <attr name="valign"/>
            </elem>
            <elem name="th">
                <attr name="ID"/>
                <attr name="language"/>
                <attr name="styleCode"/>
                <attr name="abbr"/>
                <attr name="axis"/>
                <attr name="headers"/>
                <attr name="scope"/>
                <attr name="rowspan"/>
                <attr name="colspan"/>
                <attr name="align"/>
                <attr name="char"/>
                <attr name="charoff"/>
                <attr name="valign"/>
            </elem>
            <elem name="td">
                <attr name="ID"/>
                <attr name="language"/>
                <attr name="styleCode"/>
                <attr name="abbr"/>
                <attr name="axis"/>
                <attr name="headers"/>
                <attr name="scope"/>
                <attr name="rowspan"/>
                <attr name="colspan"/>
                <attr name="align"/>
                <attr name="char"/>
                <attr name="charoff"/>
                <attr name="valign"/>
            </elem>
        </tableElems>
    </xsl:variable>
    
    <xd:doc>
        <xd:desc>Handle table and constituents of table</xd:desc>
    </xd:doc>
    <xsl:template match="hl7:table | hl7:thead | hl7:tfoot | hl7:tbody | hl7:colgroup | hl7:col | hl7:tr | hl7:th | hl7:td">
        <xsl:element name="{local-name()}">
            <xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
            <!--<xsl:if test="@ID">
                <a name="{@ID}"/>
            </xsl:if>-->
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

    <!--<xd:doc>
        <xd:desc>
            <xd:p>Handle table</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:table">
        <table>
            <xsl:apply-templates select="." mode="handleSectionTextAttributes">
                <xsl:with-param name="class" select="'narr_table'"/>
            </xsl:apply-templates>
            <!-\-<xsl:if test="@ID">
                <a name="{@ID}"/>
            </xsl:if>-\->
            <xsl:apply-templates/>
        </table>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle thead</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:thead">
        <thead>
            <xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
            <!-\-<xsl:if test="@ID">
                <a name="{@ID}"/>
            </xsl:if>-\->
            <xsl:apply-templates/>
        </thead>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle tfoot</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:tfoot">
        <tfoot>
            <xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
            <!-\-<xsl:if test="@ID">
                <a name="{@ID}"/>
            </xsl:if>-\->
            <xsl:apply-templates/>
        </tfoot>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Handle tbody</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:tbody">
        <tbody>
            <xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
            <!-\-<xsl:if test="@ID">
                <a name="{@ID}"/>
            </xsl:if>-\->
            <xsl:apply-templates/>
        </tbody>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle colgroup</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:colgroup">
        <colgroup>
            <xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
            <!-\-<xsl:if test="@ID">
                <a name="{@ID}"/>
            </xsl:if>-\->
            <xsl:apply-templates/>
        </colgroup>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle col</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:col">
        <col>
            <xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
            <!-\-<xsl:if test="@ID">
                <a name="{@ID}"/>
            </xsl:if>-\->
            <xsl:apply-templates/>
        </col>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle tr</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:tr">
        <tr>
            <xsl:apply-templates select="." mode="handleSectionTextAttributes">
                <xsl:with-param name="class" select="'narr_tr'"/>
            </xsl:apply-templates>
            <!-\-<xsl:if test="@ID">
                <a name="{@ID}"/>
            </xsl:if>-\->
            <xsl:apply-templates/>
        </tr>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle th</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:th">
        <th>
            <xsl:apply-templates select="." mode="handleSectionTextAttributes">
                <xsl:with-param name="class" select="'narr_th'"/>
            </xsl:apply-templates>
            <!-\-<xsl:if test="@ID">
                <a name="{@ID}"/>
            </xsl:if>-\->
            <xsl:apply-templates/>
        </th>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle td</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:td">
        <td>
            <xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
            <!-\-<xsl:if test="@ID">
                <a name="{@ID}"/>
            </xsl:if>-\->
            <xsl:apply-templates/>
        </td>
    </xsl:template>-->
    
    <xd:doc>
        <xd:desc>Security measure. Only process images on the image whitelist</xd:desc>
        <xd:param name="current-whitelist"/>
        <xd:param name="image-uri"/>
        <xd:param name="altTitleText"/>
    </xd:doc>
    <xsl:template name="check-external-image-whitelist">
        <xsl:param name="current-whitelist"/>
        <xsl:param name="image-uri"/>
        <xsl:param name="altTitleText"/>
        <xsl:choose>
            <xsl:when test="string-length($current-whitelist) &gt; 0">
                <xsl:variable name="whitelist-item">
                    <xsl:choose>
                        <xsl:when test="contains($current-whitelist,'|')">
                            <xsl:value-of select="substring-before($current-whitelist,'|')"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$current-whitelist"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:choose>
                    <xsl:when test="starts-with($image-uri,$whitelist-item)">
                        <br clear="all"/>
                        <img src="{$image-uri}" alt="{$altTitleText}" title="{$altTitleText}"/>
                        <xsl:message>
                            <xsl:value-of select="$image-uri"/>
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'is-in-the-whitelist'"/>
                            </xsl:call-template>
                        </xsl:message>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="check-external-image-whitelist">
                            <xsl:with-param name="current-whitelist" select="substring-after($current-whitelist,'|')"/>
                            <xsl:with-param name="image-uri" select="$image-uri"/>
                            <xsl:with-param name="altTitleText" select="$altTitleText"/>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
                
            </xsl:when>
            <xsl:otherwise>
                <p>
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="'non-local-image-found-1'"/>
                    </xsl:call-template>
                    <xsl:value-of select="$image-uri"/>
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="'non-local-image-found-2'"/>
                    </xsl:call-template>
                </p>
                <xsl:message>
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="'non-local-image-found-1'"/>
                    </xsl:call-template>
                    <xsl:value-of select="$image-uri"/>
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="'non-local-image-found-2'"/>
                    </xsl:call-template>
                </xsl:message>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Handle RenderMultiMedia. This currently only handles GIF's and JPEG's. It could, however, be extended 
                by including other image MIME types in the predicate and/or by generating &lt;object&gt; or &lt;applet&gt; 
                tag with the correct params depending on the media type @ID =$imageRef referencedObject </xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:renderMultiMedia">
        <xsl:variable name="imageRefs" select="@referencedObject"/>
        <!--<xsl:variable name="imageRefs">
            <xsl:call-template name="tokenize">
                <xsl:with-param name="string" select="@referencedObject"/>
                <xsl:with-param name="delimiters" select="' '"/>
            </xsl:call-template>
        </xsl:variable>-->
        <xsl:variable name="referencedObjects" select="ancestor::hl7:ClinicalDocument//hl7:regionOfInterest[@ID = $imageRefs] | ancestor::hl7:ClinicalDocument//hl7:observationMedia[@ID = $imageRefs]"/>
        <br/>
        <span>
            <xsl:apply-templates select="hl7:caption"/>
            <xsl:for-each select="$referencedObjects">
                <xsl:choose>
                    <xsl:when test="self::hl7:regionOfInterest">
                        <!-- What we actually would want is an svg with fallback to just the image that renders the ROI on top of image
                            The only example (in the CDA standard itself) that we've seen so far has unusable coordinates. That for now
                            is not very encouraging to put in the effort, so we just render the images for now
                        -->
                        <xsl:apply-templates select=".//hl7:observationMedia">
                            <!--<xsl:with-param name="usemap" select="@ID"/>-->
                        </xsl:apply-templates>
                        <!--<xsl:variable name="coords">
                            <xsl:variable name="tcoords">
                                <xsl:for-each select="hl7:value/@value">
                                    <xsl:value-of select="."/>
                                    <xsl:text> </xsl:text>
                                </xsl:for-each>
                            </xsl:variable>
                            <xsl:value-of select="translate(normalize-space($tcoords),' ',',')"/>
                        </xsl:variable>-->
                        <!--<svg id="graph" width="100%" height="400px" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="https://www.w3.org/1999/xlink">
                            <!-\- pattern -\->
                            <defs>
                                <pattern id="image" x="0%" y="0%" height="100%" width="100%" viewBox="0 0 512 512">
                                    <image x="0%" y="0%" width="512" height="512" xlink:href="https://cdn3.iconfinder.com/data/icons/people-professions/512/Baby-512.png"/>
                                </pattern>
                            </defs>
                            <circle id="sd" class="medium" cx="5%" cy="40%" r="5%" fill="url(#image)" stroke="lightblue" stroke-width="0.5%"/>
                        </svg>-->
                        <!--<map id="{@ID}" name="{@ID}">
                            <xsl:choose>
                                <!-\- A circle defined by two (column,row) pairs. The first point is the center of the circle and the second point is a point on the perimeter of the circle. -\->
                                <xsl:when test="hl7:code/@code = 'CIRCLE'">
                                    <area shape="circle" coords="{$coords}" alt="Computer" href="computer.htm"/>
                                </xsl:when>
                                <!-\- An ellipse defined by four (column,row) pairs, the first two points specifying the endpoints of the major axis and the second two points specifying the endpoints of the minor axis. -\->
                                <xsl:when test="hl7:code/@code = 'ELLIPSE'">
                                    <area shape="poly" coords="{$coords}" alt="Computer" href="computer.htm"/>
                                </xsl:when>
                                <!-\- A single point denoted by a single (column,row) pair, or multiple points each denoted by a (column,row) pair. -\->
                                <xsl:when test="hl7:code/@code = 'POINT'">
                                    <area shape="poly" coords="{$coords}" alt="Computer" href="computer.htm"/>
                                </xsl:when>
                                <!-\- A series of connected line segments with ordered vertices denoted by (column,row) pairs; if the first and last vertices are the same, it is a closed polygon. -\->
                                <xsl:when test="hl7:code/@code = 'POLY'">
                                    <area shape="poly" coords="{$coords}" alt="Computer" href="computer.htm"/>
                                </xsl:when>
                            </xsl:choose>
                        </map>-->
                    </xsl:when>
                    <!-- Here is where the direct MultiMedia image referencing goes -->
                    <xsl:when test="self::hl7:observationMedia">
                        <xsl:apply-templates select="."/>
                    </xsl:when>
                </xsl:choose>
            </xsl:for-each>
        </span>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Handle superscript</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:sup">
        <sup>
            <xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
            <!--<xsl:if test="@ID">
                <a name="{@ID}"/>
            </xsl:if>-->
            <xsl:apply-templates/>
        </sup>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Handle subscript</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:sub">
        <sub>
            <xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
            <!--<xsl:if test="@ID">
                <a name="{@ID}"/>
            </xsl:if>-->
            <xsl:apply-templates/>
        </sub>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Attribute processing for CDAr2 and CDAr3</xd:p>
        </xd:desc>
        <xd:param name="class">If valued then this gets added to potential other class codes</xd:param>
    </xd:doc>
    <xsl:template match="*" mode="handleSectionTextAttributes">
        <xsl:param name="class">
            <xsl:choose>
                <xsl:when test="local-name() = 'table'">narr_table</xsl:when>
                <xsl:when test="local-name() = 'tr'">narr_tr</xsl:when>
                <xsl:when test="local-name() = 'th'">narr_th</xsl:when>
            </xsl:choose>
        </xsl:param>
        
        <xsl:variable name="classes">
            <xsl:if test="string-length($class)">
                <xsl:value-of select="$class"/>
            </xsl:if>
            <xsl:if test="@revised">
                <xsl:text> </xsl:text>
                <xsl:text>revision_</xsl:text>
                <xsl:value-of select="@revised"/>
                <xsl:text>_final</xsl:text>
            </xsl:if>
            <xsl:if test="@styleCode">
                <xsl:text> </xsl:text>
                <xsl:value-of select="@styleCode"/>
            </xsl:if>
            <xsl:if test="@class">
                <xsl:text> </xsl:text>
                <xsl:value-of select="@class"/>
            </xsl:if>
        </xsl:variable>
        
        <xsl:variable name="elem-name" select="local-name(.)"/>
        
        <!-- Write @class attribute if there's data for it -->
        <xsl:if test="string-length(normalize-space($classes))>0">
            <xsl:attribute name="class">
                <xsl:value-of select="normalize-space($classes)"/>
            </xsl:attribute>
        </xsl:if>
        <!-- Write title with @revised (CDAr1 / CDAr2) prefixing to @title if one exists already -->
        <xsl:if test="@revised">
            <xsl:attribute name="title">
                <xsl:value-of select="normalize-space(concat(@revised,' ',@title))"/>
            </xsl:attribute>
        </xsl:if>
        <!-- Write default table cellspacing / cellpadding -->
        <xsl:if test="self::hl7:table">
            <xsl:if test="not(@cellspacing)">
                <xsl:attribute name="cellspacing">
                    <xsl:value-of select="'1'"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="not(@cellpadding)">
                <xsl:attribute name="cellpadding">
                    <xsl:value-of select="'1'"/>
                </xsl:attribute>
            </xsl:if>
        </xsl:if>
        
        <xsl:for-each select="@*">
            <xsl:sort select="local-name()" order="descending"/>
            <xsl:variable name="attr-name" select="local-name(.)"/>
            <xsl:variable name="attr-value" select="."/>
            <xsl:variable name="lcSource" select="translate($attr-value, $uc, $lc)"/>
            <xsl:variable name="scrubbedSource" select="translate($attr-value, $simple-sanitizer-match, $simple-sanitizer-replace)"/>
            <xsl:choose>
                <xsl:when test="contains($lcSource,'javascript')">
                    <xsl:variable name="warningText">
                        <xsl:call-template name="getLocalizedString">
                            <xsl:with-param name="key" select="'javascript-injection-warning'"/>
                            <xsl:with-param name="post" select="': '"/>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:message terminate="yes">
                        <xsl:value-of select="$warningText"/>
                        <xsl:value-of select="$attr-value"/>
                    </xsl:message>
                    <xsl:if test="$attr-name = 'href'">
                        <xsl:attribute name="title">
                            <xsl:value-of select="concat(normalize-space(concat(../@title, ' ', $warningText)), ' ', $attr-value)"/>
                        </xsl:attribute>
                    </xsl:if>
                </xsl:when>
                <xsl:when test="not($attr-value = $scrubbedSource)">
                    <xsl:variable name="warningText">
                        <xsl:call-template name="getLocalizedString">
                            <xsl:with-param name="key" select="'malicious-content-warning'"/>
                            <xsl:with-param name="post" select="': '"/>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:message>
                        <xsl:value-of select="$warningText"/>
                        <xsl:value-of select="$attr-value"/>
                    </xsl:message>
                    <xsl:if test="$attr-name = 'href'">
                        <xsl:attribute name="title">
                            <xsl:value-of select="concat(normalize-space(concat(../@title, ' ', $warningText)), ' ', $attr-value)"/>
                        </xsl:attribute>
                    </xsl:if>
                </xsl:when>
                <xsl:when test="exslt:node-set($table-elem-attrs)/elem[@name = $elem-name] and 
                                not(exslt:node-set($table-elem-attrs)//elem[@name = $elem-name]/attr[@name = $attr-name])">
                    <xsl:message><xsl:value-of select="$attr-name"/> is not legal in <xsl:value-of select="$elem-name"/></xsl:message>
                </xsl:when>
                <!-- Regular handling from here -->
                <xsl:when test="$attr-name = 'ID'">
                    <xsl:attribute name="id">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$attr-name = 'class'">
                    <!-- Already handled -->
                </xsl:when>
                <xsl:when test="$attr-name = 'revised'">
                    <!-- Already handled -->
                </xsl:when>
                <xsl:when test="$attr-name = 'styleCode'">
                    <!-- Already handled -->
                </xsl:when>
                <xsl:when test="$attr-name = 'ID'">
                    <!-- @ID should be handled in a name tag, so don't add here -->
                </xsl:when>
                <xsl:when test="$attr-name = 'IDREF'">
                    <!-- @IDREF doubtful. Should be in an href attribute, but doesn't hurt to add here -->
                    <xsl:attribute name="idref">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$attr-name = 'language'">
                    <xsl:attribute name="lang">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>

                <!-- Table stuff -->
                <xsl:when test="$attr-name = 'border'">
                    <xsl:attribute name="border">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$attr-name = 'frame'">
                    <xsl:attribute name="frame">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$attr-name = 'rules'">
                    <xsl:attribute name="rules">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$attr-name = 'cellpadding'">
                    <xsl:attribute name="cellpadding">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$attr-name = 'cellspacing'">
                    <xsl:attribute name="cellspacing">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$attr-name = 'span'">
                    <xsl:attribute name="span">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$attr-name = 'summary'">
                    <xsl:attribute name="summary">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$attr-name = 'width'">
                    <xsl:attribute name="width">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$attr-name = 'align'">
                    <xsl:attribute name="align">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$attr-name = 'valign'">
                    <xsl:attribute name="valign">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$attr-name = 'char'">
                    <xsl:attribute name="char">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$attr-name = 'charoff'">
                    <xsl:attribute name="charoff">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$attr-name = 'abbr'">
                    <xsl:attribute name="abbr">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$attr-name = 'scope'">
                    <xsl:attribute name="scope">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$attr-name = 'headers'">
                    <xsl:attribute name="headers">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$attr-name = 'axis'">
                    <xsl:attribute name="axis">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$attr-name = 'colspan'">
                    <xsl:attribute name="colspan">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$attr-name = 'rowspan'">
                    <xsl:attribute name="rowspan">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>

                <!-- LinkHTML stuff -->
                <xsl:when test="$attr-name = 'name'">
                    <xsl:attribute name="name">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$attr-name = 'rel'">
                    <xsl:attribute name="rel">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$attr-name = 'href'">
                    <xsl:attribute name="href">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$attr-name = 'title'">
                    <xsl:attribute name="title">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:when test="$attr-name = 'rev'">
                    <xsl:attribute name="rev">
                        <xsl:value-of select="."/>
                    </xsl:attribute>
                </xsl:when>
                <xsl:otherwise>
                    <!-- For CDAr3 we might get a slew of attributes not catered for explicitly, 
                        but supposedly HTML compatible so just could add them as-is -->
                    <!-- However... CDAr3 never happened and this poses a security risk, so ignore -->
                    <!--<xsl:attribute name="{$attr-name}">
                        <xsl:value-of select="."/>
                    </xsl:attribute>-->
                </xsl:otherwise>
            </xsl:choose>
        </xsl:for-each>
    </xsl:template>
    
    <!-- 
        ====================================
        START CDAr3 NarrativeBlock specifics
        ====================================
    -->
    
    <xd:doc>
        <xd:desc>
            <xd:p>Handle HTML like CDAr3 style Section.text elements that are not handled already above</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template match="hl7:a | hl7:dd | hl7:dl | hl7:img | hl7:ins | hl7:span | hl7:p | hl7:ol | hl7:ul| hl7:li">
        <xsl:element name="{local-name()}" namespace="http://www.w3.org/1999/xhtml">
            <xsl:apply-templates select="." mode="handleSectionTextAttributes"/>
            <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>
    
    <!-- 
        ==================================
        END CDAr3 NarrativeBlock specifics
        ==================================
    -->

    <xd:doc>
        <xd:desc>
            <xd:p>Handle the document title based on the ClinicalDocument.title, ClinicalDocument.code or finally just 'Clinical Document'</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="show-title">
        <xsl:variable name="documentEffectiveTime">
            <xsl:call-template name="show-timestamp">
                <xsl:with-param name="in" select="hl7:effectiveTime"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:choose>
            <!-- CDAr2 DTr1 -->
            <xsl:when test="string-length(hl7:title) &gt; 0">
                <xsl:value-of select="hl7:title"/>
            </xsl:when>
            <!-- CDAr3 DTr2 -->
            <xsl:when test="string-length(hl7:title/@value) &gt; 0">
                <xsl:value-of select="hl7:title/@value"/>
            </xsl:when>
            <!-- CDAr2 DTr1 -->
            <xsl:when test="hl7:code/@displayName">
                <xsl:value-of select="hl7:code/@displayName"/>
            </xsl:when>
            <!-- CDAr3 DTr2 -->
            <xsl:when test="hl7:code/hl7:displayName/@value">
                <xsl:value-of select="hl7:code/hl7:displayName/@value"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="key" select="'Clinical Document'"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
        <xsl:text> (</xsl:text>
        <xsl:value-of select="normalize-space($documentEffectiveTime)"/>
        <xsl:if test="hl7:confidentialityCode[@code[not(. = 'N')]]">
            <xsl:text> </xsl:text>
            <xsl:call-template name="show-code-set">
                <xsl:with-param name="in" select="hl7:confidentialityCode"/>
            </xsl:call-template>
        </xsl:if>
        <xsl:text>)</xsl:text>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Show patients, guardians, consents, encounters, serviceEvents, orders and authors</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="show-header">
        <table class="header_table">
            <tbody>
                <!-- Patient row -->
                <xsl:for-each select="hl7:recordTarget/hl7:patientRole">
                    <tr>
                        <td class="td_label">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'recordTarget'"/>
                            </xsl:call-template>
                        </td>
                        <td>
                            <!-- IE8 hack: without this span with float, IE8 will render the span with float right on a new line -->
                            <span class="span_value">
                                <xsl:call-template name="show-name-set">
                                    <xsl:with-param name="in" select="hl7:patient/hl7:name[1]"/>
                                </xsl:call-template>
                            </span>
                            <span style="float: right; margin-left: 1em;">
                                <xsl:if test="hl7:patient/hl7:birthTime[@value]">
                                    <span>
                                        <span class="span_label">
                                            <xsl:choose>
                                                <xsl:when test="hl7:patient/*[local-name() = 'deceasedInd'][@value = 'true' or @nullFlavor] | hl7:patient/*[local-name() = 'deceasedTime']">
                                                    <xsl:call-template name="getLocalizedString">
                                                        <xsl:with-param name="key" select="'birthTimeLongDeceased'"/>
                                                    </xsl:call-template>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:call-template name="getLocalizedString">
                                                        <xsl:with-param name="key" select="'birthTimeLong'"/>
                                                    </xsl:call-template>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                            <xsl:text>: </xsl:text>
                                        </span>
                                        <span class="span_value">
                                            <xsl:call-template name="show-timestamp">
                                                <xsl:with-param name="in" select="hl7:patient/hl7:birthTime"/>
                                            </xsl:call-template>
                                            <xsl:if test="hl7:patient/*[local-name() = 'deceasedInd'][@value = 'true' or @nullFlavor] | hl7:patient/*[local-name() = 'deceasedTime']">
                                                <xsl:text> - &#8224; </xsl:text>
                                                <xsl:choose>
                                                    <xsl:when test="hl7:patient/*[local-name() = 'deceasedTime'][@value]">
                                                        <xsl:call-template name="show-timestamp">
                                                            <xsl:with-param name="in" select="hl7:patient/*[local-name() = 'deceasedTime']"/>
                                                        </xsl:call-template>
                                                    </xsl:when>
                                                    <xsl:when test="hl7:patient/*[local-name() = 'deceasedInd'][@nullFlavor]">
                                                        <xsl:call-template name="show-nullFlavor">
                                                            <xsl:with-param name="in" select="hl7:patient/*[local-name() = 'deceasedInd']/@nullFlavor"/>
                                                        </xsl:call-template>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:call-template name="getLocalizedString">
                                                            <xsl:with-param name="key" select="'date_unknown'"/>
                                                        </xsl:call-template>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:if>
                                            <xsl:variable name="comparedate">
                                                <xsl:choose>
                                                    <xsl:when test="hl7:patient/*[local-name() = 'deceasedTime'][@value]">
                                                        <xsl:value-of select="hl7:patient/*[local-name() = 'deceasedTime']/@value"/>
                                                    </xsl:when>
                                                    <xsl:when test="not(hl7:patient/*[local-name() = 'deceasedInd'] or hl7:patient/*[local-name() = 'deceasedInd'][@value = 'true' or @nullFlavor] or hl7:patient/*[local-name() = 'deceasedTime'])">
                                                        <xsl:value-of select="$currentDate"/>
                                                    </xsl:when>
                                                </xsl:choose>
                                            </xsl:variable>
                                            <xsl:if test="string-length($comparedate) > 0">
                                                <span>
                                                    <xsl:attribute name="title">
                                                        <xsl:choose>
                                                            <xsl:when test="hl7:patient/*[local-name() = 'deceasedTime'][@value]">
                                                                <xsl:call-template name="getLocalizedString">
                                                                    <xsl:with-param name="key" select="'At the time of death'"/>
                                                                </xsl:call-template>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                                <xsl:call-template name="getLocalizedString">
                                                                    <xsl:with-param name="key" select="'At document creation time'"/>
                                                                </xsl:call-template>
                                                            </xsl:otherwise>
                                                        </xsl:choose>
                                                    </xsl:attribute>
                                                    <xsl:call-template name="getLocalizedString">
                                                        <xsl:with-param name="pre">
                                                            <xsl:text> (</xsl:text>
                                                            <xsl:call-template name="getAge">
                                                                <xsl:with-param name="comparedate" select="$comparedate"/>
                                                                <xsl:with-param name="date" select="hl7:patient/hl7:birthTime/@value"/>
                                                            </xsl:call-template>
                                                        </xsl:with-param>
                                                        <xsl:with-param name="key" select="'yr'"/>
                                                        <xsl:with-param name="post" select="')'"/>
                                                    </xsl:call-template>
                                                </span>
                                            </xsl:if>
                                            <xsl:if test="hl7:patient/*[local-name() = 'multipleBirthInd'][@value = 'true'] | hl7:patient/*[local-name() = 'multipleBirthOrderNumber']">
                                                <i>
                                                    <xsl:call-template name="getLocalizedString">
                                                        <xsl:with-param name="pre" select="' '"/>
                                                        <xsl:with-param name="key" select="'partOfMultipleBirth'"/>
                                                    </xsl:call-template>
                                                </i>
                                            </xsl:if>
                                        </span>
                                    </span>
                                </xsl:if>
                                <xsl:if test="hl7:patient/hl7:administrativeGenderCode[@code]">
                                    <span class="span_label">
                                        <xsl:call-template name="getLocalizedString">
                                            <xsl:with-param name="key" select="'administrativeGenderCode'"/>
                                            <xsl:with-param name="post" select="': '"/>
                                        </xsl:call-template>
                                    </span>
                                    <span class="span_value">
                                        <xsl:call-template name="show-code-set">
                                            <xsl:with-param name="in" select="hl7:patient/hl7:administrativeGenderCode"/>
                                        </xsl:call-template>
                                    </span>
                                </xsl:if>
                            </span>
                            <xsl:if test="hl7:id[not(contains($skip-ids-var, concat(',',@root,',')))]">
                                <span style="float: right;" class="print_visible">
                                    <span class="span_label">
                                        <xsl:call-template name="getLocalizedString">
                                            <xsl:with-param name="key" select="'patientIdLong'"/>
                                            <xsl:with-param name="post" select="':&#160;'"/>
                                        </xsl:call-template>
                                    </span>
                                    <span class="span_value">
                                        <xsl:call-template name="show-id-set">
                                            <xsl:with-param name="in" select="hl7:id[not(contains($skip-ids-var, concat(',', @root, ',')))]"/>
                                            <xsl:with-param name="sep" select="', '"/>
                                        </xsl:call-template>
                                    </span>
                                </span>
                            </xsl:if>
                        </td>
                    </tr>
                    <xsl:if test="hl7:patient/hl7:guardian">
                        <tr>
                            <td class="td_label">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'Guardian'"/>
                                </xsl:call-template>
                            </td>
                            <td>
                                <span class="span_value">
                                    <xsl:call-template name="show-name-set">
                                        <xsl:with-param name="in" select="hl7:patient/hl7:guardian/*/hl7:name[1]"/>
                                    </xsl:call-template>
                                    <xsl:if test="hl7:patient/hl7:guardian/hl7:code">
                                        <xsl:text> - </xsl:text>
                                        <xsl:call-template name="show-code-set">
                                            <xsl:with-param name="in" select="hl7:patient/hl7:guardian/hl7:code"/>
                                        </xsl:call-template>
                                    </xsl:if>
                                </span>
                            </td>
                        </tr>
                    </xsl:if>
                </xsl:for-each>
                <!-- Authorization -->
                <xsl:for-each select="hl7:authorization/hl7:consent">
                    <tr>
                        <td class="td_label">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'consent'"/>
                            </xsl:call-template>
                        </td>
                        <td>
                            <xsl:if test="hl7:id">
                                <span class="span_label">
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'id'"/>
                                        <xsl:with-param name="post" select="': '"/>
                                    </xsl:call-template>
                                </span>
                                <span class="span_value">
                                    <xsl:call-template name="show-id-set">
                                        <xsl:with-param name="in" select="hl7:id"/>
                                    </xsl:call-template>
                                </span>
                            </xsl:if>
                            <xsl:if test="hl7:code">
                                <xsl:if test="hl7:id">
                                    <xsl:text>, </xsl:text>
                                </xsl:if>
                                <span class="span_label">
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'code'"/>
                                        <xsl:with-param name="post" select="': '"/>
                                    </xsl:call-template>
                                </span>
                                <span class="span_value">
                                    <xsl:call-template name="show-code-set">
                                        <xsl:with-param name="in" select="hl7:code"/>
                                    </xsl:call-template>
                                </span>
                            </xsl:if>
                            <xsl:if test="hl7:statusCode">
                                <xsl:if test="hl7:id | hl7:code">
                                    <xsl:text>, </xsl:text>
                                </xsl:if>
                                <span class="span_label">
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'statusCode'"/>
                                        <xsl:with-param name="post" select="': '"/>
                                    </xsl:call-template>
                                </span>
                                <span class="span_value">
                                    <xsl:call-template name="show-code">
                                        <xsl:with-param name="in" select="hl7:statusCode"/>
                                    </xsl:call-template>
                                </span>
                            </xsl:if>
                        </td>
                    </tr>
                </xsl:for-each>
                <!-- Encounter row -->
                <xsl:for-each select="hl7:componentOf/hl7:encompassingEncounter">
                    <tr>
                        <td class="td_label">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'Encounter'"/>
                            </xsl:call-template>
                        </td>
                        <td>
                            <xsl:if test="hl7:id">
                                <span class="span_label">
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'id'"/>
                                        <xsl:with-param name="post" select="': '"/>
                                    </xsl:call-template>
                                </span>
                                <span class="span_value">
                                    <xsl:call-template name="show-id-set">
                                        <xsl:with-param name="in" select="hl7:id"/>
                                    </xsl:call-template>
                                </span>
                            </xsl:if>
                            <xsl:if test="hl7:code">
                                <xsl:if test="hl7:id">
                                    <xsl:text>, </xsl:text>
                                </xsl:if>
                                <span class="span_label">
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'type'"/>
                                        <xsl:with-param name="post" select="': '"/>
                                    </xsl:call-template>
                                </span>
                                <span class="span_value">
                                    <xsl:call-template name="show-code-set">
                                        <xsl:with-param name="in" select="hl7:code"/>
                                    </xsl:call-template>
                                </span>
                            </xsl:if>
                            <xsl:if test="hl7:effectiveTime">
                                <xsl:if test="hl7:id | hl7:code">
                                    <xsl:text>, </xsl:text>
                                </xsl:if>
                                <span class="span_label">
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'effectiveTime'"/>
                                        <xsl:with-param name="post" select="': '"/>
                                    </xsl:call-template>
                                </span>
                                <span class="span_value">
                                    <xsl:call-template name="show-ivlts">
                                        <xsl:with-param name="in" select="hl7:effectiveTime"/>
                                    </xsl:call-template>
                                </span>
                            </xsl:if>
                            <xsl:if test="hl7:location/hl7:healthCareFacility/hl7:code">
                                <div>
                                    <span class="span_label">
                                        <xsl:call-template name="getLocalizedString">
                                            <xsl:with-param name="key" select="'location'"/>
                                            <xsl:with-param name="post" select="': '"/>
                                        </xsl:call-template>
                                    </span>
                                    <span class="span_value">
                                        <xsl:call-template name="show-code-set">
                                            <xsl:with-param name="in" select="hl7:location/hl7:healthCareFacility/hl7:code"/>
                                        </xsl:call-template>
                                    </span>
                                </div>
                            </xsl:if>
                        </td>
                    </tr>
                </xsl:for-each>
                <!-- DocumentationOf -->
                <xsl:for-each select="hl7:documentationOf/hl7:serviceEvent">
                    <xsl:variable name="displayName">
                        <xsl:if test="@classCode[not(. = 'ACT')]">
                            <xsl:call-template name="show-actClassCode">
                                <xsl:with-param name="clsCode" select="@classCode"/>
                            </xsl:call-template>
                        </xsl:if>
                    </xsl:variable>
                    <tr>
                        <td class="td_label">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'documentationOf'"/>
                            </xsl:call-template>
                        </td>
                        <td>
                            <xsl:if test="string-length($displayName) > 0">
                                <xsl:call-template name="firstCharCaseUp">
                                    <xsl:with-param name="data" select="$displayName"/>
                                </xsl:call-template>
                            </xsl:if>
                            <xsl:if test="hl7:code">
                                <xsl:if test="string-length($displayName) > 0">
                                    <xsl:text>, </xsl:text>
                                </xsl:if>
                                <span class="span_value">
                                    <xsl:call-template name="show-code">
                                        <xsl:with-param name="in" select="hl7:code"/>
                                    </xsl:call-template>
                                </span>
                            </xsl:if>
                            <xsl:if test="hl7:effectiveTime">
                                <xsl:if test="string-length($displayName) > 0 or hl7:code">
                                    <xsl:text>, </xsl:text>
                                </xsl:if>
                                <span class="span_label">
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'effectiveTime'"/>
                                        <xsl:with-param name="post" select="': '"/>
                                    </xsl:call-template>
                                </span>
                                <span class="span_value">
                                    <xsl:call-template name="show-ivlts">
                                        <xsl:with-param name="in" select="hl7:effectiveTime"/>
                                    </xsl:call-template>
                                </span>
                            </xsl:if>
                            <xsl:for-each select="hl7:performer/hl7:assignedEntity/hl7:assignedPerson[hl7:name]">
                                <xsl:if test="string-length($displayName) > 0 or ancestor::hl7:serviceEvent[1]/hl7:code or ancestor::hl7:serviceEvent[1]/hl7:effectiveTime">
                                    <xsl:text>, </xsl:text>
                                </xsl:if>
                                <span class="span_label">
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="concat('typeCode-', ancestor::hl7:performer[1]/@typeCode)"/>
                                        <xsl:with-param name="post" select="': '"/>
                                    </xsl:call-template>
                                </span>
                                <span class="span_value">
                                    <xsl:call-template name="show-name">
                                        <xsl:with-param name="in" select="hl7:name[1]"/>
                                    </xsl:call-template>
                                </span>
                            </xsl:for-each>
                        </td>
                    </tr>
                </xsl:for-each>
                <!-- InFulfillmentOf -->
                <xsl:for-each select="hl7:inFulfillmentOf/hl7:order">
                    <tr>
                        <td class="td_label">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'typeCode-FLFS'"/>
                            </xsl:call-template>
                        </td>
                        <td>
                            <span class="span_label">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'order'"/>
                                </xsl:call-template>
                                <xsl:text> </xsl:text>
                            </span>
                            <xsl:if test="hl7:id">
                                <span class="span_label">
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'id'"/>
                                        <xsl:with-param name="post" select="': '"/>
                                    </xsl:call-template>
                                </span>
                                <span class="span_value">
                                    <xsl:call-template name="show-id-set">
                                        <xsl:with-param name="in" select="hl7:id"/>
                                    </xsl:call-template>
                                </span>
                            </xsl:if>
                            <xsl:if test="hl7:code">
                                <xsl:if test="hl7:id">
                                    <xsl:text>, </xsl:text>
                                </xsl:if>
                                <span class="span_label">
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'code'"/>
                                        <xsl:with-param name="post" select="': '"/>
                                    </xsl:call-template>
                                </span>
                                <span class="span_value">
                                    <xsl:call-template name="show-code-set">
                                        <xsl:with-param name="in" select="hl7:code"/>
                                    </xsl:call-template>
                                </span>
                            </xsl:if>
                            <xsl:if test="hl7:priorityCode">
                                <xsl:if test="hl7:id | hl7:code">
                                    <xsl:text>, </xsl:text>
                                </xsl:if>
                                <span class="span_label">
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'priorityCode'"/>
                                        <xsl:with-param name="post" select="': '"/>
                                    </xsl:call-template>
                                </span>
                                <span class="span_value">
                                    <xsl:call-template name="show-code-set">
                                        <xsl:with-param name="in" select="hl7:priorityCode"/>
                                    </xsl:call-template>
                                </span>
                            </xsl:if>
                        </td>
                    </tr>
                </xsl:for-each>
                <!-- Author row -->
                <xsl:for-each select="hl7:author/hl7:assignedAuthor">
                    <tr>
                        <td class="td_label">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'author'"/>
                            </xsl:call-template>
                        </td>
                        <td>
                            <span class="span_value">
                                <xsl:choose>
                                    <xsl:when test="hl7:assignedPerson/hl7:name">
                                        <xsl:call-template name="show-name-set">
                                            <xsl:with-param name="in" select="hl7:assignedPerson/hl7:name[1]"/>
                                        </xsl:call-template>
                                        <xsl:if test="hl7:assignedPerson/hl7:desc">
                                            <div>
                                                <xsl:value-of select="hl7:assignedPerson/hl7:desc"/>
                                            </div>
                                        </xsl:if>
                                        <xsl:if test="hl7:assignedPerson/hl7:birthTime">
                                            <xsl:text> </xsl:text>
                                            <xsl:call-template name="getLocalizedString">
                                                <xsl:with-param name="key" select="'birthTimeLong'"/>
                                            </xsl:call-template>
                                            <xsl:text> </xsl:text>
                                            <xsl:call-template name="show-timestamp">
                                                <xsl:with-param name="in" select="hl7:assignedPerson/hl7:birthTime"/>
                                            </xsl:call-template>
                                        </xsl:if>
                                    </xsl:when>
                                    <xsl:when test="hl7:assignedAuthoringDevice/hl7:softwareName">
                                        <xsl:value-of select="hl7:assignedAuthoringDevice/hl7:softwareName"/>
                                    </xsl:when>
                                    <xsl:when test="hl7:assignedDevice/hl7:softwareName">
                                        <xsl:value-of select="hl7:assignedDevice/hl7:softwareName/@value"/>
                                    </xsl:when>
                                </xsl:choose>
                            </span>
                            <xsl:if test="hl7:representedOrganization">
                                <xsl:variable name="organizationName">
                                    <xsl:choose>
                                        <xsl:when test="hl7:representedOrganization/hl7:name">
                                            <xsl:call-template name="show-name-set">
                                                <xsl:with-param name="in" select="hl7:representedOrganization/hl7:name[1]"/>
                                            </xsl:call-template>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:variable name="id-root" select="(hl7:representedOrganization/hl7:id[not(@nullFlavor)])[1]/@root"/>
                                            <xsl:variable name="id-ext" select="(hl7:representedOrganization/hl7:id[not(@nullFlavor)])[1]/@extension"/>
                                            <xsl:choose>
                                                <xsl:when test="$id-ext">
                                                    <xsl:call-template name="show-name-set">
                                                        <xsl:with-param name="in" select="(ancestor::hl7:ClinicalDocument//*[hl7:id[@root = $id-root][@extension = $id-ext]][hl7:name])[1]/hl7:name[1]"/>
                                                    </xsl:call-template>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:call-template name="show-name-set">
                                                        <xsl:with-param name="in" select="(ancestor::hl7:ClinicalDocument//*[hl7:id[@root = $id-root][not(@extension)]][hl7:name])[1]/hl7:name[1]"/>
                                                    </xsl:call-template>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </xsl:variable>
                                <xsl:text>, </xsl:text>
                                <span class="span_label">
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'organization'"/>
                                        <xsl:with-param name="post" select="': '"/>
                                    </xsl:call-template>
                                </span>
                                <span class="span_value">
                                    <xsl:choose>
                                        <xsl:when test="string-length(normalize-space($organizationName)) > 0">
                                            <xsl:value-of select="normalize-space($organizationName)"/>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:call-template name="show-id-set">
                                                <xsl:with-param name="in" select="hl7:representedOrganization/hl7:id"/>
                                            </xsl:call-template>
                                        </xsl:otherwise>
                                    </xsl:choose>
                                </span>
                            </xsl:if>
                            <xsl:if test="../hl7:time[@value | *]">
                                <xsl:text>, </xsl:text>
                                <span class="span_label">
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'Authored_on'"/>
                                        <xsl:with-param name="post" select="': '"/>
                                    </xsl:call-template>
                                </span>
                                <span class="span_value">
                                    <xsl:call-template name="show-timestamp">
                                        <xsl:with-param name="in" select="../hl7:time"/>
                                    </xsl:call-template>
                                </span>
                            </xsl:if>
                        </td>
                    </tr>
                </xsl:for-each>
            </tbody>
        </table>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Handle general document propreties (id + creation time)</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="documentGeneral">
        <table class="header_table">
            <tbody>
                <tr>
                    <td class="td_label td_label_width">
                        <xsl:call-template name="getLocalizedString">
                            <xsl:with-param name="key" select="'Document'"/>
                        </xsl:call-template>
                    </td>
                    <td style="width: 30%;">
                        <xsl:call-template name="idVersionSetId"/>
                    </td>
                    <td class="td_label td_label_width">
                        <xsl:call-template name="getLocalizedString">
                            <xsl:with-param name="key" select="'Created_on'"/>
                        </xsl:call-template>
                    </td>
                    <td>
                        <xsl:call-template name="show-timestamp">
                            <xsl:with-param name="in" select="hl7:effectiveTime"/>
                        </xsl:call-template>
                    </td>
                </tr>
            </tbody>
        </table>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle confidentiality</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="confidentiality">
        <table class="header_table">
            <tbody>
                <td class="td_label">
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="'Confidentiality'"/>
                    </xsl:call-template>
                </td>
                <td style="width: 80%;">
                    <xsl:call-template name="show-code-set">
                        <xsl:with-param name="in" select="hl7:confidentialityCode"/>
                    </xsl:call-template>
                </td>
            </tbody>
        </table>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Handle CDA Header author</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="author">
        <xsl:for-each select="hl7:author/hl7:assignedAuthor">
            <table class="header_table">
                <tbody>
                    <tr>
                        <td class="td_label td_label_width">
                            <xsl:if test="hl7:representedOrganization/hl7:addr | hl7:representedOrganization/hl7:telecom">
                                <xsl:attribute name="rowspan">2</xsl:attribute>
                            </xsl:if>
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'author'"/>
                            </xsl:call-template>
                        </td>
                        <td>
                            <xsl:choose>
                                <xsl:when test="hl7:addr | hl7:telecom">
                                    <xsl:attribute name="style">width: 30%;</xsl:attribute>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:attribute name="colspan">3</xsl:attribute>
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:if test="hl7:representedOrganization/hl7:addr | hl7:representedOrganization/hl7:telecom">
                                <xsl:attribute name="rowspan">2</xsl:attribute>
                            </xsl:if>
                            <xsl:choose>
                                <xsl:when test="hl7:assignedPerson/hl7:name">
                                    <xsl:call-template name="show-name-set">
                                        <xsl:with-param name="in" select="hl7:assignedPerson/hl7:name"/>
                                    </xsl:call-template>
                                    <xsl:if test="hl7:assignedPerson/hl7:desc">
                                        <div>
                                            <xsl:value-of select="hl7:assignedPerson/hl7:desc"/>
                                        </div>
                                    </xsl:if>
                                    <xsl:if test="hl7:assignedPerson/hl7:birthTime">
                                        <xsl:text> </xsl:text>
                                        <xsl:call-template name="getLocalizedString">
                                            <xsl:with-param name="key" select="'birthTimeLong'"/>
                                        </xsl:call-template>
                                        <xsl:text> </xsl:text>
                                        <xsl:call-template name="show-timestamp">
                                            <xsl:with-param name="in" select="hl7:assignedPerson/hl7:birthTime"/>
                                        </xsl:call-template>
                                    </xsl:if>
                                </xsl:when>
                                <xsl:when test="hl7:assignedAuthoringDevice/hl7:softwareName">
                                    <xsl:value-of select="hl7:assignedAuthoringDevice/hl7:softwareName"/>
                                </xsl:when>
                                <xsl:when test="hl7:assignedDevice/hl7:softwareName">
                                    <xsl:value-of select="hl7:assignedDevice/hl7:softwareName/@value"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:call-template name="show-id-set">
                                        <xsl:with-param name="in" select="hl7:in"/>
                                        <xsl:with-param name="sep" select="'br'"/>
                                    </xsl:call-template>
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:if test="hl7:code">
                                <xsl:text> - </xsl:text>
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'code'"/>
                                    <xsl:with-param name="post" select="': '"/>
                                </xsl:call-template>
                                <xsl:call-template name="show-code-set">
                                    <xsl:with-param name="in" select="hl7:code"/>
                                    <xsl:with-param name="sep" select="'br'"/>
                                </xsl:call-template>
                            </xsl:if>
                            <xsl:if test="hl7:representedOrganization">
                                <xsl:text>, </xsl:text>
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'organization'"/>
                                    <xsl:with-param name="post" select="': '"/>
                                </xsl:call-template>
                            </xsl:if>
                            <xsl:variable name="name-set">
                                <xsl:choose>
                                    <xsl:when test="hl7:representedOrganization/hl7:name">
                                        <xsl:copy-of select="hl7:representedOrganization/hl7:name"/>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:variable name="id-root" select="(hl7:representedOrganization/hl7:id[not(@nullFlavor)])[1]/@root"/>
                                        <xsl:variable name="id-ext" select="(hl7:representedOrganization/hl7:id[not(@nullFlavor)])[1]/@extension"/>
                                        <xsl:choose>
                                            <xsl:when test="$id-ext">
                                                <xsl:copy-of select="(ancestor::hl7:ClinicalDocument//*[hl7:id[@root = $id-root][@extension = $id-ext]][hl7:name])[1]/hl7:name"/>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:copy-of select="(ancestor::hl7:ClinicalDocument//*[hl7:id[@root = $id-root][not(@extension)]][hl7:name])[1]/hl7:name"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:variable>
                            <xsl:choose>
                                <xsl:when test="exslt:node-set($name-set)">
                                    <xsl:call-template name="show-name-set">
                                        <xsl:with-param name="in" select="exslt:node-set($name-set)"/>
                                    </xsl:call-template>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:call-template name="show-id-set">
                                        <xsl:with-param name="in" select="hl7:representedOrganization/hl7:id"/>
                                    </xsl:call-template>
                                </xsl:otherwise>
                            </xsl:choose>
                        </td>
                        <xsl:if test="hl7:addr | hl7:telecom">
                            <td class="td_label td_label_width">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'Contact_details'"/>
                                </xsl:call-template>
                            </td>
                            <td>
                                <xsl:call-template name="show-contactInfo">
                                    <xsl:with-param name="contact" select="."/>
                                </xsl:call-template>
                            </td>
                        </xsl:if>
                    </tr>
                    <xsl:if test="hl7:representedOrganization/hl7:addr | hl7:representedOrganization/hl7:telecom">
                        <tr>
                            <td class="td_label td_label_width">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'Contact_details'"/>
                                </xsl:call-template>
                                <xsl:text> (</xsl:text>
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'organization'"/>
                                </xsl:call-template>
                                <xsl:text>)</xsl:text>
                            </td>
                            <td>
                                <xsl:call-template name="show-contactInfo">
                                    <xsl:with-param name="contact" select="hl7:representedOrganization"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                    </xsl:if>
                </tbody>
            </table>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Handle CDA Header authenticator</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="authenticator">
        <xsl:for-each select="hl7:authenticator">
            <table class="header_table">
                <tbody>
                    <tr>
                        <td class="td_label td_label_width">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'typeCode-AUTHEN'"/>
                            </xsl:call-template>
                        </td>
                        <td>
                            <xsl:if test="hl7:assignedEntity/hl7:addr | hl7:assignedEntity/hl7:telecom">
                                <xsl:attribute name="style">width: 30%;</xsl:attribute>
                            </xsl:if>
                            <xsl:call-template name="show-assignedEntity">
                                <xsl:with-param name="asgnEntity" select="hl7:assignedEntity"/>
                            </xsl:call-template>
                            <xsl:text> </xsl:text>
                            <xsl:call-template name="show-code-set">
                                <xsl:with-param name="in" select="hl7:signatureCode"/>
                            </xsl:call-template>
                            <xsl:if test="hl7:time/@value">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="pre" select="'&#160;'"/>
                                    <xsl:with-param name="key" select="'at'"/>
                                    <xsl:with-param name="post" select="'&#160;'"/>
                                </xsl:call-template>
                                <xsl:call-template name="show-timestamp">
                                    <xsl:with-param name="in" select="hl7:time"/>
                                </xsl:call-template>
                            </xsl:if>
                            <!-- SDTC defines sdtc:signatureText including a digital signature. XSLT lacks tools to verify validity, but may signal its presence -->
                            <xsl:if test="*[local-name() = 'signatureText']">
                                <xsl:text> </xsl:text>
                                <img>
                                    <xsl:attribute name="src">
                                        <xsl:text>data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABQAAAAQCAYAAAAWGF8bAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAACXBIWXMAAAsTAAALEwEAmpwYAAACC2lUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iWE1QIENvcmUgNS40LjAiPgogICA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPgogICAgICA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIgogICAgICAgICAgICB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyI+CiAgICAgICAgIDx0aWZmOlJlc29sdXRpb25Vbml0PjI8L3RpZmY6UmVzb2x1dGlvblVuaXQ+CiAgICAgICAgIDx0aWZmOkNvbXByZXNzaW9uPjE8L3RpZmY6Q29tcHJlc3Npb24+CiAgICAgICAgIDx0aWZmOk9yaWVudGF0aW9uPjE8L3RpZmY6T3JpZW50YXRpb24+CiAgICAgICAgIDx0aWZmOlBob3RvbWV0cmljSW50ZXJwcmV0YXRpb24+MjwvdGlmZjpQaG90b21ldHJpY0ludGVycHJldGF0aW9uPgogICAgICA8L3JkZjpEZXNjcmlwdGlvbj4KICAgPC9yZGY6UkRGPgo8L3g6eG1wbWV0YT4KD0UqkwAAApdJREFUOBGVVL9LslEUfszbD12yBmmRICmkbAiC0v9AQadAQdAaoiFoam5qaYmWCAKFGtqiRQQHpyJ1avMHBkFIQRItYj/Mbu9zPm7IR8P3Hbjvfb3nnOc+5zzn1Vav1/XR0RHe398xMDAArTX+x2w2m+QopbCxsQF1cnKCg4MDeDwePD8/CxaDaCb473dx9j3GxsbQbDYxPDwM9fn5KS7uQ0ND8m4ATY5hbS4wfp5zfX19YXR0VAgolknzer2YnJxEr9eTIJNkQH/bCcZS7+/vcXl5KSHKJIZCIaysrODj40N6SS9vNqzMxf3A9DscDlxcXAggYxQPadlsFtVqFU9PTxgZGRFgl8sFu90urF9fX38EMySYOzg4iLu7O8Fgdcr0p1aroVgs4vj4GNPT07i9vcX6+roE+nw+7O/vS9MZ3w/IywuFAm5ubqQyJRnW4+XlBVdXVxgfH8f19TWCwSBKpRKWl5eFcavVEkCKZ6oiOIVkrjHFkmgcHbfbjZmZGeNDpVLB4eEhNjc3kUql5Jy9np+fl5bwgCWzOpqIZOhzDqkWLRwOI5fLodFoYGpqSs7ImMxjsRgCgQDe3t4EwIiSz+f/lGzoU/atrS0kk0mcnp4iHo9jdnYW6XRaAAnOalZXV+V3/4Pi0Yhl297e1mdnZ3h4eBDp/X6/lEohKMzS0hIWFhbw+PgogJw7LiMmK+S4tNttJBIJKE44wWgcDZZ1fn6OSCQCczMV/BdzOp1Qa2tr4LdIFScmJlAul5HJZLC4uCjjs7OzI8CcsX4jMzNCLJXjE41GQbU0l9VkbSXpvb09bTVd7+7uamtEtMVa/Na/kf5tMZfn3W5Xlq3T6VgXaekDd44Kv2uKMDc39zPE/ex+ezdsvwFm7oHDCGA3ogAAAABJRU5ErkJggg==</xsl:text>
                                    </xsl:attribute>
                                    <xsl:attribute name="alt"></xsl:attribute>
                                    <xsl:attribute name="title">
                                        <xsl:call-template name="getLocalizedString">
                                            <xsl:with-param name="key" select="'Signature present but not verified'"/>
                                        </xsl:call-template>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="*[local-name() = 'signatureText']/*[local-name() = 'thumbnail']"/>
                                    </xsl:attribute>
                                </img>
                            </xsl:if>
                        </td>
                        <xsl:if test="hl7:assignedEntity/hl7:addr | hl7:assignedEntity/hl7:telecom">
                            <td class="td_label td_label_width">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'Contact_details'"/>
                                </xsl:call-template>
                            </td>
                            <td>
                                <xsl:call-template name="show-contactInfo">
                                    <xsl:with-param name="contact" select="hl7:assignedEntity"/>
                                </xsl:call-template>
                            </td>
                        </xsl:if>
                    </tr>
                </tbody>
            </table>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle CDA Header legalAuthenticator</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="legalAuthenticator">
        <xsl:for-each select="hl7:legalAuthenticator">
            <table class="header_table">
                <tbody>
                    <tr>
                        <td class="td_label td_label_width">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'typeCode-LA'"/>
                            </xsl:call-template>
                        </td>
                        <td>
                            <xsl:if test="hl7:assignedEntity/hl7:addr | hl7:assignedEntity/hl7:telecom">
                                <xsl:attribute name="style">width: 30%;</xsl:attribute>
                            </xsl:if>
                            <xsl:call-template name="show-assignedEntity">
                                <xsl:with-param name="asgnEntity" select="hl7:assignedEntity"/>
                            </xsl:call-template>
                            <xsl:text> </xsl:text>
                            <xsl:call-template name="show-code-set">
                                <xsl:with-param name="in" select="hl7:signatureCode"/>
                            </xsl:call-template>
                            <xsl:if test="hl7:time/@value">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="pre" select="'&#160;'"/>
                                    <xsl:with-param name="key" select="'at'"/>
                                    <xsl:with-param name="post" select="'&#160;'"/>
                                </xsl:call-template>
                                <xsl:call-template name="show-timestamp">
                                    <xsl:with-param name="in" select="hl7:time"/>
                                </xsl:call-template>
                            </xsl:if>
                        </td>
                        <xsl:if test="hl7:assignedEntity/hl7:addr | hl7:assignedEntity/hl7:telecom">
                            <td class="td_label td_label_width">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'Contact_details'"/>
                                </xsl:call-template>
                            </td>
                            <td>
                                <xsl:call-template name="show-contactInfo">
                                    <xsl:with-param name="contact" select="hl7:assignedEntity"/>
                                </xsl:call-template>
                            </td>
                        </xsl:if>
                    </tr>
                </tbody>
            </table>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Handle CDA Header dataEnterer</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="dataEnterer">
        <xsl:for-each select="hl7:dataEnterer">
            <table class="header_table">
                <tbody>
                    <tr>
                        <td class="td_label td_label_width">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'typeCode-ENT'"/>
                            </xsl:call-template>
                        </td>
                        <td>
                            <xsl:if test="hl7:assignedEntity/hl7:addr | hl7:dataEnterer/hl7:assignedEntity/hl7:telecom">
                                <xsl:attribute name="style">width: 30%;</xsl:attribute>
                            </xsl:if>
                            <xsl:call-template name="show-assignedEntity">
                                <xsl:with-param name="asgnEntity" select="hl7:assignedEntity"/>
                            </xsl:call-template>
                        </td>
                        <xsl:if test="hl7:assignedEntity/hl7:addr | hl7:dataEnterer/hl7:assignedEntity/hl7:telecom">
                            <td class="td_label td_label_width">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'Contact_details'"/>
                                </xsl:call-template>
                            </td>
                            <td>
                                <xsl:call-template name="show-contactInfo">
                                    <xsl:with-param name="contact" select="hl7:assignedEntity"/>
                                </xsl:call-template>
                            </td>
                        </xsl:if>
                    </tr>
                </tbody>
            </table>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Handle CDA Header componentOf</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="componentOf">
        <xsl:for-each select="hl7:componentOf/hl7:encompassingEncounter">
            <table class="header_table">
                <tbody>
                    <tr>
                        <td class="td_label td_label_width">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'Encounter'"/>
                            </xsl:call-template>
                        </td>
                        <td>
                            <xsl:choose>
                                <xsl:when test="hl7:effectiveTime">
                                    <xsl:attribute name="style">width: 30%;</xsl:attribute>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:attribute name="colspan">3</xsl:attribute>
                                </xsl:otherwise>
                            </xsl:choose>
                            <table class="table_simple">
                                <tbody>
                                    <tr>
                                        <td class="td_label">
                                            <xsl:call-template name="getLocalizedString">
                                                <xsl:with-param name="key" select="'id'"/>
                                            </xsl:call-template>
                                        </td>
                                        <td>
                                            <xsl:call-template name="show-id-set">
                                                <xsl:with-param name="in" select="hl7:id"/>
                                            </xsl:call-template>
                                        </td>
                                    </tr>
                                    <xsl:if test="hl7:code">
                                        <tr>
                                            <td class="td_label">
                                                <xsl:call-template name="getLocalizedString">
                                                    <xsl:with-param name="key" select="'type'"/>
                                                </xsl:call-template>
                                            </td>
                                            <td>
                                                <xsl:call-template name="show-code-set">
                                                    <xsl:with-param name="in" select="hl7:code"/>
                                                </xsl:call-template>
                                            </td>
                                        </tr>
                                    </xsl:if>
                                </tbody>
                            </table>
                        </td>
                        <xsl:if test="hl7:effectiveTime">
                            <td class="td_label td_label_width">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'Encounter Date'"/>
                                </xsl:call-template>
                            </td>
                            <td>
                                <xsl:call-template name="show-ivlts">
                                    <xsl:with-param name="in" select="hl7:effectiveTime"/>
                                </xsl:call-template>
                            </td>
                        </xsl:if>
                    </tr>
                    <xsl:if test="hl7:dischargeDispositionCode | sdtc:admissionReferralSourceCode | hl7:admissionReferralSourceCode">
                        <tr>
                            <xsl:choose>
                                <xsl:when test="sdtc:admissionReferralSourceCode | hl7:admissionReferralSourceCode">
                                    <td class="td_label td_label_width">
                                        <xsl:call-template name="getLocalizedString">
                                            <xsl:with-param name="key" select="'Encounter Admission Referral Source'"/>
                                        </xsl:call-template>
                                    </td>
                                    <td style="width: 30%;">
                                        <xsl:call-template name="show-code-set">
                                            <xsl:with-param name="in" select="sdtc:admissionReferralSourceCode | hl7:admissionReferralSourceCode"/>
                                        </xsl:call-template>
                                    </td>
                                    <td class="td_label td_label_width">
                                        <xsl:call-template name="getLocalizedString">
                                            <xsl:with-param name="key" select="'Encounter Discharge Disposition'"/>
                                        </xsl:call-template>
                                    </td>
                                    <td style="width: 30%;">
                                        <xsl:call-template name="show-code-set">
                                            <xsl:with-param name="in" select="hl7:dischargeDispositionCode"/>
                                        </xsl:call-template>
                                    </td>
                                </xsl:when>
                                <xsl:otherwise>
                                    <td class="td_label td_label_width">
                                        <xsl:call-template name="getLocalizedString">
                                            <xsl:with-param name="key" select="'Encounter Discharge Disposition'"/>
                                        </xsl:call-template>
                                    </td>
                                    <td colspan="3">
                                        <xsl:call-template name="show-code-set">
                                            <xsl:with-param name="in" select="hl7:dischargeDispositionCode"/>
                                        </xsl:call-template>
                                    </td>
                                </xsl:otherwise>
                            </xsl:choose>
                        </tr>
                    </xsl:if>
                    <xsl:if test="hl7:location">
                        <tr>
                            <td class="td_label td_label_width">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'Encounter Location'"/>
                                </xsl:call-template>
                            </td>
                            <td colspan="3">
                                <xsl:choose>
                                    <!-- FIXME: playingPlace is CDAr3 May Ballot specific. This is unlikely to remain this way -->
                                    <!-- FIXME: scopingOrganization is CDAr3 May Ballot specific. This is unlikely to remain this way -->
                                    <xsl:when test="hl7:location/hl7:healthCareFacility/hl7:*[local-name() = 'location' or local-name() = 'playingPlace']/hl7:name">
                                        <xsl:call-template name="show-name-set">
                                            <xsl:with-param name="in" select="hl7:location/hl7:healthCareFacility/hl7:*[local-name() = 'location' or local-name() = 'playingPlace']/hl7:name"/>
                                        </xsl:call-template>
                                        <xsl:if test="hl7:location/hl7:healthCareFacility/hl7:*[local-name() = 'location' or local-name() = 'playingPlace']/hl7:addr">
                                            <xsl:text> (</xsl:text>
                                            <xsl:call-template name="show-address-set">
                                                <xsl:with-param name="in" select="hl7:location/hl7:healthCareFacility/hl7:*[local-name() = 'location' or local-name() = 'playingPlace']/hl7:addr"/>
                                                <xsl:with-param name="sep" select="', '"/>
                                            </xsl:call-template>
                                            <xsl:text>)</xsl:text>
                                        </xsl:if>
                                        <xsl:for-each select="
                                                hl7:location/hl7:healthCareFacility/hl7:serviceProviderOrganization/hl7:name |
                                                hl7:location/hl7:healthCareFacility/hl7:scopingOrganization/hl7:name">
                                            <xsl:call-template name="getLocalizedString">
                                                <xsl:with-param name="pre" select="'&#160;'"/>
                                                <xsl:with-param name="key" select="'of'"/>
                                                <xsl:with-param name="post" select="'&#160;'"/>
                                            </xsl:call-template>
                                            <xsl:call-template name="show-name-set">
                                                <xsl:with-param name="in" select="hl7:location/hl7:healthCareFacility/hl7:serviceProviderOrganization/hl7:name"/>
                                            </xsl:call-template>
                                        </xsl:for-each>
                                    </xsl:when>
                                    <xsl:when test="hl7:location/hl7:healthCareFacility/hl7:code">
                                        <xsl:call-template name="show-code-set">
                                            <xsl:with-param name="in" select="hl7:location/hl7:healthCareFacility/hl7:code"/>
                                        </xsl:call-template>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:if test="hl7:location/hl7:healthCareFacility/hl7:id">
                                            <xsl:call-template name="getLocalizedString">
                                                <xsl:with-param name="key" select="'id'"/>
                                                <xsl:with-param name="post" select="':'"/>
                                            </xsl:call-template>
                                            <xsl:call-template name="show-id-set">
                                                <xsl:with-param name="in" select="hl7:location/hl7:healthCareFacility/hl7:id"/>
                                            </xsl:call-template>
                                        </xsl:if>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </td>
                        </tr>
                    </xsl:if>
                    <xsl:if test="hl7:responsibleParty">
                        <tr>
                            <td class="td_label td_label_width">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'responsibleParty'"/>
                                </xsl:call-template>
                            </td>
                            <td>
                                <xsl:choose>
                                    <xsl:when test="hl7:responsibleParty/hl7:assignedEntity/hl7:addr | hl7:responsibleParty/hl7:assignedEntity/hl7:telecom">
                                        <xsl:attribute name="style">width: 30%;</xsl:attribute>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:attribute name="colspan">3</xsl:attribute>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:call-template name="show-assignedEntity">
                                    <xsl:with-param name="asgnEntity" select="hl7:responsibleParty/hl7:assignedEntity"/>
                                </xsl:call-template>
                            </td>
                            <xsl:if test="hl7:responsibleParty/hl7:assignedEntity/hl7:addr | hl7:responsibleParty/hl7:assignedEntity/hl7:telecom">
                                <td class="td_label td_label_width">
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'Contact_details'"/>
                                    </xsl:call-template>
                                </td>
                                <td>
                                    <xsl:call-template name="show-contactInfo">
                                        <xsl:with-param name="contact" select="hl7:responsibleParty/hl7:assignedEntity"/>
                                    </xsl:call-template>
                                </td>
                            </xsl:if>
                        </tr>
                    </xsl:if>
                    <xsl:for-each select="hl7:encounterParticipant">
                        <tr>
                            <td class="td_label td_label_width">
                                <xsl:call-template name="show-participationTypeOrCode">
                                    <xsl:with-param name="typeCode" select="@typeCode"/>
                                </xsl:call-template>
                                <xsl:if test="hl7:time">
                                    <xsl:text> (</xsl:text>
                                    <xsl:call-template name="show-ivlts">
                                        <xsl:with-param name="in" select="hl7:time"/>
                                    </xsl:call-template>
                                    <xsl:text>)</xsl:text>
                                </xsl:if>
                            </td>
                            <td>
                                <xsl:choose>
                                    <xsl:when test="hl7:assignedEntity/hl7:addr | hl7:assignedEntity/hl7:telecom">
                                        <xsl:attribute name="style">width: 30%;</xsl:attribute>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:attribute name="colspan">3</xsl:attribute>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:call-template name="show-assignedEntity">
                                    <xsl:with-param name="asgnEntity" select="hl7:assignedEntity"/>
                                </xsl:call-template>
                            </td>
                            <xsl:if test="hl7:assignedEntity/hl7:addr | hl7:assignedEntity/hl7:telecom">
                                <td class="td_label td_label_width">
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'Contact_details'"/>
                                    </xsl:call-template>
                                </td>
                                <td>
                                    <xsl:call-template name="show-contactInfo">
                                        <xsl:with-param name="contact" select="hl7:assignedEntity"/>
                                    </xsl:call-template>
                                </td>
                            </xsl:if>
                        </tr>
                    </xsl:for-each>
                </tbody>
            </table>
        </xsl:for-each>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Handle CDA Header custodian</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="custodian">
        <xsl:for-each select="hl7:custodian">
            <table class="header_table">
                <tbody>
                    <tr>
                        <td class="td_label td_label_width">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'custodian'"/>
                            </xsl:call-template>
                        </td>
                        <td>
                            <xsl:if test="hl7:assignedCustodian/hl7:representedCustodianOrganization/hl7:addr | hl7:custodian/hl7:assignedCustodian/hl7:representedCustodianOrganization/hl7:telecom">
                                <xsl:attribute name="style">width: 30%;</xsl:attribute>
                            </xsl:if>
                            <xsl:choose>
                                <xsl:when test="hl7:assignedCustodian/hl7:representedCustodianOrganization/hl7:name">
                                    <xsl:call-template name="show-name-set">
                                        <xsl:with-param name="in" select="hl7:assignedCustodian/hl7:representedCustodianOrganization/hl7:name"/>
                                        <xsl:with-param name="sep" select="'br'"/>
                                    </xsl:call-template>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:call-template name="show-id-set">
                                        <xsl:with-param name="in" select="hl7:assignedCustodian/hl7:representedCustodianOrganization/hl7:id"/>
                                        <xsl:with-param name="sep" select="'br'"/>
                                    </xsl:call-template>
                                </xsl:otherwise>
                            </xsl:choose>
                        </td>
                        <xsl:if test="hl7:assignedCustodian/hl7:representedCustodianOrganization/hl7:addr | hl7:custodian/hl7:assignedCustodian/hl7:representedCustodianOrganization/hl7:telecom">
                            <td class="td_label td_label_width">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'Contact_details'"/>
                                </xsl:call-template>
                            </td>
                            <td>
                                <xsl:call-template name="show-contactInfo">
                                    <xsl:with-param name="contact" select="hl7:assignedCustodian/hl7:representedCustodianOrganization"/>
                                </xsl:call-template>
                            </td>
                        </xsl:if>
                    </tr>
                </tbody>
            </table>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle CDA Header documentationOf</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="documentationOf">
        <xsl:for-each select="hl7:documentationOf">
            <table class="header_table">
                <tbody>
                    <xsl:if test="hl7:serviceEvent[@classCode | hl7:code]">
                        <xsl:variable name="displayName">
                            <xsl:if test="hl7:serviceEvent/@classCode[not(. = 'ACT')]">
                                <xsl:call-template name="show-actClassCode">
                                    <xsl:with-param name="clsCode" select="hl7:serviceEvent/@classCode"/>
                                </xsl:call-template>
                            </xsl:if>
                        </xsl:variable>
                        <tr>
                            <td class="td_label td_label_width">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'documentationOf'"/>
                                </xsl:call-template>
                                <xsl:if test="string-length($displayName) > 0">
                                    <xsl:text> - </xsl:text>
                                    <xsl:value-of select="$displayName"/>
                                </xsl:if>
                            </td>
                            <td style="width: 80%;" colspan="3">
                                <xsl:call-template name="show-code">
                                    <xsl:with-param name="in" select="hl7:serviceEvent/hl7:code"/>
                                </xsl:call-template>
                                <xsl:call-template name="show-ivlts">
                                    <xsl:with-param name="in" select="hl7:serviceEvent/hl7:effectiveTime"/>
                                </xsl:call-template>
                                <xsl:call-template name="show-code">
                                    <xsl:with-param name="in" select="hl7:serviceEvent/hl7:statusCode"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                    </xsl:if>
                    <xsl:for-each select="hl7:serviceEvent/hl7:performer">
                        <xsl:variable name="displayName">
                            <xsl:call-template name="show-participationType">
                                <xsl:with-param name="ptype" select="@typeCode"/>
                            </xsl:call-template>
                            <xsl:text> - </xsl:text>
                            <xsl:if test="hl7:functionCode//@code">
                                <xsl:call-template name="show-code-set">
                                    <xsl:with-param name="in" select="hl7:functionCode"/>
                                </xsl:call-template>
                            </xsl:if>
                        </xsl:variable>
                        <tr>
                            <td class="td_label td_label_width">
                                <xsl:call-template name="firstCharCaseUp">
                                    <xsl:with-param name="data" select="$displayName"/>
                                </xsl:call-template>
                            </td>
                            <td>
                                <xsl:choose>
                                    <xsl:when test="hl7:assignedEntity/hl7:addr | hl7:assignedEntity/hl7:telecom">
                                        <xsl:attribute name="style">width: 30%;</xsl:attribute>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:attribute name="colspan">3</xsl:attribute>
                                    </xsl:otherwise>
                                </xsl:choose>
                                <xsl:call-template name="show-assignedEntity">
                                    <xsl:with-param name="asgnEntity" select="hl7:assignedEntity"/>
                                </xsl:call-template>
                            </td>
                            <xsl:if test="hl7:assignedEntity/hl7:addr | hl7:assignedEntity/hl7:telecom">
                                <td class="td_label td_label_width">
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'Contact_details'"/>
                                    </xsl:call-template>
                                </td>
                                <td>
                                    <xsl:call-template name="show-contactInfo">
                                        <xsl:with-param name="contact" select="hl7:assignedEntity"/>
                                    </xsl:call-template>
                                </td>
                            </xsl:if>
                        </tr>
                    </xsl:for-each>
                </tbody>
            </table>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle CDA Header inFulfillmentOf</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="inFulfillmentOf">
        <xsl:for-each select="hl7:inFulfillmentOf">
            <table class="header_table">
                <tbody>
                    <tr>
                        <td class="td_label td_label_width">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'typeCode-FLFS'"/>
                            </xsl:call-template>
                        </td>
                        <td style="width: 80%;">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'order'"/>
                            </xsl:call-template>
                            <xsl:text>: </xsl:text>
                            <xsl:for-each select="hl7:order">
                                <xsl:call-template name="show-id-set">
                                    <xsl:with-param name="in" select="hl7:id"/>
                                </xsl:call-template>
                                <xsl:if test="hl7:code">
                                    <xsl:text>&#160;</xsl:text>
                                    <xsl:call-template name="show-code-set">
                                        <xsl:with-param name="in" select="hl7:code"/>
                                    </xsl:call-template>
                                </xsl:if>
                                <xsl:if test="hl7:priorityCode">
                                    <xsl:text>&#160;</xsl:text>
                                    <xsl:call-template name="show-code-set">
                                        <xsl:with-param name="in" select="hl7:priorityCode"/>
                                    </xsl:call-template>
                                </xsl:if>
                            </xsl:for-each>
                        </td>
                    </tr>
                </tbody>
            </table>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle CDA Header informant</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="informant">
        <xsl:for-each select="hl7:informant">
            <table class="header_table">
                <tbody>
                    <tr>
                        <td class="td_label td_label_width">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'typeCode-INF'"/>
                            </xsl:call-template>
                        </td>
                        <td>
                            <xsl:if test="hl7:assignedEntity/hl7:addr | hl7:assignedEntity/hl7:telecom | hl7:relatedEntity/hl7:addr | hl7:relatedEntity/hl7:telecom">
                                <xsl:attribute name="style">width: 30%;</xsl:attribute>
                            </xsl:if>
                            <xsl:if test="hl7:assignedEntity">
                                <xsl:call-template name="show-assignedEntity">
                                    <xsl:with-param name="asgnEntity" select="hl7:assignedEntity"/>
                                </xsl:call-template>
                            </xsl:if>
                            <xsl:if test="hl7:relatedEntity">
                                <xsl:call-template name="show-relatedEntity">
                                    <xsl:with-param name="relatedEntity" select="hl7:relatedEntity"/>
                                </xsl:call-template>
                            </xsl:if>
                        </td>
                        <xsl:choose>
                            <xsl:when test="hl7:assignedEntity/hl7:addr | hl7:assignedEntity/hl7:telecom">
                                <td class="td_label td_label_width">
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'Contact_details'"/>
                                    </xsl:call-template>
                                </td>
                                <td>
                                    <xsl:if test="hl7:assignedEntity">
                                        <xsl:call-template name="show-contactInfo">
                                            <xsl:with-param name="contact" select="hl7:assignedEntity"/>
                                        </xsl:call-template>
                                    </xsl:if>
                                </td>
                            </xsl:when>
                            <xsl:when test="hl7:relatedEntity/hl7:addr | hl7:relatedEntity/hl7:telecom">
                                <td class="td_label td_label_width">
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'Contact_details'"/>
                                    </xsl:call-template>
                                </td>
                                <td>
                                    <xsl:if test="hl7:relatedEntity">
                                        <xsl:call-template name="show-contactInfo">
                                            <xsl:with-param name="contact" select="hl7:relatedEntity"/>
                                        </xsl:call-template>
                                    </xsl:if>
                                </td>
                            </xsl:when>
                        </xsl:choose>
                    </tr>
                </tbody>
            </table>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle CDA Header informationRecipient</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="informationRecipient">
        <xsl:for-each select="hl7:informationRecipient">
            <table class="header_table">
                <tbody>
                    <tr>
                        <td class="td_label td_label_width">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'typeCode-PRCP'"/>
                            </xsl:call-template>
                        </td>
                        <td>
                            <xsl:choose>
                                <xsl:when test="hl7:intendedRecipient/hl7:addr | hl7:intendedRecipient/hl7:telecom">
                                    <xsl:attribute name="style">width: 30%;</xsl:attribute>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:attribute name="colspan">3</xsl:attribute>
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:choose>
                                <xsl:when test="hl7:intendedRecipient/hl7:informationRecipient/hl7:name">
                                    <xsl:for-each select="hl7:intendedRecipient/hl7:informationRecipient">
                                        <xsl:call-template name="show-name-set">
                                            <xsl:with-param name="in" select="hl7:name"/>
                                            <xsl:with-param name="sep" select="'br'"/>
                                        </xsl:call-template>
                                    </xsl:for-each>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:for-each select="hl7:intendedRecipient">
                                        <xsl:call-template name="show-id-set">
                                            <xsl:with-param name="in" select="hl7:id"/>
                                            <xsl:with-param name="sep" select="'br'"/>
                                        </xsl:call-template>
                                        <br/>
                                    </xsl:for-each>
                                </xsl:otherwise>
                            </xsl:choose>
                        </td>
                        <xsl:if test="hl7:intendedRecipient/hl7:addr | hl7:intendedRecipient/hl7:telecom">
                            <td class="td_label td_label_width">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'Contact_details'"/>
                                </xsl:call-template>
                            </td>
                            <td>
                                <xsl:call-template name="show-contactInfo">
                                    <xsl:with-param name="contact" select="hl7:intendedRecipient"/>
                                </xsl:call-template>
                            </td>
                        </xsl:if>
                    </tr>
                    <xsl:for-each select="hl7:intendedRecipient/hl7:receivedOrganization">
                        <tr>
                            <td class="td_label td_label_width">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="pre" select="''"/>
                                    <xsl:with-param name="key" select="'Organization'"/>
                                    <xsl:with-param name="post" select="''"/>
                                </xsl:call-template>
                            </td>
                            <td style="width: 30%;">
                                <div>
                                    <xsl:call-template name="show-name-set">
                                        <xsl:with-param name="in" select="hl7:name"/>
                                    </xsl:call-template>
                                </div>
                                <xsl:if test="hl7:id">
                                    <table class="table_simple">
                                        <tbody>
                                            <tr>
                                                <td class="td_label">
                                                    <xsl:call-template name="getLocalizedString">
                                                        <xsl:with-param name="key" select="'id'"/>
                                                    </xsl:call-template>
                                                </td>
                                                <td>
                                                    <xsl:call-template name="show-id-set">
                                                        <xsl:with-param name="in" select="hl7:id"/>
                                                    </xsl:call-template>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </xsl:if>
                            </td>
                            <td class="td_label td_label_width">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'Contact_details'"/>
                                </xsl:call-template>
                                <xsl:text> (</xsl:text>
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'organization'"/>
                                </xsl:call-template>
                                <xsl:text>)</xsl:text>
                            </td>
                            <td style="width: 30%;">
                                <xsl:call-template name="show-contactInfo">
                                    <xsl:with-param name="contact" select="."/>
                                </xsl:call-template>
                            </td>
                        </tr>
                    </xsl:for-each>
                </tbody>
            </table>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle CDA Header participant</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="participant">
        <xsl:for-each select="hl7:participant">
            <table class="header_table">
                <tbody>
                    <tr>
                        <td class="td_label td_label_width">
                            <xsl:variable name="participtRole">
                                <xsl:call-template name="show-participationTypeOrCode">
                                    <xsl:with-param name="typeCode" select="@typeCode"/>
                                    <xsl:with-param name="classCode" select="hl7:associatedEntity/@classCode"/>
                                    <xsl:with-param name="code" select="hl7:associatedEntity/hl7:code"/>
                                </xsl:call-template>
                            </xsl:variable>
                            <xsl:choose>
                                <xsl:when test="string-length($participtRole) > 0">
                                    <xsl:call-template name="firstCharCaseUp">
                                        <xsl:with-param name="data" select="$participtRole"/>
                                    </xsl:call-template>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'participant'"/>
                                    </xsl:call-template>
                                </xsl:otherwise>
                            </xsl:choose>
                        </td>
                        <td>
                            <xsl:if test="hl7:associatedEntity/hl7:addr | hl7:associatedEntity/hl7:telecom">
                                <xsl:attribute name="style">width: 30%;</xsl:attribute>
                            </xsl:if>
                            <xsl:if test="hl7:functionCode">
                                <xsl:call-template name="show-code-set">
                                    <xsl:with-param name="in" select="hl7:functionCode"/>
                                </xsl:call-template>
                                <xsl:text>, </xsl:text>
                            </xsl:if>
                            <xsl:call-template name="show-associatedEntity">
                                <xsl:with-param name="assoEntity" select="hl7:associatedEntity"/>
                            </xsl:call-template>
                            <xsl:call-template name="show-ivlts">
                                <xsl:with-param name="in" select="hl7:time"/>
                            </xsl:call-template>
                        </td>
                        <xsl:if test="hl7:associatedEntity/hl7:addr | hl7:associatedEntity/hl7:telecom">
                            <td class="td_label td_label_width">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'Contact_details'"/>
                                </xsl:call-template>
                            </td>
                            <td>
                                <xsl:call-template name="show-contactInfo">
                                    <xsl:with-param name="contact" select="hl7:associatedEntity"/>
                                </xsl:call-template>
                            </td>
                        </xsl:if>
                    </tr>
                </tbody>
            </table>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle CDA Header recordTarget</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="recordTarget">
        <xsl:for-each select="hl7:recordTarget/hl7:patientRole">
            <table class="header_table">
                <tbody>
                    <tr>
                        <td class="td_label td_label_width">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="pre" select="''"/>
                                <xsl:with-param name="key" select="'recordTarget'"/>
                                <xsl:with-param name="post" select="''"/>
                            </xsl:call-template>
                        </td>
                        <td style="width: 30%;">
                            <xsl:call-template name="show-name-set">
                                <xsl:with-param name="in" select="hl7:patient/hl7:name"/>
                            </xsl:call-template>
                        </td>
                        <td class="td_label td_label_width">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'Contact_details'"/>
                            </xsl:call-template>
                        </td>
                        <td style="width: 30%;">
                            <xsl:call-template name="show-contactInfo">
                                <xsl:with-param name="contact" select="."/>
                            </xsl:call-template>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_label td_label_width">
                            <xsl:choose>
                                <xsl:when test="hl7:patient/*[local-name() = 'deceasedInd'][@value = 'true' or @nullFlavor] | hl7:patient/*[local-name() = 'deceasedTime']">
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'birthTimeLongDeceased'"/>
                                    </xsl:call-template>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'birthTimeLong'"/>
                                    </xsl:call-template>
                                </xsl:otherwise>
                            </xsl:choose>
                        </td>
                        <td style="width: 30%;">
                            <xsl:call-template name="show-birthDeathTime-multipleBirth">
                                <xsl:with-param name="in" select="hl7:patient"/>
                                <xsl:with-param name="clinicalDocumentEffectiveTime" select="ancestor-or-self::hl7:ClinicalDocument/hl7:effectiveTime/@value"/>
                            </xsl:call-template>
                        </td>
                        <td class="td_label td_label_width">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'administrativeGenderCode'"/>
                            </xsl:call-template>
                        </td>
                        <td>
                            <xsl:call-template name="show-code-set">
                                <xsl:with-param name="in" select="hl7:patient/hl7:administrativeGenderCode"/>
                            </xsl:call-template>
                        </td>
                    </tr>
                    <xsl:if test="hl7:patient/hl7:raceCode | hl7:patient/hl7:ethnicGroupCode">
                        <tr>
                            <td class="td_label td_label_width">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'Race'"/>
                                </xsl:call-template>
                            </td>
                            <td style="width: 30%;">
                                <xsl:call-template name="show-code-set">
                                    <xsl:with-param name="in" select="hl7:patient/hl7:raceCode"/>
                                </xsl:call-template>
                            </td>
                            <td class="td_label td_label_width">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'Ethnicity'"/>
                                </xsl:call-template>
                            </td>
                            <td>
                                <xsl:call-template name="show-code-set">
                                    <xsl:with-param name="in" select="hl7:patient/hl7:ethnicGroupCode"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                    </xsl:if>
                    <tr>
                        <td class="td_label td_label_width">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'patientIdsLong'"/>
                            </xsl:call-template>
                        </td>
                        <td>
                            <xsl:if test="not(hl7:patient/hl7:languageCommunication)">
                                <xsl:attribute name="colspan">3</xsl:attribute>
                            </xsl:if>
                            <xsl:call-template name="show-id-set">
                                <xsl:with-param name="in" select="hl7:id[not(contains($skip-ids-var, concat(',',@root,',')))]"/>
                                <xsl:with-param name="sep" select="'br'"/>
                            </xsl:call-template>
                        </td>
                        <xsl:if test="hl7:patient/hl7:languageCommunication">
                            <td class="td_label td_label_width">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'languageCommunication'"/>
                                </xsl:call-template>
                            </td>
                            <td colspan="3">
                                <xsl:for-each select="hl7:patient/hl7:languageCommunication">
                                    <div>
                                        <xsl:value-of select="hl7:languageCode/@code"/>
                                        <xsl:if test="hl7:modeCode">
                                            <xsl:text>, </xsl:text>
                                            <xsl:call-template name="show-code-set">
                                                <xsl:with-param name="in" select="hl7:modeCode"/>
                                                <xsl:with-param name="sep" select="' '"/>
                                            </xsl:call-template>
                                        </xsl:if>
                                        <xsl:if test="hl7:proficiencyLevelCode">
                                            <xsl:text>, </xsl:text>
                                            <xsl:call-template name="show-code-set">
                                                <xsl:with-param name="in" select="hl7:proficiencyLevelCode"/>
                                                <xsl:with-param name="sep" select="' '"/>
                                            </xsl:call-template>
                                        </xsl:if>
                                        <xsl:if test="hl7:preferenceInd">
                                            <xsl:text>, </xsl:text>
                                            <xsl:call-template name="getLocalizedString">
                                                <xsl:with-param name="key" select="'preferredLanguage'"/>
                                                <xsl:with-param name="post" select="': '"/>
                                            </xsl:call-template>
                                            <xsl:call-template name="show-boolean">
                                                <xsl:with-param name="in" select="hl7:preferenceInd"/>
                                            </xsl:call-template>
                                        </xsl:if>
                                    </div>
                                </xsl:for-each>
                            </td>
                        </xsl:if>
                    </tr>
                    <xsl:if test="hl7:patient/hl7:guardian">
                        <tr>
                            <td class="td_label td_label_width">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'Guardian'"/>
                                </xsl:call-template>
                            </td>
                            <td style="width: 30%;">
                                <xsl:call-template name="show-name-set">
                                    <xsl:with-param name="in" select="hl7:patient/hl7:guardian/*/hl7:name"/>
                                </xsl:call-template>
                                <xsl:if test="hl7:patient/hl7:guardian/hl7:code">
                                    <xsl:text> - </xsl:text>
                                    <xsl:call-template name="show-code-set">
                                        <xsl:with-param name="in" select="hl7:patient/hl7:guardian/hl7:code"/>
                                    </xsl:call-template>
                                </xsl:if>
                            </td>
                            <td class="td_label td_label_width">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'Contact_details'"/>
                                </xsl:call-template>
                            </td>
                            <td>
                                <xsl:call-template name="show-contactInfo">
                                    <xsl:with-param name="contact" select="hl7:patient/hl7:guardian"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                    </xsl:if>
                    <xsl:for-each select="hl7:providerOrganization">
                        <tr>
                            <td class="td_label td_label_width">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="pre" select="''"/>
                                    <xsl:with-param name="key" select="'providerOrganization'"/>
                                    <xsl:with-param name="post" select="''"/>
                                </xsl:call-template>
                            </td>
                            <td style="width: 30%;">
                                <div>
                                    <xsl:call-template name="show-name-set">
                                        <xsl:with-param name="in" select="hl7:name"/>
                                    </xsl:call-template>
                                </div>
                                <xsl:if test="hl7:id">
                                    <table class="table_simple">
                                        <tbody>
                                            <tr>
                                                <td class="td_label">
                                                    <xsl:call-template name="getLocalizedString">
                                                        <xsl:with-param name="key" select="'id'"/>
                                                    </xsl:call-template>
                                                </td>
                                                <td>
                                                    <xsl:call-template name="show-id-set">
                                                        <xsl:with-param name="in" select="hl7:id"/>
                                                    </xsl:call-template>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </xsl:if>
                            </td>
                            <td class="td_label td_label_width">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'Contact_details'"/>
                                </xsl:call-template>
                                <xsl:text> (</xsl:text>
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'organization'"/>
                                </xsl:call-template>
                                <xsl:text>)</xsl:text>
                            </td>
                            <td style="width: 30%;">
                                <xsl:call-template name="show-contactInfo">
                                    <xsl:with-param name="contact" select="."/>
                                </xsl:call-template>
                            </td>
                        </tr>
                    </xsl:for-each>
                </tbody>
            </table>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle CDA Header relatedDocument</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="relatedDocument">
        <xsl:for-each select="hl7:relatedDocument">
            <xsl:variable name="parentCDACode" select="ancestor::hl7:ClinicalDocument[1]/hl7:code"/>
            <table class="header_table">
                <tbody>
                    <tr>
                        <td class="td_label td_label_width">
                            <xsl:choose>
                                <xsl:when test="@inversionInd = 'true'">
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'relatingDocumentInverted'"/>
                                    </xsl:call-template>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:call-template name="getLocalizedString">
                                        <xsl:with-param name="key" select="'relatingDocument'"/>
                                    </xsl:call-template>
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:text> (</xsl:text>
                            <xsl:call-template name="show-actRelationship">
                                <xsl:with-param name="ptype" select="@typeCode"/>
                            </xsl:call-template>
                            <xsl:text>)</xsl:text>
                        </td>
                        <td style="width: 80%;">
                            <xsl:for-each select="hl7:parentDocument">
                                <xsl:call-template name="idVersionSetId"/>
                            </xsl:for-each>
                        </td>
                    </tr>
                </tbody>
            </table>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle CDA Header authorization</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="authorization">
        <xsl:for-each select="hl7:authorization">
            <table class="header_table">
                <tbody>
                    <tr>
                        <td class="td_label td_label_width">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'consent'"/>
                            </xsl:call-template>
                        </td>
                        <td style="width: 80%;">
                            <xsl:choose>
                                <xsl:when test="hl7:consent/hl7:code">
                                    <xsl:call-template name="show-code">
                                        <xsl:with-param name="in" select="hl7:consent/hl7:code"/>
                                    </xsl:call-template>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:call-template name="show-code">
                                        <xsl:with-param name="in" select="hl7:consent/hl7:statusCode"/>
                                    </xsl:call-template>
                                </xsl:otherwise>
                            </xsl:choose>
                            <br/>
                        </td>
                    </tr>
                </tbody>
            </table>
        </xsl:for-each>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle CDA Header assignedEntity</xd:p>
        </xd:desc>
        <xd:param name="asgnEntity">Contains the assignedEntity element</xd:param>
    </xd:doc>
    <xsl:template name="show-assignedEntity">
        <xsl:param name="asgnEntity"/>
        <xsl:choose>
            <xsl:when test="$asgnEntity/hl7:assignedPerson/hl7:name">
                <xsl:call-template name="show-name-set">
                    <xsl:with-param name="in" select="$asgnEntity/hl7:assignedPerson/hl7:name"/>
                </xsl:call-template>
                <xsl:if test="$asgnEntity/hl7:assignedPerson/hl7:desc">
                    <div>
                        <xsl:value-of select="$asgnEntity/hl7:assignedPerson/hl7:desc"/>
                    </div>
                </xsl:if>
                <xsl:if test="$asgnEntity/hl7:assignedPerson/hl7:birthTime">
                    <xsl:text> </xsl:text>
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="'birthTimeLong'"/>
                    </xsl:call-template>
                    <xsl:text> </xsl:text>
                    <xsl:call-template name="show-timestamp">
                        <xsl:with-param name="in" select="$asgnEntity/hl7:assignedPerson/hl7:birthTime"/>
                    </xsl:call-template>
                </xsl:if>
                <xsl:if test="$asgnEntity/hl7:representedOrganization/hl7:name">
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="pre" select="' '"/>
                        <xsl:with-param name="key" select="'of'"/>
                        <xsl:with-param name="post" select="' '"/>
                    </xsl:call-template>
                    <xsl:call-template name="show-name-set">
                        <xsl:with-param name="in" select="$asgnEntity/hl7:representedOrganization/hl7:name"/>
                    </xsl:call-template>
                </xsl:if>
            </xsl:when>
            <xsl:when test="$asgnEntity/hl7:representedOrganization">
                <xsl:value-of select="$asgnEntity/hl7:representedOrganization/hl7:name"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="show-id-set">
                    <xsl:with-param name="in" select="$asgnEntity/hl7:id"/>
                    <xsl:with-param name="sep" select="'br'"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle CDA Header relatedEntity</xd:p>
        </xd:desc>
        <xd:param name="relatedEntity">Contains the relatedEntity element</xd:param>
    </xd:doc>
    <xsl:template name="show-relatedEntity">
        <xsl:param name="relatedEntity"/>
        <xsl:choose>
            <xsl:when test="$relatedEntity/hl7:relatedPerson/hl7:name">
                <xsl:call-template name="show-name-set">
                    <xsl:with-param name="in" select="$relatedEntity/hl7:relatedPerson/hl7:name"/>
                </xsl:call-template>
                <xsl:if test="$relatedEntity/hl7:relatedPerson/hl7:desc">
                    <div>
                        <xsl:value-of select="$relatedEntity/hl7:relatedPerson/hl7:desc"/>
                    </div>
                </xsl:if>
                <xsl:if test="$relatedEntity/hl7:relatedPerson/hl7:birthTime">
                    <xsl:text> </xsl:text>
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="'birthTimeLong'"/>
                    </xsl:call-template>
                    <xsl:text> </xsl:text>
                    <xsl:call-template name="show-timestamp">
                        <xsl:with-param name="in" select="$relatedEntity/hl7:relatedPerson/hl7:birthTime"/>
                    </xsl:call-template>
                </xsl:if>
            </xsl:when>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle CDA Header associatedEntity</xd:p>
        </xd:desc>
        <xd:param name="assoEntity">Contains the associatedEntity element</xd:param>
    </xd:doc>
    <xsl:template name="show-associatedEntity">
        <xsl:param name="assoEntity"/>
        <xsl:if test="$assoEntity/hl7:associatedPerson">
            <xsl:call-template name="show-name-set">
                <xsl:with-param name="in" select="$assoEntity/hl7:associatedPerson/hl7:name"/>
                <xsl:with-param name="sep" select="'br'"/>
            </xsl:call-template>
            <xsl:if test="$assoEntity/hl7:assignedPerson/hl7:desc">
                <div>
                    <xsl:value-of select="$assoEntity/hl7:assignedPerson/hl7:desc"/>
                </div>
            </xsl:if>
            <xsl:if test="$assoEntity/hl7:assignedPerson/hl7:birthTime">
                <xsl:text> </xsl:text>
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="key" select="'birthTimeLong'"/>
                </xsl:call-template>
                <xsl:text> </xsl:text>
                <xsl:call-template name="show-timestamp">
                    <xsl:with-param name="in" select="$assoEntity/hl7:assignedPerson/hl7:birthTime"/>
                </xsl:call-template>
            </xsl:if>
        </xsl:if>
        <xsl:if test="$assoEntity/hl7:code">
            <xsl:if test="$assoEntity/hl7:associatedPerson/hl7:name or $assoEntity/hl7:associatedPerson/hl7:id">
                <xsl:text>, </xsl:text>
            </xsl:if>
            <xsl:call-template name="show-code-set">
                <xsl:with-param name="in" select="$assoEntity/hl7:code"/>
            </xsl:call-template>
        </xsl:if>
        <xsl:if test="$assoEntity/hl7:id">
            <xsl:if test="$assoEntity/hl7:associatedPerson/hl7:name">
                <xsl:text>, </xsl:text>
            </xsl:if>
            <xsl:call-template name="getLocalizedString">
                <xsl:with-param name="key" select="'id'"/>
                <xsl:with-param name="post" select="': '"/>
            </xsl:call-template>
            <xsl:call-template name="show-id-set">
                <xsl:with-param name="in" select="$assoEntity/hl7:id"/>
                <xsl:with-param name="sep" select="'br'"/>
            </xsl:call-template>
        </xsl:if>
        <xsl:if test="$assoEntity/hl7:scopingOrganization">
            <br/>
            <xsl:call-template name="getLocalizedString">
                <xsl:with-param name="key" select="'organization'"/>
                <xsl:with-param name="post" select="': '"/>
            </xsl:call-template>
        </xsl:if>
        <xsl:choose>
            <xsl:when test="$assoEntity/hl7:scopingOrganization/hl7:name">
                <xsl:call-template name="show-name-set">
                    <xsl:with-param name="in" select="$assoEntity/hl7:scopingOrganization/hl7:name"/>
                </xsl:call-template>
                <xsl:if test="$assoEntity/hl7:scopingOrganization/hl7:standardIndustryClassCode">
                    <xsl:value-of select="$assoEntity/hl7:scopingOrganization/hl7:standardIndustryClassCode/@displayName"/>
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="pre" select="' '"/>
                        <xsl:with-param name="key" select="'code'"/>
                        <xsl:with-param name="post" select="':'"/>
                    </xsl:call-template>
                    <xsl:call-template name="show-code-set">
                        <xsl:with-param name="in" select="$assoEntity/hl7:scopingOrganization/hl7:standardIndustryClassCode/@code"/>
                    </xsl:call-template>
                </xsl:if>
                <xsl:text>, </xsl:text>
            </xsl:when>
            <xsl:when test="$assoEntity/hl7:scopingOrganization/hl7:standardIndustryClassCode">
                <xsl:value-of select="$assoEntity/hl7:scopingOrganization/hl7:standardIndustryClassCode/@displayName"/>
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="pre" select="' '"/>
                    <xsl:with-param name="key" select="'code'"/>
                    <xsl:with-param name="post" select="':'"/>
                </xsl:call-template>
                <xsl:call-template name="show-code-set">
                    <xsl:with-param name="in" select="$assoEntity/hl7:scopingOrganization/hl7:standardIndustryClassCode/@code"/>
                </xsl:call-template>
                <xsl:text>, </xsl:text>
            </xsl:when>
        </xsl:choose>
        <xsl:if test="$assoEntity/hl7:scopingOrganization/hl7:id">
            <xsl:call-template name="getLocalizedString">
                <xsl:with-param name="key" select="'id'"/>
                <xsl:with-param name="post" select="': '"/>
            </xsl:call-template>
            <xsl:call-template name="show-id-set">
                <xsl:with-param name="in" select="$assoEntity/hl7:scopingOrganization/hl7:id"/>
                <xsl:with-param name="sep" select="'br'"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle id, setId and versionNumber</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="idVersionSetId">
        <xsl:if test="hl7:id | hl7:setId | hl7:versionNumber">
            <table class="table_simple">
                <tbody>
                    <xsl:if test="hl7:id">
                        <tr>
                            <td class="td_label">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'id'"/>
                                </xsl:call-template>
                            </td>
                            <td>
                                <xsl:call-template name="show-id-set">
                                    <xsl:with-param name="in" select="hl7:id"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                    </xsl:if>
                    <xsl:if test="hl7:versionNumber">
                        <tr>
                            <td class="td_label">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'versionNumber'"/>
                                </xsl:call-template>
                            </td>
                            <td>
                                <xsl:value-of select="hl7:versionNumber/@value"/>
                            </td>
                        </tr>
                    </xsl:if>
                    <xsl:if test="hl7:setId">
                        <tr>
                            <td class="td_label">
                                <xsl:call-template name="getLocalizedString">
                                    <xsl:with-param name="key" select="'setId'"/>
                                </xsl:call-template>
                            </td>
                            <td>
                                <xsl:call-template name="show-id-set">
                                    <xsl:with-param name="in" select="hl7:setId"/>
                                </xsl:call-template>
                            </td>
                        </tr>
                    </xsl:if>
                </tbody>
            </table>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Handle contactInfo. Address and telecom</xd:p>
        </xd:desc>
        <xd:param name="contact">Element containing addr and or telecom element</xd:param>
    </xd:doc>
    <xsl:template name="show-contactInfo">
        <xsl:param name="contact"/>
        <xsl:call-template name="show-address-set">
            <xsl:with-param name="in" select="$contact/hl7:addr"/>
            <xsl:with-param name="sep" select="'br'"/>
        </xsl:call-template>
        <xsl:if test="$contact/hl7:addr and $contact/hl7:telecom">
            <br/>
        </xsl:if>
        <xsl:call-template name="show-telecom-set">
            <xsl:with-param name="in" select="$contact/hl7:telecom"/>
            <xsl:with-param name="sep" select="', '"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc>Handle one line of birth/death/multiple birth data</xd:desc>
        <xd:param name="in">One element with the child elements birthTime, deceasedInd, deceasedTime, multipleBirthInd, multipleBirthOrderNumber. Each of those is optional and may bein the V3 namespace or in another namespace like sdtc</xd:param>
        <xd:param name="clinicalDocumentEffectiveTime">hl7:ClinicalDocument/hl7:effectiveTime/@value</xd:param>
    </xd:doc>
    <xsl:template name="show-birthDeathTime-multipleBirth">
        <xsl:param name="in"/>
        <xsl:param name="clinicalDocumentEffectiveTime" select="ancestor-or-self::hl7:ClinicalDocument/hl7:effectiveTime/@value"/>
        <xsl:if test="$in">
            <xsl:call-template name="show-timestamp">
                <xsl:with-param name="in" select="$in/*[local-name() = 'birthTime']"/>
            </xsl:call-template>
            <xsl:if test="$in/*[local-name() = 'deceasedInd'][@value = 'true' or @nullFlavor] | $in/*[local-name() = 'deceasedTime']">
                <xsl:text> - </xsl:text>
                <xsl:choose>
                    <xsl:when test="$in/*[local-name() = 'deceasedTime'][@value]">
                        <xsl:call-template name="show-timestamp">
                            <xsl:with-param name="in" select="$in/*[local-name() = 'deceasedTime']"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="$in/*[local-name() = 'deceasedInd'][@nullFlavor]">
                        <xsl:call-template name="show-nullFlavor">
                            <xsl:with-param name="in" select="$in/*[local-name() = 'deceasedInd']/@nullFlavor"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:call-template name="getLocalizedString">
                            <xsl:with-param name="pre" select="'&#8224;'"/>
                            <xsl:with-param name="key" select="'date_unknown'"/>
                        </xsl:call-template>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
            <xsl:variable name="comparedate">
                <xsl:choose>
                    <xsl:when test="$in/*[local-name() = 'deceasedTime'][@value]">
                        <xsl:value-of select="$in/*[local-name() = 'deceasedTime']/@value"/>
                    </xsl:when>
                    <xsl:when test="not($in/*[local-name() = 'deceasedInd'] or $in/*[local-name() = 'deceasedTime'][@value = 'true' or @nullFlavor] or $in/*[local-name() = 'deceasedTime'])">
                        <xsl:value-of select="$clinicalDocumentEffectiveTime"/>
                    </xsl:when>
                </xsl:choose>
            </xsl:variable>
            <xsl:if test="string-length($comparedate) > 0">
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="pre">
                        <xsl:text> (</xsl:text>
                        <xsl:call-template name="getAge">
                            <xsl:with-param name="comparedate" select="$comparedate"/>
                            <xsl:with-param name="date" select="$in/hl7:birthTime/@value"/>
                        </xsl:call-template>
                    </xsl:with-param>
                    <xsl:with-param name="key" select="'yr'"/>
                    <xsl:with-param name="post" select="')'"/>
                </xsl:call-template>
            </xsl:if>
            <xsl:if test="$in/*[local-name() = 'multipleBirthInd'][@value = 'true'] | $in/*[local-name() = 'multipleBirthOrderNumber']">
                <i>
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="pre" select="' '"/>
                        <xsl:with-param name="key" select="'partOfMultipleBirth'"/>
                    </xsl:call-template>
                </i>
            </xsl:if>
        </xsl:if>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Get localized string for a classCode</xd:p>
        </xd:desc>
        <xd:param name="clsCode">Class code string</xd:param>
    </xd:doc>
    <xsl:template name="show-actClassCode">
        <xsl:param name="clsCode"/>
        <xsl:call-template name="getLocalizedString">
            <xsl:with-param name="key" select="concat('2.16.840.1.113883.5.6-',$clsCode)"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Get localized string for a typeCode from an act relationship</xd:p>
        </xd:desc>
        <xd:param name="ptype">ActRelationship type string</xd:param>
    </xd:doc>
    <xsl:template name="show-actRelationship">
        <xsl:param name="ptype"/>
        <xsl:call-template name="getLocalizedString">
            <xsl:with-param name="key" select="concat('2.16.840.1.113883.5.1002-',$ptype)"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Get localized string for a typeCode from a participation</xd:p>
        </xd:desc>
        <xd:param name="ptype">Participation type string</xd:param>
    </xd:doc>
    <xsl:template name="show-participationType">
        <xsl:param name="ptype"/>
        <xsl:call-template name="getLocalizedString">
            <xsl:with-param name="key" select="concat('2.16.840.1.113883.5.90-',$ptype)"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Takes the participation typeCode attribute and translates that to a human readable form and adds the Role.code in human readable form if available.</xd:p>
        </xd:desc>
        <xd:param name="typeCode">required. Participation typeCode</xd:param>
        <xd:param name="code">optional. Role.code</xd:param>
        <xd:param name="classCode">optional. Class code of the contained class, if any</xd:param>
    </xd:doc>
    <xsl:template name="show-participationTypeOrCode">
        <xsl:param name="typeCode"/>
        <xsl:param name="classCode"/>
        <xsl:param name="code"/>
        <xsl:if test="string-length($typeCode) > 0">
            <xsl:call-template name="getLocalizedString">
                <xsl:with-param name="key" select="concat('2.16.840.1.113883.5.90-',$typeCode)"/>
            </xsl:call-template>
        </xsl:if>
        <xsl:if test="string-length($classCode) > 0">
            <xsl:if test="string-length($typeCode) > 0">
                <xsl:text> - </xsl:text>
            </xsl:if>
            <xsl:call-template name="getLocalizedString">
                <xsl:with-param name="key" select="concat('2.16.840.1.113883.5.110-',$classCode)"/>
            </xsl:call-template>
        </xsl:if>
        <xsl:if test="$code">
            <xsl:if test="$code//@code">
                <xsl:text> </xsl:text>
                <xsl:call-template name="show-code-set">
                    <xsl:with-param name="in" select="$code"/>
                </xsl:call-template>
            </xsl:if>
        </xsl:if>
    </xsl:template>

    <!-- ====================================================================== -->
    <!--                         Datatype based functions                       -->
    <!-- ====================================================================== -->

    <xd:doc>
        <xd:desc>
            <xd:p>Show elements with datatype II separated with the value in 'sep'. Calls <xd:ref name="show-id" type="template">show-id</xd:ref>
        </xd:p>
        </xd:desc>
        <xd:param name="in">Set of 0 to * elements</xd:param>
        <xd:param name="sep">Separator between output of different elements. Default ', ' and special is 'br' which generates an HTML br tag</xd:param>
    </xd:doc>
    <xsl:template name="show-id-set">
        <xsl:param name="in"/>
        <xsl:param name="sep" select="', '"/>
        <xsl:if test="$in">
            <xsl:choose>
                <!-- DTr1 -->
                <xsl:when test="count($in) &gt; 1">
                    <xsl:for-each select="$in">
                        <xsl:call-template name="show-id">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                        <xsl:if test="position() != last()">
                            <xsl:choose>
                                <xsl:when test="$sep = 'br'">
                                    <br/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$sep"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:when>
                <!-- DTr2 -->
                <xsl:when test="$in[hl7:item]">
                    <xsl:for-each select="$in/hl7:item">
                        <xsl:call-template name="show-id">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                        <xsl:if test="position() != last()">
                            <xsl:choose>
                                <xsl:when test="$sep = 'br'">
                                    <br/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$sep"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:when>
                <!-- DTr1 or DTr2 -->
                <xsl:otherwise>
                    <xsl:call-template name="show-id">
                        <xsl:with-param name="in" select="$in"/>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Show element with datatype II</xd:p>
        </xd:desc>
        <xd:param name="in">One element, possibly out of a set</xd:param>
    </xd:doc>
    <xsl:template name="show-id">
        <xsl:param name="in"/>
        <xsl:if test="$in">
            <span>
                <xsl:if test="$in[@assigningAuthorityName]">
                    <xsl:attribute name="title">
                        <xsl:value-of select="$in/@assigningAuthorityName"/>
                    </xsl:attribute>
                </xsl:if>
                <xsl:variable name="extension">
                    <xsl:if test="$in[@extension][@root]">
                        <xsl:choose>
                            <xsl:when test="$in[contains($mask-ids-var, concat(',',@root,','))]">
                                <span>
                                    <xsl:attribute name="title">
                                        <xsl:call-template name="show-nullFlavor">
                                            <xsl:with-param name="in" select="'MSK'"/>
                                        </xsl:call-template>
                                    </xsl:attribute>
                                    <xsl:text>xxx-xxx-xxx</xsl:text>
                                </span>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="$in/@extension"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:if>
                </xsl:variable>
                <xsl:choose>
                    <xsl:when test="$in[@extension][@root]">
                        <xsl:copy-of select="$extension"/>
                        <xsl:call-template name="getLocalizedString">
                            <xsl:with-param name="pre" select="' ('"/>
                            <xsl:with-param name="key" select="$in/@root"/>
                            <xsl:with-param name="post" select="')'"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:when test="$in[@root]">
                        <xsl:value-of select="$in/@root"/>
                    </xsl:when>
                    <xsl:when test="$in[@extension]">
                        <xsl:copy-of select="$extension"/>
                    </xsl:when>
                </xsl:choose>
                <xsl:if test="$in[@nullFlavor]">
                    <xsl:text>(</xsl:text>
                    <xsl:call-template name="show-nullFlavor">
                        <xsl:with-param name="in" select="$in/@nullFlavor"/>
                    </xsl:call-template>
                    <xsl:text>)</xsl:text>
                </xsl:if>
            </span>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Show elements with datatype INT separated with the value in 'sep'. Calls <xd:ref name="show-integer" type="template">show-integer</xd:ref>
            </xd:p>
        </xd:desc>
        <xd:param name="in">Set of 0 to * elements</xd:param>
        <xd:param name="sep">Separator between output of different elements. Default ', ' and special is 'br' which generates an HTML br tag</xd:param>
    </xd:doc>
    <xsl:template name="show-integer-set">
        <xsl:param name="in"/>
        <xsl:param name="sep" select="', '"/>
        <xsl:if test="$in">
            <xsl:choose>
                <!-- DTr1 -->
                <xsl:when test="count($in) > 1">
                    <xsl:for-each select="$in">
                        <xsl:call-template name="show-integer">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                        <xsl:if test="position() != last()">
                            <xsl:choose>
                                <xsl:when test="$sep = 'br'">
                                    <br/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$sep"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:when>
                <!-- DTr2 -->
                <xsl:when test="$in[hl7:item]">
                    <xsl:for-each select="$in/hl7:item">
                        <xsl:call-template name="show-integer">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                        <xsl:if test="position() != last()">
                            <xsl:choose>
                                <xsl:when test="$sep = 'br'">
                                    <br/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$sep"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:when>
                <!-- DTr1 or DTr2 -->
                <xsl:otherwise>
                    <xsl:call-template name="show-integer">
                        <xsl:with-param name="in" select="$in"/>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Show element with datatype INT</xd:p>
        </xd:desc>
        <xd:param name="in">One element, possibly out of a set</xd:param>
    </xd:doc>
    <xsl:template name="show-integer">
        <xsl:param name="in"/>
        <xsl:if test="$in">
            <xsl:choose>
                <xsl:when test="$in[@value]">
                    <xsl:value-of select="$in/@value"/>
                </xsl:when>
            </xsl:choose>
            <xsl:if test="$in[@value]">
                <xsl:text> </xsl:text>
            </xsl:if>
            <xsl:if test="$in[@nullFlavor]">
                <xsl:text>(</xsl:text>
                <xsl:call-template name="show-nullFlavor">
                    <xsl:with-param name="in" select="$in/@nullFlavor"/>
                </xsl:call-template>
                <xsl:text>)</xsl:text>
            </xsl:if>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Show elements with datatype CD, CE, CV, CO separated with the value in 'sep'. Calls <xd:ref name="show-code" type="template">show-code</xd:ref></xd:p>
        </xd:desc>
        <xd:param name="in">Set of 0 to * elements</xd:param>
        <xd:param name="sep">Separator between output of different elements. Default ', ' and special is 'br' which generates an HTML br tag</xd:param>
        <xd:param name="textonly">XSLT 1.0 will output a warning when you create an element inside an attribute/text node/processing instruction. To prevent that warning, we should just prevent creation of elements in that context. Set to 'true' if that's the case. Default is 'false'.</xd:param>
    </xd:doc>
    <xsl:template name="show-code-set">
        <xsl:param name="in"/>
        <xsl:param name="sep" select="', '"/>
        <xsl:param name="textonly" select="'false'"/>
        <xsl:if test="$in">
            <xsl:choose>
                <!-- DTr1 -->
                <xsl:when test="count($in) > 1">
                    <xsl:for-each select="$in">
                        <xsl:call-template name="show-code">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="textonly" select="$textonly"/>
                        </xsl:call-template>
                        <xsl:if test="position() != last()">
                            <xsl:choose>
                                <xsl:when test="$sep = 'br' and not($textonly = 'true')">
                                    <br/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$sep"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:when>
                <!-- DTr2 -->
                <xsl:when test="$in[hl7:item]">
                    <xsl:for-each select="$in/hl7:item">
                        <xsl:call-template name="show-code">
                            <xsl:with-param name="in" select="."/>
                            <xsl:with-param name="textonly" select="$textonly"/>
                        </xsl:call-template>
                        <xsl:if test="position() != last()">
                            <xsl:choose>
                                <xsl:when test="$sep = 'br' and not($textonly = 'true')">
                                    <br/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$sep"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:when>
                <!-- DTr1 or DTr2 -->
                <xsl:otherwise>
                    <xsl:call-template name="show-code">
                        <xsl:with-param name="in" select="$in"/>
                        <xsl:with-param name="textonly" select="$textonly"/>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Show elements with datatype CD, CE, CV, CO</xd:p>
        </xd:desc>
        <xd:param name="in">One element, possibly out of a set</xd:param>
        <xd:param name="textonly">XSLT 1.0 will output a warning when you create an element inside an attribute/text node/processing instruction. To prevent that warning, we should just prevent creation of elements in that context. Set to 'true' if that's the case. Default is 'false'.</xd:param>
    </xd:doc>
    <xsl:template name="show-code">
        <xsl:param name="in"/>
        <xsl:param name="textonly" select="'false'"/>
        <xsl:if test="$in">
            <xsl:variable name="codeSystem">
                <xsl:choose>
                    <xsl:when test="@codeSystem"><xsl:value-of select="$in/@codeSystem"/></xsl:when>
                    <xsl:when test="$in/self::hl7:signatureCode[not(@codeSystem)]">2.16.840.1.113883.5.89</xsl:when>
                </xsl:choose>
            </xsl:variable>
            <xsl:choose>
                <!-- DTr1 -->
                <xsl:when test="$in[@code] and string-length($codeSystem) > 0">
                    <xsl:variable name="key" select="concat($codeSystem, '-', $in/@code)"/>
                    <xsl:variable name="displayName">
                        <xsl:call-template name="getLocalizedString">
                            <xsl:with-param name="key" select="$key"/>
                        </xsl:call-template>
                    </xsl:variable>
                    <xsl:choose>
                        <xsl:when test="$displayName = $key and $in[@displayName]">
                            <xsl:value-of select="$in/@displayName"/>
                        </xsl:when>
                        <xsl:when test="$displayName = $key and $in[hl7:displayName/@value]">
                            <xsl:value-of select="($in/hl7:displayName/@value)[1]"/>
                        </xsl:when>
                        <xsl:when test="$displayName = $key">
                            <xsl:value-of select="$in/@code"/>
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="pre" select="' ('"/>
                                <xsl:with-param name="key" select="$codeSystem"/>
                                <xsl:with-param name="post" select="')'"/>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$displayName"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
                <!-- DTr1 -->
                <xsl:when test="$in[@displayName]">
                    <xsl:value-of select="$in/@displayName"/>
                </xsl:when>
                <!-- DTr2 -->
                <xsl:when test="$in[hl7:displayName/@value]">
                    <xsl:value-of select="($in/hl7:displayName/@value)[1]"/>
                </xsl:when>
                <!-- DTr1 or DTr2 -->
                <xsl:when test="$in[@code]">
                    <xsl:value-of select="$in/@code"/>
                </xsl:when>
                <!-- DTr1 or DTr2 -->
                <xsl:when test="$in[@nullFlavor]">
                    <xsl:call-template name="show-nullFlavor">
                        <xsl:with-param name="in" select="$in/@nullFlavor"/>
                    </xsl:call-template>
                </xsl:when>
            </xsl:choose>
            <!-- DTr1 | DTr2 -->
            <xsl:for-each select="$in/*[local-name() = 'originalText'] | $in/*[local-name() = 'originalText']/*[local-name() = 'xml']">
                <xsl:text> - </xsl:text>
                <xsl:value-of select="."/>
            </xsl:for-each>
            <xsl:for-each select="$in/*[local-name() = 'translation']">
                <xsl:choose>
                    <xsl:when test="$textonly = 'true'">
                        <xsl:text>. </xsl:text>
                        <xsl:call-template name="getLocalizedString">
                            <xsl:with-param name="key" select="local-name()"/>
                            <xsl:with-param name="post" select="': '"/>
                        </xsl:call-template>
                        <xsl:call-template name="show-code-set">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <div style="margin-left: 2em;">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="local-name()"/>
                                <xsl:with-param name="post" select="': '"/>
                            </xsl:call-template>
                            <xsl:call-template name="show-code-set">
                                <xsl:with-param name="in" select="."/>
                            </xsl:call-template>
                        </div>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Show elements with datatype EN, ON, PN or TN separated with the value in 'sep'. Calls <xd:ref name="show-name" type="template">show-name</xd:ref></xd:p>
        </xd:desc>
        <xd:param name="in">Set of 0 to * elements</xd:param>
        <xd:param name="sep">Separator between output of different elements. Default ', ' and special is 'br' which generates an HTML br tag</xd:param>
    </xd:doc>
    <xsl:template name="show-name-set">
        <xsl:param name="in"/>
        <xsl:param name="sep" select="', '"/>
        <xsl:if test="$in">
            <xsl:choose>
                <!-- DTr1 -->
                <xsl:when test="count($in) > 1">
                    <xsl:for-each select="$in">
                        <xsl:call-template name="show-name">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                        <xsl:if test="position() != last()">
                            <xsl:choose>
                                <xsl:when test="$sep = 'br'">
                                    <br/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$sep"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:when>
                <!-- DTr2 -->
                <xsl:when test="$in[hl7:item]">
                    <xsl:for-each select="$in/hl7:item">
                        <xsl:call-template name="show-name">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                        <xsl:if test="position() != last()">
                            <xsl:choose>
                                <xsl:when test="$sep = 'br'">
                                    <br/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$sep"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:when>
                <!-- DTr1 or DTr2 -->
                <xsl:otherwise>
                    <xsl:call-template name="show-name">
                        <xsl:with-param name="in" select="$in"/>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Show element with datatype EN, ON, PN, or TN</xd:p>
        </xd:desc>
        <xd:param name="in">One element, possibly out of a set</xd:param>
    </xd:doc>
    <xsl:template name="show-name">
        <xsl:param name="in"/>
        <xsl:if test="$in">
            <xsl:if test="$in/@use">
                <xsl:call-template name="tokenize">
                    <xsl:with-param name="prefix" select="'nameUse_'"/>
                    <xsl:with-param name="string" select="$in/@use"/>
                    <xsl:with-param name="delimiters" select="' '"/>
                </xsl:call-template>
                <xsl:text>: </xsl:text>
            </xsl:if>
            <xsl:if test="$in[@use][@nullFlavor]">
                <xsl:text> </xsl:text>
            </xsl:if>
            <xsl:call-template name="show-nullFlavor">
                <xsl:with-param name="in" select="$in/@nullFlavor"/>
            </xsl:call-template>
            <xsl:for-each select="$in/node()">
                <!-- 
                        Except for prefix, suffix and delimiter name parts, every name part is surrounded by implicit whitespace.
                        Leading and trailing explicit whitespace is insignificant in all those name parts. 
                    -->
                <xsl:if test="self::hl7:given[string-length(normalize-space(.)) > 0] | self::hl7:family[string-length(normalize-space(.)) > 0] | self::hl7:part[@type='GIV' or @type='FAM'][string-length(normalize-space(@value)) > 0]">
                    <xsl:if test="preceding-sibling::node()[string-length(normalize-space(.)) > 0]">
                        <xsl:text> </xsl:text>
                    </xsl:if>
                </xsl:if>
                <xsl:choose>
                    <xsl:when test="self::comment() | self::processing-instruction()"/>
                    <!-- DTr1 -->
                    <xsl:when test="self::hl7:family">
                        <xsl:call-template name="caseUp">
                            <xsl:with-param name="data" select="."/>
                        </xsl:call-template>
                    </xsl:when>
                    <!-- DTr2 -->
                    <xsl:when test="self::hl7:part[@type = 'FAM']">
                        <xsl:call-template name="caseUp">
                            <xsl:with-param name="data" select="@value"/>
                        </xsl:call-template>
                    </xsl:when>
                    <!-- DTr1 -->
                    <xsl:when test="self::hl7:prefix[contains(@qualifier, 'VV')]">
                        <xsl:call-template name="caseUp">
                            <xsl:with-param name="data" select="."/>
                        </xsl:call-template>
                        <xsl:text> </xsl:text>
                    </xsl:when>
                    <!-- DTr2 -->
                    <xsl:when test="self::hl7:part[@type = 'PFX' and contains(@qualifier, 'VV')]">
                        <xsl:call-template name="caseUp">
                            <xsl:with-param name="data" select="@value"/>
                        </xsl:call-template>
                        <xsl:text> </xsl:text>
                    </xsl:when>
                    <!-- DTr1 -->
                    <xsl:when test="self::hl7:prefix | self::hl7:given | self::delimiter">
                        <xsl:value-of select="."/>
                    </xsl:when>
                    <!-- DTr2 -->
                    <xsl:when test="self::hl7:part[@type = 'PFX' or @type = 'GIV' or @type = 'DEL']">
                        <xsl:value-of select="@value"/>
                    </xsl:when>
                    <xsl:when test="string-length(normalize-space(.)) > 0">
                        <xsl:value-of select="."/>
                    </xsl:when>
                    <!-- DTr2 -->
                    <xsl:when test="self::hl7:part[not(@type)][string-length(normalize-space(@value)) > 0]">
                        <xsl:value-of select="@value"/>
                    </xsl:when>
                </xsl:choose>
                <xsl:if test="self::hl7:given[string-length(normalize-space(.)) > 0] | self::hl7:family[string-length(normalize-space(.)) > 0] | self::hl7:part[@type='GIV' or @type='FAM'][string-length(normalize-space(@value)) > 0]">
                    <xsl:if test="following-sibling::node()[string-length(normalize-space(.)) > 0]">
                        <xsl:text> </xsl:text>
                    </xsl:if>
                </xsl:if>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Show elements with datatype AD separated with the value in 'sep'. Calls <xd:ref name="show-address" type="template">show-address</xd:ref></xd:p>
        </xd:desc>
        <xd:param name="in">Set of 0 to * elements</xd:param>
        <xd:param name="sep">Separator between output of different elements. Default ', ' and special is 'br' which generates an HTML br tag</xd:param>
    </xd:doc>
    <xsl:template name="show-address-set">
        <xsl:param name="in"/>
        <xsl:param name="sep" select="', '"/>
        <xsl:if test="$in">
            <xsl:choose>
                <!-- DTr1 -->
                <xsl:when test="count($in) > 1">
                    <xsl:for-each select="$in">
                        <xsl:call-template name="show-address">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                        <xsl:if test="position() != last()">
                            <xsl:choose>
                                <xsl:when test="$sep = 'br'">
                                    <br/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$sep"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:when>
                <!-- DTr2 -->
                <xsl:when test="$in[hl7:item]">
                    <xsl:for-each select="$in/hl7:item">
                        <xsl:call-template name="show-address">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                        <xsl:if test="position() != last()">
                            <xsl:choose>
                                <xsl:when test="$sep = 'br'">
                                    <br/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$sep"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:when>
                <!-- DTr1 or DTr2 -->
                <xsl:otherwise>
                    <xsl:call-template name="show-address">
                        <xsl:with-param name="in" select="$in"/>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Show element with datatype AD</xd:p>
        </xd:desc>
        <xd:param name="in">One element, possibly out of a set</xd:param>
    </xd:doc>
    <xsl:template name="show-address">
        <xsl:param name="in"/>
        <xsl:if test="$in">
            <xsl:if test="$in/@use">
                <xsl:call-template name="tokenize">
                    <xsl:with-param name="prefix" select="'addressUse_'"/>
                    <xsl:with-param name="string" select="$in/@use"/>
                    <xsl:with-param name="delimiters" select="' '"/>
                </xsl:call-template>
                <xsl:text>: </xsl:text>
            </xsl:if>
            <xsl:if test="$in[@use][@nullFlavor]">
                <xsl:text> </xsl:text>
            </xsl:if>
            <xsl:call-template name="show-nullFlavor">
                <xsl:with-param name="in" select="$in/@nullFlavor"/>
            </xsl:call-template>
            <xsl:for-each select="$in/text() | $in/*">
                <xsl:choose>
                    <xsl:when test="self::hl7:useablePeriod"/>
                    <!-- DTr1 only if not streetAddressLine -->
                    <xsl:when test="self::hl7:streetName">
                        <xsl:if test="not(../hl7:streetAddressLine)">
                            <xsl:variable name="additionalLocator" select="following-sibling::hl7:*[1][local-name() = 'additionalLocator'] |
                                                                           following-sibling::hl7:*[1][local-name() = 'houseNumberNumeric' or local-name() = 'houseNumber' or local-name() = 'buildingNumberSuffix']/following-sibling::hl7:*[1][local-name() = 'additionalLocator'] | 
                                                                           following-sibling::hl7:*[1][local-name() = 'houseNumberNumeric' or local-name() = 'houseNumber']/following-sibling::hl7:*[1][local-name() = 'buildingNumberSuffix']/following-sibling::hl7:*[1][local-name() = 'additionalLocator']"/>
                            <xsl:variable name="houseNumber" select="following-sibling::hl7:*[1][local-name() = 'houseNumberNumeric'] | 
                                                                     following-sibling::hl7:*[1][local-name() = 'houseNumber']"/>
                            <xsl:variable name="buildingNumberSuffix" select="following-sibling::hl7:*[1][local-name() = 'buildingNumberSuffix'] | 
                                                                              following-sibling::hl7:*[1][local-name() = 'houseNumberNumeric' or local-name() = 'houseNumber']/following-sibling::hl7:*[1][local-name() = 'buildingNumberSuffix']"/>
                            <!-- 
                                Look for
                                - streetName houseNumber|houseNumberNumeric|buildingNumberSuffix
                                - streetName houseNumber|houseNumberNumeric|buildingNumberSuffix additionalLocator houseNumber|houseNumberNumeric|buildingNumberSuffix
                                - streetName additionalLocator houseNumber|houseNumberNumeric|buildingNumberSuffix
                                in that order and nothing in between.
                            -->
                            <xsl:value-of select="."/>
                            <xsl:choose>
                                <xsl:when test="string-length($houseNumber) > 0">
                                    <xsl:text>&#160;</xsl:text>
                                    <xsl:value-of select="$houseNumber"/>
                                    <xsl:if test="string-length($buildingNumberSuffix) > 0">
                                        <xsl:text>&#160;</xsl:text>
                                        <xsl:value-of select="$buildingNumberSuffix"/>
                                    </xsl:if>
                                </xsl:when>
                                <xsl:when test="string-length($buildingNumberSuffix) > 0">
                                    <xsl:text>&#160;</xsl:text>
                                    <xsl:value-of select="$buildingNumberSuffix"/>
                                </xsl:when>
                            </xsl:choose>
                            <xsl:if test="string-length($additionalLocator) > 0">
                                <xsl:text>&#160;</xsl:text>
                                <xsl:value-of select="$additionalLocator"/>
                                
                                <xsl:variable name="houseNumber2" select="$additionalLocator/following-sibling::hl7:*[1][local-name() = 'houseNumberNumeric'] | 
                                                                          $additionalLocator/following-sibling::hl7:*[1][local-name() = 'houseNumber']"/>
                                <xsl:variable name="buildingNumberSuffix2" select="$additionalLocator/following-sibling::hl7:*[1][local-name() = 'buildingNumberSuffix'] | 
                                                                                   $additionalLocator/following-sibling::hl7:*[1][local-name() = 'houseNumberNumeric' or local-name() = 'houseNumber']/following-sibling::hl7:*[1][local-name() = 'buildingNumberSuffix']"/>
                                
                                <xsl:choose>
                                    <xsl:when test="string-length($houseNumber2) > 0">
                                        <xsl:text>&#160;</xsl:text>
                                        <xsl:value-of select="$houseNumber2"/>
                                        <xsl:if test="string-length($buildingNumberSuffix2) > 0">
                                            <xsl:text>&#160;</xsl:text>
                                            <xsl:value-of select="$buildingNumberSuffix2"/>
                                        </xsl:if>
                                    </xsl:when>
                                    <xsl:when test="string-length($buildingNumberSuffix2) > 0">
                                        <xsl:text>&#160;</xsl:text>
                                        <xsl:value-of select="$buildingNumberSuffix2"/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:if>
                            <xsl:if test="following-sibling::*[not(local-name() = 'houseNumber' or local-name() = 'houseNumberNumeric' or local-name() = 'buildingNumberSuffix' or local-name() = 'additionalLocator')][string-length(.) > 0 or @code]">
                                <br/>
                            </xsl:if>
                        </xsl:if>
                    </xsl:when>
                    <!-- DTr2 only if not streetAddressLine -->
                    <xsl:when test="self::hl7:part[@type='STR']">
                        <xsl:if test="not(../hl7:part[@type='SAL'])">
                            <xsl:variable name="additionalLocator" select="following-sibling::hl7:part[1][@type='ADL'] |
                                                                           following-sibling::hl7:part[1][@type='BNN' or @type='BNR' or @type='BNS']/following-sibling::hl7:part[1][@type='ADL'] | 
                                                                           following-sibling::hl7:part[1][@type='BNN' or @type='BNR' or @type='BNS']/following-sibling::hl7:part[1][@type='BNS']/following-sibling::hl7:part[1][@type='ADL']"/>
                            <xsl:variable name="houseNumber" select="following-sibling::hl7:part[1][@type='BNN'] | 
                                following-sibling::hl7:part[1][@type='BNR']"/>
                            <xsl:variable name="buildingNumberSuffix" select="following-sibling::hl7:part[1][@type='BNS'] | 
                                following-sibling::hl7:part[1][@type='BNN' or @type='BNR']/following-sibling::hl7:part[1][@type='BNS']"/>
                            <!-- 
                                Look for
                                - streetName houseNumber|houseNumberNumeric|buildingNumberSuffix
                                - streetName houseNumber|houseNumberNumeric|buildingNumberSuffix additionalLocator houseNumber|houseNumberNumeric|buildingNumberSuffix
                                - streetName additionalLocator houseNumber|houseNumberNumeric|buildingNumberSuffix
                                in that order and nothing in between.
                            -->
                            <xsl:value-of select="."/>
                            <xsl:choose>
                                <xsl:when test="string-length($houseNumber) > 0">
                                    <xsl:text>&#160;</xsl:text>
                                    <xsl:value-of select="$houseNumber"/>
                                    <xsl:if test="string-length($buildingNumberSuffix) > 0">
                                        <xsl:text>&#160;</xsl:text>
                                        <xsl:value-of select="$buildingNumberSuffix"/>
                                    </xsl:if>
                                </xsl:when>
                                <xsl:when test="string-length($buildingNumberSuffix) > 0">
                                    <xsl:text>&#160;</xsl:text>
                                    <xsl:value-of select="$buildingNumberSuffix"/>
                                </xsl:when>
                            </xsl:choose>
                            <xsl:if test="string-length($additionalLocator) > 0">
                                <xsl:text>&#160;</xsl:text>
                                <xsl:value-of select="$additionalLocator"/>
                                
                                <xsl:variable name="houseNumber2" select="$additionalLocator/following-sibling::hl7:part[1][@type='BNN'] | 
                                    $additionalLocator/following-sibling::hl7:part[1][@type='BNR']"/>
                                <xsl:variable name="buildingNumberSuffix2" select="$additionalLocator/following-sibling::hl7:part[1][@type='BNS'] | 
                                    $additionalLocator/following-sibling::hl7:part[1][@type='BNN' or @type='BNR']/following-sibling::hl7:part[1][@type='BNS']"/>
                                
                                <xsl:choose>
                                    <xsl:when test="string-length($houseNumber2) > 0">
                                        <xsl:text>&#160;</xsl:text>
                                        <xsl:value-of select="$houseNumber2"/>
                                        <xsl:if test="string-length($buildingNumberSuffix2) > 0">
                                            <xsl:text>&#160;</xsl:text>
                                            <xsl:value-of select="$buildingNumberSuffix2"/>
                                        </xsl:if>
                                    </xsl:when>
                                    <xsl:when test="string-length($buildingNumberSuffix2) > 0">
                                        <xsl:text>&#160;</xsl:text>
                                        <xsl:value-of select="$buildingNumberSuffix2"/>
                                    </xsl:when>
                                </xsl:choose>
                            </xsl:if>
                            <xsl:if test="following-sibling::*[not(@type='BNR' or local-name() = 'houseNumberNumeric' or @type='BNS' or @type='ADL')][string-length(.) > 0 or @code]">
                                <br/>
                            </xsl:if>
                        </xsl:if>
                    </xsl:when>
                    <!-- DTr1 only if not streetAddressLine -->
                    <xsl:when test="self::hl7:houseNumber or self::hl7:houseNumberNumeric or self::hl7:buildingNumberSuffix">
                        <xsl:if test="not(../hl7:streetAddressLine)">
                            <xsl:if test="not(preceding-sibling::hl7:*[1][local-name() = 'streetName' or local-name() = 'additionalLocator'])">
                                <xsl:if test="not(self::hl7:buildingNumberSuffix and preceding-sibling::hl7:*[1][local-name() = 'houseNumberNumeric' or local-name() = 'houseNumber'])">
                                    <xsl:value-of select="."/>
                                    <xsl:if test="following-sibling::hl7:*[1][string-length(.) > 0 or @code]">
                                        <br/>
                                    </xsl:if>
                                </xsl:if>
                            </xsl:if>
                        </xsl:if>
                    </xsl:when>
                    <!-- DTr2 only if not streetAddressLine -->
                    <xsl:when test="self::hl7:part[@type='BNN' or @type='BNR' or @type='BNS']">
                        <xsl:if test="not(../hl7:part[@type = 'SAL'])">
                            <xsl:if test="not(preceding-sibling::hl7:*[1][hl7:part[@type = 'STR' or @type = 'ADL']])">
                                <xsl:if test="not(self::hl7:part[@type='BNS'] and preceding-sibling::hl7:*[1][@type='BNN' or @type='BNR'])">
                                        <xsl:value-of select="@value"/>
                                        <xsl:if test="following-sibling::hl7:part[1][string-length(@value) > 0 or @code]">
                                             <br/>
                                        </xsl:if>
                                  </xsl:if>
                            </xsl:if>
                        </xsl:if>
                    </xsl:when>
                    <!-- DTr1 -->
                    <xsl:when test="self::hl7:additionalLocator">
                        <xsl:if test="not(preceding-sibling::hl7:*[1][local-name()='houseNumber' or local-name()='houseNumberNumeric' or local-name()='buildingNumberSuffix'])">
                            <xsl:value-of select="."/>
                            <xsl:if test="following-sibling::hl7:*[1][local-name()='houseNumberNumeric']">
                                <xsl:text>&#160;</xsl:text>
                                <xsl:value-of select="following-sibling::hl7:*[1][local-name()='houseNumberNumeric']"/>
                            </xsl:if>
                            <xsl:if test="following-sibling::hl7:*[1][local-name()='houseNumber']">
                                <xsl:text>&#160;</xsl:text>
                                <xsl:value-of select="following-sibling::hl7:*[1][local-name()='houseNumber']"/>
                            </xsl:if>
                            <xsl:if test="following-sibling::hl7:*[1][local-name()='buildingNumberSuffix']">
                                <xsl:text>&#160;</xsl:text>
                                <xsl:value-of select="following-sibling::hl7:*[1][local-name()='buildingNumberSuffix']"/>
                            </xsl:if>
                            <xsl:if test="following-sibling::hl7:*[1][string-length(.) > 0 or @code]">
                                <br/>
                            </xsl:if>
                        </xsl:if>
                    </xsl:when>
                    <!-- DTr2 -->
                    <xsl:when test="self::hl7:part[@type='ADL']">
                        <xsl:if test="not(preceding-sibling::hl7:*[1][@type='BNN' or @type='BNR' or @type='BNS'])">
                            <xsl:value-of select="@value"/>
                            <xsl:if test="following-sibling::hl7:*[1][@type='BNN']">
                                <xsl:text>&#160;</xsl:text>
                                <xsl:value-of select="following-sibling::hl7:*[1][@type='BNN']/@value"/>
                            </xsl:if>
                            <xsl:if test="following-sibling::hl7:*[1][@type='BNR']">
                                <xsl:text>&#160;</xsl:text>
                                <xsl:value-of select="following-sibling::hl7:*[1][@type='BNR']/@value"/>
                            </xsl:if>
                            <xsl:if test="following-sibling::hl7:*[1][@type='BNS']">
                                <xsl:text>&#160;</xsl:text>
                                <xsl:value-of select="following-sibling::hl7:*[1][@type='BNS']/@value"/>
                            </xsl:if>
                            <xsl:if test="following-sibling::hl7:part[1][string-length(@value) > 0 or @code]">
                                <br/>
                            </xsl:if>
                        </xsl:if>
                    </xsl:when>
                    <!-- DTr1 -->
                    <xsl:when test="self::hl7:postBox">
                        <xsl:call-template name="getLocalizedString">
                            <xsl:with-param name="key" select="'Postbox'"/>
                            <xsl:with-param name="post" select="' '"/>
                        </xsl:call-template>
                        <xsl:value-of select="."/>
                        <xsl:if test="following-sibling::hl7:*[1][string-length(.) > 0 or @code]">
                            <br/>
                        </xsl:if>
                    </xsl:when>
                    <!-- DTr2 -->
                    <xsl:when test="self::hl7:part[@type='POB']">
                        <xsl:call-template name="getLocalizedString">
                            <xsl:with-param name="key" select="'Postbox'"/>
                            <xsl:with-param name="post" select="' '"/>
                        </xsl:call-template>
                        <xsl:value-of select="@value"/>
                        <xsl:if test="following-sibling::hl7:part[1][string-length(@value) > 0 or @code]">
                            <br/>
                        </xsl:if>
                    </xsl:when>
                    <!-- DTr1 ZIP CITY, STATE or CITY, STATE ZIP depending on addr part contents -->
                    <xsl:when test="self::hl7:city">
                        <xsl:if test="preceding-sibling::hl7:postalCode[1][string-length(.) > 0 or @code]">
                            <xsl:choose>
                                <xsl:when test="preceding-sibling::hl7:postalCode[1][string-length(.) > 0]">
                                    <xsl:value-of select="preceding-sibling::hl7:postalCode[1][string-length(.) > 0]"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="preceding-sibling::hl7:postalCode[1][@code]/@code"/>
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:text> </xsl:text>
                        </xsl:if>
                        <xsl:value-of select="."/>
                        <xsl:if test="../hl7:state[string-length(.)>0]">
                            <xsl:text>, </xsl:text>
                            <xsl:value-of select="../hl7:state"/>
                        </xsl:if>
                        <xsl:if test="following-sibling::hl7:postalCode[1][string-length(.) > 0 or @code]">
                            <xsl:text> </xsl:text>
                            <xsl:choose>
                                <xsl:when test="following-sibling::hl7:postalCode[1][string-length(.) > 0]">
                                    <xsl:value-of select="following-sibling::hl7:postalCode[1][string-length(.) > 0]"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="following-sibling::hl7:postalCode[1][@code]/@code"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                        <xsl:if test="following-sibling::hl7:*[1][string-length(.) > 0 or @code]">
                            <br/>
                        </xsl:if>
                    </xsl:when>
                    <!-- DTr2 ZIP CITY, STATE or CITY, STATE ZIP depending on addr part contents -->
                    <xsl:when test="self::hl7:part[@type='CTY']">
                        <xsl:if test="preceding-sibling::hl7:part[@type='ZIP'][1][string-length(@value) > 0 or @code]">
                            <xsl:choose>
                                <xsl:when test="preceding-sibling::hl7:postalCode[1][string-length(@value) > 0]">
                                    <xsl:value-of select="preceding-sibling::hl7:postalCode[1][string-length(@value) > 0]/@value"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="preceding-sibling::hl7:postalCode[1][@code]/@code"/>
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:text> </xsl:text>
                        </xsl:if>
                        <xsl:value-of select="@value"/>
                        <xsl:if test="../hl7:part[@type='STA'][string-length(@value)>0]">
                            <xsl:text>, </xsl:text>
                            <xsl:value-of select="../hl7:part[@type='STA']/@value"/>
                        </xsl:if>
                        <xsl:if test="following-sibling::hl7:part[@type='ZIP'][1][string-length(@value) > 0 or @code]">
                            <xsl:choose>
                                <xsl:when test="following-sibling::hl7:postalCode[1][string-length(@value) > 0]">
                                    <xsl:value-of select="following-sibling::hl7:postalCode[1][string-length(@value) > 0]/@value"/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="following-sibling::hl7:postalCode[1][@code]/@code"/>
                                </xsl:otherwise>
                            </xsl:choose>
                            <xsl:text> </xsl:text>
                        </xsl:if>
                        <xsl:if test="following-sibling::hl7:part[1][string-length(@value) > 0 or @code]">
                            <br/>
                        </xsl:if>
                    </xsl:when>
                    <!-- DTr1 -->
                    <xsl:when test="self::hl7:postalCode and ../hl7:city"/>
                    <!-- DTr2 -->
                    <xsl:when test="self::hl7:part[@type='ZIP'] and ../hl7:part[@type='CTY']"/>
                    <!-- DTr1 -->
                    <xsl:when test="self::hl7:state">
                        <xsl:if test="not(../hl7:city)">
                            <xsl:if test="(string-length(preceding-sibling::hl7:*[1]) > 0 or preceding-sibling::*/@code)">
                                <br/>
                            </xsl:if>
                            <xsl:value-of select="."/>
                            <xsl:if test="(string-length(following-sibling::hl7:*[1]) > 0 or following-sibling::*/@code)">
                                <br/>
                            </xsl:if>
                        </xsl:if>
                    </xsl:when>
                    <!-- DTr2 -->
                    <xsl:when test="self::hl7:part[@type='STA']">
                        <xsl:if test="not(../hl7:part[@type = 'CTY'])">
                            <xsl:if test="(string-length(preceding-sibling::hl7:*[1]/@value) > 0 or preceding-sibling::hl7:*/@code)">
                                <br/>
                            </xsl:if>
                            <xsl:value-of select="@value"/>
                            <xsl:if test="(string-length(following-sibling::hl7:*[1]/@value) > 0 or following-sibling::hl7:*/@code)">
                                <br/>
                            </xsl:if>
                        </xsl:if>
                    </xsl:when>
                    <!-- DTr1 -->
                    <xsl:when test="string-length(text()) > 0">
                        <xsl:value-of select="."/>
                        <xsl:if test="(string-length(following-sibling::hl7:*[1]) > 0 or following-sibling::hl7:*/@code)">
                            <br/>
                        </xsl:if>
                    </xsl:when>
                    <!-- DTr2 -->
                    <xsl:when test="string-length(@value) > 0">
                        <xsl:value-of select="@value"/>
                        <xsl:if test="(string-length(following-sibling::hl7:*[1]/@value) > 0 or following-sibling::hl7:*/@code)">
                            <br/>
                        </xsl:if>
                    </xsl:when>
                    <xsl:otherwise> </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
            <xsl:for-each select="$in/hl7:useablePeriod">
                <div>
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="'Period'"/>
                    </xsl:call-template>
                    <xsl:text> </xsl:text>
                    <xsl:call-template name="show-ivlts">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </div>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Show elements with datatype QTY/PQ separated with the value in 'sep'. Calls <xd:ref name="show-quantity" type="template">show-quantity</xd:ref>
            </xd:p>
        </xd:desc>
        <xd:param name="in">Set of 0 to * elements</xd:param>
        <xd:param name="sep">Separator between output of different elements. Default ', ' and special is 'br' which generates an HTML br tag</xd:param>
    </xd:doc>
    <xsl:template name="show-quantity-set">
        <xsl:param name="in"/>
        <xsl:param name="sep" select="', '"/>
        <xsl:if test="$in">
            <xsl:choose>
                <!-- DTr1 -->
                <xsl:when test="count($in) &gt; 1">
                    <xsl:for-each select="$in">
                        <xsl:call-template name="show-quantity">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                        <xsl:if test="position() != last()">
                            <xsl:choose>
                                <xsl:when test="$sep = 'br'">
                                    <br/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$sep"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:when>
                <!-- DTr2 -->
                <xsl:when test="$in[hl7:item]">
                    <xsl:for-each select="$in/hl7:item">
                        <xsl:call-template name="show-quantity">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                        <xsl:if test="position() != last()">
                            <xsl:choose>
                                <xsl:when test="$sep = 'br'">
                                    <br/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$sep"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:when>
                <!-- DTr1 or DTr2 -->
                <xsl:otherwise>
                    <xsl:call-template name="show-quantity">
                        <xsl:with-param name="in" select="$in"/>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Show element with datatype QTY/PQ</xd:p>
        </xd:desc>
        <xd:param name="in">One element, possibly out of a set</xd:param>
    </xd:doc>
    <xsl:template name="show-quantity">
        <xsl:param name="in"/>
        <xsl:if test="$in">
            <xsl:choose>
                <xsl:when test="$in[@value]">
                    <xsl:value-of select="$in/@value"/>
                    <xsl:text> </xsl:text>
                    <xsl:choose>
                        <xsl:when test="$in[not(@unit) or @unit = '1'][@value = 1]">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'Unit'"/>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:when test="$in[not(@unit) or @unit = '1'][@value > 1]">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'Units'"/>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="$in/@unit"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:when>
            </xsl:choose>
            <xsl:if test="$in[@value | @unit]">
                <xsl:text> </xsl:text>
            </xsl:if>
            <xsl:if test="$in[@nullFlavor]">
                <xsl:text>(</xsl:text>
                <xsl:call-template name="show-nullFlavor">
                    <xsl:with-param name="in" select="$in/@nullFlavor"/>
                </xsl:call-template>
                <xsl:text>)</xsl:text>
            </xsl:if>
            <xsl:for-each select="$in/*[local-name() = 'translation']">
                <div style="margin-left: 2em;">
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="local-name()"/>
                        <xsl:with-param name="post" select="' '"/>
                    </xsl:call-template>
                    <xsl:call-template name="show-code-set">
                        <xsl:with-param name="in" select="."/>
                    </xsl:call-template>
                </div>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>Show element with datatype IVL_TS</xd:desc>
        <xd:param name="in">One element, possibly out of a set</xd:param>
    </xd:doc>
    <xsl:template name="show-ivlts">
        <xsl:param name="in"/>
        <xsl:if test="$in">
            <xsl:variable name="fromDate">
                <xsl:call-template name="show-timestamp">
                    <xsl:with-param name="in" select="$in/hl7:low"/>
                    <xsl:with-param name="part" select="'date'"/>
                </xsl:call-template>
            </xsl:variable>
            <xsl:variable name="toDate">
                <xsl:call-template name="show-timestamp">
                    <xsl:with-param name="in" select="$in/hl7:high"/>
                    <xsl:with-param name="part" select="'date'"/>
                </xsl:call-template>
            </xsl:variable>
            <xsl:variable name="fromTime">
                <xsl:call-template name="show-timestamp">
                    <xsl:with-param name="in" select="$in/hl7:low"/>
                    <xsl:with-param name="part" select="'time'"/>
                </xsl:call-template>
            </xsl:variable>
            <xsl:variable name="toTime">
                <xsl:call-template name="show-timestamp">
                    <xsl:with-param name="in" select="$in/hl7:high"/>
                    <xsl:with-param name="part" select="'time'"/>
                </xsl:call-template>
            </xsl:variable>
            
            <xsl:choose>
                <xsl:when test="$in/@value">
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="'at'"/>
                        <xsl:with-param name="post" select="'&#160;'"/>
                    </xsl:call-template>
                    <xsl:call-template name="show-timestamp">
                        <xsl:with-param name="in" select="$in"/>
                    </xsl:call-template>
                </xsl:when>
                <!-- Same day, different times -->
                <xsl:when test="$fromDate = $toDate">
                    <xsl:call-template name="show-timestamp">
                        <xsl:with-param name="in" select="$in/hl7:low"/>
                        <xsl:with-param name="part" select="'date'"/>
                    </xsl:call-template>
                    
                    <xsl:if test="string-length(normalize-space($fromTime)) > 0">
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="normalize-space($fromTime)"/>
                        
                        <xsl:if test="string-length(normalize-space($toTime)) > 0">
                            <xsl:text> - </xsl:text>
                            <xsl:value-of select="normalize-space($toTime)"/>
                        </xsl:if>
                    </xsl:if>
                </xsl:when>
                <xsl:when test="$in/hl7:low">
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="'from'"/>
                        <xsl:with-param name="post" select="'&#160;'"/>
                    </xsl:call-template>
                    <xsl:call-template name="show-timestamp">
                        <xsl:with-param name="in" select="$in/hl7:low"/>
                    </xsl:call-template>
                    <xsl:if test="$in/hl7:high">
                        <xsl:call-template name="getLocalizedString">
                            <xsl:with-param name="pre" select="' '"/>
                            <xsl:with-param name="key" select="'to'"/>
                            <xsl:with-param name="post" select="'&#160;'"/>
                        </xsl:call-template>
                        <xsl:call-template name="show-timestamp">
                            <xsl:with-param name="in" select="$in/hl7:high"/>
                        </xsl:call-template>
                    </xsl:if>
                </xsl:when>
                <xsl:when test="$in/hl7:high">
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="'to'"/>
                        <xsl:with-param name="post" select="'&#160;'"/>
                    </xsl:call-template>
                    <xsl:call-template name="show-timestamp">
                        <xsl:with-param name="in" select="$in/hl7:high"/>
                    </xsl:call-template>
                </xsl:when>
            </xsl:choose>
        </xsl:if>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Show elements with datatype TEL or URI separated with the value in 'sep'. Calls <xd:ref name="show-telecom" type="template">show-telecom</xd:ref></xd:p>
        </xd:desc>
        <xd:param name="in">Set of 0 to * elements</xd:param>
        <xd:param name="sep">Separator between output of different elements. Default ', ' and special is 'br' which generates an HTML br tag</xd:param>
    </xd:doc>
    <xsl:template name="show-telecom-set">
        <xsl:param name="in"/>
        <xsl:param name="sep" select="', '"/>
        <xsl:if test="$in">
            <xsl:choose>
                <!-- DTr1 -->
                <xsl:when test="count($in) > 1">
                    <xsl:for-each select="$in">
                        <xsl:call-template name="show-telecom">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                        <xsl:if test="position() != last()">
                            <xsl:choose>
                                <xsl:when test="$sep = 'br'">
                                    <br/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$sep"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:when>
                <!-- DTr2 -->
                <xsl:when test="$in[hl7:item]">
                    <xsl:for-each select="$in/hl7:item">
                        <xsl:call-template name="show-telecom">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                        <xsl:if test="position() != last()">
                            <xsl:choose>
                                <xsl:when test="$sep = 'br'">
                                    <br/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$sep"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:when>
                <!-- DTr1 or DTr2 -->
                <xsl:otherwise>
                    <xsl:call-template name="show-telecom">
                        <xsl:with-param name="in" select="$in"/>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Show element with datatype TEL or URI</xd:p>
        </xd:desc>
        <xd:param name="in">One element, possibly out of a set</xd:param>
    </xd:doc>
    <xsl:template name="show-telecom">
        <xsl:param name="in"/>
        <xsl:choose>
            <xsl:when test="$in">
                <xsl:for-each select="$in">
                    <xsl:if test="position() > 1">
                        <br/>
                    </xsl:if>
                    
                    <xsl:variable name="type" select="substring-before(@value, ':')"/>
                    <xsl:variable name="value" select="substring-after(@value, ':')"/>
                    <xsl:if test="$type">
                        <xsl:call-template name="translateTelecomUriScheme">
                            <xsl:with-param name="code" select="$type"/>
                        </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="@use">
                        <xsl:text> </xsl:text>
                        <xsl:call-template name="tokenize">
                            <xsl:with-param name="prefix" select="'addressUse_'"/>
                            <xsl:with-param name="string" select="@use"/>
                            <xsl:with-param name="delimiters" select="' '"/>
                        </xsl:call-template>
                    </xsl:if>
                    <xsl:if test="$type or @use">
                        <xsl:text>: </xsl:text>
                    </xsl:if>
                    <xsl:choose>
                        <xsl:when test="$type">
                            <xsl:value-of select="$value"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="@value"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:for-each>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="key" select="'telecom information not available'"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Show element with datatype TS</xd:p>
        </xd:desc>
        <xd:param name="in">One element, possibly out of a set</xd:param>
        <xd:param name="part">value to tell if we want the full thing 'datetime', date only 'date', or time only 'time'</xd:param>
    </xd:doc>
    <xsl:template name="show-timestamp">
        <xsl:param name="in"/>
        <xsl:param name="part" select="'datetime'"/>
        
        <xsl:call-template name="formatDateTime">
            <xsl:with-param name="date" select="$in/@value"/>
            <xsl:with-param name="part" select="$part"/>
        </xsl:call-template>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Show elements with datatype ST separated with the value in 'sep'. Calls <xd:ref name="show-text" type="template">show-text</xd:ref></xd:p>
        </xd:desc>
        <xd:param name="in">Set of 0 to * elements</xd:param>
        <xd:param name="sep">Separator between output of different elements. Default ', ' and special is 'br' which generates an HTML br tag</xd:param>
    </xd:doc>
    <xsl:template name="show-text-set">
        <xsl:param name="in"/>
        <xsl:param name="sep" select="', '"/>
        <xsl:if test="$in">
            <xsl:choose>
                <!-- DTr1 -->
                <xsl:when test="count($in) > 1">
                    <xsl:for-each select="$in">
                        <xsl:call-template name="show-text">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                        <xsl:if test="position() != last()">
                            <xsl:choose>
                                <xsl:when test="$sep = 'br'">
                                    <br/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$sep"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:when>
                <!-- DTr2 -->
                <xsl:when test="$in[hl7:item]">
                    <xsl:for-each select="$in/hl7:item">
                        <xsl:call-template name="show-text">
                            <xsl:with-param name="in" select="."/>
                        </xsl:call-template>
                        <xsl:if test="position() != last()">
                            <xsl:choose>
                                <xsl:when test="$sep = 'br'">
                                    <br/>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:value-of select="$sep"/>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:if>
                    </xsl:for-each>
                </xsl:when>
                <!-- DTr1 or DTr2 -->
                <xsl:otherwise>
                    <xsl:call-template name="show-text">
                        <xsl:with-param name="in" select="$in"/>
                    </xsl:call-template>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Show element with datatype ST</xd:p>
        </xd:desc>
        <xd:param name="in">One element, possibly out of a set</xd:param>
    </xd:doc>
    <xsl:template name="show-text">
        <xsl:param name="in"/>
        <xsl:if test="$in">
            <xsl:choose>
                <!-- DTr1 and DTr2 -->
                <xsl:when test="$in[@nullFlavor]">
                    <xsl:call-template name="show-nullFlavor">
                        <xsl:with-param name="in" select="$in/@nullFlavor"/>
                    </xsl:call-template>
                </xsl:when>
                <!-- DTr2 -->
                <xsl:when test="$in[@value]">
                    <xsl:copy-of select="translate($in/@value, '&#13;&#10;', '&lt;br/&gt;')"/>
                </xsl:when>
                <!-- DTr1 -->
                <xsl:otherwise>
                    <xsl:copy-of select="translate($in/text(), '&#13;&#10;', '&lt;br/&gt;')"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Show element with datatype BL/BN</xd:p>
        </xd:desc>
        <xd:param name="in">One element, possibly out of a set</xd:param>
    </xd:doc>
    <xsl:template name="show-boolean">
        <xsl:param name="in"/>
        <xsl:if test="$in">
            <xsl:choose>
                <!-- DTr1 and DTr2 -->
                <xsl:when test="$in[@value]">
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="concat('boolean-', $in/@value)"/>
                    </xsl:call-template>
                </xsl:when>
                <!-- DTr1 and DTr2 -->
                <xsl:when test="$in[@nullFlavor]">
                    <xsl:call-template name="show-nullFlavor">
                        <xsl:with-param name="in" select="$in/@nullFlavor"/>
                    </xsl:call-template>
                </xsl:when>
            </xsl:choose>
        </xsl:if>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Show a nullFlavor as text</xd:p>
        </xd:desc>
        <xd:param name="in">The nullFlavor code, e.g. NI, OTH</xd:param>
    </xd:doc>
    <xsl:template name="show-nullFlavor">
        <xsl:param name="in"/>
        <xsl:if test="string-length($in) > 0">
            <xsl:call-template name="getLocalizedString">
                <xsl:with-param name="key" select="concat('nullFlavor_', $in)"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <!-- ====================================================================== -->
    <!--                           Supporting functions                         -->
    <!-- ====================================================================== -->

    <xd:doc>
        <xd:desc>
            <xd:p>Takes the 5th and 6th character from a timestamp, and returns the localized month name</xd:p>
        </xd:desc>
        <xd:param name="date">Timestamp string</xd:param>
    </xd:doc>
    <xsl:template name="formatMonth">
        <xsl:param name="date"/>
        <!-- month -->
        <xsl:variable name="month" select="substring($date, 5, 2)"/>
        <xsl:choose>
            <xsl:when test="$month = '01'">
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="key" select="'January'"/>
                    <xsl:with-param name="post" select="' '"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$month = '02'">
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="key" select="'February'"/>
                    <xsl:with-param name="post" select="' '"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$month = '03'">
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="key" select="'March'"/>
                    <xsl:with-param name="post" select="' '"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$month = '04'">
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="key" select="'April'"/>
                    <xsl:with-param name="post" select="' '"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$month = '05'">
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="key" select="'May'"/>
                    <xsl:with-param name="post" select="' '"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$month = '06'">
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="key" select="'June'"/>
                    <xsl:with-param name="post" select="' '"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$month = '07'">
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="key" select="'July'"/>
                    <xsl:with-param name="post" select="' '"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$month = '08'">
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="key" select="'August'"/>
                    <xsl:with-param name="post" select="' '"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$month = '09'">
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="key" select="'September'"/>
                    <xsl:with-param name="post" select="' '"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$month = '10'">
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="key" select="'October'"/>
                    <xsl:with-param name="post" select="' '"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$month = '11'">
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="key" select="'November'"/>
                    <xsl:with-param name="post" select="' '"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$month = '12'">
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="key" select="'December'"/>
                    <xsl:with-param name="post" select="' '"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$month"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Formats a timestamp</xd:p>
        </xd:desc>
        <xd:param name="date"/>
        <xd:param name="part">value to tell if we want the full thing 'datetime', date only 'date', or time only 'time'</xd:param>
    </xd:doc>
    <xsl:template name="formatDateTime">
        <xsl:param name="date"/>
        <xsl:param name="part" select="'datetime'"/>
        
        <xsl:variable name="yearNum" select="substring ($date, 1, 4)"/>
        <xsl:variable name="monthNum" select="substring ($date, 5, 2)"/>
        <xsl:variable name="monthText">
            <xsl:call-template name="formatMonth">
                <xsl:with-param name="date" select="$date"/>
            </xsl:call-template>
        </xsl:variable>
        <xsl:variable name="dayNum">
            <xsl:choose>
                <xsl:when test="substring($date, 7, 1) = '0'">
                    <xsl:value-of select="substring($date, 8, 1)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="substring($date, 7, 2)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:if test="not($part = 'time')">
            <xsl:choose>
                <xsl:when test="$textLangPartLowerCase = 'nl'">
                    <xsl:value-of select="$dayNum"/>
                    <xsl:text> </xsl:text>
                    <xsl:call-template name="caseDown">
                        <xsl:with-param name="data" select="$monthText"/>
                    </xsl:call-template>
                    <xsl:text> </xsl:text>
                    <xsl:value-of select="$yearNum"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:call-template name="firstCharCaseUp">
                        <xsl:with-param name="data" select="$monthText"/>
                    </xsl:call-template>
                    <xsl:if test="string-length($dayNum) > 0">
                        <xsl:text> </xsl:text>
                        <xsl:value-of select="$dayNum"/>
                    </xsl:if>
                    <xsl:if test="string-length($yearNum) > 0">
                        <xsl:text>, </xsl:text>
                        <xsl:value-of select="$yearNum"/>
                    </xsl:if>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:if>

        <!-- time and US timezone -->
        <xsl:if test="string-length($date) > 8 and not($part = 'date')">
            <xsl:if test="not($part = 'time')">
                <xsl:text>, </xsl:text>
            </xsl:if>
            <!-- time -->
            <xsl:variable name="time">
                <xsl:value-of select="substring($date, 9, 6)"/>
            </xsl:variable>
            <xsl:variable name="hh">
                <xsl:value-of select="substring($time, 1, 2)"/>
            </xsl:variable>
            <xsl:variable name="mm">
                <xsl:value-of select="substring($time, 3, 2)"/>
            </xsl:variable>
            <xsl:variable name="ss">
                <xsl:value-of select="substring($time, 5, 2)"/>
            </xsl:variable>
            <xsl:if test="string-length($hh) > 1">
                <xsl:choose>
                    <xsl:when test="$textLangPartLowerCase = 'en' and number($hh) > 12">
                        <xsl:value-of select="number($hh) - 12"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$hh"/>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:choose>
                    <xsl:when test="string-length($mm) > 1 and not(contains($mm, '-')) and not(contains($mm, '+')) and not($mm = '00' and $ss = '00')">
                        <xsl:text>:</xsl:text>
                        <xsl:value-of select="$mm"/>
                        <xsl:if test="string-length($ss) > 1 and not(contains($ss, '-')) and not(contains($ss, '+')) and not($ss = '00')">
                            <xsl:text>:</xsl:text>
                            <xsl:value-of select="$ss"/>
                        </xsl:if>
                    </xsl:when>
                    <xsl:when test="$textLangPartLowerCase = 'nl'">
                        <xsl:call-template name="getLocalizedString">
                            <xsl:with-param name="key" select="'h'"/>
                        </xsl:call-template>
                    </xsl:when>
                </xsl:choose>
                <xsl:if test="$textLangPartLowerCase = 'en'">
                    <xsl:choose>
                        <xsl:when test="number($hh) > 12">
                            <xsl:text>PM</xsl:text>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:text>AM</xsl:text>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:if>
            </xsl:if>
            <!-- time zone. Don't try getting a name for it as that will always fail parts of the year due to daylight savings -->
            <xsl:choose>
                <xsl:when test="contains($date, '+')">
                    <xsl:text> +</xsl:text>
                    <xsl:value-of select="substring-after($date, '+')"/>
                </xsl:when>
                <xsl:when test="contains($date, '-')">
                    <xsl:text> -</xsl:text>
                    <xsl:value-of select="substring-after($date, '-')"/>
                </xsl:when>
            </xsl:choose>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Get someones age based on the difference between 'date' and <xd:ref name="currentDate" type="parameter">currentDate</xd:ref>.</xd:p>
        </xd:desc>
        <xd:param name="date">Persons date of birth as HL7 TS</xd:param>
        <xd:param name="comparedate">The date, format yyyymmdd as HL7 TS, that the age should be calculated relative to</xd:param>
    </xd:doc>
    <xsl:template name="getAge">
        <xsl:param name="comparedate"/>
        <xsl:param name="date"/>
        <xsl:variable name="yearNum" select="substring($date, 1, 4)"/>
        <xsl:variable name="monthNum" select="substring($date, 5, 2)"/>
        <xsl:variable name="dayNum">
            <xsl:choose>
                <xsl:when test="substring ($date, 7, 1)=&quot;0&quot;">
                    <xsl:value-of select="substring($date, 8, 1)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="substring($date, 7, 2)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:variable name="yearNumCreate" select="substring($comparedate, 1, 4)"/>
        <xsl:variable name="monthNumCreate" select="substring($comparedate, 5, 2)"/>
        <xsl:variable name="dayNumCreate">
            <xsl:choose>
                <xsl:when test="substring ($comparedate, 7, 1)=&quot;0&quot;">
                    <xsl:value-of select="substring($comparedate, 8, 1)"/>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="substring($comparedate, 7, 2)"/>
                </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>

        <xsl:variable name="yearDiff" select="number($yearNumCreate) - number($yearNum)"/>
        <xsl:choose>
            <xsl:when test="number($monthNum) &lt; number($monthNumCreate)">
                <xsl:value-of select="$yearDiff"/>
            </xsl:when>
            <xsl:when test="number($monthNum) &gt; number($monthNumCreate)">
                <xsl:value-of select="$yearDiff - 1"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="number($dayNum) &lt;= number($dayNumCreate)">
                        <xsl:value-of select="$yearDiff"/>
                    </xsl:when>
                    <xsl:when test="number($dayNum) &gt; number($dayNumCreate)">
                        <xsl:value-of select="$yearDiff - 1"/>
                    </xsl:when>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Convert Telecom URI scheme (tel, fax, http, mailto) to display text</xd:p>
        </xd:desc>
        <xd:param name="code">Scheme string</xd:param>
    </xd:doc>
    <xsl:template name="translateTelecomUriScheme">
        <xsl:param name="code"/>
        <!--xsl:value-of select="document('voc.xml')/systems/system[@root=$code/@codeSystem]/code[@value=$code/@code]/@displayName"/-->
        <!--xsl:value-of select="document('codes.xml')/*/code[@code=$code]/@display"/-->
        <xsl:choose>
            <!-- lookup table Telecom URI -->
            <xsl:when test="$code = 'tel'">
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="key" select="'Tel'"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$code = 'fax'">
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="key" select="'Fax'"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$code = 'http' or $code = 'https'">
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="key" select="'Web'"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:when test="$code = 'mailto'">
                <xsl:call-template name="getLocalizedString">
                    <xsl:with-param name="key" select="'Mail'"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:text>{$code='</xsl:text>
                <xsl:value-of select="$code"/>
                <xsl:text>'?}</xsl:text>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Converts Latin characters in input to lower case and returns the result</xd:p>
        </xd:desc>
        <xd:param name="data">Input string</xd:param>
    </xd:doc>
    <xsl:template name="caseDown">
        <xsl:param name="data"/>
        <xsl:if test="$data">
            <xsl:value-of select="translate($data, $uc, $lc)"/>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Converts Latin characters in input to upper case and returns the result</xd:p>
        </xd:desc>
        <xd:param name="data">Input string</xd:param>
    </xd:doc>
    <xsl:template name="caseUp">
        <xsl:param name="data"/>
        <xsl:if test="$data">
            <xsl:value-of select="translate($data,$lc, $uc)"/>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Converts first character in input to upper case if it is a Latin character and returns the result</xd:p>
        </xd:desc>
        <xd:param name="data">Input string</xd:param>
    </xd:doc>
    <xsl:template name="firstCharCaseUp">
        <xsl:param name="data"/>
        <xsl:if test="$data">
            <xsl:call-template name="caseUp">
                <xsl:with-param name="data" select="substring($data, 1, 1)"/>
            </xsl:call-template>
            <xsl:value-of select="substring($data, 2)"/>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Tokenize based on delimiters, or if no delimiter do character tokenization</xd:p>
        </xd:desc>
        <xd:param name="string">String to tokenize</xd:param>
        <xd:param name="delimiters">Optional delimiter string</xd:param>
        <xd:param name="prefix">Optional prefix for every 'array' item</xd:param>
        <xd:param name="localize">Optional parameter to determine if we should just tokenize or also try to localize array items (default)</xd:param>
    </xd:doc>
    <xsl:template name="tokenize">
        <xsl:param name="string" select="''"/>
        <xsl:param name="delimiters" select="' '"/>
        <xsl:param name="prefix"/>
        <xsl:param name="localize" select="true()"/>
        <xsl:choose>
            <xsl:when test="not($string)"/>
            <xsl:when test="not($delimiters)">
                <xsl:call-template name="_tokenize-characters">
                    <xsl:with-param name="string" select="$string"/>
                    <xsl:with-param name="prefix" select="$prefix"/>
                    <xsl:with-param name="localize" select="$localize"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="_tokenize-delimiters">
                    <xsl:with-param name="string" select="$string"/>
                    <xsl:with-param name="delimiters" select="$delimiters"/>
                    <xsl:with-param name="prefix" select="$prefix"/>
                    <xsl:with-param name="localize" select="$localize"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Tokenize every character</xd:p>
        </xd:desc>
        <xd:param name="string">String to tokenize</xd:param>
        <xd:param name="prefix">Optional prefix for every 'array' item</xd:param>
        <xd:param name="localize">Optional parameter to determine if we should just tokenize or also try to localize array items (default)</xd:param>
    </xd:doc>
    <xsl:template name="_tokenize-characters">
        <xsl:param name="string"/>
        <xsl:param name="prefix"/>
        <xsl:param name="localize" select="true()"/>
        <xsl:if test="$string">
            <xsl:choose>
                <xsl:when test="$localize">
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="concat($prefix,substring($string, 1, 1))"/>
                    </xsl:call-template>
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="substring($string, 1, 1)"/>
                </xsl:otherwise>
            </xsl:choose>
            <xsl:call-template name="_tokenize-characters">
                <xsl:with-param name="string" select="substring($string, 2)"/>
                <xsl:with-param name="prefix" select="$prefix"/>
                <xsl:with-param name="localize" select="$localize"/>
            </xsl:call-template>
        </xsl:if>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Tokenize based on delimiters</xd:p>
        </xd:desc>
        <xd:param name="string">String to tokenize</xd:param>
        <xd:param name="delimiters">Required delimiter string</xd:param>
        <xd:param name="prefix">Optional prefix for every 'array' item</xd:param>
        <xd:param name="localize">Optional parameter to determine if we should just tokenize or also try to localize array items (default)</xd:param>
    </xd:doc>
    <xsl:template name="_tokenize-delimiters">
        <xsl:param name="string"/>
        <xsl:param name="delimiters"/>
        <xsl:param name="prefix"/>
        <xsl:param name="localize" select="true()"/>
        
        <xsl:variable name="delimiter" select="substring($delimiters, 1, 1)"/>
        <xsl:choose>
            <xsl:when test="not($delimiter)">
                <xsl:choose>
                    <xsl:when test="$localize">
                        <xsl:call-template name="getLocalizedString">
                            <xsl:with-param name="key" select="concat($prefix, $string)"/>
                        </xsl:call-template>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$string"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:when test="contains($string, $delimiter)">
                <xsl:if test="not(starts-with($string, $delimiter))">
                    <xsl:call-template name="_tokenize-delimiters">
                        <xsl:with-param name="string" select="substring-before($string, $delimiter)"/>
                        <xsl:with-param name="delimiters" select="substring($delimiters, 2)"/>
                        <xsl:with-param name="prefix" select="$prefix"/>
                        <xsl:with-param name="localize" select="$localize"/>
                    </xsl:call-template>
                </xsl:if>
                <xsl:text> </xsl:text>
                <xsl:call-template name="_tokenize-delimiters">
                    <xsl:with-param name="string" select="substring-after($string, $delimiter)"/>
                    <xsl:with-param name="delimiters" select="$delimiters"/>
                    <xsl:with-param name="prefix" select="$prefix"/>
                    <xsl:with-param name="localize" select="$localize"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <xsl:call-template name="_tokenize-delimiters">
                    <xsl:with-param name="string" select="$string"/>
                    <xsl:with-param name="delimiters" select="substring($delimiters, 2)"/>
                    <xsl:with-param name="prefix" select="$prefix"/>
                    <xsl:with-param name="localize" select="$localize"/>
                </xsl:call-template>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xd:doc>
        <xd:desc>
            <xd:p>Retrieves a language dependant string from our <xd:ref name="vocFile" type="parameter">language file</xd:ref> such as a label based on a key. Returns string based on <xd:ref name="textLang" type="parameter">textLang</xd:ref>, <xd:ref name="textLangDefault" type="parameter">textLangDefault</xd:ref>, the first two characters of the textLangDefault, e.g. 'en' in 'en-US' and finally if all else fails just the key text.</xd:p>
        </xd:desc>
        <xd:param name="pre">Some text or space to prefix our string with</xd:param>
        <xd:param name="key">The key to find our text with</xd:param>
        <xd:param name="post">Some text like a colon or space to postfix our text with</xd:param>
    </xd:doc>
    <xsl:template name="getLocalizedString">
        <xsl:param name="pre" select="''"/>
        <xsl:param name="key"/>
        <xsl:param name="post" select="''"/>
        
        <xsl:choose>
            <!-- compare 'de-CH' -->
            <xsl:when test="$vocMessages//translation[@key = $key]/value[@lang = $textLangLowerCase]">
                <xsl:value-of select="concat($pre,$vocMessages//translation[@key = $key]/value[@lang=$textLangLowerCase]/text(),$post)"/>
            </xsl:when>
            <!-- compare 'de' in 'de-CH' -->
            <xsl:when test="$vocMessages//translation[@key = $key]/value[substring(@lang, 1, 2)=$textLangPartLowerCase]">
                <xsl:value-of select="concat($pre,$vocMessages//translation[@key = $key]/value[substring(@lang, 1, 2)=$textLangPartLowerCase]/text(),$post)"/>
            </xsl:when>
            <!-- compare 'en-US' -->
            <xsl:when test="$vocMessages//translation[@key = $key]/value[@lang=$textLangDefaultLowerCase]">
                <xsl:value-of select="concat($pre,$vocMessages//translation[@key = $key]/value[@lang=$textLangDefaultLowerCase]/text(),$post)"/>
            </xsl:when>
            <!-- compare 'en' in 'en-US' -->
            <xsl:when test="$vocMessages//translation[@key = $key]/value[substring(@lang, 1, 2)=$textLangDefaultPartLowerCase]">
                <xsl:value-of select="concat($pre,$vocMessages//translation[@key = $key]/value[substring(@lang, 1, 2)=$textLangDefaultPartLowerCase]/text(),$post)"/>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="concat($pre,$key,$post)"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>Helper template for calculation of CSS font sizes. Takes <xd:ref name="font-size-main" type="parameter">font-size-main</xd:ref> as base and adds the value in parameter <xd:i>with</xd:i> while retaining the unit.</xd:p>
        </xd:desc>
        <xd:param name="with">The value to add to the base value. May be a negative number</xd:param>
    </xd:doc>
    <xsl:template name="raiseFontSize">
        <xsl:param name="with"/>
        <xsl:variable name="mainsize" select="translate($font-size-main,'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz','')"/>
        <xsl:variable name="mainunit" select="translate($font-size-main,'0123456789','')"/>
        <xsl:value-of select="number($mainsize)+number($with)"/>
        <xsl:value-of select="$mainunit"/>
    </xsl:template>

    <!-- ====================================================================== -->
    <!--                             Javascript stuff                           -->
    <!-- ====================================================================== -->
    
    <xd:doc>
        <xd:desc>
            <xd:p>generate global section toggle</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="make-sectiontoggle">
        <xsl:if test="count(hl7:component/hl7:structuredBody/hl7:component[hl7:section]) &gt; 0">
            <td style="background-color: white;">
                <!-- creates toggle for sections -->
                <div id="sectionsToggleExpand" style="display: none;" class="span_button" onclick="expandAllSections();">
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="'Expand All'"/>
                    </xsl:call-template>
                </div>
                <div id="sectionsToggleCollapse" class="span_button" onclick="collapseAllSections();">
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="'Collapse All'"/>
                    </xsl:call-template>
                </div>
            </td>
        </xsl:if>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>generate revision toggle</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="make-revisiontoggle">
        <xsl:if test="//hl7:content[@revised]">
            <td style="background-color: white;">
                <!-- creates toggle for revisions marks -->
                <div id="revisionToggleOn" class="span_button" onclick="showReviewMarks();">
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="'show revisions'"/>
                    </xsl:call-template>
                </div>
                <div id="revisionToggleOff" style="display: none;" class="span_button" onclick="hideReviewMarks();">
                    <xsl:call-template name="getLocalizedString">
                        <xsl:with-param name="key" select="'hide revisions'"/>
                    </xsl:call-template>
                </div>
            </td>
        </xsl:if>
    </xsl:template>
    
    <xd:doc>
        <xd:desc>
            <xd:p>generate table of contents</xd:p>
        </xd:desc>
    </xd:doc>
    <xsl:template name="make-tableofcontents">
        <xsl:variable name="tocid">
            <xsl:choose>
                <xsl:when test="$useJavascript"><xsl:text>nav</xsl:text></xsl:when>
                <xsl:otherwise><xsl:text>nonav</xsl:text></xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:if test="count(hl7:component/hl7:structuredBody/hl7:component[hl7:section]) &gt; 1">
            <td style="width: 35%; background-color: white;">
                <!-- produce table of contents -->
                <ul id="{$tocid}">
                    <li style="list-style: none;">
                        <div class="span_button">
                            <xsl:call-template name="getLocalizedString">
                                <xsl:with-param name="key" select="'Table of Contents'"/>
                            </xsl:call-template>
                            <xsl:text>&#160;&#8711;</xsl:text>
                        </div>
                        <ul>
                            <xsl:for-each select="hl7:component/hl7:structuredBody/hl7:component/hl7:section">
                                <li>
                                    <a>
                                        <xsl:attribute name="href">
                                            <xsl:text>#</xsl:text>
                                            <xsl:choose>
                                                <xsl:when test="@ID">
                                                    <xsl:value-of select="@ID"/>
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    <xsl:apply-templates select="." mode="getAnchorName"/>
                                                </xsl:otherwise>
                                            </xsl:choose>
                                        </xsl:attribute>
                                        <xsl:apply-templates select="." mode="getTitleName"/>
                                        <xsl:if test="@nullFlavor">
                                            <xsl:text> (</xsl:text>
                                            <xsl:call-template name="show-nullFlavor">
                                                <xsl:with-param name="in" select="@nullFlavor"/>
                                            </xsl:call-template>
                                            <xsl:text>)</xsl:text>
                                        </xsl:if>
                                        <xsl:if test="$menu-depth > 1 and hl7:component/hl7:section">
                                            <xsl:text> ▶</xsl:text>
                                        </xsl:if>
                                    </a>
                                    <xsl:if test="$menu-depth > 1 and hl7:component/hl7:section">
                                        <ul>
                                            <xsl:for-each select="hl7:component/hl7:section">
                                                <li style="padding-left: 2em;">
                                                    <a>
                                                        <xsl:attribute name="href">
                                                            <xsl:text>#</xsl:text>
                                                            <xsl:choose>
                                                                <xsl:when test="@ID">
                                                                    <xsl:value-of select="@ID"/>
                                                                </xsl:when>
                                                                <xsl:otherwise>
                                                                    <xsl:apply-templates select="." mode="getAnchorName"/>
                                                                </xsl:otherwise>
                                                            </xsl:choose>
                                                        </xsl:attribute>
                                                        <xsl:apply-templates select="." mode="getTitleName"/>
                                                        <xsl:if test="$menu-depth > 2 and hl7:component/hl7:section">
                                                            <xsl:text> ▶</xsl:text>
                                                        </xsl:if>
                                                    </a>
                                                    <xsl:if test="$menu-depth > 2 and hl7:component/hl7:section">
                                                        <ul>
                                                            <xsl:for-each select="hl7:component/hl7:section">
                                                                <li style="padding-left: 2em;">
                                                                    <a>
                                                                        <xsl:attribute name="href">
                                                                            <xsl:text>#</xsl:text>
                                                                            <xsl:choose>
                                                                                <xsl:when test="@ID">
                                                                                    <xsl:value-of select="@ID"/>
                                                                                </xsl:when>
                                                                                <xsl:otherwise>
                                                                                    <xsl:apply-templates select="." mode="getAnchorName"/>
                                                                                </xsl:otherwise>
                                                                            </xsl:choose>
                                                                        </xsl:attribute>
                                                                        <xsl:apply-templates select="." mode="getTitleName"/>
                                                                    </a>
                                                                </li>
                                                            </xsl:for-each>
                                                        </ul>
                                                    </xsl:if>
                                                </li>
                                            </xsl:for-each>
                                        </ul>
                                    </xsl:if>
                                </li>
                            </xsl:for-each>
                        </ul>
                    </li>
                </ul>
            </td>
        </xsl:if>
    </xsl:template>
</xsl:stylesheet>
