<input type="hidden" id="pageTracker" value="${pageTracker!""}" />
<input type="hidden" id="loggedIn" value="" />
	
<div class="footer">
	<#assign currentDate = .now>
	<#assign currentYear = currentDate?string["yyyy"]>
	
	<footer class="bd-footer">
	    <div class="container-fluid p-2 p-md-2">
	        Copyright &copy; ${currentYear} Sanskrit High School Vattoli All Rights Reserved. Privacy - Policy - Terms of Use<br>
	        Designed and built By - <img class="footer-logo" src="/img/logo.png"></img> - 2006 Batch.
	    </div>
	</footer>
</div>