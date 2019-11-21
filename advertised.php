<?php


$db = mysqli_connect('localhost', 'root', '', 'projects');

    // Can be used to load advertised restaurants
    // if(isset($_GET['fetchData'])){
    //     $restaurants = mysqli_query($db, "SELECT * FROM advertised");
    //     $restaurantsSerialized = array();
    //     foreach($restaurants as $restaurant){
    //         $businesses = new stdClass();
    //         $businesses->coordinates = new stdClass();
    //         $businesses->location = new stdClass();
    //         $businesses->coordinates->latitude = $restaurant['latitude'];
    //         $businesses->coordinates->longitude = $restaurant['longitude'];
    //         $businesses->location->display_address[] = $restaurant['address'];
    //         $businesses->image_url = $restaurant['image_url'];
    //         $businesses->name = $restaurant['name'];
    //         $businesses->likes = $restaurant['likes'];
    //         $businesses->category = $restaurant['category'];
    //         array_push($restaurantsSerialized, $businesses);
    //     }
    //     $myJSON = json_encode($restaurantsSerialized);
    
    //     echo $myJSON;
    // }

    if(isset($_POST['upVote'])){
        $id = $_POST['upVote'];
        mysqli_query($db, "UPDATE favourites SET likes = likes + 1 WHERE `id` = '$id'");
    }

    if(isset($_POST['downVote'])){
        $id = $_POST['downVote'];
        mysqli_query($db, "UPDATE favourites SET likes = likes - 1 WHERE `id` = '$id'");
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
        $id = $_POST['deleteFav'];
        mysqli_query($db, "DELETE FROM `favourites` WHERE `id` = '$id'");
    }

    if(isset($_POST['addFav'])){
        $name = $_POST['addFav'];
        $image = $_POST['image'];
        $query = mysqli_query($db, "SELECT * FROM favourites WHERE `name` = '$name'");
        $count = mysqli_num_rows($query);
        if($count == 0){
            mysqli_query($db, "INSERT INTO `favourites`(`name`, `comments`, `image_url`, `likes`) VALUES ('$name', '<p> </p>', '$image', '0')");
            echo $count;
        } else{
            echo $count;
        }
        
    }

    if(isset($_POST['updateComment'])){
        $id = $_POST['updateComment'];
        $comment = $_POST['newComment'];
        mysqli_query($db, "UPDATE `favourites` SET `comments` = concat(\"<p>$comment </p>\", `comments`) WHERE `id` = \"$id\"");
    }
?>