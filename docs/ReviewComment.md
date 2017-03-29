# YextClient::ReviewComment

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**content** | **String** | Content of the comment. | [optional] 
**author_role** | **String** |  | [optional] 
**publisher_date** | **Integer** | The timestamp of the comment as reported by the publisher.  If edits impact the comment timestamp on the publisher, then this timestamp may change.  This timestamp always comes from the publisher and we respect whatever they have. | [optional] 
**visibility** | **String** | Defaults to &#x60;PUBLIC&#x60; when creating a comment | [optional] 
**author_email** | **String** | The email address of the person who wrote the comment (if we have it). | [optional] 
**author_name** | **String** | The name of the person who wrote the comment (if we have it). | [optional] 
**parent_id** | **Integer** | If this comment is in response to another comment, this is the ID of the parent comment. | [optional] 
**id** | **Integer** | ID of this comment (assigned by Yext). | [optional] 


