@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'TRuck Master Root view'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZR_LP_TRUCK_MASTER as select from ZI_LP_TRUCKMASTER
//composition of target_data_source_name as _association_name
{
    key Truckregnum,
    Truckmake,
    Truckpuc,
    Lastchanged,
    Createdby,
    Changedby
//    _association_name // Make association public
}
