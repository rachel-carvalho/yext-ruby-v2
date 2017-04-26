# YextClient::Asset

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**video_url** | **String** | URL to the YouTube video.  **Required - when asset type is &#x60;&#x60;VIDEO&#x60;&#x60;. Must be a valid URL to a YouTube video. Cannot be updated once created.** | [optional] 
**description** | **String** | Asset description. | [optional] 
**for_locations** | [**AssetForLocations**](AssetForLocations.md) |  | 
**clickthrough_url** | **String** | Clickthrough URL.  **Optional - only valid when asset type is &#x60;&#x60;PHOTO&#x60;&#x60;.**  | [optional] 
**labels** | **Array&lt;String&gt;** | List of text labels to apply to this Asset. | [optional] 
**photo_url** | **String** | URL to the photo asset.  **Required - when asset type is &#x60;&#x60;PHOTO&#x60;&#x60;. Must be a valid URL to a photo asset. Cannot be updated once created.**  | [optional] 
**details** | **String** | Details text.  **Optional - only valid when asset type is &#x60;&#x60;PHOTO&#x60;&#x60;.**  | [optional] 
**alternate_text** | **String** | Alternate text for accessibility purposes.  **Optional - only valid when asset type is &#x60;&#x60;PHOTO&#x60;&#x60;.**  | [optional] 
**type** | **String** | Asset type. | 
**id** | **String** | Primary key. Unique alphanumeric (Latin-1) ID assigned by the Yext. | [optional] 
**contents** | [**Array&lt;AssetTextContent&gt;**](AssetTextContent.md) |  | [optional] 
**name** | **String** | Asset name. | 


