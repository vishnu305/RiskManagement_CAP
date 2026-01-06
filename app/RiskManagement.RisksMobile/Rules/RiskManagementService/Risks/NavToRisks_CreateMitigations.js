export default function NavToCreate(clientAPI) {
    if (clientAPI.getODataProvider('/RisksMobile/Services/RiskManagementService.service').isDraftEnabled('Risks')) {
        return clientAPI.executeAction({
            'Name': '/RisksMobile/Actions/DraftEditEntity.action',
            'Properties': {
                'Target': {
                    'EntitySet': 'Risks'
                },
                'OnSuccess': '/RisksMobile/Actions/RiskManagementService/Risks/NavToRisks_CreateMitigations.action'
            }
        });
    } else {
        return clientAPI.executeAction('/RisksMobile/Actions/RiskManagementService/Risks/NavToRisks_CreateMitigations.action');
    }
}