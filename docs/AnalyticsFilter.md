# YextClient::AnalyticsFilter

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**start_date** | **Date** | The inclusive start date for the report data.  Defaults to 90 days before the end date. Must be before the date given in &#x60;endDate&#x60;. E.g. ‘2016-08-22’ NOTE: If &#x60;WEEKS&#x60;, &#x60;MONTHS&#x60;, or &#x60;MONTHS_RETAIL&#x60; is in dimensions, startDate must coincide with the beginning and end of a week or month, depending on the dimension chosen. | [optional] 
**location_labels** | **Array&lt;String&gt;** | Array of location labels | [optional] 
**end_date** | **Date** | The exclusive end date for the report data.  Defaults to the lowest common denominator of the relevant maximum reporting dates. Must be after the date given in &#x60;startDate&#x60;. E.g. ‘2016-08-30’ NOTE: If &#x60;WEEKS&#x60;, &#x60;MONTHS&#x60;, or &#x60;MONTHS_RETAIL&#x60; is in dimensions, endDate must coincide with the beginning and end of a week or month, depending on the dimension chosen. | [optional] 
**instagram_content_type** | **String** |  | [optional] 
**google_action_type** | **Array&lt;String&gt;** | Specifies the type of customer actions to be included in the report. Can only be used with the &#x60;GOOGLE_CUSTOMER_ACTIONS&#x60; metric. | [optional] 
**google_query_type** | **Array&lt;String&gt;** | Specifies the type of queries to be included in the report. Can only be used with the &#x60;GOOGLE_SEARCHES&#x60; metric. | [optional] 
**platforms** | **Array&lt;String&gt;** | Array of platform IDs. | [optional] 
**search_term** | **String** |  | [optional] 
**partners** | **Array&lt;Float&gt;** | Specifies the partners that should be included in the report. Can only be used with Reviews metrics. | [optional] 
**search_type** | **String** |  | [optional] 
**foursquare_checkin_age** | **String** |  | [optional] 
**frequent_words** | **Array&lt;String&gt;** | Specifies the words that should be included in the report. Can only be used with Reviews metrics. | [optional] 
**foursquare_checkin_time_of_day** | **String** |  | [optional] 
**ratings** | **Array&lt;Integer&gt;** | Specifies the ratings to be included in the report. Can only be used with Reviews metrics. | [optional] 
**foursquare_checkin_gender** | **String** |  | [optional] 
**foursquare_checkin_type** | **String** |  | [optional] 
**hours** | **Array&lt;Float&gt;** | Specifies the hour(s) of day that should be included in the report. Can only, and must be used with the &#x60;GOOGLE_PHONE_CALLS&#x60; metric. | [optional] 
**max_search_frequency** | **Float** |  | [optional] 
**folder_id** | **Integer** | Specifies the folder whose locations and subfolders should be included in the results. Default is 0 (root folder). Cannot be used when &#x60;ACCOUNT_ID&#x60; is in dimensions. | [optional] 
**location_ids** | **Array&lt;String&gt;** | Array of locationIds | [optional] 
**countries** | **Array&lt;String&gt;** | Array of 3166 Alpha-2 country codes. | [optional] 
**min_search_frequency** | **Float** |  | [optional] 


