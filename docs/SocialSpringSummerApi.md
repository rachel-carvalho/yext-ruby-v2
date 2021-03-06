# YextClient::SocialSpringSummerApi

All URIs are relative to *https://api.yext.com/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_comment**](SocialSpringSummerApi.md#create_comment) | **POST** /accounts/{accountId}/posts/{postId}/comments | Comments: Create
[**create_posts**](SocialSpringSummerApi.md#create_posts) | **POST** /accounts/{accountId}/posts | Posts: Create
[**delete_comment**](SocialSpringSummerApi.md#delete_comment) | **DELETE** /accounts/{accountId}/posts/{postId}/comments/{commentId} | Comments: delete
[**delete_post**](SocialSpringSummerApi.md#delete_post) | **DELETE** /accounts/{accountId}/posts/{postId} | Posts: Delete
[**get_comments**](SocialSpringSummerApi.md#get_comments) | **GET** /accounts/{accountId}/posts/{postId}/comments | Comments: List
[**get_linked_account**](SocialSpringSummerApi.md#get_linked_account) | **GET** /accounts/{accountId}/linkedaccounts/{linkedAccountId} | Linked Accounts: Get
[**get_linked_accounts**](SocialSpringSummerApi.md#get_linked_accounts) | **GET** /accounts/{accountId}/linkedaccounts | Linked Accounts: List
[**get_posts**](SocialSpringSummerApi.md#get_posts) | **GET** /accounts/{accountId}/posts | Posts: List
[**update_comment**](SocialSpringSummerApi.md#update_comment) | **PUT** /accounts/{accountId}/posts/{postId}/comments/{commentId} | Comments: Update
[**update_linked_account**](SocialSpringSummerApi.md#update_linked_account) | **PUT** /accounts/{accountId}/linkedaccounts/{linkedAccountId} | Linked Accounts: Update


# **create_comment**
> IdResponse create_comment(account_id, post_id, vparent_id, opts)

Comments: Create

Create a new Comment in response to another Post / Comment.

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

api_instance = YextClient::SocialSpringSummerApi.new

account_id = "account_id_example" # String | 

post_id = "post_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format.

parent_id = "parent_id_example" # String | The ID of the Comment this Comment is replying to.  **Example** 123 

opts = { 
  message: "message_example", # String | The message included in the Comment, if any.  **Example** “Hello, World!” 
  photo_url: "photo_url_example", # String | The URL of the photo included in the Comment, if any.  **Example** “https://…” 
  link_url: "link_url_example" # String | The URL of the link included in the Comment, if any.  **Example** “https://…” 
}

begin
  #Comments: Create
  result = api_instance.create_comment(account_id, post_id, vparent_id, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling SocialSpringSummerApi->create_comment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **post_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **parent_id** | **String**| The ID of the Comment this Comment is replying to.  **Example** 123  | 
 **message** | **String**| The message included in the Comment, if any.  **Example** “Hello, World!”  | [optional] 
 **photo_url** | **String**| The URL of the photo included in the Comment, if any.  **Example** “https://…”  | [optional] 
 **link_url** | **String**| The URL of the link included in the Comment, if any.  **Example** “https://…”  | [optional] 

### Return type

[**IdResponse**](IdResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **create_posts**
> IdResponse create_posts(account_id, vlocation_ids, publisher_ids, message, opts)

Posts: Create

Create a new Post.

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

api_instance = YextClient::SocialSpringSummerApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format.

location_ids = ["location_ids_example"] # Array<String> | List of Location IDs for this Post

publisher_ids = ["publisher_ids_example"] # Array<String> | List of Publisher IDs for this Post

message = "message_example" # String | The message included in the Post, if any.  **Example** \"Hello, World!\" 

opts = { 
  photo_url: "photo_url_example", # String | The URL of the photo included in the Post, if any.  **Example** \"https://...\" 
  link_url: "link_url_example" # String | The URL of the link included in the Post, if any.  **Example** \"https://...\" 
}

begin
  #Posts: Create
  result = api_instance.create_posts(account_id, vlocation_ids, publisher_ids, message, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling SocialSpringSummerApi->create_posts: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **location_ids** | [**Array&lt;String&gt;**](String.md)| List of Location IDs for this Post | 
 **publisher_ids** | [**Array&lt;String&gt;**](String.md)| List of Publisher IDs for this Post | 
 **message** | **String**| The message included in the Post, if any.  **Example** \&quot;Hello, World!\&quot;  | 
 **photo_url** | **String**| The URL of the photo included in the Post, if any.  **Example** \&quot;https://...\&quot;  | [optional] 
 **link_url** | **String**| The URL of the link included in the Post, if any.  **Example** \&quot;https://...\&quot;  | [optional] 

### Return type

[**IdResponse**](IdResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **delete_comment**
> ErrorResponse delete_comment(account_id, post_id, comment_id, v)

Comments: delete

Deletes an existing Comment.

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

api_instance = YextClient::SocialSpringSummerApi.new

account_id = "account_id_example" # String | 

post_id = "post_id_example" # String | 

comment_id = "comment_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format.


begin
  #Comments: delete
  result = api_instance.delete_comment(account_id, post_id, comment_id, v)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling SocialSpringSummerApi->delete_comment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **post_id** | **String**|  | 
 **comment_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]

### Return type

[**ErrorResponse**](ErrorResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **delete_post**
> ErrorResponse delete_post(account_id, post_id, v)

Posts: Delete

Deletes an existing Post.

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

api_instance = YextClient::SocialSpringSummerApi.new

account_id = "account_id_example" # String | 

post_id = "post_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format.


begin
  #Posts: Delete
  result = api_instance.delete_post(account_id, post_id, v)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling SocialSpringSummerApi->delete_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **post_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]

### Return type

[**ErrorResponse**](ErrorResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_comments**
> SocialCommentsResponse get_comments(account_id, post_id, v, opts)

Comments: List

Retrieve list of Comments for a Post.

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

api_instance = YextClient::SocialSpringSummerApi.new

account_id = "account_id_example" # String | 

post_id = "post_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format.

opts = { 
  limit: 100, # Integer | Number of results to return, up to 100. Default 100.  **Example** 20 
  offset: 0 # Integer | Number of results to return.
  type: "type_example" # String | Determines which type of Comments are returned
}

begin
  #Comments: List
  result = api_instance.get_comments(account_id, post_id, v, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling SocialSpringSummerApi->get_comments: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **post_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **limit** | **Integer**| Number of results to return, up to 100. Default 100.  **Example** 20  | [optional] [default to 100]
 **offset** | **Integer**| Number of results to return. | [optional] [default to 0]
 **type** | **String**| Determines which type of Comments are returned | [optional] 

### Return type

[**SocialCommentsResponse**](SocialCommentsResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_linked_account**
> LinkedAccountResponse get_linked_account(account_id, linked_account_id, v)

Linked Accounts: Get

Retrieve a specific Linked Account.

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

api_instance = YextClient::SocialSpringSummerApi.new

account_id = "account_id_example" # String | 

linked_account_id = "linked_account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format.


begin
  #Linked Accounts: Get
  result = api_instance.get_linked_account(account_id, linked_account_id, v)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling SocialSpringSummerApi->get_linked_account: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **linked_account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]

### Return type

[**LinkedAccountResponse**](LinkedAccountResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_linked_accounts**
> LinkedAccountsResponse get_linked_accounts(account_id, v, opts)

Linked Accounts: List

Retrieve all Linked Accounts and their last known statuses.

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

api_instance = YextClient::SocialSpringSummerApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format.

opts = { 
  limit: 100, # Integer | Number of results to return, up to 100. Default 100.  **Example** 20 
  offset: 0 # Integer | Number of results to return.
  location_ids: ["location_ids_example"], # Array<String> | Defaults to all account locations with a PowerListings subscription.  **Example** 123, 456, 789 
  publisher_ids: ["publisher_ids_example"], # Array<String> | Defaults to all publishers subscribed by account  **Example** FACEBOOK, FOURSQUARE 
  status: "ALL" # String | Used to filter for Linked Accounts with a particular status.
}

begin
  #Linked Accounts: List
  result = api_instance.get_linked_accounts(account_id, v, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling SocialSpringSummerApi->get_linked_accounts: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **limit** | **Integer**| Number of results to return, up to 100. Default 100.  **Example** 20  | [optional] [default to 100]
 **offset** | **Integer**| Number of results to return. | [optional] [default to 0]
 **location_ids** | [**Array&lt;String&gt;**](String.md)| Defaults to all account locations with a PowerListings subscription.  **Example** 123, 456, 789  | [optional] 
 **publisher_ids** | [**Array&lt;String&gt;**](String.md)| Defaults to all publishers subscribed by account  **Example** FACEBOOK, FOURSQUARE  | [optional] 
 **status** | **String**| Used to filter for Linked Accounts with a particular status. | [optional] [default to ALL]

### Return type

[**LinkedAccountsResponse**](LinkedAccountsResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_posts**
> SocialPostsResponse get_posts(account_id, v, opts)

Posts: List

Retrieve list of Posts.

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

api_instance = YextClient::SocialSpringSummerApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format.

opts = { 
  limit: 100, # Integer | Number of results to return, up to 100. Default 100.  **Example** 20 
  offset: 0 # Integer | Number of results to return.
  location_ids: ["location_ids_example"], # Array<String> | When provided, only Posts that involve the requested locations will be returned.  By defaults, Posts will be returned for all locations subscribed to Social Posting.  **Example** 123, 456, 789 
  folder_id: "folder_id_example", # String | When provided, only Posts for locations in the given folder and its subfolders will be included in the results.  **Example** 123 
  countries: ["countries_example"], # Array<String> | Array of 3166 Alpha-2 country codes. When present, only Posts for locations in the given countries will be returned.  **Example** ['US', 'CA'] 
  location_labels: ["location_labels_example"], # Array<String> | Array of location labels. When present, only Posts for location with the provided labels will be returned.  **Example** ['pilot stores'] 
  publisher_ids: ["publisher_ids_example"], # Array<String> | Defaults to all publishers subscribed by account  **Example** FACEBOOK, FOURSQUARE 
  keywords: ["keywords_example"] # Array<String> | When provided, only Posts that mention the given keywords will be returned. Posts will be returned if the original post or any comments contain this string.  **Example** ['pizza'] 
}

begin
  #Posts: List
  result = api_instance.get_posts(account_id, v, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling SocialSpringSummerApi->get_posts: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **limit** | **Integer**| Number of results to return, up to 100. Default 100.  **Example** 20  | [optional] [default to 100]
 **offset** | **Integer**| Number of results to return. | [optional] [default to 0]
 **location_ids** | [**Array&lt;String&gt;**](String.md)| When provided, only Posts that involve the requested locations will be returned.  By defaults, Posts will be returned for all locations subscribed to Social Posting.  **Example** 123, 456, 789  | [optional] 
 **folder_id** | **String**| When provided, only Posts for locations in the given folder and its subfolders will be included in the results.  **Example** 123  | [optional] 
 **countries** | [**Array&lt;String&gt;**](String.md)| Array of 3166 Alpha-2 country codes. When present, only Posts for locations in the given countries will be returned.  **Example** [&#39;US&#39;, &#39;CA&#39;]  | [optional] 
 **location_labels** | [**Array&lt;String&gt;**](String.md)| Array of location labels. When present, only Posts for location with the provided labels will be returned.  **Example** [&#39;pilot stores&#39;]  | [optional] 
 **publisher_ids** | [**Array&lt;String&gt;**](String.md)| Defaults to all publishers subscribed by account  **Example** FACEBOOK, FOURSQUARE  | [optional] 
 **keywords** | [**Array&lt;String&gt;**](String.md)| When provided, only Posts that mention the given keywords will be returned. Posts will be returned if the original post or any comments contain this string.  **Example** [&#39;pizza&#39;]  | [optional] 

### Return type

[**SocialPostsResponse**](SocialPostsResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **update_comment**
> ErrorResponse update_comment(account_id, post_id, comment_id, vcomment)

Comments: Update

Updates an existing Comment.    **NOTE:** Only updates supplied fields (aka PATCH). 

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

api_instance = YextClient::SocialSpringSummerApi.new

account_id = "account_id_example" # String | 

post_id = "post_id_example" # String | 

comment_id = "comment_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format.

comment = YextClient::PostEntry.new # PostEntry | 


begin
  #Comments: Update
  result = api_instance.update_comment(account_id, post_id, comment_id, vcomment)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling SocialSpringSummerApi->update_comment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **post_id** | **String**|  | 
 **comment_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **comment** | [**PostEntry**](PostEntry.md)|  | 

### Return type

[**ErrorResponse**](ErrorResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **update_linked_account**
> ErrorResponse update_linked_account(account_id, linked_account_id, v, opts)

Linked Accounts: Update

Assign or Unassign a Linked Account to one or more Locations.  **Note:** When assigning Locations to a Linked Account, if any of the Locations are already assigned to another Linked Account with the same Publisher, they will be re-assigned to this Linked Account, and lose their association with the previous Linked Account.  **Note:** It is an error to include the same Location ID in both the assignLocations and unassignLocations lists in the same request. 

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

api_instance = YextClient::SocialSpringSummerApi.new

account_id = "account_id_example" # String | 

linked_account_id = "linked_account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format.

opts = { 
  assign_location_ids: ["assign_location_ids_example"], # Array<String> | Array of Location IDs to be assigned to this Linked Account.  Use this field to assign this Linked Account to Locations without affecting any other assigned Locations.  
  unassign_location_ids: ["unassign_location_ids_example"] # Array<String> | Array of Location IDs to be unassigned from this Linked Account.  Use this field to unassign this Linked Account from Locations without affecting any other assigned Locations. 
}

begin
  #Linked Accounts: Update
  result = api_instance.update_linked_account(account_id, linked_account_id, v, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling SocialSpringSummerApi->update_linked_account: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **linked_account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **assign_location_ids** | [**Array&lt;String&gt;**](String.md)| Array of Location IDs to be assigned to this Linked Account.  Use this field to assign this Linked Account to Locations without affecting any other assigned Locations.   | [optional] 
 **unassign_location_ids** | [**Array&lt;String&gt;**](String.md)| Array of Location IDs to be unassigned from this Linked Account.  Use this field to unassign this Linked Account from Locations without affecting any other assigned Locations.  | [optional] 

### Return type

[**ErrorResponse**](ErrorResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



