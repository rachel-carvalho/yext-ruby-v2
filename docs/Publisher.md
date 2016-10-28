# YextClient::Publisher

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** | Publisher name | [optional] 
**url** | **String** | Publisher home page. Will link to Apple App Store for mobile-only apps | [optional] 
**supported_location_types** | [**Array&lt;LocationType&gt;**](LocationType.md) | List of Location types that are supported by this Publisher | [optional] 
**supported_countries** | **Array&lt;String&gt;** | List of countries where this Publisher publishes listings. Countries are denoted by ISO 3166 2-letter country codes | [optional] 
**alternate_brands** | [**Array&lt;PublisherAlternateBrands&gt;**](PublisherAlternateBrands.md) | List of Publisher&#39;s alternate brands where listings are syndicated | [optional] 
**id** | **String** | Publisher ID | [optional] 
**typical_update_speed** | **Integer** | Typical speed for updates to go live, in seconds | [optional] 
**features** | **Array&lt;String&gt;** | List of features supported by this Publisher | [optional] 


