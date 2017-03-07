# YextClient::UserApi

All URIs are relative to *https://api.yext.com/v2*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_user**](UserApi.md#create_user) | **POST** /accounts/{accountId}/users | Users: Create
[**delete_user**](UserApi.md#delete_user) | **DELETE** /accounts/{accountId}/users/{userId} | Users: Delete
[**get_roles**](UserApi.md#get_roles) | **GET** /accounts/{accountId}/roles | Roles: Get
[**get_user**](UserApi.md#get_user) | **GET** /accounts/{accountId}/users/{userId} | Users: Get
[**get_users**](UserApi.md#get_users) | **GET** /accounts/{accountId}/users | Users: List
[**update_user**](UserApi.md#update_user) | **PUT** /accounts/{accountId}/users/{userId} | Users: Update
[**update_user_password**](UserApi.md#update_user_password) | **PUT** /accounts/{accountId}/users/{userId}/password | Users: Update Password


# **create_user**
> IdResponse create_user(account_id, vcreate_user_request)

Users: Create

Create a new User

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

api_instance = YextClient::UserApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format.

create_user_request = YextClient::CreateUserRequest.new # CreateUserRequest | 


begin
  #Users: Create
  result = api_instance.create_user(account_id, vcreate_user_request)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling UserApi->create_user: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **create_user_request** | [**CreateUserRequest**](CreateUserRequest.md)|  | 

### Return type

[**IdResponse**](IdResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **delete_user**
> ErrorResponse delete_user(account_id, vuser_id)

Users: Delete

Deletes an existing User.

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

api_instance = YextClient::UserApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format.

user_id = "user_id_example" # String | 


begin
  #Users: Delete
  result = api_instance.delete_user(account_id, vuser_id)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling UserApi->delete_user: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **user_id** | **String**|  | 

### Return type

[**ErrorResponse**](ErrorResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_roles**
> RolesResponse get_roles(account_id, v)

Roles: Get

Retrieves a list of the roles that users can have within a customer’s account.

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

api_instance = YextClient::UserApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format.


begin
  #Roles: Get
  result = api_instance.get_roles(account_id, v)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling UserApi->get_roles: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]

### Return type

[**RolesResponse**](RolesResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_user**
> UserResponse get_user(account_id, vuser_id)

Users: Get

Retrieves details of a specific User.

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

api_instance = YextClient::UserApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format.

user_id = "user_id_example" # String | 


begin
  #Users: Get
  result = api_instance.get_user(account_id, vuser_id)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling UserApi->get_user: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **user_id** | **String**|  | 

### Return type

[**UserResponse**](UserResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **get_users**
> UsersResponse get_users(account_id, v, opts)

Users: List

Lists all Users in an account.

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

api_instance = YextClient::UserApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format.

opts = { 
  limit: 10, # Integer | Number of results to return.
  offset: 0 # Integer | Number of results to skip. Used to page through results.
}

begin
  #Users: List
  result = api_instance.get_users(account_id, v, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling UserApi->get_users: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **limit** | **Integer**| Number of results to return. | [optional] [default to 10]
 **offset** | **Integer**| Number of results to skip. Used to page through results. | [optional] [default to 0]

### Return type

[**UsersResponse**](UsersResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **update_user**
> IdResponse update_user(account_id, vuser_idupdate_user_request)

Users: Update

Updates an existing User.

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

api_instance = YextClient::UserApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format.

user_id = "user_id_example" # String | 

update_user_request = YextClient::User.new # User | 


begin
  #Users: Update
  result = api_instance.update_user(account_id, vuser_idupdate_user_request)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling UserApi->update_user: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **user_id** | **String**|  | 
 **update_user_request** | [**User**](User.md)|  | 

### Return type

[**IdResponse**](IdResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **update_user_password**
> ErrorResponse update_user_password(account_id, vuser_id, opts)

Users: Update Password

Updates a User's password.

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

api_instance = YextClient::UserApi.new

account_id = "account_id_example" # String | 

v = "20161012" # String | A date in `YYYYMMDD` format.

user_id = "user_id_example" # String | 

opts = { 
  update_password_request: YextClient::UpdatePasswordRequest.new # UpdatePasswordRequest | 
}

begin
  #Users: Update Password
  result = api_instance.update_user_password(account_id, vuser_id, opts)
  p result
rescue YextClient::ApiError => e
  puts "Exception when calling UserApi->update_user_password: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_id** | **String**|  | 
 **v** | **String**| A date in &#x60;YYYYMMDD&#x60; format. | [default to 20161012]
 **user_id** | **String**|  | 
 **update_password_request** | [**UpdatePasswordRequest**](UpdatePasswordRequest.md)|  | [optional] 

### Return type

[**ErrorResponse**](ErrorResponse.md)

### Authorization

[api_key](../README.md#api_key)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



