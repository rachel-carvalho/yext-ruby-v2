# YextClient::User

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**username** | **String** | User’s username. | [optional] 
**first_name** | **String** | User’s first name. | [optional] 
**last_name** | **String** | User’s last name. | [optional] 
**acl** | [**Array&lt;UserAcl&gt;**](UserAcl.md) |  | [optional] 
**sso** | **BOOLEAN** | Indicates whether SSO has been enabled for this user.  Defaults to false.  | [optional] 
**phone_number** | **String** | User’s phone number. | [optional] 
**email_address** | **String** | User’s email address. | [optional] 
**password** | **String** | User’s password.  Only used when creating a new user (never returned in an API response). | [optional] 
**id** | **String** | ID of this User.  Ignored when sent in update requests.  | [optional] 


