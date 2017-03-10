# YextClient::CustomField

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**options** | [**Array&lt;CustomOption&gt;**](CustomOption.md) | Present if and only if &#x60;type&#x60; is &#x60;SINGLE_OPTION&#x60; or &#x60;MULTI_OPTION&#x60;.  List of options (key/value pairs) for the Custom Field.  Example: {   {      \&quot;key\&quot;: \&quot;2413\&quot;,     \&quot;value\&quot;: \&quot;Temporarily Closed\&quot;   },   {     \&quot;key\&quot;: \&quot;2414\&quot;,     \&quot;value\&quot;: \&quot;Coming Soon\&quot;   },   {     \&quot;key\&quot;: \&quot;2415\&quot;,     \&quot;value\&quot;: \&quot;Closed\&quot;   },   {     \&quot;key\&quot;: \&quot;2416\&quot;,     \&quot;value\&quot;: \&quot;Open\&quot;   } }  | [optional] 
**type** | **String** | The data type of the Custom Field&#39;s contents. | [optional] 
**id** | **String** | The Custom Field ID. | [optional] 
**name** | **String** | The Custom Field&#39;s name. | [optional] 


