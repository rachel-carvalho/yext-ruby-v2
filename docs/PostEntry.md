# YextClient::PostEntry

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**status** | **String** |  | [optional] 
**liked** | **BOOLEAN** | True if the business representative for the given location and publisher likes this PostEntry | [optional] 
**author** | [**Author**](Author.md) |  | [optional] 
**timestamp** | **Integer** | Timestamp this PostEntry was created, as reported by the publisher (milliseconds since epoch). | [optional] 
**photo_url** | **String** | The URL of the photo included in the PostEntry, if any. | [optional] 
**comments** | **Integer** | Total number of Comments that have been written in response to this PostEntry. (i.e. the number of descendents of this node in the PostEntry graph) | [optional] 
**location_id** | **String** | Location ID for this PostEntry. | [optional] 
**likes** | **Integer** | Total number of likes this PostEntry has received. | [optional] 
**parent_id** | **String** | If this is an original Post, the parentId will be null.  If this PostEntry is in response to another PostEntry, this is the ID of the parent PostEntry.  | [optional] 
**message** | **String** | The message included in the PostEntry, if any. | [optional] 
**publisher_id** | **String** | Publisher ID for this PostEntry. | [optional] 
**id** | **String** | ID of this PostEntry. | [optional] 
**link_url** | **String** | The URL of the link included in the PostEntry, if any. | [optional] 


