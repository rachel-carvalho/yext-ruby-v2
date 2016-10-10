=begin
#Yext API

## Policies and Conventions  This section gives you the basic information you need to use our APIs.  ## Authentication All requests must be authenticated using an app’s API key.  <pre>GET https://api.yext.com/v2/accounts/[accountId]/locations?<b>api_key=API_KEY</b>&v=YYYYMMDD</pre>  The API key should be kept secret, as each app has exactly one API key.  ## Versioning All requests must be versioned using the v parameter.   <pre>GET https://api.yext.com/v2/accounts/[accountId]/locations?api_key=API_KEY&<b>v=YYYYMMDD</b></pre>  The **`v`** parameter (a date in `YYYYMMDD` format) is designed to give you the freedom to adapt to Yext API changes on your own schedule. When you pass this parameter, any changes we made to the API after the specified date will not affect the behavior of the request or the content of the response.  **NOTE:** Yext has the ability to make changes that affect previous versions of the API, if necessary.  ## Errors and Warnings There are three kinds of issues that can be reported for a given request:  * **`FATAL_ERROR`**     * An issue caused the entire request to be rejected. * **`NON_FATAL_ERROR`**     * An item is rejected, but other items present in the request are accepted (e.g., one invalid Product List item).      * A field is rejected, but the item otherwise is accepted (e.g., invalid website URL in a Location). * **`WARNING`**     * The request did not adhere to our best practices or recommendations, but the data was accepted anyway (e.g., data was sent that may cause some listings to become unavailable, a deprecated API was used, or we changed the format of a field's content to meet our requirements).  ## Validation Modes API v2 will support two request validation modes: *Strict Mode* and *Lenient Mode*.  In Strict Mode, both `FATAL_ERROR`s and `NON_FATAL_ERROR`s are reported simply as `FATAL_ERROR`s, and any error will cause the entire request to fail.  In Lenient Mode, `FATAL_ERROR`s and `NON_FATAL_ERROR`s are reported as such, and only `FATAL_ERROR`s will cause a request to fail.  All requests will be processed in Strict Mode by default.  To activate Lenient Mode, append the parameter `validation=lenient` to your request URLs.  ## Serialization API v2 only accepts data in JSON format.  ### Dates and times * We always use milliseconds since epoch (a.k.a. Unix time) for timestamps (e.g., review creation times, webhook update times). * We always use ISO 8601 without timezone for local date times (e.g., Event start time, Event end time). * Dates are transmitted as strings: `“YYYY-MM-DD”`.  ## Account ID In keeping with RESTful design principles, every URL in API v2 has an account ID prefix. This prefix helps to ensure that you have unique URLs for all resources.  In addition to specifying resources by explicit account ID, the following two macros are defined: * **`me`** - refers to the account that owns the API key sent with the request * **`all`** - refers to the account that owns the API key sent with the request, as well as all sub-accounts (recursively)  **IMPORTANT:** The **`me`** macro is supported in all API methods.  The **`all`** macro will only be supported in certain URLs, as noted in the reference documentation.  ### Examples This URL refers to all locations in account 123. <pre>https://api.yext.com/v2/accounts/<b>123</b>/locations?api_key=456&v=20160822</pre>  This URL refers to all locations in the account that owns API key 456. <pre>https://api.yext.com/v2/accounts/<b>me</b>/locations?<b>api_key=456</b>&v=20160822</pre>  This URL refers to all locations in the account that owns API key 456, as well as all locations from any of its child accounts. <pre>https://api.yext.com/v2/accounts/<b>all</b>/locations?<b>api_key=456</b>&v=20160822</pre>  ## Actor Headers To attribute changes to a particular user or employee, all requests may be passed with the following headers.  **NOTE:** If you choose to provide actor headers, and we are unable to authenticate the request using the values you provide, the request will result in an error and fail.  * Attribute activity to Admin user via admin login cookie *(for Yext’s use only)*     * Header: `YextEmployee`     * Value: Admin user’s AlphaLogin cookie * Attribute activity to Admin user via email address and password     * Headers: `YextEmployeeEmail`, `YextEmployeePassword`     * Values: Admin user’s email address, Admin user’s Admin password * Attribute activity to customer user via login cookie     * Header: `YextUser`     * Value: Customer user’s YextAppsLogin cookie * Attribute activity to customer user via email address and password     * Headers: `YextUserEmail`, `YextUserPassword`     * Values: Customer user’s email address, Customer user’s password  Changes will be logged as follows:  * App with no designated actor     * History Entry \"Updated By\" Value: `App [App ID] - ‘[App Name]’`     * Example: `App 432 - ‘Hello World App’` * App with customer user actor     * History Entry \"Updated By\" Value: `[user name] ([user email]) (App [App ID] - ‘[App Name]’)`     * Example: `Jordan Smith (jsmith@example.com) (App 432 - ‘Hello World App’)` * App with Yext employee actor## Response Format   * History Entry \"Updated By\" Value: `[employee username] (App [App ID] - ‘[App Name]’)`   * Example: `hlerman (App 432 - ‘Hello World App’)`  ## Response Format * **`meta`**     * Response metadata  * **`meta.uuid`**     * Unique ID for this request / response * **`meta.errors[]`**     * List of errors and warnings  * **`meta.errors[].code`**     * Code that uniquely identifies the error or warning  * **`meta.errors[].type`**     * One of:         * `FATAL_ERROR`         * `NON_FATAL_ERROR`         * `WARNING`     * See \"Errors and Warnings\" above for details. * **`meta.errors[].message`**     *  An explanation of the issue * **`response`**     * An explanation of the issue   Example: <pre><code> {     \"meta\": {         \"uuid\": \"bb0c7e19-4dc3-4891-bfa5-8593b1f124ad\",         \"errors\": [             {                 \"code\": ...error code...,                 \"type\": ...error, fatal error, non fatal error, or warning...,                 \"message\": ...explanation of the issue...             }         ]     },     \"response\": {         ...results...     } } </code></pre>  ## Status Codes * `200 OK`    * Either there are no errors or warnings, or the only issues are of type `WARNING`. * `207 Multi-Status`     * There are errors of type `itemError` or `fieldError` (but none of type `requestError`). * `400 Bad Request`     * A parameter is invalid, or a required parameter is missing. This includes the case where no API key is provided and the case where a resource ID is specified incorrectly in a path.     * This status is if any of the response errors are of type `requestError`. * `401 Unauthorized`     * The API key provided is invalid.     * `403 Forbidden`     * The requested information cannot be viewed by the acting user.  * `404 Not Found`     * The endpoint does not exist. * `405 Method Not Allowed`     * The request is using a method that is not allowed (e.g., POST with a GET-only endpoint). * `409 Conflict`     * The request could not be completed in its current state.     * Use the information included in the response to modify the request and retry. * `429 Too Many Requests`     * You have exceeded your rate limit / quota. * `500 Internal Server Error`     * Yext’s servers are not operating as expected. The request is likely valid but should be resent later. * `504 Timeout`     * Yext’s servers took too long to handle this request, and it timed out.  ## Quotas and Rate Limits Default quotas and rate limits are as follows.  * **Location Cloud API** *(includes Analytics, PowerListings, Location Manager, Reviews, Social, and User endpoints)*: 5,000 requests per hour * **Administrative API**: 1 qps * **Live API**: 100,000 requests per hour  **NOTE:** Webhook requests do not count towards an account’s quota.  For the most current and accurate rate-limit usage information for a particular request type, check the **`RateLimit-Remaining`** and **`RateLimit-Limit`** HTTP headers of your API responses.  If you are currently over your limit, our API will return a `429` error, and the response object returned by our API will be empty. We will also include a **`RateLimit-Reset`** header in the response, which indicates when you will have additional quota.  ## Client- vs. Yext-assigned IDs You can set the ID for the following objects when you create them. If you do not provide an ID, Yext will generate one for you.  * Account * User * Location * Bio List * Menu List * Product List * Event List * Bio List Item * Menu List Item * Product List Item * Event List Item  ## Logging All API requests are logged, and can be found in your Developer Console.  API logs are stored for 90 days. 

OpenAPI spec version: 0.0.2

Generated by: https://github.com/swagger-api/swagger-codegen.git

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

=end

require "uri"

module YextClient
  class LocationsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end

    # Locations: Create
    # Create a new Location
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param location_request 
    # @param [Hash] opts the optional parameters
    # @return [InlineResponse201]
    def create_location(account_id, v, location_request, opts = {})
      data, _status_code, _headers = create_location_with_http_info(account_id, v, location_request, opts)
      return data
    end

    # Locations: Create
    # Create a new Location
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param location_request 
    # @param [Hash] opts the optional parameters
    # @return [Array<(InlineResponse201, Fixnum, Hash)>] InlineResponse201 data, response status code and response headers
    def create_location_with_http_info(account_id, v, location_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: LocationsApi.create_location ..."
      end
      # verify the required parameter 'account_id' is set
      fail ArgumentError, "Missing the required parameter 'account_id' when calling LocationsApi.create_location" if account_id.nil?
      # verify the required parameter 'v' is set
      fail ArgumentError, "Missing the required parameter 'v' when calling LocationsApi.create_location" if v.nil?
      # verify enum value
      unless ['20161012'].include?(v)
        fail ArgumentError, "invalid value for 'v', must be one of 20161012"
      end
      # verify the required parameter 'location_request' is set
      fail ArgumentError, "Missing the required parameter 'location_request' when calling LocationsApi.create_location" if location_request.nil?
      # resource path
      local_var_path = "/accounts/{accountId}/locations".sub('{format}','json').sub('{' + 'accountId' + '}', account_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'v'] = v

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      local_header_accept = ['application/json']
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = ['application/json']
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(location_request)
      auth_names = ['api_key']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'InlineResponse201')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: LocationsApi#create_location\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Categories: List
    # Get available Categories.  All Locations are required to have an associated Category to assist with organization and search. Yext provides a hierarchy of business categories for this purpose, exposed by this API. 
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param [Hash] opts the optional parameters
    # @option opts [String] :language Only categories that apply to this language will be returned. (default to en)
    # @option opts [String] :country Only categories that apply in this country will be returned. (default to us)
    # @return [InlineResponse2007]
    def get_business_categories(v, opts = {})
      data, _status_code, _headers = get_business_categories_with_http_info(v, opts)
      return data
    end

    # Categories: List
    # Get available Categories.  All Locations are required to have an associated Category to assist with organization and search. Yext provides a hierarchy of business categories for this purpose, exposed by this API. 
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param [Hash] opts the optional parameters
    # @option opts [String] :language Only categories that apply to this language will be returned.
    # @option opts [String] :country Only categories that apply in this country will be returned.
    # @return [Array<(InlineResponse2007, Fixnum, Hash)>] InlineResponse2007 data, response status code and response headers
    def get_business_categories_with_http_info(v, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: LocationsApi.get_business_categories ..."
      end
      # verify the required parameter 'v' is set
      fail ArgumentError, "Missing the required parameter 'v' when calling LocationsApi.get_business_categories" if v.nil?
      # verify enum value
      unless ['20161012'].include?(v)
        fail ArgumentError, "invalid value for 'v', must be one of 20161012"
      end
      # resource path
      local_var_path = "/categories".sub('{format}','json')

      # query parameters
      query_params = {}
      query_params[:'v'] = v
      query_params[:'language'] = opts[:'language'] if !opts[:'language'].nil?
      query_params[:'country'] = opts[:'country'] if !opts[:'country'].nil?

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      local_header_accept = ['application/json']
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = ['application/json']
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['api_key']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'InlineResponse2007')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: LocationsApi#get_business_categories\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Custom Fields: List
    # Returns a list of Custom Fields in an Account.
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param account_id 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :offset Number of results to skip. Used to page through results (default to 0)
    # @option opts [Integer] :limit Number of results to return (default to 100)
    # @return [InlineResponse200]
    def get_custom_fields(v, account_id, opts = {})
      data, _status_code, _headers = get_custom_fields_with_http_info(v, account_id, opts)
      return data
    end

    # Custom Fields: List
    # Returns a list of Custom Fields in an Account.
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param account_id 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :offset Number of results to skip. Used to page through results
    # @option opts [Integer] :limit Number of results to return
    # @return [Array<(InlineResponse200, Fixnum, Hash)>] InlineResponse200 data, response status code and response headers
    def get_custom_fields_with_http_info(v, account_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: LocationsApi.get_custom_fields ..."
      end
      # verify the required parameter 'v' is set
      fail ArgumentError, "Missing the required parameter 'v' when calling LocationsApi.get_custom_fields" if v.nil?
      # verify enum value
      unless ['20161012'].include?(v)
        fail ArgumentError, "invalid value for 'v', must be one of 20161012"
      end
      # verify the required parameter 'account_id' is set
      fail ArgumentError, "Missing the required parameter 'account_id' when calling LocationsApi.get_custom_fields" if account_id.nil?
      if opts[:'limit'] > 1000.0
        fail ArgumentError, 'invalid value for "opts[:"limit"]" when calling LocationsApi.get_custom_fields, must be smaller than or equal to 1000.0.'
      end

      # resource path
      local_var_path = "/accounts/{accountId}/customfields".sub('{format}','json').sub('{' + 'accountId' + '}', account_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'v'] = v
      query_params[:'offset'] = opts[:'offset'] if !opts[:'offset'].nil?
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      local_header_accept = ['application/json']
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = ['application/json']
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['api_key']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'InlineResponse200')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: LocationsApi#get_custom_fields\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Google Fields: List
    # Use the Google Attributes API to retrieve a complete list of Google's location attributes for each business category. This list includes attributes that may not apply to all Partner Locations in an account. The attributes available to a Partner Location depends on its primary business category. You can view and edit the attributes of Partner Locationsvia the googleKeywords field in the Locations API.
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param [Hash] opts the optional parameters
    # @return [InlineResponse2008]
    def get_google_keywords(v, opts = {})
      data, _status_code, _headers = get_google_keywords_with_http_info(v, opts)
      return data
    end

    # Google Fields: List
    # Use the Google Attributes API to retrieve a complete list of Google&#39;s location attributes for each business category. This list includes attributes that may not apply to all Partner Locations in an account. The attributes available to a Partner Location depends on its primary business category. You can view and edit the attributes of Partner Locationsvia the googleKeywords field in the Locations API.
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param [Hash] opts the optional parameters
    # @return [Array<(InlineResponse2008, Fixnum, Hash)>] InlineResponse2008 data, response status code and response headers
    def get_google_keywords_with_http_info(v, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: LocationsApi.get_google_keywords ..."
      end
      # verify the required parameter 'v' is set
      fail ArgumentError, "Missing the required parameter 'v' when calling LocationsApi.get_google_keywords" if v.nil?
      # verify enum value
      unless ['20161012'].include?(v)
        fail ArgumentError, "invalid value for 'v', must be one of 20161012"
      end
      # resource path
      local_var_path = "/googlefields".sub('{format}','json')

      # query parameters
      query_params = {}
      query_params[:'v'] = v

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      local_header_accept = ['application/json']
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = ['application/json']
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['api_key']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'InlineResponse2008')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: LocationsApi#get_google_keywords\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Locations: Get
    # Gets the primary profile for a single Location.
    # @param account_id 
    # @param location_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param [Hash] opts the optional parameters
    # @return [InlineResponse201]
    def get_location(account_id, location_id, v, opts = {})
      data, _status_code, _headers = get_location_with_http_info(account_id, location_id, v, opts)
      return data
    end

    # Locations: Get
    # Gets the primary profile for a single Location.
    # @param account_id 
    # @param location_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param [Hash] opts the optional parameters
    # @return [Array<(InlineResponse201, Fixnum, Hash)>] InlineResponse201 data, response status code and response headers
    def get_location_with_http_info(account_id, location_id, v, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: LocationsApi.get_location ..."
      end
      # verify the required parameter 'account_id' is set
      fail ArgumentError, "Missing the required parameter 'account_id' when calling LocationsApi.get_location" if account_id.nil?
      # verify the required parameter 'location_id' is set
      fail ArgumentError, "Missing the required parameter 'location_id' when calling LocationsApi.get_location" if location_id.nil?
      # verify the required parameter 'v' is set
      fail ArgumentError, "Missing the required parameter 'v' when calling LocationsApi.get_location" if v.nil?
      # verify enum value
      unless ['20161012'].include?(v)
        fail ArgumentError, "invalid value for 'v', must be one of 20161012"
      end
      # resource path
      local_var_path = "/accounts/{accountId}/locations/{locationId}".sub('{format}','json').sub('{' + 'accountId' + '}', account_id.to_s).sub('{' + 'locationId' + '}', location_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'v'] = v

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      local_header_accept = ['application/json']
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = ['application/json']
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['api_key']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'InlineResponse201')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: LocationsApi#get_location\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Folders: List
    # Returns a list of Location Folders in an Account.
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param [Hash] opts the optional parameters
    # @option opts [String] :offset Number of results to skip. Used to page through results (default to 0)
    # @option opts [Integer] :limit Number of results to return (default to 100)
    # @return [InlineResponse2001]
    def get_location_folders(account_id, v, opts = {})
      data, _status_code, _headers = get_location_folders_with_http_info(account_id, v, opts)
      return data
    end

    # Folders: List
    # Returns a list of Location Folders in an Account.
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param [Hash] opts the optional parameters
    # @option opts [String] :offset Number of results to skip. Used to page through results
    # @option opts [Integer] :limit Number of results to return
    # @return [Array<(InlineResponse2001, Fixnum, Hash)>] InlineResponse2001 data, response status code and response headers
    def get_location_folders_with_http_info(account_id, v, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: LocationsApi.get_location_folders ..."
      end
      # verify the required parameter 'account_id' is set
      fail ArgumentError, "Missing the required parameter 'account_id' when calling LocationsApi.get_location_folders" if account_id.nil?
      # verify the required parameter 'v' is set
      fail ArgumentError, "Missing the required parameter 'v' when calling LocationsApi.get_location_folders" if v.nil?
      # verify enum value
      unless ['20161012'].include?(v)
        fail ArgumentError, "invalid value for 'v', must be one of 20161012"
      end
      if opts[:'limit'] > 1000.0
        fail ArgumentError, 'invalid value for "opts[:"limit"]" when calling LocationsApi.get_location_folders, must be smaller than or equal to 1000.0.'
      end

      # resource path
      local_var_path = "/accounts/{accountId}/folders".sub('{format}','json').sub('{' + 'accountId' + '}', account_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'v'] = v
      query_params[:'offset'] = opts[:'offset'] if !opts[:'offset'].nil?
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      local_header_accept = ['application/json']
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = ['application/json']
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['api_key']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'InlineResponse2001')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: LocationsApi#get_location_folders\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Locations: List
    # Get multiple Locations (primary profiles only).
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :limit Number of results to return (default to 10)
    # @option opts [String] :offset Number of results to skip. Used to page through results (default to 0)
    # @return [InlineResponse2002]
    def get_locations(account_id, v, opts = {})
      data, _status_code, _headers = get_locations_with_http_info(account_id, v, opts)
      return data
    end

    # Locations: List
    # Get multiple Locations (primary profiles only).
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :limit Number of results to return
    # @option opts [String] :offset Number of results to skip. Used to page through results
    # @return [Array<(InlineResponse2002, Fixnum, Hash)>] InlineResponse2002 data, response status code and response headers
    def get_locations_with_http_info(account_id, v, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: LocationsApi.get_locations ..."
      end
      # verify the required parameter 'account_id' is set
      fail ArgumentError, "Missing the required parameter 'account_id' when calling LocationsApi.get_locations" if account_id.nil?
      # verify the required parameter 'v' is set
      fail ArgumentError, "Missing the required parameter 'v' when calling LocationsApi.get_locations" if v.nil?
      # verify enum value
      unless ['20161012'].include?(v)
        fail ArgumentError, "invalid value for 'v', must be one of 20161012"
      end
      if opts[:'limit'] > 50.0
        fail ArgumentError, 'invalid value for "opts[:"limit"]" when calling LocationsApi.get_locations, must be smaller than or equal to 50.0.'
      end

      # resource path
      local_var_path = "/accounts/{accountId}/locations".sub('{format}','json').sub('{' + 'accountId' + '}', account_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'v'] = v
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?
      query_params[:'offset'] = opts[:'offset'] if !opts[:'offset'].nil?

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      local_header_accept = ['application/json']
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = ['application/json']
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['api_key']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'InlineResponse2002')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: LocationsApi#get_locations\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Locations: Update
    # Updates the primary profile for a Location.  **NOTE:** Despite using the PUT method, Locations: Update only updates supplied fields. Omitted fields are not modified.  **NOTE:** The Location's primary profile language can be changed by calling this endpoint with a different, but unused, language code. 
    # @param account_id 
    # @param location_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param location_request 
    # @param [Hash] opts the optional parameters
    # @return [InlineResponse201]
    def update_location(account_id, location_id, v, location_request, opts = {})
      data, _status_code, _headers = update_location_with_http_info(account_id, location_id, v, location_request, opts)
      return data
    end

    # Locations: Update
    # Updates the primary profile for a Location.  **NOTE:** Despite using the PUT method, Locations: Update only updates supplied fields. Omitted fields are not modified.  **NOTE:** The Location&#39;s primary profile language can be changed by calling this endpoint with a different, but unused, language code. 
    # @param account_id 
    # @param location_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param location_request 
    # @param [Hash] opts the optional parameters
    # @return [Array<(InlineResponse201, Fixnum, Hash)>] InlineResponse201 data, response status code and response headers
    def update_location_with_http_info(account_id, location_id, v, location_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: LocationsApi.update_location ..."
      end
      # verify the required parameter 'account_id' is set
      fail ArgumentError, "Missing the required parameter 'account_id' when calling LocationsApi.update_location" if account_id.nil?
      # verify the required parameter 'location_id' is set
      fail ArgumentError, "Missing the required parameter 'location_id' when calling LocationsApi.update_location" if location_id.nil?
      # verify the required parameter 'v' is set
      fail ArgumentError, "Missing the required parameter 'v' when calling LocationsApi.update_location" if v.nil?
      # verify enum value
      unless ['20161012'].include?(v)
        fail ArgumentError, "invalid value for 'v', must be one of 20161012"
      end
      # verify the required parameter 'location_request' is set
      fail ArgumentError, "Missing the required parameter 'location_request' when calling LocationsApi.update_location" if location_request.nil?
      # resource path
      local_var_path = "/accounts/{accountId}/locations/{locationId}".sub('{format}','json').sub('{' + 'accountId' + '}', account_id.to_s).sub('{' + 'locationId' + '}', location_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'v'] = v

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      local_header_accept = ['application/json']
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = ['application/json']
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(location_request)
      auth_names = ['api_key']
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'InlineResponse201')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: LocationsApi#update_location\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
