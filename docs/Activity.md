# YextClient::Activity

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**type** | **String** | The type of the activity.  See AnalyticsFilter for activity types. | [optional] 
**date** | **String** | The date and time the activity occurred in ISO 8601 format (yyyy-mm-ddT:hh:mm:ss.000Z) | [optional] 
**location_id** | **String** | The ID of the location affected by the activity, if applicable. | [optional] 
**actor** | **String** | The performer of the activity.  See possible values above. | [optional] 
**content** | **String** | A description of the activity (e.g., Listing Live on Facebook) or the text that was saved as a result of the activity (e.g., Call Today!, MAIN : 9085550506) May be an empty string (\&quot;\&quot;) for certain activities (e.g., updates to Enhanced Content Lists) | [optional] 
**details** | **String** | A description of the activity (e.g., Featured Message field updated, New Social post on Facebook) | [optional] 


