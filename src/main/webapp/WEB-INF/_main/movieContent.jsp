<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../../header.jsp"%>
<link href="${ctx}/css/movieContentStyle.css" rel="stylesheet" type="text/css">
<body>
	<div id="modal" class="modal">
		<div class="modal-content">
			<span style= class="close">&times;</span>
			<p>${vo.movieNm }</p>
		</div>
	</div>
	<script type="text/javascript">
		var modal = document.getElementById("modal");
		var span = document.getElementsByClassName("close")[0];

		btn.onclick = function() {
			modal.style.display = "block";
		}

		span.onclick = function() {
			modal.style.display = "none";
		}

		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>
</body>
</html>