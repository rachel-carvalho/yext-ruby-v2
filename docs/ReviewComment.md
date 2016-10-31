# YextClient::ReviewComment

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**author_role** | **String** |  | [optional] 
**publisher_date** | **String** | The date of the comment as reported by the publisher.  If edits impact the comment date on the publisher, then this date may change.  This date always comes from the publisher and we respect whatever they have. | [optional] 
**visibility** | **String** |  | [optional] 
**author_email** | **String** | The email address of the person who wrote the comment (if we have it). | [optional] 
**author_name** | **String** | The name of the person who wrote the comment (if we have it). | [optional] 
**parent_id** | **Integer** | If this comment is in response to another comment, this is the ID of the parent comment. | [optional] 
**message** | **String** | Content of the comment. | [optional] 
**id** | **Integer** | ID of this comment (assigned by Yext). | [optional] 


