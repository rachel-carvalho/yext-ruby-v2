=begin
#Yext API

# 

OpenAPI spec version: 2.0

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
    # @param v A date in &#x60;YYYYMMDD&#x60; format.
    # @param create_user_request 
    # @param [Hash] opts the optional parameters
    # @return [IdResponse]
    def create_user(account_id, v, create_user_request, opts = {})
      data, _status_code, _headers = create_user_with_http_info(account_id, v, create_user_request, opts)
      return data
    end

    # Users: Create
    # Create a new User
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format.
    # @param create_user_request 
    # @param [Hash] opts the optional parameters
    # @return [Array<(IdResponse, Fixnum, Hash)>] IdResponse data, response status code and response headers
    def create_user_with_http_info(account_id, v, create_user_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: UserApi.create_user ..."
      end
      # verify the required parameter 'account_id' is set
      fail ArgumentError, "Missing the required parameter 'account_id' when calling UserApi.create_user" if account_id.nil?
      # verify the required parameter 'v' is set
      fail ArgumentError, "Missing the required parameter 'v' when calling UserApi.create_user" if v.nil?
      # verify the required parameter 'create_user_request' is set
      fail ArgumentError, "Missing the required parameter 'create_user_request' when calling UserApi.create_user" if create_user_request.nil?
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
      post_body = @api_client.object_to_http_body(create_user_request)
      auth_names = ['api_key']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'IdResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: UserApi#create_user\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Users: Delete
    # Deletes an existing User.
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format.
    # @param user_id 
    # @param [Hash] opts the optional parameters
    # @return [ErrorResponse]
    def delete_user(account_id, v, user_id, opts = {})
      data, _status_code, _headers = delete_user_with_http_info(account_id, v, user_id, opts)
      return data
    end

    # Users: Delete
    # Deletes an existing User.
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format.
    # @param user_id 
    # @param [Hash] opts the optional parameters
    # @return [Array<(ErrorResponse, Fixnum, Hash)>] ErrorResponse data, response status code and response headers
    def delete_user_with_http_info(account_id, v, user_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: UserApi.delete_user ..."
      end
      # verify the required parameter 'account_id' is set
      fail ArgumentError, "Missing the required parameter 'account_id' when calling UserApi.delete_user" if account_id.nil?
      # verify the required parameter 'v' is set
      fail ArgumentError, "Missing the required parameter 'v' when calling UserApi.delete_user" if v.nil?
      # verify the required parameter 'user_id' is set
      fail ArgumentError, "Missing the required parameter 'user_id' when calling UserApi.delete_user" if user_id.nil?
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
      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'ErrorResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: UserApi#delete_user\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Roles: Get
    # Retrieves a list of the roles that users can have within a customer’s account.
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format.
    # @param [Hash] opts the optional parameters
    # @return [RolesResponse]
    def get_roles(account_id, v, opts = {})
      data, _status_code, _headers = get_roles_with_http_info(account_id, v, opts)
      return data
    end

    # Roles: Get
    # Retrieves a list of the roles that users can have within a customer’s account.
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format.
    # @param [Hash] opts the optional parameters
    # @return [Array<(RolesResponse, Fixnum, Hash)>] RolesResponse data, response status code and response headers
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
        :return_type => 'RolesResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: UserApi#get_roles\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Users: Get
    # Retrieves details of a specific User.
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format.
    # @param user_id 
    # @param [Hash] opts the optional parameters
    # @return [UserResponse]
    def get_user(account_id, v, user_id, opts = {})
      data, _status_code, _headers = get_user_with_http_info(account_id, v, user_id, opts)
      return data
    end

    # Users: Get
    # Retrieves details of a specific User.
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format.
    # @param user_id 
    # @param [Hash] opts the optional parameters
    # @return [Array<(UserResponse, Fixnum, Hash)>] UserResponse data, response status code and response headers
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
        :return_type => 'UserResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: UserApi#get_user\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Users: List
    # Lists all Users in an account.
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format.
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :limit Number of results to return. (default to 10)
    # @option opts [Integer] :offset Number of results to return. (default to 0)
    # @return [UsersResponse]
    def get_users(account_id, v, opts = {})
      data, _status_code, _headers = get_users_with_http_info(account_id, v, opts)
      return data
    end

    # Users: List
    # Lists all Users in an account.
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format.
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :limit Number of results to return.
    # @option opts [Integer] :offset Number of results to return.
    # @return [Array<(UsersResponse, Fixnum, Hash)>] UsersResponse data, response status code and response headers
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
        :return_type => 'UsersResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: UserApi#get_users\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Users: Update
    # Updates an existing User.
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format.
    # @param user_id 
    # @param update_user_request 
    # @param [Hash] opts the optional parameters
    # @return [IdResponse]
    def update_user(account_id, v, user_id, update_user_request, opts = {})
      data, _status_code, _headers = update_user_with_http_info(account_id, v, user_id, update_user_request, opts)
      return data
    end

    # Users: Update
    # Updates an existing User.
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format.
    # @param user_id 
    # @param update_user_request 
    # @param [Hash] opts the optional parameters
    # @return [Array<(IdResponse, Fixnum, Hash)>] IdResponse data, response status code and response headers
    def update_user_with_http_info(account_id, v, user_id, update_user_request, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: UserApi.update_user ..."
      end
      # verify the required parameter 'account_id' is set
      fail ArgumentError, "Missing the required parameter 'account_id' when calling UserApi.update_user" if account_id.nil?
      # verify the required parameter 'v' is set
      fail ArgumentError, "Missing the required parameter 'v' when calling UserApi.update_user" if v.nil?
      # verify the required parameter 'user_id' is set
      fail ArgumentError, "Missing the required parameter 'user_id' when calling UserApi.update_user" if user_id.nil?
      # verify the required parameter 'update_user_request' is set
      fail ArgumentError, "Missing the required parameter 'update_user_request' when calling UserApi.update_user" if update_user_request.nil?
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
      post_body = @api_client.object_to_http_body(update_user_request)
      auth_names = ['api_key']
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'IdResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: UserApi#update_user\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Users: Update Password
    # Updates a User's password.
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format.
    # @param user_id 
    # @param [Hash] opts the optional parameters
    # @option opts [UpdatePasswordRequest] :update_password_request 
    # @return [ErrorResponse]
    def update_user_password(account_id, v, user_id, opts = {})
      data, _status_code, _headers = update_user_password_with_http_info(account_id, v, user_id, opts)
      return data
    end

    # Users: Update Password
    # Updates a User&#39;s password.
    # @param account_id 
    # @param v A date in &#x60;YYYYMMDD&#x60; format.
    # @param user_id 
    # @param [Hash] opts the optional parameters
    # @option opts [UpdatePasswordRequest] :update_password_request 
    # @return [Array<(ErrorResponse, Fixnum, Hash)>] ErrorResponse data, response status code and response headers
    def update_user_password_with_http_info(account_id, v, user_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: UserApi.update_user_password ..."
      end
      # verify the required parameter 'account_id' is set
      fail ArgumentError, "Missing the required parameter 'account_id' when calling UserApi.update_user_password" if account_id.nil?
      # verify the required parameter 'v' is set
      fail ArgumentError, "Missing the required parameter 'v' when calling UserApi.update_user_password" if v.nil?
      # verify the required parameter 'user_id' is set
      fail ArgumentError, "Missing the required parameter 'user_id' when calling UserApi.update_user_password" if user_id.nil?
      # resource path
      local_var_path = "/accounts/{accountId}/users/{userId}/password".sub('{format}','json').sub('{' + 'accountId' + '}', account_id.to_s).sub('{' + 'userId' + '}', user_id.to_s)

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
      post_body = @api_client.object_to_http_body(opts[:'update_password_request'])
      auth_names = ['api_key']
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'ErrorResponse')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: UserApi#update_user_password\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
