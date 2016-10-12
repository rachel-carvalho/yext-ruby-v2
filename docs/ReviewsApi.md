# YextClient::ReviewsApi

All URIs are relative to *https://api.yext.com/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_comment**](ReviewsApi.md#create_comment) | **POST** /accounts/{accountId}/reviews/{reviewId}/comments | Comments: Create
[**get_review**](ReviewsApi.md#get_review) | **GET** /accounts/{accountId}/reviews/{reviewId} | Reviews: Get
[**list_reviews**](ReviewsApi.md#list_reviews) | **GET** /accounts/{accountId}/reviews | Reviews: List


# **create_comment**
> InlineResponse2011 create_comment(account_id, review_id, v, opts)

Comments: Create

Creates a new Comment on a Review.

### Example
```ruby
# load the gem
require 'yext-client'
# setup authorization
YextClient.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['api_key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['api_key'] = 'Bearer'
end

api_instance = YextClient::ReviewsApi.new

account_id = "account_id_example" # String | 

review_id = 56 # Integer | ID of this Review

v = "v_example" # String | A date in `YYYYMMDD` format

opts = { 
  content: "content_example", # String | Content of the new comment.
  visibility: "PRIVATE", # String | 
  parent_id: 56 # Integer | If this Comment is in response to another comment, use this field to specify the ID of the parent Comment.
}

begin
  #Comments: Create
  result = api_instance.create_comment(account_id, review_id, v, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling ReviewsApi->create_comment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **review_id** | **Integer**| ID of this Review | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | 
 **content** | **String**| Content of the new comment. | [optional] 
 **visibility** | **String**|  | [optional] [default to PRIVATE]
 **parent_id** | **Integer**| If this Comment is in response to another comment, use this field to specify the ID of the parent Comment. | [optional] 

### Return type

[**InlineResponse2011**](InlineResponse2011.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_review**
> InlineResponse20012 get_review(account_id, review_id, v)

Reviews: Get

Retrieve a specific Review.

### Example
```ruby
# load the gem
require 'yext-client'
# setup authorization
YextClient.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['api_key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['api_key'] = 'Bearer'
end

api_instance = YextClient::ReviewsApi.new

account_id = "account_id_example" # String | 

review_id = 56 # Integer | ID of this Review

v = "v_example" # String | A date in `YYYYMMDD` format


begin
  #Reviews: Get
  result = api_instance.get_review(account_id, review_id, v)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling ReviewsApi->get_review: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **review_id** | **Integer**| ID of this Review | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | 

### Return type

[**InlineResponse20012**](InlineResponse20012.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **list_reviews**
> InlineResponse20011 list_reviews(account_id, v, opts)

Reviews: List

Retrieve all Reviews matching the given criteria.  **NOTE:** Yelp Reviews are **not** included. 

### Example
```ruby
# load the gem
require 'yext-client'
# setup authorization
YextClient.configure do |config|
  # Configure API key authorization: api_key
  config.api_key['api_key'] = 'YOUR API KEY'
  # Uncomment the following line to set a prefix for the API key, e.g. 'Bearer' (defaults to nil)
  #config.api_key_prefix['api_key'] = 'Bearer'
end

api_instance = YextClient::ReviewsApi.new

account_id = "account_id_example" # String | 

v = "v_example" # String | A date in `YYYYMMDD` format

opts = { 
  limit: 100, # Integer | Number of results to return.
  offset: 0, # Integer | Number of results to skip. Used to page through results
  location_ids: ["location_ids_example"], # Array<String> | When provided, only reviews for the requested locations will be returned.  By default, reviews will be returned for all locations subscribed to Review Monitoring.  **Example:** loc123,loc456,loc789 
  folder_id: "folder_id_example", # String | When provided, only reviews for locations in the given folder and its subfolders will be included in the results.
  countries: ["countries_example"], # Array<String> | When present, only reviews for locations in the given countries will be returned. Countries are denoted by ISO 3166 2-letter country codes.
  location_labels: ["location_labels_example"], # Array<String> | When present, only reviews for location with the provided labels will be returned.
  publisher_ids: ["publisher_ids_example"], # Array<String> | Defaults to all publishers subscribed by account  **Example:** MAPQUEST,YELP 
  review_content: "review_content_example", # String | When specified, only reviews that include the provided content will be returned.
  min_rating: 1.2, # Float | When specified, only reviews with the provided minimum rating or higher will be returned.
  max_rating: 1.2, # Float | 
  min_publisher_date: "min_publisher_date_example", # String | When specified, only reviews with a publisher date on or after the given date will be returned.
  max_publisher_date: "max_publisher_date_example", # String | When specified, only reviews with a publisher date on or before the given date will be returned.
  min_last_yext_update_date: "min_last_yext_update_date_example", # String | When specified, only reviews with a last Yext update date on or after the given date will be returned.
  max_last_yext_update_date: "max_last_yext_update_date_example", # String | When specified, only reviews with a last Yext update date on or before the given date will be returned.
  awaiting_response: "awaiting_response_example", # String | When specified, only reviews that are awaiting an owner reply on the given objects will be returned.  For example, when `awaitingResponse=COMMENT`, reviews will only be returned if they have at least one comment that has not been responded to by the owner. 
  min_non_owner_comments: 56, # Integer | When specified, only reviews that have at least the provided number of non-owner comments will be returned.
  reviewer_name: "reviewer_name_example", # String | When specified, only reviews whose authorName contains the provided string will be returned.
  reviewer_email: "reviewer_email_example" # String | When specified, only reviews whose authorEmail matches the provided email address will be returned.
}

begin
  #Reviews: List
  result = api_instance.list_reviews(account_id, v, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling ReviewsApi->list_reviews: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format | 
 **limit** | **Integer**| Number of results to return. | [optional] [default to 100]
 **offset** | **Integer**| Number of results to skip. Used to page through results | [optional] [default to 0]
 **location_ids** | [**Array&lt;String&gt;**](String.md)| When provided, only reviews for the requested locations will be returned.  By default, reviews will be returned for all locations subscribed to Review Monitoring.  **Example:** loc123,loc456,loc789  | [optional] 
 **folder_id** | **String**| When provided, only reviews for locations in the given folder and its subfolders will be included in the results. | [optional] 
 **countries** | [**Array&lt;String&gt;**](String.md)| When present, only reviews for locations in the given countries will be returned. Countries are denoted by ISO 3166 2-letter country codes. | [optional] 
 **location_labels** | [**Array&lt;String&gt;**](String.md)| When present, only reviews for location with the provided labels will be returned. | [optional] 
 **publisher_ids** | [**Array&lt;String&gt;**](String.md)| Defaults to all publishers subscribed by account  **Example:** MAPQUEST,YELP  | [optional] 
 **review_content** | **String**| When specified, only reviews that include the provided content will be returned. | [optional] 
 **min_rating** | **Float**| When specified, only reviews with the provided minimum rating or higher will be returned. | [optional] 
 **max_rating** | **Float**|  | [optional] 
 **min_publisher_date** | **String**| When specified, only reviews with a publisher date on or after the given date will be returned. | [optional] 
 **max_publisher_date** | **String**| When specified, only reviews with a publisher date on or before the given date will be returned. | [optional] 
 **min_last_yext_update_date** | **String**| When specified, only reviews with a last Yext update date on or after the given date will be returned. | [optional] 
 **max_last_yext_update_date** | **String**| When specified, only reviews with a last Yext update date on or before the given date will be returned. | [optional] 
 **awaiting_response** | **String**| When specified, only reviews that are awaiting an owner reply on the given objects will be returned.  For example, when &#x60;awaitingResponse&#x3D;COMMENT&#x60;, reviews will only be returned if they have at least one comment that has not been responded to by the owner.  | [optional] 
 **min_non_owner_comments** | **Integer**| When specified, only reviews that have at least the provided number of non-owner comments will be returned. | [optional] 
 **reviewer_name** | **String**| When specified, only reviews whose authorName contains the provided string will be returned. | [optional] 
 **reviewer_email** | **String**| When specified, only reviews whose authorEmail matches the provided email address will be returned. | [optional] 

### Return type

[**InlineResponse20011**](InlineResponse20011.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json


