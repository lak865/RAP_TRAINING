@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Truck Master Root conjumption view'
@Metadata.allowExtensions: true
define root view entity ZC_LP_TRUCK_MASTER as projection on ZR_LP_TRUCK_MASTER
{
    key Truckregnum,
    Truckmake,
    Truckpuc,
    Lastchanged,
    Createdby,
    Changedby
}
