=begin
#Yext API

## Policies and Conventions  This section gives you the basic information you need to use our APIs.  ## Authentication All requests must be authenticated using an app’s API key.  <pre>GET https://api.yext.com/v2/accounts/[accountId]/locations?<b>api_key=API_KEY</b>&v=YYYYMMDD</pre>  The API key should be kept secret, as each app has exactly one API key.  ## Versioning All requests must be versioned using the **`v`** parameter.   <pre>GET https://api.yext.com/v2/accounts/[accountId]/locations?api_key=API_KEY&<b>v=YYYYMMDD</b></pre>  The **`v`** parameter (a date in `YYYYMMDD` format) is designed to give you the freedom to adapt to Yext API changes on your own schedule. When you pass this parameter, any changes we made to the API after the specified date will not affect the behavior of the request or the content of the response.  **NOTE:** Yext has the ability to make changes that affect previous versions of the API, if necessary.  ## Serialization API v2 only accepts data in JSON format.  ## Content-Type Headers For all requests that include a request body, the Content-Type header must be included and set to `application/json`.  ## Errors and Warnings There are three kinds of issues that can be reported for a given request:  * **`FATAL_ERROR`**     * An issue caused the entire request to be rejected. * **`NON_FATAL_ERROR`**     * An item is rejected, but other items present in the request are accepted (e.g., one invalid Product List item).      * A field is rejected, but the item otherwise is accepted (e.g., invalid website URL in a Location). * **`WARNING`**     * The request did not adhere to our best practices or recommendations, but the data was accepted anyway (e.g., data was sent that may cause some listings to become unavailable, a deprecated API was used, or we changed the format of a field's content to meet our requirements).  ## Validation Modes *(Available December 2016)*  API v2 will support two request validation modes: *Strict Mode* and *Lenient Mode*.  In Strict Mode, both `FATAL_ERROR`s and `NON_FATAL_ERROR`s are reported simply as `FATAL_ERROR`s, and any error will cause the entire request to fail.  In Lenient Mode, `FATAL_ERROR`s and `NON_FATAL_ERROR`s are reported as such, and only `FATAL_ERROR`s will cause a request to fail.  All requests will be processed in Strict Mode by default.  To activate Lenient Mode, append the parameter `validation=lenient` to your request URLs.  ### Dates and times * We always use milliseconds since epoch (a.k.a. Unix time) for timestamps (e.g., review creation times, webhook update times). * We always use ISO 8601 without timezone for local date times (e.g., Event start time, Event end time). * Dates are transmitted as strings: `“YYYY-MM-DD”`.  ## Account ID In keeping with RESTful design principles, every URL in API v2 has an account ID prefix. This prefix helps to ensure that you have unique URLs for all resources.  In addition to specifying resources by explicit account ID, the following two macros are defined: * **`me`** - refers to the account that owns the API key sent with the request * **`all`** - refers to the account that owns the API key sent with the request, as well as all sub-accounts (recursively)  **IMPORTANT:** The **`me`** macro is supported in all API methods.  The **`all`** macro will only be supported in certain URLs, as noted in the reference documentation.  ### Examples This URL refers to all locations in account 123. <pre>https://api.yext.com/v2/accounts/<b>123</b>/locations?api_key=456&v=20160822</pre>  This URL refers to all locations in the account that owns API key 456. <pre>https://api.yext.com/v2/accounts/<b>me</b>/locations?<b>api_key=456</b>&v=20160822</pre>  This URL refers to all locations in the account that owns API key 456, as well as all locations from any of its child accounts. <pre>https://api.yext.com/v2/accounts/<b>all</b>/locations?<b>api_key=456</b>&v=20160822</pre>  ## Actor Headers *(Available December 2016)*  To attribute changes to a particular user or employee, all requests may be passed with the following headers.  **NOTE:** If you choose to provide actor headers, and we are unable to authenticate the request using the values you provide, the request will result in an error and fail.  * Attribute activity to Admin user via admin login cookie *(for Yext’s use only)*     * Header: `YextEmployee`     * Value: Admin user’s AlphaLogin cookie * Attribute activity to Admin user via email address and password     * Headers: `YextEmployeeEmail`, `YextEmployeePassword`     * Values: Admin user’s email address, Admin user’s Admin password * Attribute activity to customer user via login cookie     * Header: `YextUser`     * Value: Customer user’s YextAppsLogin cookie * Attribute activity to customer user via email address and password     * Headers: `YextUserEmail`, `YextUserPassword`     * Values: Customer user’s email address, Customer user’s password  Changes will be logged as follows:  * App with no designated actor     * History Entry \"Updated By\" Value: `App [App ID] - ‘[App Name]’`     * Example: `App 432 - ‘Hello World App’` * App with customer user actor     * History Entry \"Updated By\" Value: `[user name] ([user email]) (App [App ID] - ‘[App Name]’)`     * Example: `Jordan Smith (jsmith@example.com) (App 432 - ‘Hello World App’)` * App with Yext employee actor   * History Entry \"Updated By\" Value: `[employee username] (App [App ID] - ‘[App Name]’)`   * Example: `hlerman (App 432 - ‘Hello World App’)`  ## Response Format * **`meta`**     * Response metadata  * **`meta.uuid`**     * Unique ID for this request / response * **`meta.errors[]`**     * List of errors and warnings  * **`meta.errors[].code`**     * Code that uniquely identifies the error or warning  * **`meta.errors[].type`**     * One of:         * `FATAL_ERROR`         * `NON_FATAL_ERROR`         * `WARNING`     * See \"Errors and Warnings\" above for details. * **`meta.errors[].message`**     * An explanation of the issue * **`response`**     * The main content (body) of the response  Example: <pre><code> {     \"meta\": {         \"uuid\": \"bb0c7e19-4dc3-4891-bfa5-8593b1f124ad\",         \"errors\": [             {                 \"code\": ...error code...,                 \"type\": ...error, fatal error, non fatal error, or warning...,                 \"message\": ...explanation of the issue...             }         ]     },     \"response\": {         ...results...     } } </code></pre>  ## Status Codes * `200 OK`    * Either there are no errors or warnings, or the only issues are of type `WARNING`. * `207 Multi-Status`     * There are errors of type `itemError` or `fieldError` (but none of type `requestError`). * `400 Bad Request`     * A parameter is invalid, or a required parameter is missing. This includes the case where no API key is provided and the case where a resource ID is specified incorrectly in a path.     * This status is if any of the response errors are of type `requestError`. * `401 Unauthorized`     * The API key provided is invalid.     * `403 Forbidden`     * The requested information cannot be viewed by the acting user.  * `404 Not Found`     * The endpoint does not exist. * `405 Method Not Allowed`     * The request is using a method that is not allowed (e.g., POST with a GET-only endpoint). * `409 Conflict`     * The request could not be completed in its current state.     * Use the information included in the response to modify the request and retry. * `429 Too Many Requests`     * You have exceeded your rate limit / quota. * `500 Internal Server Error`     * Yext’s servers are not operating as expected. The request is likely valid but should be resent later. * `504 Timeout`     * Yext’s servers took too long to handle this request, and it timed out.  ## Quotas and Rate Limits Default quotas and rate limits are as follows.  * **Location Cloud API** *(includes Analytics, PowerListings®, Location Manager, Reviews, Social, and User endpoints)*: 5,000 requests per hour * **Administrative API**: 1 qps * **Live API**: 100,000 requests per hour  **NOTE:** Webhook requests do not count towards an account’s quota.  For the most current and accurate rate-limit usage information for a particular request type, check the **`RateLimit-Remaining`** and **`RateLimit-Limit`** HTTP headers of your API responses.  If you are currently over your limit, our API will return a `429` error, and the response object returned by our API will be empty. We will also include a **`RateLimit-Reset`** header in the response, which indicates when you will have additional quota.  ## Client- vs. Yext-assigned IDs You can set the ID for the following objects when you create them. If you do not provide an ID, Yext will generate one for you.  * Account * User * Location * Bio List * Menu List * Product List * Event List * Bio List Item * Menu List Item * Product List Item * Event List Item  ## Logging All API requests are logged. API logs can be found in your Developer Console and are stored for 90 days. 

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
  class SocialApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end

    # Comments: create
    # Create a new Comment in response to another Post / Comment.
    # @param account_id 
    # @param post_id 
    # @param parent_id The ID of the Comment this Comment is replying to.  **Example** 123 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :message The message included in the Comment, if any.  **Example** “Hello, World!” 
    # @option opts [String] :photo_url The URL of the photo included in the Comment, if any.  **Example** “https://…” 
    # @option opts [String] :link_url The URL of the link included in the Comment, if any.  **Example** “https://…” 
    # @return [InlineResponse2014]
    def create_comment(account_id, post_id, parent_id, opts = {})
      data, _status_code, _headers = create_comment_with_http_info(account_id, post_id, parent_id, opts)
      return data
    end

    # Comments: create
    # Create a new Comment in response to another Post / Comment.
    # @param account_id 
    # @param post_id 
    # @param parent_id The ID of the Comment this Comment is replying to.  **Example** 123 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :message The message included in the Comment, if any.  **Example** “Hello, World!” 
    # @option opts [String] :photo_url The URL of the photo included in the Comment, if any.  **Example** “https://…” 
    # @option opts [String] :link_url The URL of the link included in the Comment, if any.  **Example** “https://…” 
    # @return [Array<(InlineResponse2014, Fixnum, Hash)>] InlineResponse2014 data, response status code and response headers
    def create_comment_with_http_info(account_id, post_id, parent_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: SocialApi.create_comment ..."
      end
      # verify the required parameter 'account_id' is set
      fail ArgumentError, "Missing the required parameter 'account_id' when calling SocialApi.create_comment" if account_id.nil?
      # verify the required parameter 'post_id' is set
      fail ArgumentError, "Missing the required parameter 'post_id' when calling SocialApi.create_comment" if post_id.nil?
      # verify the required parameter 'parent_id' is set
      fail ArgumentError, "Missing the required parameter 'parent_id' when calling SocialApi.create_comment" if parent_id.nil?
      # resource path
      local_var_path = "/accounts/{accountId}/posts/{postId}/comments".sub('{format}','json').sub('{' + 'accountId' + '}', account_id.to_s).sub('{' + 'postId' + '}', post_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'parentId'] = parent_id
      query_params[:'message'] = opts[:'message'] if !opts[:'message'].nil?
      query_params[:'photoUrl'] = opts[:'photo_url'] if !opts[:'photo_url'].nil?
      query_params[:'linkUrl'] = opts[:'link_url'] if !opts[:'link_url'].nil?

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
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'InlineResponse2014')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SocialApi#create_comment\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Posts: create
    # Create a new Post.
    # @param account_id 
    # @param location_ids List of Location IDs for this Post
    # @param publisher_ids List of Publisher IDs for this Post
    # @param message The message included in the Post, if any.  **Example** \&quot;Hello, World!\&quot; 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :photo_url The URL of the photo included in the Post, if any.  **Example** \&quot;https://...\&quot; 
    # @option opts [String] :link_url The URL of the link included in the Post, if any.  **Example** \&quot;https://...\&quot; 
    # @return [InlineResponse2014]
    def create_posts(account_id, location_ids, publisher_ids, message, opts = {})
      data, _status_code, _headers = create_posts_with_http_info(account_id, location_ids, publisher_ids, message, opts)
      return data
    end

    # Posts: create
    # Create a new Post.
    # @param account_id 
    # @param location_ids List of Location IDs for this Post
    # @param publisher_ids List of Publisher IDs for this Post
    # @param message The message included in the Post, if any.  **Example** \&quot;Hello, World!\&quot; 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :photo_url The URL of the photo included in the Post, if any.  **Example** \&quot;https://...\&quot; 
    # @option opts [String] :link_url The URL of the link included in the Post, if any.  **Example** \&quot;https://...\&quot; 
    # @return [Array<(InlineResponse2014, Fixnum, Hash)>] InlineResponse2014 data, response status code and response headers
    def create_posts_with_http_info(account_id, location_ids, publisher_ids, message, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: SocialApi.create_posts ..."
      end
      # verify the required parameter 'account_id' is set
      fail ArgumentError, "Missing the required parameter 'account_id' when calling SocialApi.create_posts" if account_id.nil?
      # verify the required parameter 'location_ids' is set
      fail ArgumentError, "Missing the required parameter 'location_ids' when calling SocialApi.create_posts" if location_ids.nil?
      # verify the required parameter 'publisher_ids' is set
      fail ArgumentError, "Missing the required parameter 'publisher_ids' when calling SocialApi.create_posts" if publisher_ids.nil?
      # verify the required parameter 'message' is set
      fail ArgumentError, "Missing the required parameter 'message' when calling SocialApi.create_posts" if message.nil?
      # resource path
      local_var_path = "/accounts/{accountId}/posts".sub('{format}','json').sub('{' + 'accountId' + '}', account_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'locationIds'] = @api_client.build_collection_param(location_ids, :csv)
      query_params[:'publisherIds'] = @api_client.build_collection_param(publisher_ids, :csv)
      query_params[:'message'] = message
      query_params[:'photoUrl'] = opts[:'photo_url'] if !opts[:'photo_url'].nil?
      query_params[:'linkUrl'] = opts[:'link_url'] if !opts[:'link_url'].nil?

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
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'InlineResponse2014')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SocialApi#create_posts\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Comments: delete
    # Deletes an existing Comment.
    # @param account_id 
    # @param post_id 
    # @param comment_id 
    # @param [Hash] opts the optional parameters
    # @return [InlineResponseDefault]
    def delete_comment(account_id, post_id, comment_id, opts = {})
      data, _status_code, _headers = delete_comment_with_http_info(account_id, post_id, comment_id, opts)
      return data
    end

    # Comments: delete
    # Deletes an existing Comment.
    # @param account_id 
    # @param post_id 
    # @param comment_id 
    # @param [Hash] opts the optional parameters
    # @return [Array<(InlineResponseDefault, Fixnum, Hash)>] InlineResponseDefault data, response status code and response headers
    def delete_comment_with_http_info(account_id, post_id, comment_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: SocialApi.delete_comment ..."
      end
      # verify the required parameter 'account_id' is set
      fail ArgumentError, "Missing the required parameter 'account_id' when calling SocialApi.delete_comment" if account_id.nil?
      # verify the required parameter 'post_id' is set
      fail ArgumentError, "Missing the required parameter 'post_id' when calling SocialApi.delete_comment" if post_id.nil?
      # verify the required parameter 'comment_id' is set
      fail ArgumentError, "Missing the required parameter 'comment_id' when calling SocialApi.delete_comment" if comment_id.nil?
      # resource path
      local_var_path = "/accounts/{accountId}/posts/{postId}/comments/{commentId}".sub('{format}','json').sub('{' + 'accountId' + '}', account_id.to_s).sub('{' + 'postId' + '}', post_id.to_s).sub('{' + 'commentId' + '}', comment_id.to_s)

      # query parameters
      query_params = {}

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
      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'InlineResponseDefault')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SocialApi#delete_comment\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Posts: delete
    # Deletes an existing Post.
    # @param account_id 
    # @param post_id 
    # @param [Hash] opts the optional parameters
    # @return [InlineResponseDefault]
    def delete_post(account_id, post_id, opts = {})
      data, _status_code, _headers = delete_post_with_http_info(account_id, post_id, opts)
      return data
    end

    # Posts: delete
    # Deletes an existing Post.
    # @param account_id 
    # @param post_id 
    # @param [Hash] opts the optional parameters
    # @return [Array<(InlineResponseDefault, Fixnum, Hash)>] InlineResponseDefault data, response status code and response headers
    def delete_post_with_http_info(account_id, post_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: SocialApi.delete_post ..."
      end
      # verify the required parameter 'account_id' is set
      fail ArgumentError, "Missing the required parameter 'account_id' when calling SocialApi.delete_post" if account_id.nil?
      # verify the required parameter 'post_id' is set
      fail ArgumentError, "Missing the required parameter 'post_id' when calling SocialApi.delete_post" if post_id.nil?
      # resource path
      local_var_path = "/accounts/{accountId}/posts/{postId}".sub('{format}','json').sub('{' + 'accountId' + '}', account_id.to_s).sub('{' + 'postId' + '}', post_id.to_s)

      # query parameters
      query_params = {}

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
      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'InlineResponseDefault')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SocialApi#delete_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Comments: list
    # Retrieve list of Comments for a Post.
    # @param account_id 
    # @param post_id 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :limit Number of results to return, up to 100. Default 100.  **Example** 20  (default to 100)
    # @option opts [Integer] :offset Number of results to skip. Used to page through results (default to 0)
    # @option opts [String] :type Determines which type of Comments are returned
    # @return [InlineResponse20018]
    def get_comments(account_id, post_id, opts = {})
      data, _status_code, _headers = get_comments_with_http_info(account_id, post_id, opts)
      return data
    end

    # Comments: list
    # Retrieve list of Comments for a Post.
    # @param account_id 
    # @param post_id 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :limit Number of results to return, up to 100. Default 100.  **Example** 20 
    # @option opts [Integer] :offset Number of results to skip. Used to page through results
    # @option opts [String] :type Determines which type of Comments are returned
    # @return [Array<(InlineResponse20018, Fixnum, Hash)>] InlineResponse20018 data, response status code and response headers
    def get_comments_with_http_info(account_id, post_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: SocialApi.get_comments ..."
      end
      # verify the required parameter 'account_id' is set
      fail ArgumentError, "Missing the required parameter 'account_id' when calling SocialApi.get_comments" if account_id.nil?
      # verify the required parameter 'post_id' is set
      fail ArgumentError, "Missing the required parameter 'post_id' when calling SocialApi.get_comments" if post_id.nil?
      if !opts[:'limit'].nil? && opts[:'limit'] > 100.0
        fail ArgumentError, 'invalid value for "opts[:"limit"]" when calling SocialApi.get_comments, must be smaller than or equal to 100.0.'
      end

      if opts[:'type'] && !['ALL', 'ROOT'].include?(opts[:'type'])
        fail ArgumentError, 'invalid value for "type", must be one of ALL, ROOT'
      end
      # resource path
      local_var_path = "/accounts/{accountId}/posts/{postId}/comments".sub('{format}','json').sub('{' + 'accountId' + '}', account_id.to_s).sub('{' + 'postId' + '}', post_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?
      query_params[:'offset'] = opts[:'offset'] if !opts[:'offset'].nil?
      query_params[:'type'] = opts[:'type'] if !opts[:'type'].nil?

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
        :return_type => 'InlineResponse20018')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SocialApi#get_comments\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Linked Accounts: get
    # Retrieve a specific Linked Account.
    # @param account_id 
    # @param linked_account_id 
    # @param [Hash] opts the optional parameters
    # @return [InlineResponse2008]
    def get_linked_account(account_id, linked_account_id, opts = {})
      data, _status_code, _headers = get_linked_account_with_http_info(account_id, linked_account_id, opts)
      return data
    end

    # Linked Accounts: get
    # Retrieve a specific Linked Account.
    # @param account_id 
    # @param linked_account_id 
    # @param [Hash] opts the optional parameters
    # @return [Array<(InlineResponse2008, Fixnum, Hash)>] InlineResponse2008 data, response status code and response headers
    def get_linked_account_with_http_info(account_id, linked_account_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: SocialApi.get_linked_account ..."
      end
      # verify the required parameter 'account_id' is set
      fail ArgumentError, "Missing the required parameter 'account_id' when calling SocialApi.get_linked_account" if account_id.nil?
      # verify the required parameter 'linked_account_id' is set
      fail ArgumentError, "Missing the required parameter 'linked_account_id' when calling SocialApi.get_linked_account" if linked_account_id.nil?
      # resource path
      local_var_path = "/accounts/{accountId}/linkedaccounts/{linkedAccountId}".sub('{format}','json').sub('{' + 'accountId' + '}', account_id.to_s).sub('{' + 'linkedAccountId' + '}', linked_account_id.to_s)

      # query parameters
      query_params = {}

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
        @api_client.config.logger.debug "API called: SocialApi#get_linked_account\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Linked Accounts: list
    # Retrieve all Linked Accounts and their last known statuses.
    # @param account_id 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :limit Number of results to return, up to 100. Default 100.  **Example** 20  (default to 100)
    # @option opts [Integer] :offset Number of results to skip. Used to page through results (default to 0)
    # @option opts [Array<String>] :location_ids Defaults to all account locations with a PowerListings subscription.  **Example** 123, 456, 789 
    # @option opts [Array<String>] :publisher_ids Defaults to all publishers subscribed by account  **Example** FACEBOOK, FOURSQUARE 
    # @option opts [String] :status Used to filter for Linked Accounts with a particular status. (default to ALL)
    # @return [InlineResponse2007]
    def get_linked_accounts(account_id, opts = {})
      data, _status_code, _headers = get_linked_accounts_with_http_info(account_id, opts)
      return data
    end

    # Linked Accounts: list
    # Retrieve all Linked Accounts and their last known statuses.
    # @param account_id 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :limit Number of results to return, up to 100. Default 100.  **Example** 20 
    # @option opts [Integer] :offset Number of results to skip. Used to page through results
    # @option opts [Array<String>] :location_ids Defaults to all account locations with a PowerListings subscription.  **Example** 123, 456, 789 
    # @option opts [Array<String>] :publisher_ids Defaults to all publishers subscribed by account  **Example** FACEBOOK, FOURSQUARE 
    # @option opts [String] :status Used to filter for Linked Accounts with a particular status.
    # @return [Array<(InlineResponse2007, Fixnum, Hash)>] InlineResponse2007 data, response status code and response headers
    def get_linked_accounts_with_http_info(account_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: SocialApi.get_linked_accounts ..."
      end
      # verify the required parameter 'account_id' is set
      fail ArgumentError, "Missing the required parameter 'account_id' when calling SocialApi.get_linked_accounts" if account_id.nil?
      if !opts[:'limit'].nil? && opts[:'limit'] > 100.0
        fail ArgumentError, 'invalid value for "opts[:"limit"]" when calling SocialApi.get_linked_accounts, must be smaller than or equal to 100.0.'
      end

      if opts[:'status'] && !['ALL', 'OK', 'EXPIRED'].include?(opts[:'status'])
        fail ArgumentError, 'invalid value for "status", must be one of ALL, OK, EXPIRED'
      end
      # resource path
      local_var_path = "/accounts/{accountId}/linkedaccounts".sub('{format}','json').sub('{' + 'accountId' + '}', account_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?
      query_params[:'offset'] = opts[:'offset'] if !opts[:'offset'].nil?
      query_params[:'locationIds'] = @api_client.build_collection_param(opts[:'location_ids'], :csv) if !opts[:'location_ids'].nil?
      query_params[:'publisherIds'] = @api_client.build_collection_param(opts[:'publisher_ids'], :csv) if !opts[:'publisher_ids'].nil?
      query_params[:'status'] = opts[:'status'] if !opts[:'status'].nil?

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
        @api_client.config.logger.debug "API called: SocialApi#get_linked_accounts\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Posts: List
    # Retrieve list of Posts.
    # @param account_id 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :limit Number of results to return, up to 100. Default 100.  **Example** 20  (default to 100)
    # @option opts [Integer] :offset Number of results to skip. Used to page through results (default to 0)
    # @option opts [Array<String>] :location_ids When provided, only Posts that involve the requested locations will be returned.  By defaults, reviews will be returned for all locations subscribed to Social Posting.  **Example** 123, 456, 789 
    # @option opts [String] :folder_id When provided, only Posts for locations in the given folder and its subfolders will be included in the results.  **Example** 123 
    # @option opts [Array<String>] :countries Array of 3166 Alpha-2 country codes. When present, only Posts for locations in the given countries will be returned.  **Example** [&#39;US&#39;, &#39;CA&#39;] 
    # @option opts [Array<String>] :location_labels Array of location labels. When present, only Posts for location with the provided labels will be returned.  **Example** [&#39;pilot stores&#39;] 
    # @option opts [Array<String>] :publisher_ids Defaults to all publishers subscribed by account  **Example** FACEBOOK, FOURSQUARE 
    # @option opts [Array<String>] :keywords When provided, only Posts that mention the given keywords will be returned. Posts will be returned if the original post or any comments contain this string.  **Example** [&#39;pizza&#39;] 
    # @return [InlineResponse20017]
    def get_posts(account_id, opts = {})
      data, _status_code, _headers = get_posts_with_http_info(account_id, opts)
      return data
    end

    # Posts: List
    # Retrieve list of Posts.
    # @param account_id 
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :limit Number of results to return, up to 100. Default 100.  **Example** 20 
    # @option opts [Integer] :offset Number of results to skip. Used to page through results
    # @option opts [Array<String>] :location_ids When provided, only Posts that involve the requested locations will be returned.  By defaults, reviews will be returned for all locations subscribed to Social Posting.  **Example** 123, 456, 789 
    # @option opts [String] :folder_id When provided, only Posts for locations in the given folder and its subfolders will be included in the results.  **Example** 123 
    # @option opts [Array<String>] :countries Array of 3166 Alpha-2 country codes. When present, only Posts for locations in the given countries will be returned.  **Example** [&#39;US&#39;, &#39;CA&#39;] 
    # @option opts [Array<String>] :location_labels Array of location labels. When present, only Posts for location with the provided labels will be returned.  **Example** [&#39;pilot stores&#39;] 
    # @option opts [Array<String>] :publisher_ids Defaults to all publishers subscribed by account  **Example** FACEBOOK, FOURSQUARE 
    # @option opts [Array<String>] :keywords When provided, only Posts that mention the given keywords will be returned. Posts will be returned if the original post or any comments contain this string.  **Example** [&#39;pizza&#39;] 
    # @return [Array<(InlineResponse20017, Fixnum, Hash)>] InlineResponse20017 data, response status code and response headers
    def get_posts_with_http_info(account_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: SocialApi.get_posts ..."
      end
      # verify the required parameter 'account_id' is set
      fail ArgumentError, "Missing the required parameter 'account_id' when calling SocialApi.get_posts" if account_id.nil?
      if !opts[:'limit'].nil? && opts[:'limit'] > 100.0
        fail ArgumentError, 'invalid value for "opts[:"limit"]" when calling SocialApi.get_posts, must be smaller than or equal to 100.0.'
      end

      # resource path
      local_var_path = "/accounts/{accountId}/posts".sub('{format}','json').sub('{' + 'accountId' + '}', account_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?
      query_params[:'offset'] = opts[:'offset'] if !opts[:'offset'].nil?
      query_params[:'locationIds'] = @api_client.build_collection_param(opts[:'location_ids'], :csv) if !opts[:'location_ids'].nil?
      query_params[:'folderId'] = opts[:'folder_id'] if !opts[:'folder_id'].nil?
      query_params[:'countries'] = @api_client.build_collection_param(opts[:'countries'], :csv) if !opts[:'countries'].nil?
      query_params[:'locationLabels'] = @api_client.build_collection_param(opts[:'location_labels'], :csv) if !opts[:'location_labels'].nil?
      query_params[:'publisherIds'] = @api_client.build_collection_param(opts[:'publisher_ids'], :csv) if !opts[:'publisher_ids'].nil?
      query_params[:'keywords'] = @api_client.build_collection_param(opts[:'keywords'], :csv) if !opts[:'keywords'].nil?

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
        :return_type => 'InlineResponse20017')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SocialApi#get_posts\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Comments: update
    # Updates an existing Comment.    **NOTE:** Only updates supplied fields (aka PATCH). 
    # @param account_id 
    # @param post_id 
    # @param comment_id 
    # @param comment 
    # @param [Hash] opts the optional parameters
    # @return [InlineResponseDefault]
    def update_comment(account_id, post_id, comment_id, comment, opts = {})
      data, _status_code, _headers = update_comment_with_http_info(account_id, post_id, comment_id, comment, opts)
      return data
    end

    # Comments: update
    # Updates an existing Comment.    **NOTE:** Only updates supplied fields (aka PATCH). 
    # @param account_id 
    # @param post_id 
    # @param comment_id 
    # @param comment 
    # @param [Hash] opts the optional parameters
    # @return [Array<(InlineResponseDefault, Fixnum, Hash)>] InlineResponseDefault data, response status code and response headers
    def update_comment_with_http_info(account_id, post_id, comment_id, comment, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: SocialApi.update_comment ..."
      end
      # verify the required parameter 'account_id' is set
      fail ArgumentError, "Missing the required parameter 'account_id' when calling SocialApi.update_comment" if account_id.nil?
      # verify the required parameter 'post_id' is set
      fail ArgumentError, "Missing the required parameter 'post_id' when calling SocialApi.update_comment" if post_id.nil?
      # verify the required parameter 'comment_id' is set
      fail ArgumentError, "Missing the required parameter 'comment_id' when calling SocialApi.update_comment" if comment_id.nil?
      # verify the required parameter 'comment' is set
      fail ArgumentError, "Missing the required parameter 'comment' when calling SocialApi.update_comment" if comment.nil?
      # resource path
      local_var_path = "/accounts/{accountId}/posts/{postId}/comments/{commentId}".sub('{format}','json').sub('{' + 'accountId' + '}', account_id.to_s).sub('{' + 'postId' + '}', post_id.to_s).sub('{' + 'commentId' + '}', comment_id.to_s)

      # query parameters
      query_params = {}

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
      post_body = @api_client.object_to_http_body(comment)
      auth_names = ['api_key']
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'InlineResponseDefault')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: SocialApi#update_comment\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Linked Accounts: update
    # Assign or Unassign a Linked Account to one or more Locations.  **Note:** When assigning Locations to a Linked Account, if any of the Locations are already assigned to another Linked Account with the same Publisher, they will be re-assigned to this Linked Account, and lose their association with the previous Linked Account.  **Note:** It is an error to include the same Location ID in both the assignLocations and unassignLocations lists in the same request. 
    # @param account_id 
    # @param linked_account_id 
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :assign_location_ids Array of Location IDs to be assigned to this Linked Account.  Use this field to assign this Linked Account to Locations without affecting any other assigned Locations.  
    # @option opts [Array<String>] :unassign_location_ids Array of Location IDs to be unassigned from this Linked Account.  Use this field to unassign this Linked Account from Locations without affecting any other assigned Locations. 
    # @return [InlineResponseDefault]
    def update_linked_account(account_id, linked_account_id, opts = {})
      data, _status_code, _headers = update_linked_account_with_http_info(account_id, linked_account_id, opts)
      return data
    end

    # Linked Accounts: update
    # Assign or Unassign a Linked Account to one or more Locations.  **Note:** When assigning Locations to a Linked Account, if any of the Locations are already assigned to another Linked Account with the same Publisher, they will be re-assigned to this Linked Account, and lose their association with the previous Linked Account.  **Note:** It is an error to include the same Location ID in both the assignLocations and unassignLocations lists in the same request. 
    # @param account_id 
    # @param linked_account_id 
    # @param [Hash] opts the optional parameters
    # @option opts [Array<String>] :assign_location_ids Array of Location IDs to be assigned to this Linked Account.  Use this field to assign this Linked Account to Locations without affecting any other assigned Locations.  
    # @option opts [Array<String>] :unassign_location_ids Array of Location IDs to be unassigned from this Linked Account.  Use this field to unassign this Linked Account from Locations without affecting any other assigned Locations. 
    # @return [Array<(InlineResponseDefault, Fixnum, Hash)>] InlineResponseDefault data, response status code and response headers
    def update_linked_account_with_http_info(account_id, linked_account_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: SocialApi.update_linked_account ..."
      end
      # verify the required parameter 'account_id' is set
      fail ArgumentError, "Missing the required parameter 'account_id' when calling SocialApi.update_linked_account" if account_id.nil?
      # verify the required parameter 'linked_account_id' is set
      fail ArgumentError, "Missing the required parameter 'linked_account_id' when calling SocialApi.update_linked_account" if linked_account_id.nil?
      # resource path
      local_var_path = "/accounts/{accountId}/linkedaccounts/{linkedAccountId}".sub('{format}','json').sub('{' + 'accountId' + '}', account_id.to_s).sub('{' + 'linkedAccountId' + '}', linked_account_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'assignLocationIds'] = @api_client.build_collection_param(opts[:'assign_location_ids'], :csv) if !opts[:'assign_location_ids'].nil?
      query_params[:'unassignLocationIds'] = @api_client.build_collection_param(opts[:'unassign_location_ids'], :csv) if !opts[:'unassign_location_ids'].nil?

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
        @api_client.config.logger.debug "API called: SocialApi#update_linked_account\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
