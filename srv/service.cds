using { BusinessPartnerA2X } from './external/BusinessPartnerA2X.cds';

using { RiskManagement as my } from '../db/schema.cds';

@path : '/service/RiskManagementService'
service RiskManagementService
{
    // annotate BusinessPartners with @restrict :
    // [
    //     { grant : [ '*' ], to : [ 'RiskManager' ] },
    //     { grant : [ '*' ], to : [ 'RiskViewer' ] },
    //     { grant : [ '*' ], to : [ 'any' ] },
    //     { grant : [ '*' ], to : [ 'authenticated-user' ] }
    // ];

    // annotate Mitigations with @restrict :
    // [
    //     { grant : [ '*' ], to : [ 'RiskManager' ] },
    //     { grant : [ '*' ], to : [ 'authenticated-user' ] },
    //     { grant : [ '*' ], to : [ 'any' ] },
    //     { grant : [ '*' ], to : [ 'RiskViewer' ] }
    // ];

    // annotate Risks with @restrict :
    // [
    //     { grant : [ '*' ], to : [ 'RiskManager' ] },
    //     { grant : [ '*' ], to : [ 'RiskViewer' ] },
    //     { grant : [ '*' ], to : [ 'any' ] },
    //     { grant : [ '*' ], to : [ 'authenticated-user' ] }
    // ];

    entity BusinessPartners as
        projection on BusinessPartnerA2X.A_BusinessPartner
        {
            BusinessPartner,
            Customer,
            Supplier,
            BusinessPartnerCategory,
            BusinessPartnerFullName,
            BusinessPartnerIsBlocked
        };

    @odata.draft.enabled: 'true'
    entity Risks as
        projection on my.Risks;

    @odata.draft.enabled: 'true'
    entity Mitigations as
        projection on my.Mitigations;
}

annotate RiskManagementService with @requires :
[
    'authenticated-user',
    'RiskManager',
    'RiskViewer'
];
