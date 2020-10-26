<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>

<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>      
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<style type="text/css">
.col-md-3{
  display: inline-block;
  margin-left:-4px;
}
.col-md-3 img{
  width:100%;
  height:auto;
}
.carousel-indicators li{
  background-color:red;
}
.carousel-indicators{
  bottom: 0;
}
.carousel-control-prev-icon,
.carousel-control-next-icon{
  background-color:red;
}
.no-padding{
  padding-left: 0;
  padding-right: 0;
  height: 30rem;
  }

</style>



</head>
<body>

<script type="text/javascript">
$(document).ready(function() {
    $('#Carousel').carousel({
        interval: 5000
    })
});
</script>

<div id="demo" class="carousel slide" data-ride="carousel">

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>
  
  <!-- The slideshow -->
  <div class="container carousel-inner no-padding">
    <div class="carousel-item active">
      <div class="col-xs-3 col-sm-3 col-md-3">
        <img src="https://image.shutterstock.com/z/stock-photo-sleeping-disorders-as-a-reason-for-insomnia-293777093.jpg">
      </div>    
      <div class="col-xs-3 col-sm-3 col-md-3">
        <img src="https://image.shutterstock.com/z/stock-photo-sleeping-disorders-as-a-reason-for-insomnia-293777093.jpg">
      </div>   
      <div class="col-xs-3 col-sm-3 col-md-3">
        <img src="https://image.shutterstock.com/z/stock-photo-sleeping-disorders-as-a-reason-for-insomnia-293777093.jpg">
      </div>   
      <div class="col-xs-3 col-sm-3 col-md-3">
        <img src="https://image.shutterstock.com/z/stock-photo-sleeping-disorders-as-a-reason-for-insomnia-293777093.jpg">
      </div>   
    </div>
    <div class="carousel-item">
      <div class="col-xs-3 col-sm-3 col-md-3">
        <img src="https://image.shutterstock.com/z/stock-photo-sleeping-disorders-as-a-reason-for-insomnia-293777093.jpg">
      </div>    
      <div class="col-xs-3 col-sm-3 col-md-3">
        <img src="https://image.shutterstock.com/z/stock-photo-sleeping-disorders-as-a-reason-for-insomnia-293777093.jpg">
      </div>   
      <div class="col-xs-3 col-sm-3 col-md-3">
        <img src="https://image.shutterstock.com/z/stock-photo-sleeping-disorders-as-a-reason-for-insomnia-293777093.jpg">
      </div>   
      <div class="col-xs-3 col-sm-3 col-md-3">
        <img src="https://image.shutterstock.com/z/stock-photo-sleeping-disorders-as-a-reason-for-insomnia-293777093.jpg">
      </div>  
    </div>
    <div class="carousel-item">
      <div class="col-xs-3 col-sm-3 col-md-3">
        <img src="https://image.shutterstock.com/z/stock-photo-sleeping-disorders-as-a-reason-for-insomnia-293777093.jpg">
      </div>    
      <div class="col-xs-3 col-sm-3 col-md-3">
        <img src="https://image.shutterstock.com/z/stock-photo-sleeping-disorders-as-a-reason-for-insomnia-293777093.jpg">
      </div>   
      <div class="col-xs-3 col-sm-3 col-md-3">
        <img src="https://image.shutterstock.com/z/stock-photo-sleeping-disorders-as-a-reason-for-insomnia-293777093.jpg">
      </div>   
      <div class="col-xs-3 col-sm-3 col-md-3">
        <img src="https://image.shutterstock.com/z/stock-photo-sleeping-disorders-as-a-reason-for-insomnia-293777093.jpg">
      </div>  
    </div>
  </div>
  
  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>


<h2>Spring MVC + jQuery + Autocomplete example</h2>

	<div>
		<input type="text"  id="w-input-search" value="">
		<span>
			<button id="w-button-search" type="button">Search</button>
		</span>
	</div>
	
	<script>
	$(document).ready(function() {

		$('#w-input-search').autocomplete({
			serviceUrl: 'http://localhost:8080/TechZone/autoCompleteSearchViaAjax',
			paramName: "tagName",
			delimiter: ",",
		    transformResult: function(response) {
		    	
		        return {
		        	
		            suggestions: $.map($.parseJSON(response), function(item) {
		            	
		                return { value: item.name, data: item.id };
		            })
		            
		        };
		        
		    }
		    
		});
		
		
	});
	</script>
	
</body>
</html>