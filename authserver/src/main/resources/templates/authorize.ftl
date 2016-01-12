<html>
<head>
<link rel="stylesheet" href="../css/wro.css"/>
</head>
			
<body>
	<div class="container">
		<h1>OAuth Approval</h1>
		<p>
			Do you authorize "${authorizationRequest.clientId}" at "${authorizationRequest.redirectUri}" to access your protected resources?
		</p>
        <form id='confirmationForm' name='confirmationForm' action='../oauth/authorize' method='post'>
          <input name='user_oauth_approval' value='true' type='hidden'/>
          <input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}' />
          <ul>
<#list scopes as scope>
            <li>
              <div class='form-group'>
              ${scope.id}:
              <input type='radio' name='${scope.id}' value='true'<#if scope.approved> checked</#if>>Approve</input>
              <input type='radio' name='${scope.id}' value='false'<#if !scope.approved> checked</#if>>Deny</input>
              </div>
            </li>
</#list>
          </ul>
          <label><input name='authorize' value='Authorize' type='submit'/></label>
        </form>

        <form id='denialForm' name='denialForm' action='../oauth/authorize' method='post'>
          <input name='user_oauth_approval' value='false' type='hidden'/>
          <input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}' />
          <label><input name='deny' value='Deny' type='submit'/></label>
        </form>
		
	</div>
	<script src="../js/wro.js"	type="text/javascript"></script>
</body>
</html>