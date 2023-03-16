
Profile: MesFrObservationBp
Parent: $FrObservationBp
Id: mes-fr-observation-bp
Description: "Pression artérielle - profil créé pour l'alimentation de l'Espace Numérique de Santé"
* meta 1..
* meta.source ^short = "Uri identifiant les systèmes tiers ayant envoyé la ressource."
* meta.source ^definition = "Uri identifiant les systèmes tiers ayant envoyé la ressource."
* meta.profile 1..*
* meta.profile ^slicing.discriminator.type = #value
* meta.profile ^slicing.discriminator.path = "$this"
* meta.profile ^slicing.rules = #open
* meta.profile contains MesFrObservationBp 1..1 MS
* meta.profile[MesFrObservationBp] = Canonical(mes-fr-observation-bp) 

* extension contains
    mes-reason-for-measurement named MesReasonForMeasurement 0..1 and
    mes-moment-of-measurement named MesMomentOfMeasurement 0..1

* category[VSCat] ^sliceName = "VSCat"
* category[VSCat].coding.display = "Signes vitaux" 
* subject only Reference($fr-patient)
* effective[x] only dateTime


* interpretation ^short = "Non renseigné"
* interpretation ^definition = "Non renseigné"

* bodySite from $JDV-J149-BodySiteBP-MES (required)
* bodySite ^binding.description = $JDV-J149-BodySiteBP-MES
* bodySite.coding.system 1..
* bodySite.coding.code 1..

* method from $JDV-J150-MethodBP-MES (required)
* method ^binding.description = $JDV-J150-MethodBP-MES
* method.coding.system 1..
* method.coding.code 1..

* device only Reference($PhdDevice)
* device ^definition = "Dispositif utilisé pour l'observation\r\nSi la mesure a été faite par un objet connecté (Profil PhdDevice) =>cette référence est obligatoire"
* device.reference 1..

* referenceRange.appliesTo from $JDV-J148-ReferenceRangeAppliesTo-CISIS (required)
* referenceRange.appliesTo ^binding.description = $JDV-J148-ReferenceRangeAppliesTo-CISIS
* referenceRange.appliesTo.coding.system 1..
* referenceRange.appliesTo.coding.code 1..
* component.referenceRange ^contentReference = "http://hl7.org/fhir/StructureDefinition/Observation#Observation.referenceRange"
