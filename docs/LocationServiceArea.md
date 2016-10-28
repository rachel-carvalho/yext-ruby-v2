# YextClient::LocationServiceArea

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**radius** | **Integer** | The distance around the location that the business serves  **Requires unit:** If the service area is specified with **radius**, a value for **unit** must also be specified.  | [optional] 
**unit** | **String** | The unit in which radius is measured.  One of: * km - kilometers * mi - miles  | [optional] 
**places** | **Array&lt;String&gt;** | A list of places served by the location, where each place is either: * a postal code, or * the name of a city.  | [optional] 


