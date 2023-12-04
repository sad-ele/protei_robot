*** Settings ***
Library    lib.py

*** Variables ***
${city}    Санкт-Петербург
${streetname}    Исаакиевская площадь
${housenumber}    4
${latitude}    59.93407845
${longitude}    30.3061419662862

*** Test Cases ***
Get Coordinates
    [documentation]    /// Совпадают ли координаты места с его адресом (не совпадают, так как
      ...  на любой адрес он отдает координаты центральной точки Питера) ///
    [Template]    Find coordinates by adress
    ${city}          ${streetname}          ${housenumber}
Get Adress
    [documentation]    /// Совпадает ли адрес с координатами места ///
    [Template]    Find adress by coordinates
    ${latitude}      ${longitude}


*** Keywords ***
Find coordinates by adress
    [Arguments]    ${city}    ${streetname}    ${housenumber}
    ${geoinfo}=  get_adress_by_name    ${city}    ${streetname}    ${housenumber}
    Should be equal    ${geoinfo}[lat]    ${latitude}
    Should be equal    ${geoinfo}[lon]    ${longitude}

Find adress by coordinates
    [Arguments]    ${latitude}    ${longitude}
    ${geoinfo}=  get_adress_by_coordinates    ${latitude}    ${longitude}
    Should Contain    ${geoinfo}[display_name]    ${city}
    Should Contain    ${geoinfo}[display_name]    ${streetname}
    Should Contain    ${geoinfo}[display_name]    ${housenumber}
