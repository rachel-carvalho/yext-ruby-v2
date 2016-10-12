# YextClient::AnalyticsFilter

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**start_date** | **Date** | The inclusive start date for the report data.  Defaults to 90 days before the end date. E.g. ‘2016-08-22’ NOTE: If WEEKS, MONTHS, or MONTHS_RETAIL is in dimensions, startDate must coincide with the beginning and end of a week or month, depending on the dimension chosen. | [optional] 
**end_date** | **Date** | The inclusive end date for the report data.  Defaults to the lowest common denominator of the relevant maximum reporting dates. E.g. ‘2016-08-30’ NOTE: If WEEKS, MONTHS, or MONTHS_RETAIL is in dimensions, endDate must coincide with the beginning and end of a week or month, depending on the dimension chosen. | [optional] 
**location_ids** | **Array&lt;String&gt;** | Array of locationIds | [optional] 
**folder_id** | **Integer** | Specifies the folder whose locations and subfolders should be included in the results. Default is 0 (root folder). Cannot be used when ACCOUNT_ID is in dimensions. | [optional] 
**countries** | **Array&lt;String&gt;** | Array of 3166 Alpha-2 country codes. | [optional] 
**location_labels** | **Array&lt;String&gt;** | Array of location labels | [optional] 
**platforms** | **Array&lt;String&gt;** | Array of platform IDs. | [optional] 
**sites** | **Array&lt;String&gt;** |  | [optional] 
**activity_types** | **Array&lt;String&gt;** | Activity types to include in an Activity list. | [optional] 
**actors** | **Array&lt;String&gt;** | List of actors whose activities should be included in an Activity list. | [optional] 
**min_search_frequency** | **Float** |  | [optional] 
**max_search_frequency** | **Float** |  | [optional] 
**search_term** | **String** |  | [optional] 
**search_type** | **String** |  | [optional] 
**foursquare_checkin_type** | **String** |  | [optional] 
**foursquare_checkin_age** | **String** |  | [optional] 
**foursquare_checkin_gender** | **String** |  | [optional] 
**foursquare_checkin_time_of_day** | **String** |  | [optional] 
**instagram_content_type** | **String** |  | [optional] 


