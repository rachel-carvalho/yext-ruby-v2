# YextClient::CreateUserRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**username** | **String** | User&#39;s username. | [optional] 
**first_name** | **String** | User&#39;s first name. | [optional] 
**last_name** | **String** | User&#39;s last name. | [optional] 
**acl** | [**Array&lt;UserAcl&gt;**](UserAcl.md) |  | [optional] 
**sso** | **BOOLEAN** | Indicates whether SSO has been enabled for this user.  Defaults to false.  | [optional] 
**phone_number** | **String** | User&#39;s phone number. | [optional] 
**email_address** | **String** | User&#39;s email address. | [optional] 
**id** | **String** | ID of this User.  Ignored when sent in update requests.  | [optional] 
**password** | **String** | User&#39;s password. | [optional] 


