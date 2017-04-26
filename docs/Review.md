# YextClient::Review

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**status** | **String** | The current status of the review; only returned for First Party and External First Party reviews. Defaults to &#x60;QUARANTINED&#x60; when creating. | [optional] 
**rating** | **Float** | Normalized rating out of 5. This value is omitted if the review does not include a rating.  | [optional] 
**title** | **String** | Title of the review. This value is omitted if reviews on the publisher&#39;s site do not have titles.  | [optional] 
**url** | **String** | The URL of the review, or the URL of the listing where the review can be found if there is no specific URL for the review. | [optional] 
**publisher_date** | **Integer** | The timestamp of the review as reported by the publisher. If edits impact the review date on the publisher, then this date may change. This date always comes from the publisher and we respect whatever they have. | [optional] 
**business_id** | **Integer** | ID of the account associated with this review | [optional] 
**comments** | [**Array&lt;ReviewComment&gt;**](ReviewComment.md) | An ordered array of Comments on the review.  **NOTE:** The order is a flattened tree with depth ties broken by publisher date.  | [optional] 
**content** | **String** | Content of the review.  | [optional] 
**date** | **Date** | (&#x60;YYYY-MM-DD&#x60; format) If provided, the date you received the review from the customer. Defaults to the date the review was uploaded to Yext. | [optional] 
**author_name** | **String** | The name of the person who wrote the review (if we have it). | [optional] 
**author_email** | **String** | The email address of the person who wrote the review (if we have it). | [optional] 
**location_id** | **String** | ID of the location associated with this review | [optional] 
**last_yext_update_time** | **Integer** | This is the timestamp Yext last ingested an update for the review. This is a timestamp from Yext, and it always means the last time this review changed in Yext. | [optional] 
**publisher_id** | **String** | For third-party reviews, the ID of publisher associated with this listing. For first-party reviews, this will be FIRST_PARTY.  | [optional] 
**id** | **Integer** | ID of this review | [optional] 


