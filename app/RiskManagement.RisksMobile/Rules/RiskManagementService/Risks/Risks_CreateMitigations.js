export default function CreateRelatedEntity(clientAPI) {
    if (clientAPI.getODataProvider('/RisksMobile/Services/RiskManagementService.service').isDraftEnabled('Risks')) {
        let readLink = clientAPI.binding['@odata.readLink'];
        return clientAPI.executeAction({
            'Name': '/RisksMobile/Actions/RiskManagementService/Risks/Risks_CreateMitigations.action',
            'Properties': {
                'OnSuccess': ''
            }
        }).then((result) => {
            return clientAPI.executeAction({
                'Name': '/RisksMobile/Actions/DraftSaveEntity.action',
                'Properties': {
                    'Target': {
                        'EntitySet': 'Risks',
                        'ReadLink': readLink
                    }
                }
            });
        });
    } else {
        return clientAPI.executeAction('/RisksMobile/Actions/RiskManagementService/Risks/Risks_CreateMitigations.action');
    }
}