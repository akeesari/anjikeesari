# Single Sign-On - Introduction

## Introduction


If you're involved in implementing Single Sign-On (SSO) in your project, it's crucial to understand the fundamental concepts that will help you to implement the authentication mechanism. 

In this article, we'll explain the foundational elements of Single Sign-On. By looking into these core concepts, you'll gain a clear understanding that will help to implement Single Sign-On in your own application.

Whether you're new to SSO or seeking a refresher, this exploration will help you with the essential knowledge needed to review the complexities of Single Sign-On and make informed decisions during the implementation process. 


## What is Single Sign-On?

`Single Sign-On (SSO)` is a user authentication process that enables a user to access multiple applications with a single set of login credentials. Instead of requiring users to remember separate usernames and passwords for each application, SSO streamlines the login process by authenticating the user once and granting access to multiple services.

## Waht are the benefits of SSO?

Single Sign-On (SSO) offers several benefits for both users and organizations. Here are some key advantages of implementing SSO:

- **Enhanced User Experience:** Users only need to remember and enter one set of credentials to access multiple applications and services, leading to a smoother and more efficient user experience.

- **Time and Productivity Savings:** SSO reduces the need for users to repeatedly log in, saving time and minimizing disruptions to workflow. This can result in increased productivity across an organization.

- **Minimized Password Reset Requests:** With fewer passwords to manage, organizations typically experience a decrease in password-related support requests and help desk calls, leading to cost savings.

- **Centralized Access Management:** SSO allows for centralized control and management of user access. Changes in user permissions or account status can be applied uniformly across all connected applications.

- **Enhanced Security:** SSO can enhance security by enforcing consistent authentication policies. Users are less likely to resort to insecure practices, such as writing down passwords, when dealing with multiple credentials.

## How Single Sign-On works?

Single Sign-On (SSO) works by allowing users to authenticate once and gain access to multiple applications or services without the need to re-enter credentials for each one. The fundamental idea is to streamline the authentication process and provide a seamless user experience across various systems. Here's a high-level overview of how SSO works:

1. **User Attempts to Access a Service:** 
    - When a user attempts to access an application or service that is part of the SSO system, they are redirected to the SSO system for authentication.

2. **SSO Authentication Request:**
    - The SSO system initiates an authentication request, prompting the user to provide their credentials (username and password) or use alternative authentication methods like multi-factor authentication (MFA).

3. **User Authentication:**
    - The user enters their credentials or completes the required authentication steps. The SSO system verifies the user's identity.

4. **Issuance of Authentication Token:**
    - Upon successful authentication, the SSO system issues an authentication token. This token serves as proof of the user's identity and is often in the form of a secure token like a JSON Web Token (JWT).

5. **Token Exchange (Optional):**
    - In some cases, depending on the SSO protocol used (such as OAuth 2.0 or SAML), the authentication token may be exchanged for an access token or a service-specific token.

6. **SSO Session Management:**
    - The SSO system manages the user's session, keeping track of the user's authenticated state. This session information is used to facilitate access to other services without additional authentication.

7. **User Accesses Another Service:**
    - If the user decides to access another application or service within the SSO environment, the SSO system recognizes the user's existing session and provides access without requesting credentials again.

8. **Logout Handling (Optional):**
    - When the user logs out, the SSO system can handle the logout process by terminating the user's session across all connected services. This ensures a complete logout experience.

9. **Token Expiry and Refresh (Optional):**
    - Authentication tokens may have a limited validity period. If needed, the SSO system can handle token expiration by either requiring re-authentication or using mechanisms like token refresh to obtain a new token without requiring the user's credentials.


## What are the different types of SSO?

Single Sign-On (SSO) comes in various types, depends on different use cases. Here are some common types of SSO:

- **Enterprise SSO:** Primarily used within an organization, Enterprise SSO allows users to access various internal systems and applications using a single set of credentials. It enhances security and simplifies user management for IT administrators.

- **Web SSO:** Web SSO extends the SSO concept to web applications. Users can log in once to access multiple web services, making it prevalent in online platforms, social media, and cloud-based applications.

- **Federated SSO:** Federated SSO enables users to access resources across multiple organizations or domains. It relies on trust relationships between identity providers, allowing for seamless authentication in a distributed environment.

## Popular SSO Protocols

Several popular Single Sign-On (SSO) protocols are widely used to implement SSO across various applications and services. Here are some of the most common SSO protocols:

- **OAuth 2.0:**
OAuth 2.0 is a widely adopted authorization framework that allows a user to grant a third-party application limited access to their resources without exposing their credentials. While OAuth 2.0 itself is not an authentication protocol, it is often used in conjunction with OpenID Connect to achieve both authentication and authorization in an SSO scenario.

- **OpenID Connect:**
OpenID Connect is an identity layer built on top of OAuth 2.0. It extends OAuth 2.0 to provide a standardized way for clients to request and receive identity information about users. OpenID Connect is specifically designed for authentication and is commonly used for SSO.

- **SAML (Security Assertion Markup Language):**
SAML is an XML-based standard for exchanging authentication and authorization data between parties, particularly in a web browser environment. It allows for the secure transfer of user identity information between an identity provider (IdP) and a service provider (SP), facilitating SSO.


## Roles of Single Sign-On

The Single Sign-On (SSO) process involves several roles or components working together in a coordinated fashion to provide a secure, seamless, and efficient Single Sign-On experience for users across multiple applications and services. The main roles or components include:


**User (Resource Owner):**

- **Role:** The end-user or resource owner is the individual seeking access to various applications and services without the need for multiple logins.
- **Interaction:** Initiates the authentication process by attempting to access a resource or application.

**Identity Provider (IdP):**

- **Role:** The Identity Provider is responsible for authenticating the user and asserting their identity to other applications or services.
- **Interaction:** Verifies user credentials and issues authentication tokens (such as SAML assertions or JWTs) to signify a successful authentication.

**Service Provider (SP) / Resource Server::**

- **Role:** The Service Provider is the application or service that the user wants to access. It relies on the Identity Provider's assertion to grant access to the user.
- **Interaction:** Receives the authentication token from the user and validates it with the Identity Provider to authorize access.

**Authorization Server:**

- **Role:** In OAuth-based SSO systems, the Authorization Server is responsible for granting access tokens to client applications.
- **Interaction:** Issues access tokens after authenticating the user and obtaining their consent. The client application uses these tokens to access protected resources.


## Tokens used in SSO

Let's explore the two types of tokens, `identity tokens`, and `access tokens`, delivered by the Authorization Server, both of which are commonly presented in the form of JSON Web Tokens (JWTs):


**ID Tokens:**

   - **Purpose:** ID tokens are primarily used in the context of OpenID Connect. They are meant to carry information about the authentication of the user.
   - **Content:** An ID token contains claims about the identity of the authenticated user, such as their user ID, username, and possibly other information like email or profile information.
   - **Usage:** ID tokens are typically used by the client application to obtain information about the authenticated user. They are not used to access protected resources but rather to identify the user.
   - **Example Scenario:** After a user logs in through an OpenID Connect provider, the provider issues an ID token, which the client application can use to get information about the authenticated user.

**Access Tokens:**

   - **Purpose:** Access tokens are used to access protected resources on behalf of a user.
   - **Content:** An access token represents the authorization granted to a client application to access specific resources on behalf of the user. It may contain information about the scope of access, expiration time, and other details.
   - **Usage:** Access tokens are presented by the client to the resource server to gain access to protected resources. They are used in API calls to demonstrate that the client has been authorized to access the requested resources.
   - **Example Scenario:** A user logs in and grants permission to a third-party application to access their profile information on a social media platform. The application receives an access token that it can then use to make API requests to retrieve the user's profile data.


Example Identity Token (JWT):
```json
{
  "iss": "https://openid-provider.com",
  "sub": "1234567890",
  "aud": "your-client-id",
  "exp": 1632969781,
  "iat": 1632966181,
  "name": "John Doe",
  "email": "john.doe@example.com",
  "picture": "https://example.com/john-doe.jpg",
  "nonce": "nonce-value"
}

```

Token data details:

- **`sub` (Subject):** Identifies the subject of the token (e.g., user ID).
- **`iss` (Issuer):** Specifies the issuer of the token (e.g., Authorization Server).
- **`aud` (Audience):** Indicates the audience for which the token is intended (e.g., client application or resource server).
- **`exp` (Expiration Time):** Specifies the expiration time of the token.
- **`iat` (Issued At):** Indicates the time at which the token was issued.

**Access Tokens:**

- **Description:** Access tokens are used by the client application to access protected resources on behalf of the user. They represent the authorization granted by the user.
- **Contents:** Access tokens often include information about the granted permissions, scope, and expiration time.
- **Use Case:** Access tokens are presented by the client application to the resource server when making requests for protected resources. They serve as a proof of authorization.

Example Access Token (JWT):
```json
{
  "iss": "https://authorization-server.com",
  "sub": "1234567890",
  "aud": ["https://api.example.com", "https://resources.example.com"],
  "exp": 1632969781,
  "iat": 1632966181,
  "scope": "read write",
  "jti": "a1b2c3d4e5f6"
}
```
simplified example of what an access token might look like:

```json
{
  "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...",
  "token_type": "Bearer",
  "expires_in": 3600,
  "scope": "read write",
  "refresh_token": "rT_5f9d2a96-7ae3-4eae-b64d-6375942b9c2a"
}
```


**Refresh Tokens:**

In Single Sign-On (SSO) systems, refresh tokens play a crucial role in extending the validity of access tokens and maintaining a user's authenticated session without requiring repeated user authentication. 

Access tokens, which grant access to resources, typically have a limited lifespan for security reasons. Once an access token expires, the user would need to re-authenticate to obtain a new one.

When a user initially authenticates and obtains an access token, the Identity Provider or Authorization Server may also issue a refresh token along with the access token.


These tokens play a crucial role in the OAuth 2.0 and OpenID Connect protocols, providing a secure and standardized way to convey identity and authorization information in a distributed and interoperable manner.


## OAuth 2.0 flows

OAuth 2.0 flows, also known as OAuth 2.0 grant types, define the mechanism through which applications obtain authorization and access tokens to interact with protected resources on behalf of a user. Each flow is designed for specific use cases and scenarios, providing a standardized way for clients (applications) to request and obtain access to resources.

The main OAuth 2.0 flows include:

**Authorization Code Grant Flow:**

- **Use Case:** Web applications with a server-side component.
- **Description:** Involves the redirection of the user to the authorization server, where the user authenticates and grants permission. The authorization server returns an authorization code to the client, which is then exchanged for an access token.

**Implicit Grant Flow:**

- **Use Case:** Browser-based applications (JavaScript applications).
- **Description:** Designed for client-side applications running in the user's browser. The access token is issued directly to the client without the need for an intermediate authorization code exchange.

**Client Credentials Grant Flow:**

- **Use Case:** Confidential clients, such as backend servers or applications that can securely store client credentials.
- **Description:** The client (usually a server) directly requests an access token from the authorization server using its client credentials (client ID and secret). This flow is suitable for machine-to-machine communication.

**Resource Owner Password Credentials Grant Flow:**

- **Use Case:** Highly trusted applications, such as native mobile apps.
- **Description:** Involves the resource owner (user) providing their username and password directly to the client. The client then uses these credentials to obtain an access token from the authorization server.

These flows provide flexibility and cater to different types of applications and security requirements. The choice of a specific flow depends on the characteristics of the client application, the level of trust, and the security considerations of the overall system architecture.

## JSON Web Token (JWT)

JWTs are often used for authentication and authorization purposes in web applications and APIs. They can be sent between parties, and since they are self-contained, the recipient can verify the information within the token without needing to contact the issuer. JWTs are widely used in various protocols and frameworks, including OAuth 2.0 and OpenID Connect.

JWTs are defined by the RFC 7519 standard and consist of three parts:

**1. Header:** The header typically consists of two parts: the type of the token (JWT) and the signing algorithm being used, such as HMAC SHA256 or RSA.

   Example:
   ```json
   {
     "alg": "HS256",
     "typ": "JWT"
   }
   ```

**2. Payload:** The payload contains the claims. Claims are statements about an entity (typically, the user) and additional data.

   Example:
   ```json
   {
     "sub": "1234567890",
     "name": "John Doe",
     "iat": 1516239022
   }
   ```

**3. Signature:** To create the signature part, you have to take the encoded header, the encoded payload, a secret, the algorithm specified in the header, and sign that.

Example (using HMAC SHA256):
```
HMACSHA256(
    base64UrlEncode(header) + "." +
    base64UrlEncode(payload),
    secret)
```

The resulting JWT looks like this:
```
eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwMCIsIm5hbWUiOiJKb2huIERvZSIsImlhdCI6MTUxNjIzOTAyMn0.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c
```


## Conclusion

Single Sign-On plays an importent role in the realm of identity and access management, providing a user-centric and secure approach to accessing multiple applications seamlessly. With benefits ranging from enhanced user experience to improved security and streamlined administration, SSO continues to play a vital role in shaping the future of digital identity.

## References

- [OAuth 2.0 Specification](https://tools.ietf.org/html/rfc6749){:target="_blank"}
- [OpenID Connect Specifications](https://openid.net/specs/openid-connect-core-1_0.html){:target="_blank"}
- [Security Assertion Markup Language (SAML)](https://www.oasis-open.org/standards#samlv2.0){:target="_blank"}
