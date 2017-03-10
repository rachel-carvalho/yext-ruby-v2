# YextClient::CreateReviewInvitationResponse

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**first_name** | **String** | The consumer’s first name | [optional] 
**last_name** | **String** | The consumer’s last name | [optional] 
**image** | **BOOLEAN** | Only valid if “contact” is a phone number  If true, include a brand image with the phone number - otherwise nothing  | [optional] 
**contact** | **String** | The email address or phone number of the consumer.  Phone numbers should be formatted in one of the following ways: * E.164 standard international format, with a leading \&quot;+\&quot; * National format, according to the country of the corresponding location  | [optional] 
**location_id** | **String** | ID of the location that will be reviewed | [optional] 
**template_id** | **String** | If specified, the ID of the template used to format the email.  If not specified, the location’s default email template is used.  If the location has no default template, the account’s default template is used.  | [optional] 
**status** | **String** |  | [optional] 
**details** | **String** | If status is REJECTED, describes why the invitation could not be processed. | [optional] 


