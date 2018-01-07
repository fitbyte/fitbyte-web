<%--
  Created by IntelliJ IDEA.
  User: revatimahajan
  Date: 11/26/17
  Time: 8:04 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../../../favicon.ico">

    <title>Sleep Details</title>

    <!-- Bootstrap core CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="editsleep.css" rel="stylesheet">
</head>

<body>

<div class="container">

    <form class="form-sleep">
        <h2 class="form-sleep-heading">Enter details about sleep</h2>
        <label for="sleepHoursInput" class="sr-only">Number of Hours</label>
        <input type="number" id="sleepHoursInput" class="form-control" placeholder="Enter number of hours slept" required autofocus>
        <label for="sleepQualityInput" class="sr-only">Sleep Quality</label>
        <input type="number" id="sleepQualityInput" class="form-control" placeholder="Enter quality of sleep between 1-10, 10 being the highest" required>
        <button class="btn btn-lg btn-primary btn-block" type="submit" id="sleepBtn">Submit</button>
        <div id="sleepMsg" class="alert alert-success invisible">
            <strong>Success!</strong>
        </div>
    </form>

</div> <!-- /container -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js" integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js" integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ" crossorigin="anonymous"></script>

<script>
    $(document).ready(function(){
        $("#sleepBtn").click(function(){
            $.ajax({
                type: "POST",
                url: "http://localhost:8090/webapi/users/Revati/addSleep",
                contentType: "application/json",
                success:function(res){
                    $("#sleepMsg").removeClass("invisible").addClass("visible");
                },
                error: function(jqxhr, status, exception) {
                    alert('Exception:', exception);
                    alert('jqxhr:', jqxhr);
                },
                data: JSON.stringify({
                    "numberOfHours": parseInt($( "#sleepHoursInput" ).val(), 10),
                    "quality": parseInt($( "#sleepQualityInput" ).val(), 10),
                }),
                dataType: "json",
            })
            return false;
        });
    });
</script>

</body>
</html>

