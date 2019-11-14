<?php


$db = mysqli_connect('localhost', 'root', '', 'projects');


    if(isset($_GET['fetchData'])){
        $restaurants = mysqli_query($db, "SELECT * FROM advertised");
        $restaurantsSerialized = array();
        foreach($restaurants as $restaurant){
            $businesses = new stdClass();
            $businesses->coordinates = new stdClass();
            $businesses->location = new stdClass();
            $businesses->coordinates->latitude = $restaurant['latitude'];
            $businesses->coordinates->longitude = $restaurant['longitude'];
            $businesses->location->display_address[] = $restaurant['address'];
            $businesses->image_url = $restaurant['image_url'];
            $businesses->name = $restaurant['name'];
            $businesses->likes = $restaurant['likes'];
            $businesses->category = $restaurant['category'];
            array_push($restaurantsSerialized, $businesses);
        }
        $myJSON = json_encode($restaurantsSerialized);
    
        echo $myJSON;
    }

    if(isset($_POST['upVote'])){
        $name = $_POST['upVote'];
        mysqli_query($db, "UPDATE advertised SET likes = likes + 1 WHERE `name` = '$name'");
    }

    if(isset($_POST['downVote'])){
        $name = $_POST['downVote'];
        mysqli_query($db, "UPDATE advertised SET likes = likes - 1 WHERE `name` = '$name'");
    }

    if(isset($_GET['fetchFave'])){
        $favourites = mysqli_query($db, "SELECT * FROM favourites");
        $favouritesSerialized = array();
        foreach($favourites as $favourite){
            array_push($favouritesSerialized, $favourite);
        }
        $myFAV = json_encode($favouritesSerialized);
    
        echo $myFAV;
    }

    if(isset($_POST['deleteFav'])){
        $name = $_POST['deleteFav'];
        mysqli_query($db, "DELETE FROM `favourites` WHERE `name` = '$name'");
    }

    if(isset($_POST['addFav'])){
        $name = $_POST['addFav'];
        $query = mysqli_query($db, "SELECT * FROM favourites WHERE `name` = '$name'");
        $count = mysqli_num_rows($query);
        if($count == 0){
            mysqli_query($db, "INSERT INTO `favourites`(`name`) VALUES ('$name')");
            echo $count;
        } else{
            echo $count;
        }
        
    }

    if(isset($_POST['updateComment'])){
        $name = $_POST['updateComment'];
        $comment = $_POST['newComment'];
        mysqli_query($db, "UPDATE `favourites` SET `comments` = concat(\"$comment \", `comments`) WHERE `name` = \"$name\"");
    }
?>