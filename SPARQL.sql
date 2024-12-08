

PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX dbo: <http://www.telcoserices.org/ontologies/2024/10/telco-ontology#>  


--1 Classes SubClasses and Services 
SELECT ?topClass ?directSubclass ?indirectSubclass
WHERE {

  ?directSubclass rdfs:subClassOf ?topClass .
 
  ?indirectSubclass rdfs:subClassOf ?directSubclass .
  
 
  ?topClass rdf:type owl:Class .
  ?directSubclass rdf:type owl:Class .
  ?indirectSubclass rdf:type owl:Class .
}
GROUP BY ?topClass ?directSubclass ?indirectSubclass


-- Individual Counts Under Sub  Services Classes
SELECT ?type (COUNT(?individual) AS ?individualCount)
WHERE {
  ?individual rdf:type ?type .
  ?directSubClass rdfs:subClassOf dbo:Services .
  ?type rdfs:subClassOf ?directSubClass .
}
GROUP BY ?type



-- Individual Counts Under Classes
SELECT ?type (COUNT(?individual) AS ?count)
WHERE {
  ?individual rdf:type ?type.
   ?type rdf:type owl:Class
}
GROUP BY ?type







--4 Individuals Under  HighIncomeHighPayingMobileCustomer
SELECT ?individual ?type
WHERE {
  ?individual rdf:type ?type .
  FILTER (?type =dbo:MobileCustomer)
}




SELECT ?type (COUNT(?individual) AS ?count)
WHERE {
  ?individual rdf:type ?type.
  FILTER (?type = dbo:MobileCustomer)
}
GROUP BY ?type










-- 14   Servicea and User Count
SELECT ?type (COUNT(?individual) AS ?individualCount)
WHERE {
  ?individual rdf:type ?type .
  ?directSubClass rdfs:subClassOf dbo:Services .
  ?type rdfs:subClassOf ?directSubClass .
}
GROUP BY ?type


--15
-- Promoting IVR and SMS  Services Users
SELECT ?type ?individual ?service
WHERE {
  ?individual rdf:type ?type.
  FILTER (?type = dbo:HighIncomeHighPayingMobileCustomer).
  
  ?service rdf:type ?serviceType.
  FILTER (?serviceType IN (dbo:IVR, dbo:SMS))
}