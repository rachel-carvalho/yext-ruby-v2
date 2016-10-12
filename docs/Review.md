# YextClient::Review

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **Integer** | ID of this review | [optional] 
**location_id** | **String** | ID of the location associated with this review | [optional] 
**publisher_id** | **String** | For third-party reviews, the ID of publisher associated with this listing. For first-party reviews, this will be FIRST_PARTY.  | [optional] 
**rating** | **Float** | Normalized rating out of 5. This value is omitted if the review does not include a rating.  | [optional] 
**title** | **String** | Title of the review. This value is omitted if reviews on the publisher&#39;s site do not have titles.  | [optional] 
**content** | **String** | Content of the review.  | [optional] 
**author_name** | **String** | The name of the person who wrote the review (if we have it). | [optional] 
**author_email** | **String** | The email address of the person who wrote the review (if we have it). | [optional] 
**url** | **String** | The URL of the review, or the URL of the listing where the review can be found if there is no specific URL for the review. | [optional] 
**comments** | [**Array&lt;ReviewComment&gt;**](ReviewComment.md) | An ordered array of Comments on the review.  **NOTE:** The order is a flattened tree with depth ties broken by publisher date.  | [optional] 


