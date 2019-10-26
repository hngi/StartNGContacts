<?php

function getAllEmailFromJsonFile($uploadedFile,$key,$validateEmail){
    $content = file_get_contents($uploadedFile);
    $json = json_decode($content,true);
    $json_array = [];
    // check if the file uploaded is json file
    if($json === null){
        return $uploadedFile. " is an invalid file format or has invalid contents, please upload a json file with valid contents";
    }else{
        foreach ($json as $keys => $value) {
            // loop through json file and fetch all objects
            $check = array_key_exists($key, $value);
            // check if each object contain key that was passed into this function
            if ($check === true) {
                // looping through each object that has key
                foreach ($value as $ke => $valu) {
                    // counting count
                    $count_emails = 0;
                    if ($validateEmail === true) {
                        // incrementing number of entries found
                        $count_emails++;
                        // validating email
                        if (filter_var($valu, FILTER_VALIDATE_EMAIL)) {
                            array_push($json_array, $valu);
                        }
                    }else{
                        // incrementing number of entries found
                        $count_emails++;
                        // attaching values to output
                        array_push($json_array, $valu);
                    }
                }
            }
        }
       // returning array of found and/or validated key values found as result
        return $json_array;
    }
}
// function takes the file path, the key that holds the email(s) inside the file, true if you want the retrieved email(s) to be validated else false. It returns an array of email(s) found


// instantiating new object
// for tests uncomment any
// var_dump(getAllEmailFromJsonFile("sample.json","email",true));
// var_dump(getAllEmailFromJsonFile("sample.json","email",false));

// results
// array(4) { [0]=> string(16) "favour@gmail.com" [1]=> string(15) "grant@gmail.com" [2]=> string(14) "gift@gmail.com" [3]=> string(15) "grace@gmail.com" }
?>