=begin
#Yext API

## Policies and Conventions  This section gives you the basic information you need to use our APIs.  ## Authentication All requests must be authenticated using an app’s API key.  <pre>GET https://api.yext.com/v2/accounts/[accountId]/locations?<b>api_key=API_KEY</b>&v=YYYYMMDD</pre>  The API key should be kept secret, as each app has exactly one API key.  ## Versioning All requests must be versioned using the **`v`** parameter.   <pre>GET https://api.yext.com/v2/accounts/[accountId]/locations?api_key=API_KEY&<b>v=YYYYMMDD</b></pre>  The **`v`** parameter (a date in `YYYYMMDD` format) is designed to give you the freedom to adapt to Yext API changes on your own schedule. When you pass this parameter, any changes we made to the API after the specified date will not affect the behavior of the request or the content of the response.  **NOTE:** Yext has the ability to make changes that affect previous versions of the API, if necessary.  ## Serialization API v2 only accepts data in JSON format.  ## Content-Type Headers For all requests that include a request body, the Content-Type header must be included and set to `application/json`.  ## Errors and Warnings There are three kinds of issues that can be reported for a given request:  * **`FATAL_ERROR`**     * An issue caused the entire request to be rejected. * **`NON_FATAL_ERROR`**     * An item is rejected, but other items present in the request are accepted (e.g., one invalid Product List item).      * A field is rejected, but the item otherwise is accepted (e.g., invalid website URL in a Location). * **`WARNING`**     * The request did not adhere to our best practices or recommendations, but the data was accepted anyway (e.g., data was sent that may cause some listings to become unavailable, a deprecated API was used, or we changed the format of a field's content to meet our requirements).  ## Validation Modes *(Available December 2016)*  API v2 will support two request validation modes: *Strict Mode* and *Lenient Mode*.  In Strict Mode, both `FATAL_ERROR`s and `NON_FATAL_ERROR`s are reported simply as `FATAL_ERROR`s, and any error will cause the entire request to fail.  In Lenient Mode, `FATAL_ERROR`s and `NON_FATAL_ERROR`s are reported as such, and only `FATAL_ERROR`s will cause a request to fail.  All requests will be processed in Strict Mode by default.  To activate Lenient Mode, append the parameter `validation=lenient` to your request URLs.  ### Dates and times * We always use milliseconds since epoch (a.k.a. Unix time) for timestamps (e.g., review creation times, webhook update times). * We always use ISO 8601 without timezone for local date times (e.g., Event start time, Event end time). * Dates are transmitted as strings: `“YYYY-MM-DD”`.  ## Account ID In keeping with RESTful design principles, every URL in API v2 has an account ID prefix. This prefix helps to ensure that you have unique URLs for all resources.  In addition to specifying resources by explicit account ID, the following two macros are defined: * **`me`** - refers to the account that owns the API key sent with the request * **`all`** - refers to the account that owns the API key sent with the request, as well as all sub-accounts (recursively)  **IMPORTANT:** The **`me`** macro is supported in all API methods.  The **`all`** macro will only be supported in certain URLs, as noted in the reference documentation.  ### Examples This URL refers to all locations in account 123. <pre>https://api.yext.com/v2/accounts/<b>123</b>/locations?api_key=456&v=20160822</pre>  This URL refers to all locations in the account that owns API key 456. <pre>https://api.yext.com/v2/accounts/<b>me</b>/locations?<b>api_key=456</b>&v=20160822</pre>  This URL refers to all locations in the account that owns API key 456, as well as all locations from any of its child accounts. <pre>https://api.yext.com/v2/accounts/<b>all</b>/locations?<b>api_key=456</b>&v=20160822</pre>  ## Actor Headers *(Available December 2016)*  To attribute changes to a particular user or employee, all requests may be passed with the following headers.  **NOTE:** If you choose to provide actor headers, and we are unable to authenticate the request using the values you provide, the request will result in an error and fail.  * Attribute activity to Admin user via admin login cookie *(for Yext’s use only)*     * Header: `YextEmployee`     * Value: Admin user’s AlphaLogin cookie * Attribute activity to Admin user via email address and password     * Headers: `YextEmployeeEmail`, `YextEmployeePassword`     * Values: Admin user’s email address, Admin user’s Admin password * Attribute activity to customer user via login cookie     * Header: `YextUser`     * Value: Customer user’s YextAppsLogin cookie * Attribute activity to customer user via email address and password     * Headers: `YextUserEmail`, `YextUserPassword`     * Values: Customer user’s email address, Customer user’s password  Changes will be logged as follows:  * App with no designated actor     * History Entry \"Updated By\" Value: `App [App ID] - ‘[App Name]’`     * Example: `App 432 - ‘Hello World App’` * App with customer user actor     * History Entry \"Updated By\" Value: `[user name] ([user email]) (App [App ID] - ‘[App Name]’)`     * Example: `Jordan Smith (jsmith@example.com) (App 432 - ‘Hello World App’)` * App with Yext employee actor   * History Entry \"Updated By\" Value: `[employee username] (App [App ID] - ‘[App Name]’)`   * Example: `hlerman (App 432 - ‘Hello World App’)`  ## Response Format * **`meta`**     * Response metadata  * **`meta.uuid`**     * Unique ID for this request / response * **`meta.errors[]`**     * List of errors and warnings  * **`meta.errors[].code`**     * Code that uniquely identifies the error or warning  * **`meta.errors[].type`**     * One of:         * `FATAL_ERROR`         * `NON_FATAL_ERROR`         * `WARNING`     * See \"Errors and Warnings\" above for details. * **`meta.errors[].message`**     * An explanation of the issue * **`response`**     * The main content (body) of the response  Example: <pre><code> {     \"meta\": {         \"uuid\": \"bb0c7e19-4dc3-4891-bfa5-8593b1f124ad\",         \"errors\": [             {                 \"code\": ...error code...,                 \"type\": ...error, fatal error, non fatal error, or warning...,                 \"message\": ...explanation of the issue...             }         ]     },     \"response\": {         ...results...     } } </code></pre>  ## Status Codes * `200 OK`    * Either there are no errors or warnings, or the only issues are of type `WARNING`. * `207 Multi-Status`     * There are errors of type `itemError` or `fieldError` (but none of type `requestError`). * `400 Bad Request`     * A parameter is invalid, or a required parameter is missing. This includes the case where no API key is provided and the case where a resource ID is specified incorrectly in a path.     * This status is if any of the response errors are of type `requestError`. * `401 Unauthorized`     * The API key provided is invalid.     * `403 Forbidden`     * The requested information cannot be viewed by the acting user.  * `404 Not Found`     * The endpoint does not exist. * `405 Method Not Allowed`     * The request is using a method that is not allowed (e.g., POST with a GET-only endpoint). * `409 Conflict`     * The request could not be completed in its current state.     * Use the information included in the response to modify the request and retry. * `429 Too Many Requests`     * You have exceeded your rate limit / quota. * `500 Internal Server Error`     * Yext’s servers are not operating as expected. The request is likely valid but should be resent later. * `504 Timeout`     * Yext’s servers took too long to handle this request, and it timed out.  ## Quotas and Rate Limits Default quotas and rate limits are as follows.  * **Location Cloud API** *(includes Analytics, PowerListings®, Location Manager, Reviews, Social, and User endpoints)*: 5,000 requests per hour * **Administrative API**: 1 qps * **Live API**: 100,000 requests per hour  **NOTE:** Webhook requests do not count towards an account’s quota.  For the most current and accurate rate-limit usage information for a particular request type, check the **`Rate-Limit-Remaining`** and **`Rate-Limit-Limit`** HTTP headers of your API responses.  If you are currently over your limit, our API will return a `429` error, and the response object returned by our API will be empty. We will also include a **`Rate-Limit-Reset`** header in the response, which indicates when you will have additional quota.  ## Client- vs. Yext-assigned IDs You can set the ID for the following objects when you create them. If you do not provide an ID, Yext will generate one for you.  * Account * User * Location * Bio List * Menu List * Product List * Event List * Bio List Item * Menu List Item * Product List Item * Event List Item  ## Logging All API requests are logged. API logs can be found in your Developer Console and are stored for 90 days. 

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
  class UserApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end

    # Users: Create
    # Create a new User
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param user_request 
    # @param [Hash] opts the optional parameters
    # @return [InlineResponse2016]
    def create_user(account_id, v, user_request, opts = {})
      data, _status_code, _headers = create_user_with_http_info(account_id, v, user_request, opts)
      return data
    end

    # Users: Create
    # Create a new User
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param user_request 
    # @param [Hash] opts the optional parameters
    # @return [Array<(InlineResponse2016, Fixnum, Hash)>] InlineResponse2016 data, response status code and response headers
    def create_user_with_http_info(account_id, v, user_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: UserApi.create_user ..."
      end
      # verify the required parameter 'account_id' is set
      fail ArgumentError, "Missing the required parameter 'account_id' when calling UserApi.create_user" if account_id.nil?
      # verify the required parameter 'v' is set
      fail ArgumentError, "Missing the required parameter 'v' when calling UserApi.create_user" if v.nil?
      # verify the required parameter 'user_request' is set
      fail ArgumentError, "Missing the required parameter 'user_request' when calling UserApi.create_user" if user_request.nil?
      # resource path
      local_var_path = "/accounts/{accountId}/users".sub('{format}','json').sub('{' + 'accountId' + '}', account_id.to_s)

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
      post_body = @api_client.object_to_http_body(user_request)
      auth_names = ['api_key']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'InlineResponse2016')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: UserApi#create_user\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Users: Delete
    # Deletes an existing User.
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param user_id 
    # @param user_request 
    # @param [Hash] opts the optional parameters
    # @return [InlineResponse2016]
    def delete_user(account_id, v, user_id, user_request, opts = {})
      data, _status_code, _headers = delete_user_with_http_info(account_id, v, user_id, user_request, opts)
      return data
    end

    # Users: Delete
    # Deletes an existing User.
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param user_id 
    # @param user_request 
    # @param [Hash] opts the optional parameters
    # @return [Array<(InlineResponse2016, Fixnum, Hash)>] InlineResponse2016 data, response status code and response headers
    def delete_user_with_http_info(account_id, v, user_id, user_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: UserApi.delete_user ..."
      end
      # verify the required parameter 'account_id' is set
      fail ArgumentError, "Missing the required parameter 'account_id' when calling UserApi.delete_user" if account_id.nil?
      # verify the required parameter 'v' is set
      fail ArgumentError, "Missing the required parameter 'v' when calling UserApi.delete_user" if v.nil?
      # verify the required parameter 'user_id' is set
      fail ArgumentError, "Missing the required parameter 'user_id' when calling UserApi.delete_user" if user_id.nil?
      # verify the required parameter 'user_request' is set
      fail ArgumentError, "Missing the required parameter 'user_request' when calling UserApi.delete_user" if user_request.nil?
      # resource path
      local_var_path = "/accounts/{accountId}/users/{userId}".sub('{format}','json').sub('{' + 'accountId' + '}', account_id.to_s).sub('{' + 'userId' + '}', user_id.to_s)

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
      post_body = @api_client.object_to_http_body(user_request)
      auth_names = ['api_key']
      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'InlineResponse2016')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: UserApi#delete_user\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Optimization Tasks: Get Link
    # Retrieve a link to perform any pending Optimization Tasks given a set of Optimization Tasks and Locations.
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param task_ids Comma-separated list of Optimization Task IDs corresponding to Optimization Tasks that should be included in the response.  Defaults to all available Optimization Tasks in the account. 
    # @param location_ids Comma-separated list of Location IDs, corresponding to Locations to be evaluated when returning the number of locations eligible &amp; completed for each Optimization Task.  Defaults to all Locations in the account. 
    # @param mode When mode is PENDING_ONLY, the resulting link will only ask the user to complete tasks that are pending or in progress (that have not been completed before).  When mode is ALL_TASKS, the resulting link will ask the user to complete all specified tasks for all specified locations, regardless of whether they have been completed before, are pending, or are in progress. 
    # @param [Hash] opts the optional parameters
    # @return [InlineResponse20015]
    def get_link_optimization_task(account_id, v, task_ids, location_ids, mode, opts = {})
      data, _status_code, _headers = get_link_optimization_task_with_http_info(account_id, v, task_ids, location_ids, mode, opts)
      return data
    end

    # Optimization Tasks: Get Link
    # Retrieve a link to perform any pending Optimization Tasks given a set of Optimization Tasks and Locations.
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param task_ids Comma-separated list of Optimization Task IDs corresponding to Optimization Tasks that should be included in the response.  Defaults to all available Optimization Tasks in the account. 
    # @param location_ids Comma-separated list of Location IDs, corresponding to Locations to be evaluated when returning the number of locations eligible &amp; completed for each Optimization Task.  Defaults to all Locations in the account. 
    # @param mode When mode is PENDING_ONLY, the resulting link will only ask the user to complete tasks that are pending or in progress (that have not been completed before).  When mode is ALL_TASKS, the resulting link will ask the user to complete all specified tasks for all specified locations, regardless of whether they have been completed before, are pending, or are in progress. 
    # @param [Hash] opts the optional parameters
    # @return [Array<(InlineResponse20015, Fixnum, Hash)>] InlineResponse20015 data, response status code and response headers
    def get_link_optimization_task_with_http_info(account_id, v, task_ids, location_ids, mode, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: UserApi.get_link_optimization_task ..."
      end
      # verify the required parameter 'account_id' is set
      fail ArgumentError, "Missing the required parameter 'account_id' when calling UserApi.get_link_optimization_task" if account_id.nil?
      # verify the required parameter 'v' is set
      fail ArgumentError, "Missing the required parameter 'v' when calling UserApi.get_link_optimization_task" if v.nil?
      # verify the required parameter 'task_ids' is set
      fail ArgumentError, "Missing the required parameter 'task_ids' when calling UserApi.get_link_optimization_task" if task_ids.nil?
      # verify the required parameter 'location_ids' is set
      fail ArgumentError, "Missing the required parameter 'location_ids' when calling UserApi.get_link_optimization_task" if location_ids.nil?
      # verify the required parameter 'mode' is set
      fail ArgumentError, "Missing the required parameter 'mode' when calling UserApi.get_link_optimization_task" if mode.nil?
      # verify enum value
      unless ['PENDING_ONLY', 'ALL_TASKS', 'RESET'].include?(mode)
        fail ArgumentError, "invalid value for 'mode', must be one of PENDING_ONLY, ALL_TASKS, RESET"
      end
      # resource path
      local_var_path = "/accounts/{accountId}/optimizationlink".sub('{format}','json').sub('{' + 'accountId' + '}', account_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'v'] = v
      query_params[:'taskIds'] = task_ids
      query_params[:'locationIds'] = location_ids
      query_params[:'mode'] = mode

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
        :return_type => 'InlineResponse20015')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: UserApi#get_link_optimization_task\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Optimization Tasks: List
    # List Optimization Tasks for the account, optionally filtered by task and location.
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param task_ids Comma-separated list of Optimization Task IDs corresponding to Optimization Tasks that should be included in the response.  Defaults to all available Optimization Tasks in the account. 
    # @param location_ids Comma-separated list of Location IDs, corresponding to Locations to be evaluated when returning the number of locations eligible &amp; completed for each Optimization Task.  Defaults to all Locations in the account. 
    # @param [Hash] opts the optional parameters
    # @return [InlineResponse20016]
    def get_optimization_tasks(account_id, v, task_ids, location_ids, opts = {})
      data, _status_code, _headers = get_optimization_tasks_with_http_info(account_id, v, task_ids, location_ids, opts)
      return data
    end

    # Optimization Tasks: List
    # List Optimization Tasks for the account, optionally filtered by task and location.
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param task_ids Comma-separated list of Optimization Task IDs corresponding to Optimization Tasks that should be included in the response.  Defaults to all available Optimization Tasks in the account. 
    # @param location_ids Comma-separated list of Location IDs, corresponding to Locations to be evaluated when returning the number of locations eligible &amp; completed for each Optimization Task.  Defaults to all Locations in the account. 
    # @param [Hash] opts the optional parameters
    # @return [Array<(InlineResponse20016, Fixnum, Hash)>] InlineResponse20016 data, response status code and response headers
    def get_optimization_tasks_with_http_info(account_id, v, task_ids, location_ids, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: UserApi.get_optimization_tasks ..."
      end
      # verify the required parameter 'account_id' is set
      fail ArgumentError, "Missing the required parameter 'account_id' when calling UserApi.get_optimization_tasks" if account_id.nil?
      # verify the required parameter 'v' is set
      fail ArgumentError, "Missing the required parameter 'v' when calling UserApi.get_optimization_tasks" if v.nil?
      # verify the required parameter 'task_ids' is set
      fail ArgumentError, "Missing the required parameter 'task_ids' when calling UserApi.get_optimization_tasks" if task_ids.nil?
      # verify the required parameter 'location_ids' is set
      fail ArgumentError, "Missing the required parameter 'location_ids' when calling UserApi.get_optimization_tasks" if location_ids.nil?
      # resource path
      local_var_path = "/accounts/{accountId}/optimizationtasks".sub('{format}','json').sub('{' + 'accountId' + '}', account_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'v'] = v
      query_params[:'taskIds'] = task_ids
      query_params[:'locationIds'] = location_ids

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
        :return_type => 'InlineResponse20016')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: UserApi#get_optimization_tasks\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Roles: Get
    # Retrieves a list of the roles that users can have within a customer’s account.
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param [Hash] opts the optional parameters
    # @return [InlineResponse20028]
    def get_roles(account_id, v, opts = {})
      data, _status_code, _headers = get_roles_with_http_info(account_id, v, opts)
      return data
    end

    # Roles: Get
    # Retrieves a list of the roles that users can have within a customer’s account.
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param [Hash] opts the optional parameters
    # @return [Array<(InlineResponse20028, Fixnum, Hash)>] InlineResponse20028 data, response status code and response headers
    def get_roles_with_http_info(account_id, v, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: UserApi.get_roles ..."
      end
      # verify the required parameter 'account_id' is set
      fail ArgumentError, "Missing the required parameter 'account_id' when calling UserApi.get_roles" if account_id.nil?
      # verify the required parameter 'v' is set
      fail ArgumentError, "Missing the required parameter 'v' when calling UserApi.get_roles" if v.nil?
      # resource path
      local_var_path = "/accounts/{accountId}/roles".sub('{format}','json').sub('{' + 'accountId' + '}', account_id.to_s)

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
        :return_type => 'InlineResponse20028')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: UserApi#get_roles\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Users: Get
    # Retrieves details of a specific User.
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param user_id 
    # @param [Hash] opts the optional parameters
    # @return [InlineResponse2016]
    def get_user(account_id, v, user_id, opts = {})
      data, _status_code, _headers = get_user_with_http_info(account_id, v, user_id, opts)
      return data
    end

    # Users: Get
    # Retrieves details of a specific User.
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param user_id 
    # @param [Hash] opts the optional parameters
    # @return [Array<(InlineResponse2016, Fixnum, Hash)>] InlineResponse2016 data, response status code and response headers
    def get_user_with_http_info(account_id, v, user_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: UserApi.get_user ..."
      end
      # verify the required parameter 'account_id' is set
      fail ArgumentError, "Missing the required parameter 'account_id' when calling UserApi.get_user" if account_id.nil?
      # verify the required parameter 'v' is set
      fail ArgumentError, "Missing the required parameter 'v' when calling UserApi.get_user" if v.nil?
      # verify the required parameter 'user_id' is set
      fail ArgumentError, "Missing the required parameter 'user_id' when calling UserApi.get_user" if user_id.nil?
      # resource path
      local_var_path = "/accounts/{accountId}/users/{userId}".sub('{format}','json').sub('{' + 'accountId' + '}', account_id.to_s).sub('{' + 'userId' + '}', user_id.to_s)

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
        :return_type => 'InlineResponse2016')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: UserApi#get_user\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Users: List
    # Lists all Users in an account.
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :limit Number of results to return (default to 10)
    # @option opts [Integer] :offset Number of results to skip. Used to page through results (default to 0)
    # @return [InlineResponse20029]
    def get_users(account_id, v, opts = {})
      data, _status_code, _headers = get_users_with_http_info(account_id, v, opts)
      return data
    end

    # Users: List
    # Lists all Users in an account.
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :limit Number of results to return
    # @option opts [Integer] :offset Number of results to skip. Used to page through results
    # @return [Array<(InlineResponse20029, Fixnum, Hash)>] InlineResponse20029 data, response status code and response headers
    def get_users_with_http_info(account_id, v, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: UserApi.get_users ..."
      end
      # verify the required parameter 'account_id' is set
      fail ArgumentError, "Missing the required parameter 'account_id' when calling UserApi.get_users" if account_id.nil?
      # verify the required parameter 'v' is set
      fail ArgumentError, "Missing the required parameter 'v' when calling UserApi.get_users" if v.nil?
      if !opts[:'limit'].nil? && opts[:'limit'] > 50.0
        fail ArgumentError, 'invalid value for "opts[:"limit"]" when calling UserApi.get_users, must be smaller than or equal to 50.0.'
      end

      # resource path
      local_var_path = "/accounts/{accountId}/users".sub('{format}','json').sub('{' + 'accountId' + '}', account_id.to_s)

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
        :return_type => 'InlineResponse20029')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: UserApi#get_users\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Users: Update
    # Updates an existing User.
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param user_id 
    # @param user_request 
    # @param [Hash] opts the optional parameters
    # @return [InlineResponse2016]
    def update_user(account_id, v, user_id, user_request, opts = {})
      data, _status_code, _headers = update_user_with_http_info(account_id, v, user_id, user_request, opts)
      return data
    end

    # Users: Update
    # Updates an existing User.
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format
    # @param user_id 
    # @param user_request 
    # @param [Hash] opts the optional parameters
    # @return [Array<(InlineResponse2016, Fixnum, Hash)>] InlineResponse2016 data, response status code and response headers
    def update_user_with_http_info(account_id, v, user_id, user_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: UserApi.update_user ..."
      end
      # verify the required parameter 'account_id' is set
      fail ArgumentError, "Missing the required parameter 'account_id' when calling UserApi.update_user" if account_id.nil?
      # verify the required parameter 'v' is set
      fail ArgumentError, "Missing the required parameter 'v' when calling UserApi.update_user" if v.nil?
      # verify the required parameter 'user_id' is set
      fail ArgumentError, "Missing the required parameter 'user_id' when calling UserApi.update_user" if user_id.nil?
      # verify the required parameter 'user_request' is set
      fail ArgumentError, "Missing the required parameter 'user_request' when calling UserApi.update_user" if user_request.nil?
      # resource path
      local_var_path = "/accounts/{accountId}/users/{userId}".sub('{format}','json').sub('{' + 'accountId' + '}', account_id.to_s).sub('{' + 'userId' + '}', user_id.to_s)

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
      post_body = @api_client.object_to_http_body(user_request)
      auth_names = ['api_key']
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'InlineResponse2016')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: UserApi#update_user\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
