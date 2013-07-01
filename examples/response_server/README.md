### Response Server example

If your app is connected to an API key that grants you response notification (callback/postback) permissions, you may set a postback URL in your app settings.  This will have the effect of causing the Active911 servers to call your URL every time a new alert is generated.

When your URL is called, you may optionally set extra data that will be stored with the alert and shown to the user.

In this example, a simple PHP script performs the function of postback server.  It adds an extra button to the iPhone app in the "External Links" section, linking to the "Nine Classes of Hazardous Materials" visor card at the US Department of Transportation.