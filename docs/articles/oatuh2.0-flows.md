# **Single Sign-On - OAuth 2.0 flows**

## **Introduction**

OAuth 2.0 defines several authorization flows, also known as `grant types`, to enable different use cases for securing access to resources. The choice of which OAuth 2.0 flow to use depends on the specific requirements and characteristics of the client application and the desired level of security. Here are the main OAuth 2.0 flows:

In this article, I will explain the four distinct OAuth 2.0 grant types, providing a detailed exploration complete with sequence diagrams and interactive examples.  we'll also look into the interactions between the various entities involved and understanding of each grant type in details. 

## **Authorization Code Flow (Authorization Code Grant)**

   - **Use Case:** Suitable for web applications running on a server.
   - **Flow:**
     1. The client redirects the user to the authorization server's authorization endpoint.
     2. The user authenticates and approves the requested permissions.
     3. The authorization server issues an authorization code and redirects the user back to the client with the code.
     4. The client exchanges the authorization code for an access token and, optionally, a refresh token by making a direct request to the authorization server's token endpoint.

Here's a sequence diagram for the Authorization Code Flow:

This sequence diagram illustrates the interactions between the client, user, authorization server, and resource server in the Authorization Code Flow. The numbers represent the sequential order of the steps.


```mermaid
sequenceDiagram
  participant Client
  participant User
  participant AuthorizationServer
  participant ResourceServer

  Client->>AuthorizationServer: 1. Initiate Authorization Request
  AuthorizationServer-->>User: 2. Present Login Screen
  User->>AuthorizationServer: 3. Enter Credentials
  AuthorizationServer-->>User: 4. Consent Screen
  User->>AuthorizationServer: 5. Grant Permissions
  AuthorizationServer-->>Client: 6. Redirect with Authorization Code
  Client->>AuthorizationServer: 7. Exchange Authorization Code for Tokens
  AuthorizationServer-->>Client: 8. Access Token, Refresh Token
  Client->>ResourceServer: 9. Access Protected Resource
  ResourceServer-->>Client: 10. Return Protected Resource
```

Explanation of the steps:

1. **Initiate Authorization Request (Client to Authorization Server):** The client initiates the authorization process by redirecting the user to the authorization server's authorization endpoint.

2. **Present Login Screen (Authorization Server to User):** The authorization server presents a login screen to the user to enter their credentials.

3. **Enter Credentials (User to Authorization Server):** The user enters their credentials.

4. **Consent Screen (Authorization Server to User):** If necessary, the authorization server presents a consent screen to the user to grant permissions to the client.

5. **Grant Permissions (User to Authorization Server):** The user grants the requested permissions.

6. **Redirect with Authorization Code (Authorization Server to Client):** The authorization server redirects the user back to the client with an authorization code.

7. **Exchange Authorization Code for Tokens (Client to Authorization Server):** The client exchanges the received authorization code for an access token and, optionally, a refresh token.

8. **Access Token, Refresh Token (Authorization Server to Client):** The authorization server responds with the access token and refresh token.

9. **Access Protected Resource (Client to Resource Server):** The client uses the access token to request access to a protected resource.

10. **Return Protected Resource (Resource Server to Client):** The resource server returns the requested protected resource.
<!-- 
**sequence diagram example:** 

[![Alt text](images/image-3.1.png)](images/image-3.1.png){:target="_blank"} -->

## **Implicit Flow (Implicit Grant)**

   - **Use Case:** Designed for user-agent-based clients (e.g., single-page applications) that cannot keep a client secret confidential.
   - **Flow:**
     1. The client redirects the user to the authorization server's authorization endpoint.
     2. The user authenticates and approves the requested permissions.
     3. The authorization server issues an access token directly in the redirect URI fragment.

Here's a sequence diagram for the Implicit Flow:

This sequence diagram illustrates the interactions between the client, user, authorization server, and resource server in the Implicit Flow. The numbers represent the sequential order of the steps.

!!! note
    Note that in the Implicit Flow, the access token is returned directly to the client in the URL fragment.


```mermaid
sequenceDiagram
  participant Client
  participant User
  participant AuthorizationServer
  participant ResourceServer

  Client->>AuthorizationServer: 1. Initiate Authorization Request
  AuthorizationServer-->>User: 2. Present Login Screen
  User->>AuthorizationServer: 3. Enter Credentials
  AuthorizationServer-->>User: 4. Consent Screen
  User->>AuthorizationServer: 5. Grant Permissions
  AuthorizationServer-->>Client: 6. Redirect with Access Token (in URL fragment)
  Client->>ResourceServer: 7. Access Protected Resource
  ResourceServer-->>Client: 8. Return Protected Resource
```

Explanation of the steps:

1. **Initiate Authorization Request (Client to Authorization Server):** The client initiates the authorization process by redirecting the user to the authorization server's authorization endpoint.

2. **Present Login Screen (Authorization Server to User):** The authorization server presents a login screen to the user to enter their credentials.

3. **Enter Credentials (User to Authorization Server):** The user enters their credentials.

4. **Consent Screen (Authorization Server to User):** If necessary, the authorization server presents a consent screen to the user to grant permissions to the client.

5. **Grant Permissions (User to Authorization Server):** The user grants the requested permissions.

6. **Redirect with Access Token (in URL fragment) (Authorization Server to Client):** The authorization server redirects the user back to the client with an access token directly included in the URL fragment.

7. **Access Protected Resource (Client to Resource Server):** The client uses the access token to request access to a protected resource.

8. **Return Protected Resource (Resource Server to Client):** The resource server returns the requested protected resource.

Here is the simplified example of sending an OpenID Connect authentication request to an Active Directory Federation Services (AD FS) endpoint and obtaining both the `id_token` and `access token`.

**OpenID Connect Authentication Request:**

Assuming your AD FS server is hosted at `https://adfs.example.com` and your client application is registered with the client ID `your-client-id`.

The OpenID Connect authentication request might look like this:

```http
GET https://adfs.example.com/adfs/oauth2/authorize
    ?response_type=id_token token
    &client_id=your-client-id
    &redirect_uri=https://your-app-callback-url.com
    &scope=openid
    &nonce=your-nonce-value
    &response_mode=fragment
    &state=your-state-value
```

Explanation of parameters:

- `response_type=id_token token`: Request both an ID token and an access token.
- `client_id`: The client identifier registered with AD FS.
- `redirect_uri`: The callback URL where AD FS will redirect the user after authentication.
- `scope=openid`: Request OpenID Connect authentication.
- `nonce`: A unique value to mitigate replay attacks.
- `response_mode=form_post`: The response is sent as a form post.
- `state`: A value used to maintain state between the request and the callback.

response_mode=`fragment` or `form_post`

- `response_mode=fragment`: Specify that the response should be included in the URL fragment.

**OpenID Connect Authentication Response:**

Assuming a successful authentication, AD FS will redirect the user back to your specified `redirect_uri` with the tokens. The response might look like this:

```http
POST https://your-app-callback-url.com
Content-Type: application/x-www-form-urlencoded

id_token=eyJhbGciOiJSUzI1NiIsImtpZCI6IjIwMTYtMDYtMjNUMTY6MDY6MDMuMjA1In0.eyJzdWIiOiIxMDAxMjM0NTY3ODkwMTIzNDU2Nzg5MDEyMzQ1Njc4OTAxMjMiLCJhdWQiOiJodHRwczovL2V4YW1wbGUuY29tIiwibm9uY2UiOiJ5b3VyLW5vbmNlLXZhbHVlIiwiaXNzIjoiaHR0cHM6Ly9hZGZzLmV4YW1wbGUuY29tIiwiaWF0IjoxNjA5OTY1NTk3LCJleHAiOjE2MDk5NjU5OTcsImF0X2hhc2giOiJiZHNEdHBJZzRGSWtIOWw5elVZOWlnIiwic2lkIjoiYmNkS2JzWlVzQzZTUGwyazd6cTZsQT09In0.yu0uIwXVCMvZaLOdNbPiPbdgI90r-IA0Iy-l6QhH1ZyDrxP9dQAn6qGmBHXJrO15sZb3asHsqj6f3_7pVl7DFDDZXzHKFEHLJfR0deZ0OHoNlgUklrxr7tmqqTw07EYsOa_9CIsZD9id0PCTDAm0ZIyakO9BCL44O0UyvjNlHtMvXV8W4N24vQGEGjw0Cx2Nm7c__HZxS_5H0rUJL2FXFjjXgDrNhEFGjGziGjbOXwxzWc_W2AM-g-buQsN8wHw5kv8vh7mjPXYkAlKJWAKHHek5XlQDljJbWz7R1w5CfQ5MQ7CzrqX62NfeXeWZsGMKdfnAVQLkkMaOqA

&access_token=eyJhbGciOiJSUzI1NiIsImtpZCI6IjIwMTYtMDYtMjNUMTY6MDY6MDMuMjA1In0.eyJleHAiOjE2MDk5NjYxOTcsImF1ZCI6Imh0dHBzOi8vZXhhbXBsZS5jb20iLCJpc3MiOiJodHRwczovL2FkZnMuZXhhbXBsZS5jb20iLCJzdWIiOiIxMDAxMjM0NTY3ODkwMTIzNDU2Nzg5MDEyMzQ1Njc4OTAxMjMiLCJhdWQiOiJodHRwczovL2V4YW1wbGUuY29tIiwianRpIjoiNjQyMjZkM2EtN2YyNi00ZjMxLWEzMDktZDM0Y2MxNzJhNTlkIiwiaWF0IjoxNjA5OTY1NTk3fQ.DGtIlQkyqmq6ZR0bF61F5qGvBX3XXayRvdx5tQQziP-t4_1f0Y6Vl5bkYuf6hI3PYINxlWs5cM1bhecvqSo-gegqHvz7EJzj7-03YSo-01KuTLm9VyISgo6XstGLyDOFhBr7v1agx2pM7OAz8AER8sI1AmJJ1-fE0P1o7j-jd-v1cD7I8KckACin64S8b8arIjiLiluZbj3TNg1YJf7Xa5nb5oQ96VCzw7BYBwtP9bu0l5YyQ4ILVsj_yw8OxFf0KXdLpF97QvaR-Iu3IwYXZ2sSZFzRUbxjoCJqkQzvldIBK7pFlHkTTrjZLgGhZS5WuR5kZm57pSbpmrOqCtHA
```

Explanation of parameters:

- `id_token`: The ID token containing user information.
- `access_token`: The access token used to access protected resources.

!!!note
    The actual endpoints and parameters may vary based on your AD FS configuration and the OpenID Connect implementation.
<!-- 
**sequence diagram example:** 

[![Alt text](images/image-4.1.png)](images/image-4.1.png){:target="_blank"} -->

## **Resource Owner Password Credentials Flow**

   - **Use Case:** Suitable for trusted clients that can directly request and obtain the user's credentials.
   - **Flow:**
     1. The client directly requests the user's credentials (e.g., username and password).
     2. The client uses the user's credentials to request an access token directly from the authorization server.

Here's a sequence diagram for the Resource Owner Password Credentials Flow:

This sequence diagram illustrates the interactions between the client, authorization server, and resource server in the Resource Owner Password Credentials Flow. 

!!!note
    It's important to note that this flow involves the client collecting and transmitting the user's credentials, so it should only be used by highly trusted clients, and it's generally not recommended for public or untrusted clients.


```mermaid
sequenceDiagram
  participant Client
  participant AuthorizationServer
  participant ResourceServer

  Client->>AuthorizationServer: 1. Request Access Token
  AuthorizationServer-->>Client: 2. Request User Credentials
  Client->>AuthorizationServer: 3. User Credentials
  AuthorizationServer-->>Client: 4. Access Token, Refresh Token
  Client->>ResourceServer: 5. Access Protected Resource
  ResourceServer-->>Client: 6. Return Protected Resource
```

Explanation of the steps:

1. **Request Access Token (Client to Authorization Server):** The client requests an access token directly from the authorization server by providing its client credentials and the resource owner's (user's) credentials.

2. **Request User Credentials (Authorization Server to Client):** The authorization server requests the user credentials (username and password) from the client.

3. **User Credentials (Client to Authorization Server):** The client provides the user credentials (username and password) to the authorization server.

4. **Access Token, Refresh Token (Authorization Server to Client):** Upon successful authentication, the authorization server responds with an access token and, optionally, a refresh token.

5. **Access Protected Resource (Client to Resource Server):** The client uses the access token to request access to a protected resource.

6. **Return Protected Resource (Resource Server to Client):** The resource server returns the requested protected resource.
<!-- 
**sequence diagram example:** 

[![Alt text](images/image-5.1.png)](images/image-5.1.png){:target="_blank"} -->

## **Client Credentials Flow**

   - **Use Case:** Used when the client is the resource owner and wants to access its own resources.
   - **Flow:**
     1. The client directly requests an access token from the authorization server using its own credentials.

Here's a sequence diagram for the Client Credentials Flow:

This sequence diagram illustrates the interactions between the client, authorization server, and resource server in the Client Credentials Flow. The Client Credentials Flow is used when the client is the resource owner and wants to access its own resources. It does not involve user authentication, making it suitable for machine-to-machine communication where the client is acting on its own behalf.


```mermaid
sequenceDiagram
  participant Client
  participant AuthorizationServer
  participant ResourceServer

  Client->>AuthorizationServer: 1. Request Access Token
  AuthorizationServer-->>Client: 2. Respond with Access Token
  Client->>ResourceServer: 3. Access Protected Resource
  ResourceServer-->>Client: 4. Return Protected Resource
```

Explanation of the steps:

1. **Request Access Token (Client to Authorization Server):** The client directly requests an access token from the authorization server by providing its client credentials (client ID and client secret).

2. **Respond with Access Token (Authorization Server to Client):** The authorization server responds with an access token.

3. **Access Protected Resource (Client to Resource Server):** The client uses the obtained access token to request access to a protected resource.

4. **Return Protected Resource (Resource Server to Client):** The resource server returns the requested protected resource.
<!-- 
**sequence diagram example:** 

[![Alt text](images/image-6.1.png)](images/image-6.1.png){:target="_blank"} -->

## **Conclusion**

 OAuth 2.0 plays a crucial role in enabling Single Sign-On and secure authorization across various applications and services. The choice of the appropriate flow depends on the specific requirements of the client application, the level of security needed, and the characteristics of the user interaction. Continuous attention to security best practices is essential for maintaining a robust and trustworthy authentication and authorization system.

## **References**

- [AD FS OpenID Connect/OAuth flows and Application Scenarios](https://learn.microsoft.com/en-us/windows-server/identity/ad-fs/overview/ad-fs-openid-connect-oauth-flows-scenarios)
- [OAuth 2.0 Specification](https://tools.ietf.org/html/rfc6749)
- [OpenID Connect Specifications](https://openid.net/specs/openid-connect-core-1_0.html)
- [Security Assertion Markup Language (SAML)](https://www.oasis-open.org/standards#samlv2.0)
- [Mermaidv10.6.1 Live Editor](https://mermaid.live/edit#)
- 