using { BusinessPartnerA2X } from '../srv/external/BusinessPartnerA2X.cds'; 
namespace RiskManagement;

entity Risks {
    key ID: UUID;
    miti_id: UUID;
    title: String;
    prio: String;
    descr: String;
    impact: Integer;
    criticality: Integer;   
    // Store the external Business Partner key locally for a reliable join
    supplier_businesspartner     : String(10); // A_BusinessPartner.BusinessPartner is a string key

    risks : Association to many Mitigations on risks.ID = $self.miti_id;
    // To-one Association to external BusinessPartnerA2X.A_BusinessPartner
     // Name: supplier | Type: Association | Multiplicity: To-one
    supplier : Association to BusinessPartnerA2X.A_BusinessPartner
                on supplier.BusinessPartner = $self.supplier_businesspartner;
}

entity Mitigations {
    key ID: UUID;
    createdAt:	String;	
    createdBy:	String;	
    description: String;	
    owner:	String;	
    timeline:	String;
    miti : Association to Risks;
}