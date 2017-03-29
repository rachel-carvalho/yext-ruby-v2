# YextClient::ReviewsApi

All URIs are relative to *https://api.yext.com/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_comment**](ReviewsApi.md#create_comment) | **POST** /accounts/{accountId}/reviews/{reviewId}/comments | Comments: Create
[**create_review**](ReviewsApi.md#create_review) | **POST** /accounts/{accountId}/reviews | Reviews: Create
[**create_review_invites**](ReviewsApi.md#create_review_invites) | **POST** /accounts/{accountId}/reviewinvites | Review Invitations: Create
[**get_review**](ReviewsApi.md#get_review) | **GET** /accounts/{accountId}/reviews/{reviewId} | Reviews: Get
[**get_review_generation_settings**](ReviewsApi.md#get_review_generation_settings) | **GET** /accounts/{accountId}/reviews/settings/generation | Review Generation Settings: Get
[**list_reviews**](ReviewsApi.md#list_reviews) | **GET** /accounts/{accountId}/reviews | Reviews: List
[**update_review**](ReviewsApi.md#update_review) | **PUT** /accounts/{accountId}/reviews/{reviewId} | Reviews: Update
[**update_review_generation_settings**](ReviewsApi.md#update_review_generation_settings) | **POST** /accounts/{accountId}/reviews/settings/generation | Review Generation Settings: Update


# **create_comment**
> ErrorResponse create_comment(account_id, review_id, vcomment_request)

Comments: Create

Creates a new Comment on a Review. <br><br>  ## Required fields * **`content`** <br><br>  ## Optional fields * **`parentId`** <br><br> Other fields will be ignored. 

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

review_id = 56 # Integer | ID of this Review.

v = "20161012" # String | A date in `YYYYMMDD` format.

comment_request = YextClient::ReviewComment.new # ReviewComment | 


begin
  #Comments: Create
  result = api_instance.create_comment(account_id, review_id, vcomment_request)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling ReviewsApi->create_comment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **review_id** | **Integer**| ID of this Review. | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **comment_request** | [**ReviewComment**](ReviewComment.md)|  | 

### Return type

[**ErrorResponse**](ErrorResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **create_review**
> IdResponse create_review(account_id, vreview_request)

Reviews: Create

Create a new External First Party Review. <br><br>  ## Required fields * **`locationId`** * **`authorName`** * **`rating`** * **`content`** <br><br>  ## Optional fields * **`authorEmail`** * **`status`** * **`url`** * **`title`** <br><br> Other fields will be ignored. 

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

v = "20161012" # String | A date in `YYYYMMDD` format.

review_request = YextClient::Review.new # Review | 


begin
  #Reviews: Create
  result = api_instance.create_review(account_id, vreview_request)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling ReviewsApi->create_review: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **review_request** | [**Review**](Review.md)|  | 

### Return type

[**IdResponse**](IdResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **create_review_invites**
> CreateReviewInvitationsResponse create_review_invites(account_id, vreviews)

Review Invitations: Create

Sends review invitations to one or more consumers.

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

v = "20161012" # String | A date in `YYYYMMDD` format.

reviews = [YextClient::ReviewInvitation.new] # Array<ReviewInvitation> | 


begin
  #Review Invitations: Create
  result = api_instance.create_review_invites(account_id, vreviews)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling ReviewsApi->create_review_invites: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **reviews** | [**Array&lt;ReviewInvitation&gt;**](ReviewInvitation.md)|  | 

### Return type

[**CreateReviewInvitationsResponse**](CreateReviewInvitationsResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_review**
> ReviewResponse get_review(account_id, review_id, v)

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

review_id = 56 # Integer | ID of this Review.

v = "20161012" # String | A date in `YYYYMMDD` format.


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
 **review_id** | **Integer**| ID of this Review. | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]

### Return type

[**ReviewResponse**](ReviewResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_review_generation_settings**
> GetReviewGenerationSettingsResponse get_review_generation_settings(account_id, v)

Review Generation Settings: Get

Returns all current generation settings for a specified account.

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

v = "20161012" # String | A date in `YYYYMMDD` format.


begin
  #Review Generation Settings: Get
  result = api_instance.get_review_generation_settings(account_id, v)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling ReviewsApi->get_review_generation_settings: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]

### Return type

[**GetReviewGenerationSettingsResponse**](GetReviewGenerationSettingsResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **list_reviews**
> ReviewsResponse list_reviews(account_id, v, opts)

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

v = "20161012" # String | A date in `YYYYMMDD` format.

opts = { 
  limit: 100, # Integer | Number of results to return.
  offset: 0 # Integer | Number of results to skip. Used to page through results.
  location_ids: ["location_ids_example"], # Array<String> | When provided, only reviews for the requested locations will be returned.  By default, reviews will be returned for all locations subscribed to Review Monitoring.  **Example:** loc123,loc456,loc789 
  folder_id: "folder_id_example", # String | When provided, only reviews for locations in the given folder and its subfolders will be included in the results.
  countries: ["countries_example"], # Array<String> | When present, only reviews for locations in the given countries will be returned. Countries are denoted by ISO 3166 2-letter country codes.
  location_labels: ["location_labels_example"], # Array<String> | When present, only reviews for location with the provided labels will be returned.
  publisher_ids: ["publisher_ids_example"], # Array<String> | List of publisher IDs. If no IDs are specified, defaults to all publishers subscribed by account.  **Example:** MAPQUEST,YELP 
  review_content: "review_content_example", # String | When specified, only reviews that include the provided content will be returned.
  min_rating: 1.2, # Float | When specified, only reviews with the provided minimum rating or higher will be returned.
  max_rating: 1.2, # Float | 
  min_publisher_date: Date.parse("2013-10-20"), # Date | (`YYYY-MM-DD` format) When specified, only reviews with a publisher date on or after the given date will be returned.
  max_publisher_date: Date.parse("2013-10-20"), # Date | (`YYYY-MM-DD` format) When specified, only reviews with a publisher date on or before the given date will be returned.
  min_last_yext_update_date: Date.parse("2013-10-20"), # Date | (`YYYY-MM-DD` format) When specified, only reviews with a last Yext update date on or after the given date will be returned.
  max_last_yext_update_date: Date.parse("2013-10-20"), # Date | (`YYYY-MM-DD` format) When specified, only reviews with a last Yext update date on or before the given date will be returned.
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
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **limit** | **Integer**| Number of results to return. | [optional] [default to 100]
 **offset** | **Integer**| Number of results to skip. Used to page through results. | [optional] [default to 0]
 **location_ids** | [**Array&lt;String&gt;**](String.md)| When provided, only reviews for the requested locations will be returned.  By default, reviews will be returned for all locations subscribed to Review Monitoring.  **Example:** loc123,loc456,loc789  | [optional] 
 **folder_id** | **String**| When provided, only reviews for locations in the given folder and its subfolders will be included in the results. | [optional] 
 **countries** | [**Array&lt;String&gt;**](String.md)| When present, only reviews for locations in the given countries will be returned. Countries are denoted by ISO 3166 2-letter country codes. | [optional] 
 **location_labels** | [**Array&lt;String&gt;**](String.md)| When present, only reviews for location with the provided labels will be returned. | [optional] 
 **publisher_ids** | [**Array&lt;String&gt;**](String.md)| List of publisher IDs. If no IDs are specified, defaults to all publishers subscribed by account.  **Example:** MAPQUEST,YELP  | [optional] 
 **review_content** | **String**| When specified, only reviews that include the provided content will be returned. | [optional] 
 **min_rating** | **Float**| When specified, only reviews with the provided minimum rating or higher will be returned. | [optional] 
 **max_rating** | **Float**|  | [optional] 
 **min_publisher_date** | **Date**| (&#x60;YYYY-MM-DD&#x60; format) When specified, only reviews with a publisher date on or after the given date will be returned. | [optional] 
 **max_publisher_date** | **Date**| (&#x60;YYYY-MM-DD&#x60; format) When specified, only reviews with a publisher date on or before the given date will be returned. | [optional] 
 **min_last_yext_update_date** | **Date**| (&#x60;YYYY-MM-DD&#x60; format) When specified, only reviews with a last Yext update date on or after the given date will be returned. | [optional] 
 **max_last_yext_update_date** | **Date**| (&#x60;YYYY-MM-DD&#x60; format) When specified, only reviews with a last Yext update date on or before the given date will be returned. | [optional] 
 **awaiting_response** | **String**| When specified, only reviews that are awaiting an owner reply on the given objects will be returned.  For example, when &#x60;awaitingResponse&#x3D;COMMENT&#x60;, reviews will only be returned if they have at least one comment that has not been responded to by the owner.  | [optional] 
 **min_non_owner_comments** | **Integer**| When specified, only reviews that have at least the provided number of non-owner comments will be returned. | [optional] 
 **reviewer_name** | **String**| When specified, only reviews whose authorName contains the provided string will be returned. | [optional] 
 **reviewer_email** | **String**| When specified, only reviews whose authorEmail matches the provided email address will be returned. | [optional] 

### Return type

[**ReviewsResponse**](ReviewsResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **update_review**
> IdResponse update_review(account_id, review_id, vreview_request)

Reviews: Update

Updates an External First Party Review. <br><br> **NOTE:** Despite using the `PUT` method, Reviews: Update only updates supplied fields. Omitted fields are not modified. <br><br>  ## Required fields <br><br>  ## Optional fields * **`rating`** * **`title`** * **`content`** * **`authorName`** * **`authorEmail`** * **`url`** * **`status`** <br><br> Other fields will be ignored. 

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

review_id = 56 # Integer | ID of this Review.

v = "20161012" # String | A date in `YYYYMMDD` format.

review_request = YextClient::Review.new # Review | 


begin
  #Reviews: Update
  result = api_instance.update_review(account_id, review_id, vreview_request)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling ReviewsApi->update_review: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **review_id** | **Integer**| ID of this Review. | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **review_request** | [**Review**](Review.md)|  | 

### Return type

[**IdResponse**](IdResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **update_review_generation_settings**
> GetReviewGenerationSettingsResponse update_review_generation_settings(account_id, vreview_generation_settings_request)

Review Generation Settings: Update

Updates any generation settings specified in a specified account. Call may include any/all settings available to the account. Settings not included will remain unchanged. 

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

v = "20161012" # String | A date in `YYYYMMDD` format.

review_generation_settings_request = YextClient::ReviewGenerationSettings.new # ReviewGenerationSettings | 


begin
  #Review Generation Settings: Update
  result = api_instance.update_review_generation_settings(account_id, vreview_generation_settings_request)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling ReviewsApi->update_review_generation_settings: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **review_generation_settings_request** | [**ReviewGenerationSettings**](ReviewGenerationSettings.md)|  | 

### Return type

[**GetReviewGenerationSettingsResponse**](GetReviewGenerationSettingsResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



