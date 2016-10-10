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
  class ListingsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end

    # Publisher Suggestions: Get
    # Fetches details of a specific Publisher Suggestion
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param suggestion_id 
    # @param [Hash] opts the optional parameters
    # @return [InlineResponse2006]
    def get_publisher_suggestion(account_id, v, suggestion_id, opts = {})
      data, _status_code, _headers = get_publisher_suggestion_with_http_info(account_id, v, suggestion_id, opts)
      return data
    end

    # Publisher Suggestions: Get
    # Fetches details of a specific Publisher Suggestion
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param suggestion_id 
    # @param [Hash] opts the optional parameters
    # @return [Array<(InlineResponse2006, Fixnum, Hash)>] InlineResponse2006 data, response status code and response headers
    def get_publisher_suggestion_with_http_info(account_id, v, suggestion_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: ListingsApi.get_publisher_suggestion ..."
      end
      # verify the required parameter 'account_id' is set
      fail ArgumentError, "Missing the required parameter 'account_id' when calling ListingsApi.get_publisher_suggestion" if account_id.nil?
      # verify the required parameter 'v' is set
      fail ArgumentError, "Missing the required parameter 'v' when calling ListingsApi.get_publisher_suggestion" if v.nil?
      # verify enum value
      unless ['20161012'].include?(v)
        fail ArgumentError, "invalid value for 'v', must be one of 20161012"
      end
      # verify the required parameter 'suggestion_id' is set
      fail ArgumentError, "Missing the required parameter 'suggestion_id' when calling ListingsApi.get_publisher_suggestion" if suggestion_id.nil?
      # resource path
      local_var_path = "/accounts/{accountId}/powerlistings/publishersuggestions/{suggestionId}".sub('{format}','json').sub('{' + 'accountId' + '}', account_id.to_s).sub('{' + 'suggestionId' + '}', suggestion_id.to_s)

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
        :return_type => 'InlineResponse2006')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ListingsApi#get_publisher_suggestion\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Listings: List
    # Retrieve all Listings matching the given criteria including status and reasons why a Listing may be unavailable
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :limit Number of results to return (default to 20)
    # @option opts [String] :offset Number of results to skip. Used to page through results (default to 0)
    # @option opts [Array<String>] :location_ids Defaults to all account locations with a PowerListings subscription  **Example:** 123,456,789 
    # @option opts [Array<String>] :publisher_ids Defaults to all publishers subscribed by account  **Example:** MAPQUEST,YELP 
    # @return [InlineResponse2003]
    def list_listings(account_id, v, opts = {})
      data, _status_code, _headers = list_listings_with_http_info(account_id, v, opts)
      return data
    end

    # Listings: List
    # Retrieve all Listings matching the given criteria including status and reasons why a Listing may be unavailable
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :limit Number of results to return
    # @option opts [String] :offset Number of results to skip. Used to page through results
    # @option opts [Array<String>] :location_ids Defaults to all account locations with a PowerListings subscription  **Example:** 123,456,789 
    # @option opts [Array<String>] :publisher_ids Defaults to all publishers subscribed by account  **Example:** MAPQUEST,YELP 
    # @return [Array<(InlineResponse2003, Fixnum, Hash)>] InlineResponse2003 data, response status code and response headers
    def list_listings_with_http_info(account_id, v, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: ListingsApi.list_listings ..."
      end
      # verify the required parameter 'account_id' is set
      fail ArgumentError, "Missing the required parameter 'account_id' when calling ListingsApi.list_listings" if account_id.nil?
      # verify the required parameter 'v' is set
      fail ArgumentError, "Missing the required parameter 'v' when calling ListingsApi.list_listings" if v.nil?
      # verify enum value
      unless ['20161012'].include?(v)
        fail ArgumentError, "invalid value for 'v', must be one of 20161012"
      end
      if opts[:'limit'] > 1000.0
        fail ArgumentError, 'invalid value for "opts[:"limit"]" when calling ListingsApi.list_listings, must be smaller than or equal to 1000.0.'
      end

      # resource path
      local_var_path = "/accounts/{accountId}/powerlistings/listings".sub('{format}','json').sub('{' + 'accountId' + '}', account_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'v'] = v
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?
      query_params[:'offset'] = opts[:'offset'] if !opts[:'offset'].nil?
      query_params[:'locationIds'] = @api_client.build_collection_param(opts[:'location_ids'], :csv) if !opts[:'location_ids'].nil?
      query_params[:'publisherIds'] = @api_client.build_collection_param(opts[:'publisher_ids'], :csv) if !opts[:'publisher_ids'].nil?

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
        :return_type => 'InlineResponse2003')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ListingsApi#list_listings\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Publisher Suggestions: List
    # Retrieve suggestions publishers have submitted for the Locations in an account
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :limit Number of results to return (default to 10)
    # @option opts [String] :offset Number of results to skip. Used to page through results (default to 0)
    # @option opts [Array<String>] :location_ids Defaults to all account locations with a PowerListings subscription  **Example:** 123,456,789 
    # @option opts [Array<String>] :publisher_ids Defaults to all publishers subscribed by account  **Example:** MAPQUEST,YELP 
    # @option opts [Array<String>] :statuses When specified, only Publisher Suggestions with the provided statuses will be returned  **Example:** PENDING,EXPIRED 
    # @return [InlineResponse2005]
    def list_publisher_suggestions(account_id, v, opts = {})
      data, _status_code, _headers = list_publisher_suggestions_with_http_info(account_id, v, opts)
      return data
    end

    # Publisher Suggestions: List
    # Retrieve suggestions publishers have submitted for the Locations in an account
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :limit Number of results to return
    # @option opts [String] :offset Number of results to skip. Used to page through results
    # @option opts [Array<String>] :location_ids Defaults to all account locations with a PowerListings subscription  **Example:** 123,456,789 
    # @option opts [Array<String>] :publisher_ids Defaults to all publishers subscribed by account  **Example:** MAPQUEST,YELP 
    # @option opts [Array<String>] :statuses When specified, only Publisher Suggestions with the provided statuses will be returned  **Example:** PENDING,EXPIRED 
    # @return [Array<(InlineResponse2005, Fixnum, Hash)>] InlineResponse2005 data, response status code and response headers
    def list_publisher_suggestions_with_http_info(account_id, v, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: ListingsApi.list_publisher_suggestions ..."
      end
      # verify the required parameter 'account_id' is set
      fail ArgumentError, "Missing the required parameter 'account_id' when calling ListingsApi.list_publisher_suggestions" if account_id.nil?
      # verify the required parameter 'v' is set
      fail ArgumentError, "Missing the required parameter 'v' when calling ListingsApi.list_publisher_suggestions" if v.nil?
      # verify enum value
      unless ['20161012'].include?(v)
        fail ArgumentError, "invalid value for 'v', must be one of 20161012"
      end
      if opts[:'limit'] > 50.0
        fail ArgumentError, 'invalid value for "opts[:"limit"]" when calling ListingsApi.list_publisher_suggestions, must be smaller than or equal to 50.0.'
      end

      if opts[:'statuses'] && ![].include?(opts[:'statuses'])
        fail ArgumentError, 'invalid value for "statuses", must be one of '
      end
      # resource path
      local_var_path = "/accounts/{accountId}/powerlistings/publishersuggestions".sub('{format}','json').sub('{' + 'accountId' + '}', account_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'v'] = v
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?
      query_params[:'offset'] = opts[:'offset'] if !opts[:'offset'].nil?
      query_params[:'locationIds'] = @api_client.build_collection_param(opts[:'location_ids'], :csv) if !opts[:'location_ids'].nil?
      query_params[:'publisherIds'] = @api_client.build_collection_param(opts[:'publisher_ids'], :csv) if !opts[:'publisher_ids'].nil?
      query_params[:'statuses'] = @api_client.build_collection_param(opts[:'statuses'], :csv) if !opts[:'statuses'].nil?

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
        :return_type => 'InlineResponse2005')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ListingsApi#list_publisher_suggestions\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Publishers: List
    # Retrieve list of Publishers
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param [Hash] opts the optional parameters
    # @option opts [String] :subset **ALL** - return all publishers  **RELEVANT_ONLY** - only return publishers relevant to the account based on supported countries and location types  (default to RELEVANT_ONLY)
    # @return [InlineResponse2004]
    def list_publishers(account_id, v, opts = {})
      data, _status_code, _headers = list_publishers_with_http_info(account_id, v, opts)
      return data
    end

    # Publishers: List
    # Retrieve list of Publishers
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param [Hash] opts the optional parameters
    # @option opts [String] :subset **ALL** - return all publishers  **RELEVANT_ONLY** - only return publishers relevant to the account based on supported countries and location types 
    # @return [Array<(InlineResponse2004, Fixnum, Hash)>] InlineResponse2004 data, response status code and response headers
    def list_publishers_with_http_info(account_id, v, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: ListingsApi.list_publishers ..."
      end
      # verify the required parameter 'account_id' is set
      fail ArgumentError, "Missing the required parameter 'account_id' when calling ListingsApi.list_publishers" if account_id.nil?
      # verify the required parameter 'v' is set
      fail ArgumentError, "Missing the required parameter 'v' when calling ListingsApi.list_publishers" if v.nil?
      # verify enum value
      unless ['20161012'].include?(v)
        fail ArgumentError, "invalid value for 'v', must be one of 20161012"
      end
      if opts[:'subset'] && !['ALL', 'RELEVANT_ONLY'].include?(opts[:'subset'])
        fail ArgumentError, 'invalid value for "subset", must be one of ALL, RELEVANT_ONLY'
      end
      # resource path
      local_var_path = "/accounts/{accountId}/powerlistings/publishers".sub('{format}','json').sub('{' + 'accountId' + '}', account_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'v'] = v
      query_params[:'subset'] = opts[:'subset'] if !opts[:'subset'].nil?

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
        :return_type => 'InlineResponse2004')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ListingsApi#list_publishers\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Listings: Opt In
    # Opts designated locations into designated publishers **NOTE:** The number of Location IDs multiplied by the number of Publisher IDs is capped at 100. If you exceed this, you get a 400 error.
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :location_ids Defaults to all account locations with a PowerListings subscription  **Example:** 123,456,789 
    # @option opts [Array<String>] :publisher_ids Defaults to all publishers subscribed by account  **Example:** MAPQUEST,YELP 
    # @return [InlineResponseDefault]
    def opt_in_listings(account_id, v, opts = {})
      data, _status_code, _headers = opt_in_listings_with_http_info(account_id, v, opts)
      return data
    end

    # Listings: Opt In
    # Opts designated locations into designated publishers **NOTE:** The number of Location IDs multiplied by the number of Publisher IDs is capped at 100. If you exceed this, you get a 400 error.
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :location_ids Defaults to all account locations with a PowerListings subscription  **Example:** 123,456,789 
    # @option opts [Array<String>] :publisher_ids Defaults to all publishers subscribed by account  **Example:** MAPQUEST,YELP 
    # @return [Array<(InlineResponseDefault, Fixnum, Hash)>] InlineResponseDefault data, response status code and response headers
    def opt_in_listings_with_http_info(account_id, v, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: ListingsApi.opt_in_listings ..."
      end
      # verify the required parameter 'account_id' is set
      fail ArgumentError, "Missing the required parameter 'account_id' when calling ListingsApi.opt_in_listings" if account_id.nil?
      # verify the required parameter 'v' is set
      fail ArgumentError, "Missing the required parameter 'v' when calling ListingsApi.opt_in_listings" if v.nil?
      # verify enum value
      unless ['20161012'].include?(v)
        fail ArgumentError, "invalid value for 'v', must be one of 20161012"
      end
      # resource path
      local_var_path = "/accounts/{accountId}/powerlistings/listings/optin".sub('{format}','json').sub('{' + 'accountId' + '}', account_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'v'] = v
      query_params[:'locationIds'] = @api_client.build_collection_param(opts[:'location_ids'], :csv) if !opts[:'location_ids'].nil?
      query_params[:'publisherIds'] = @api_client.build_collection_param(opts[:'publisher_ids'], :csv) if !opts[:'publisher_ids'].nil?

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
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'InlineResponseDefault')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ListingsApi#opt_in_listings\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Listings: Opt Out
    # Opts designated locations out of designated publishers  **NOTE:** The number of Location IDs multiplied by the number of Publisher IDs is capped at 100. If you exceed this, you get a 400 error. 
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :location_ids Defaults to all account locations with a PowerListings subscription  **Example:** 123,456,789 
    # @option opts [Array<String>] :publisher_ids Defaults to all publishers subscribed by account  **Example:** MAPQUEST,YELP 
    # @return [InlineResponseDefault]
    def opt_out_listings(account_id, v, opts = {})
      data, _status_code, _headers = opt_out_listings_with_http_info(account_id, v, opts)
      return data
    end

    # Listings: Opt Out
    # Opts designated locations out of designated publishers  **NOTE:** The number of Location IDs multiplied by the number of Publisher IDs is capped at 100. If you exceed this, you get a 400 error. 
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :location_ids Defaults to all account locations with a PowerListings subscription  **Example:** 123,456,789 
    # @option opts [Array<String>] :publisher_ids Defaults to all publishers subscribed by account  **Example:** MAPQUEST,YELP 
    # @return [Array<(InlineResponseDefault, Fixnum, Hash)>] InlineResponseDefault data, response status code and response headers
    def opt_out_listings_with_http_info(account_id, v, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: ListingsApi.opt_out_listings ..."
      end
      # verify the required parameter 'account_id' is set
      fail ArgumentError, "Missing the required parameter 'account_id' when calling ListingsApi.opt_out_listings" if account_id.nil?
      # verify the required parameter 'v' is set
      fail ArgumentError, "Missing the required parameter 'v' when calling ListingsApi.opt_out_listings" if v.nil?
      # verify enum value
      unless ['20161012'].include?(v)
        fail ArgumentError, "invalid value for 'v', must be one of 20161012"
      end
      # resource path
      local_var_path = "/accounts/{accountId}/powerlistings/listings/optout".sub('{format}','json').sub('{' + 'accountId' + '}', account_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'v'] = v
      query_params[:'locationIds'] = @api_client.build_collection_param(opts[:'location_ids'], :csv) if !opts[:'location_ids'].nil?
      query_params[:'publisherIds'] = @api_client.build_collection_param(opts[:'publisher_ids'], :csv) if !opts[:'publisher_ids'].nil?

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
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'InlineResponseDefault')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ListingsApi#opt_out_listings\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Publisher Suggestions: Update
    # Accept or reject a Publisher Suggestion
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param suggestion_id 
    # @param status The status of the Publisher Suggestion
    # @param [Hash] opts the optional parameters
    # @return [InlineResponseDefault]
    def update_publisher_suggestion(account_id, v, suggestion_id, status, opts = {})
      data, _status_code, _headers = update_publisher_suggestion_with_http_info(account_id, v, suggestion_id, status, opts)
      return data
    end

    # Publisher Suggestions: Update
    # Accept or reject a Publisher Suggestion
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param suggestion_id 
    # @param status The status of the Publisher Suggestion
    # @param [Hash] opts the optional parameters
    # @return [Array<(InlineResponseDefault, Fixnum, Hash)>] InlineResponseDefault data, response status code and response headers
    def update_publisher_suggestion_with_http_info(account_id, v, suggestion_id, status, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: ListingsApi.update_publisher_suggestion ..."
      end
      # verify the required parameter 'account_id' is set
      fail ArgumentError, "Missing the required parameter 'account_id' when calling ListingsApi.update_publisher_suggestion" if account_id.nil?
      # verify the required parameter 'v' is set
      fail ArgumentError, "Missing the required parameter 'v' when calling ListingsApi.update_publisher_suggestion" if v.nil?
      # verify enum value
      unless ['20161012'].include?(v)
        fail ArgumentError, "invalid value for 'v', must be one of 20161012"
      end
      # verify the required parameter 'suggestion_id' is set
      fail ArgumentError, "Missing the required parameter 'suggestion_id' when calling ListingsApi.update_publisher_suggestion" if suggestion_id.nil?
      # verify the required parameter 'status' is set
      fail ArgumentError, "Missing the required parameter 'status' when calling ListingsApi.update_publisher_suggestion" if status.nil?
      # verify enum value
      unless ['ACCEPTED', 'REJECTED'].include?(status)
        fail ArgumentError, "invalid value for 'status', must be one of ACCEPTED, REJECTED"
      end
      # resource path
      local_var_path = "/accounts/{accountId}/powerlistings/publishersuggestions/{suggestionId}".sub('{format}','json').sub('{' + 'accountId' + '}', account_id.to_s).sub('{' + 'suggestionId' + '}', suggestion_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'v'] = v
      query_params[:'status'] = status

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
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'InlineResponseDefault')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ListingsApi#update_publisher_suggestion\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
